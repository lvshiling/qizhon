/*
 * Copyright (C) 2003-2011 Igniterealtime Community Contributors
 *
 *     Daniel Henninger
 *     Derrick Grigg <dgrigg@rogers.com>
 *     Juga Paazmaya <olavic@gmail.com>
 *     Nick Velloff <nick.velloff@gmail.com>
 *     Sean Treadway <seant@oncotype.dk>
 *     Sean Voisen <sean@voisen.org>
 *     Mark Walters <mark@yourpalmark.com>
 *     Dele Olajide <dele@olajide.net> 
 *
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
	 
package org.igniterealtime.xiff.core
{	 
	import flash.errors.IOError;
	import flash.events.ProgressEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.AsyncErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;	
	import flash.events.TimerEvent;
	import flash.xml.XMLDocument;
	import flash.xml.XMLNode;
 			 			
	import flash.net.NetConnection;
	import flash.net.NetGroup;
	import flash.net.GroupSpecifier;
	import flash.net.Responder;	
	import flash.net.NetStream;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	
	import org.igniterealtime.xiff.events.*;
		
	
	/**
	 * A child of <code>XMPPConnection</code>, this class makes use of peer2peer
	 * Flash RTMFP connections instead of the XMLSocket</code>.
	 * 
	 * @see org.jivesoftware.xiff.core.XMPPConnection
	 */
	public class RTMFPConnection extends XMPPConnection
	{

		public var rtmfpConnection:NetConnection = null;
		public var rtmpConnection:NetConnection = null;
		
		private var group:NetGroup = null;
		private var ipMulticastAddress:String = "225.225.0.1:30303";
		private var rtmfpUrl:String = "rtmfp://p2p.rtmfp.net/e423fa356c187078552b994c-004820ca784f/";		
		private var multicastEnabled:Boolean = false;
		private var sequenceNumber:uint = 0;

		private var rtmpUrl:String = "rtmp:/xmpp";
		private var digest:String = null;
		
		private var serverAddress:String = null;
		private var myAddress:String = null;
		private var pendingXML:String = null;
		private var timer:Timer;
				
		public function RTMFPConnection(rtmfpUrl:String = "rtmfp://p2p.rtmfp.net/e423fa356c187078552b994c-004820ca784f/", ipMulticastAddress:String = "225.225.0.1:30303")
		{		
			super();						

			trace("RTMFPConnection: ");
			
			this.rtmfpUrl = rtmfpUrl;			
			this.ipMulticastAddress = ipMulticastAddress;
			
			configureRtmfp();			
		}

		private function configureRtmfp():void 
		{		
			rtmfpConnection = new NetConnection();
			rtmfpConnection.addEventListener( NetStatusEvent.NET_STATUS , rtmfpStatus );
			rtmfpConnection.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
	    	}
	    	
		
		private function configureRtmp():void 
		{	
			trace("configureRtmp: ");

			rtmpConnection = new NetConnection();
			rtmpConnection.client = this;
			rtmpConnection.addEventListener( NetStatusEvent.NET_STATUS , rtmpStatus );
			rtmpConnection.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			
			rtmpConnection.connect(rtmpUrl);
	    	}	    	

		private function securityErrorHandler(event:SecurityErrorEvent):void 
		{
            		//trace("securityErrorHandler: " + event);
        	}


		private function rtmpStatus (evt:NetStatusEvent ):void 
		{		 
			trace("rtmpStatus: " + evt);
			
			switch(evt.info.code) {
				
				case "NetConnection.Connect.Success":

					rtmpConnection.call("xmppConnect", null, username, password, myAddress);							
					break;
		
				case "NetConnection.Connect.Failed":
				
					dispatchError( evt.info.code, "Service Unavailable", "cancel", 503 );	
					break;
					
				case "NetConnection.Connect.Closed":
				
					dispatchEvent( new DisconnectionEvent() );				
					break;
		
				case "NetConnection.Connect.Rejected":
				
					dispatchError( evt.info.code, "Not Authorized", "auth", 401 );				
					break;
					
				default:
					
			}			 
		}
		
		
		private function rtmfpStatus (evt:NetStatusEvent ):void 
		{		
			trace("rtmpStatus: " + evt);
//dispatchError( evt.info.code, serverAddress + " " + evt.info.fromLocal , "auth", 401 );			
			switch(evt.info.code) {
				
				case "NetConnection.Connect.Success":
			
					setupGroup();					
					break;
		
				case "NetConnection.Connect.Failed":
				case "NetConnection.Connect.Rejected":
				
					if (multicastEnabled)
					{
						dispatchError( evt.info.code, "Service Unavailable", "cancel", 503 );	
						
					} else {
						
						rtmfpConnection.connect("rtmfp:");
						multicastEnabled = true;
					}
					
					break;
					
				case "NetConnection.Connect.Closed":
				
					dispatchEvent( new DisconnectionEvent() );				
					break;

				case "NetGroup.Connect.Success":
					
					myAddress = group.convertPeerIDToGroupAddress(rtmfpConnection.nearID);
					timer = new Timer(2000);
					
					timer.addEventListener(TimerEvent.TIMER, function onTimer(evt:TimerEvent):void
					{
						timer.stop();
						
						if (group.neighborCount == 0 && serverAddress == null)
						{
							serverAddress = myAddress;			
							reportPromotionToNeighbours();
							pendingXML = null;
							configureRtmp();						
						}							
					});
					
					timer.start();	
					
					active = true;	
					dispatchEvent( new ConnectionSuccessEvent() );					
					break;
					

				case "NetGroup.Connect.Failed":
				case "NetGroup.Connect.Rejected":
				
					dispatchError( evt.info.code, "Not Authorized", "auth", 401 );
					break;

				case "NetGroup.SendTo.Notify":						
					
					receiveMessage(evt.info.message);
					break;

				case "NetGroup.Posting.Notify":
				
					receiveMessage(evt.info.message)
					break;	

				case "NetGroup.Neighbor.Connect":
				
					neighborConnect(evt.info.neighbor);
					break;

				case "NetGroup.Neighbor.Disconnect":
				
					neighborDisconnect(evt.info.neighbor);
					break;
						
				default:
					
			}			 
		} 

		private function setupGroup():void
		{
			trace("setupGroup ");
			
			var groupspec:GroupSpecifier = new GroupSpecifier("e423fa356c187078552b994c-004820ca784f");
						
			if (multicastEnabled) 
			{
				groupspec.multicastEnabled = true;
				groupspec.ipMulticastMemberUpdatesEnabled = true;
				groupspec.addIPMulticastAddress("225.225.0.1:30303");
				
			} else {
			
				groupspec.serverChannelEnabled = true;
			}				


			groupspec.routingEnabled = true;				
			groupspec.postingEnabled = true;

			group = new NetGroup(rtmfpConnection, groupspec.groupspecWithAuthorizations());
			group.addEventListener(NetStatusEvent.NET_STATUS, rtmfpStatus);				
		} 

		public function xmppConnect (digest:String, peerId:String):* 
		{
			trace("xmppConnect: " + digest + " " + peerId);		
			
			if (serverAddress == peerId) 
			{		
				if (digest != null)
				{
					if (this.digest == null) 		//  first time login
					{
						this.digest = digest;	
						loggedIn = true;
						dispatchEvent( new LoginEvent() );					
					}

					if (pendingXML != null)
					{
						sendUsingPrimeNeighbor(pendingXML);
						pendingXML = null;
					}

				} else {

					dispatchError( "not-authorized", "Not Authorized", "auth", 401 );
				}
				
			} else {

				var packet:Object = new Object();

				packet.action = "xmppLogin";
				packet.sequence = sequenceNumber++;
				packet.from = serverAddress;
				packet.to = peerId;
				packet.digest = digest;

				group.sendToNearest(packet, peerId);			
			}
		}			
		        
		public function xmppRecieve(rawXML:String, theAddress:String):* 
		{
			trace("xmppRecieve: " + rawXML + " " + theAddress);
			
			var xmlData:XMLDocument = new XMLDocument();
			xmlData.ignoreWhite = true;
			var isComplete:Boolean = true;

			if ("<?xml version='1.0' encoding='UTF-8'?>" == rawXML.substring(0, 38)) 
			{
				rawXML = rawXML.substring(38) + "</stream:stream>";
			}
						
			try {
				xmlData.parseXML( rawXML );
			}
			catch(err:Error){
				isComplete = false;
			}
			
			
			if (isComplete) 
			{
			    if (theAddress == myAddress)
			    {
				var event:IncomingDataEvent = new IncomingDataEvent();
				var byteData:ByteArray = new ByteArray();
				byteData.writeUTFBytes(rawXML);
				event.data = byteData;
				dispatchEvent( event );
				
				for (var i:int = 0; i<xmlData.childNodes.length; i++)
				{
					var currentNode:XMLNode = xmlData.childNodes[i];					
					handleNodeType( currentNode );
				}
				
			    } else {
			    
			    	deliverToNeighbor(rawXML, theAddress);
			    }
			}
		}
		
		
	    	override protected function sendXML( someData:* ):void
		{
			trace("sendXML: " + someData);

			var xmlData:String;

			if (someData is XML) 
			{
				xmlData =  (someData as XML).toXMLString();			

			} else if (someData is String) {

				xmlData =  someData;

			} else {

				xmlData = someData.toString();			
			}

			if (serverAddress == null)	// you become the server
			{
				serverAddress = myAddress;			
				
				reportPromotionToNeighbours();
				pendingXML = xmlData;
				configureRtmp();

			} else {

				sendUsingPrimeNeighbor(xmlData);	
			}
		}
		
		override public function disconnect():void
		{
			trace("disconnect: ");	
			
			if( isActive() ) 
			{										
				disconnectUsingPrimeNeighbor();
				
				active = false;
				loggedIn = false;
				var event:DisconnectionEvent = new DisconnectionEvent();
				dispatchEvent(event);
				
				group.close();	
				rtmfpConnection.close();	
			}
		}
		
		override public function connect( streamType:uint=0  ):Boolean
		{
			trace("connect: ");
			
			active = false;
			loggedIn = false;

			rtmfpConnection.connect(rtmfpUrl);
			return true;
		}

		override public function sendKeepAlive():void
		{
			trace("sendKeepAlive: ");		
		}

		override protected function restartStream():void
		{
			trace("restartStream: ");
			
			disconnect();
			connect();
		}
		
		
		private function disconnectUsingPrimeNeighbor():void
		{
			trace("disconnectUsingPrimeNeighbor: ");
			
			if (serverAddress == myAddress) 
			{
				rtmpConnection.call("xmppDisconnect", null, digest);				
			
			} else {
			
				var packet:Object = new Object();
				
				packet.action = "xmppDisconnect";
				packet.sequence = sequenceNumber++;
				packet.from = myAddress;
				packet.to = serverAddress;	
				packet.digest = digest;
				
				group.sendToNearest(packet, serverAddress);								
			}
			
			serverAddress = null;

		}
		
		
		private function sendUsingPrimeNeighbor(xmlData:String):void
		{	
			trace("sendUsingPrimeNeighbor: " + xmlData);
		
			if (serverAddress == myAddress) 				// that's me, i am prime neighbour
			{
				rtmpConnection.call("xmppSend", null, digest, xmlData);
				
				var event:OutgoingDataEvent = new OutgoingDataEvent();			
				var byteData:ByteArray = new ByteArray();
				byteData.writeUTFBytes(xmlData);
				event.data = byteData;

				dispatchEvent( event );				
			
			} else {
			
				var packet:Object = new Object();
				
				packet.action = "xmppSend";
				packet.sequence = sequenceNumber++;
				packet.xml = xmlData;
				packet.from = myAddress;
				packet.to = serverAddress;	
				packet.digest = digest;
				
				group.sendToNearest(packet, serverAddress);				
				
			}

		}
		
		private function deliverToNeighbor(xmlData:String, theAddress:String):void
		{
			trace("deliverToNeighbor: " + xmlData + " " + theAddress);
		
			var packet:Object = new Object();

			packet.action = "xmppRecieve";
			packet.sequence = sequenceNumber++;			
			packet.xml = xmlData;
			packet.from = serverAddress;
			packet.to = theAddress;	

			group.sendToNearest(packet, theAddress);		
		}
		
		
		private function reportPromotionToNeighbours():void
		{
			trace("reportPromotionToNeighbours: ");

			var packet:Object = new Object();

			packet.action = "xmppServer";
			packet.sequence = sequenceNumber++;
			packet.from = serverAddress;

			group.sendToAllNeighbors(packet);		
		}
		
		private function neighborDisconnect(neighborId:String):void
		{
			trace("neighborDisconnect: " + neighborId);
		
			if (serverAddress == neighborId)	// check if server is lost
			{
				serverAddress = null;			
			}
		}

		private function neighborConnect(neighborId:String):void
		{
			trace("neighborConnect: " + neighborId);

			if (serverAddress != null && serverAddress == myAddress)		// check if i am prime
			{
				reportPromotionToNeighbours();
			}
		}

		private function receiveMessage(packet:Object):void
		{
			trace("receiveMessage: " + packet);
		
			switch(packet.action) {
				
				case "xmppServer":			// new prime neighbour, change server address
				
					serverAddress = packet.from;
					
					if (this.digest == null)	// first time, not logged in, log in now
					{
						var packet:Object = new Object();

						packet.action = "xmppConnect";
						packet.sequence = sequenceNumber++;
						packet.from = myAddress;
						packet.to = serverAddress;
						packet.username = username;
						packet.password = password;

						group.sendToNearest(packet, serverAddress);										
					}
					
					break;

				case "xmppConnect":
					
					rtmpConnection.call("xmppConnect", null, packet.username, packet.password, packet.from);					
					break;	

				case "xmppLogin":					
					
					if (packet.digest != null)
					{
						this.digest = packet.digest;
						loggedIn = true;
						dispatchEvent( new LoginEvent() );

					} else {

						dispatchError( "not-authorized", "Not Authorized", "auth", 401 );
					}
					break;					
		
				case "xmppRecieve":

					var xmlData:XMLDocument = new XMLDocument();
					xmlData.ignoreWhite = true;					
					xmlData.parseXML( packet.xml );

					var event1:IncomingDataEvent = new IncomingDataEvent();
					var byteData1:ByteArray = new ByteArray();
					byteData1.writeUTFBytes(packet.xml);
					event1.data = byteData1;
					dispatchEvent( event1 );

					for (var i:int = 0; i<xmlData.childNodes.length; i++)
					{
						var currentNode:XMLNode = xmlData.childNodes[i];					
						handleNodeType( currentNode );
					}
					
					break;
					
				case "xmppSend":

					rtmpConnection.call("xmppSend", null, packet.digest, packet.xml);
				
					var event2:OutgoingDataEvent = new OutgoingDataEvent();			
					var byteData2:ByteArray = new ByteArray();
					byteData2.writeUTFBytes(packet.xml);
					event2.data = byteData2;
					dispatchEvent( event2 );					
					break;
		
				case "xmppDisconnect":
					
					rtmpConnection.call("xmppDisconnect", null, packet.digest);									
					break;
					
				default:
					
			}
		}		
		
	}
}