package org.igniterealtime.xiff.openlink
{
	import org.igniterealtime.xiff.data.IQ;
	import org.igniterealtime.xiff.core.EscapedJID;
	import flash.xml.XMLNode;
	
	public class MakeIntercomCall extends IQ
	{
		private var serverComponent:String;
		private var _type:String;
		private var _from:String;
		private var action:String;
		private var profile:String;
		private var destination:String;
		private var featureID:String;
		private var value1:String;
		public function MakeIntercomCall(type:String,serverComponent:String,from:String,action:String)
		{
			this._type=type;
			this._from=from;
			this.action=action;
			this.serverComponent=serverComponent;
		}
		
		
		public function addQuery():IQ{
			var iq:IQ = new IQ(new EscapedJID(serverComponent), _type);
				
				var commandNode:XMLNode = new XMLNode(1,"command");
				commandNode.attributes.xmlns= "http://jabber.org/protocol/commands";
				commandNode.attributes.action = action;
				commandNode.attributes.node = "http://xmpp.org/protocol/openlink:01:00:00#make-intercom-call";
				
				var  iodataNode:XMLNode = new XMLNode(1,"iodata");
				iodataNode.attributes.xmlns = "urn:xmpp:tmp:io-data";
				iodataNode.attributes.type = "input";
				commandNode.appendChild(iodataNode);
				
				var inNode:XMLNode = new XMLNode(1, "in");
				var destinationNode:XMLNode = new XMLNode(1,"destination");
				var profileNode:XMLNode = new XMLNode(1,"profile");
				var featuresNode:XMLNode = new XMLNode(1,"features");
				var featureNode:XMLNode = new XMLNode(1,"feature");
				
				
				iodataNode.appendChild(inNode);
				inNode.appendChild(profileNode);
				inNode.appendChild(destinationNode);
				inNode.appendChild(featuresNode);
				featuresNode.appendChild(featureNode);
				
				
				
				if(getDestination() != null){
				var destinationNodeValue:XMLNode = new XMLNode(3,getDestination());
				destinationNode.appendChild(destinationNodeValue);
				}
				if(getProfile() != null){
				var profileNodeValue:XMLNode = new XMLNode(3,getProfile());
				profileNode.appendChild(profileNodeValue);
				}
				if(getFeatureID() != null){
				var idNode:XMLNode = new XMLNode(1,"id");
				featureNode.appendChild(idNode);
				var idNodeValue:XMLNode = new XMLNode(3,getFeatureID());
				idNode.appendChild(idNodeValue);
				}
				if(getValue1() != null){
				var value1Node:XMLNode = new XMLNode(1,"value1");
				featureNode.appendChild(value1Node);
				var value1NodeValue:XMLNode = new XMLNode(3,getValue1());
				value1Node.appendChild(value1NodeValue);
				}
				var iqNode:XMLNode = iq.getNode();
				iqNode.appendChild(commandNode);
				iq.setNode(iqNode);
				iq.from = new EscapedJID(_from);
				return iq;
					
		} 
		
		
		public function setDestination(destination:String):void{
			this.destination = destination;
		}
		public function getDestination():String{
			return destination;
		} 
		public function setProfile(profile:String):void{
			this.profile = profile;
		}
		public function getProfile():String{
			return profile;
		} 
		public function setFeatureID(featureid:String):void{
			this.featureID = featureid;
		}
		public function getFeatureID():String{
			return featureID;
		} 
		public function setValue1(value1:String):void{
			this.value1 = value1;
		}
		public function getValue1():String{
			return value1;
		} 
	}
}