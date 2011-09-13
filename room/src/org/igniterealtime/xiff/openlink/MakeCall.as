package org.igniterealtime.xiff.openlink
{
	import flash.xml.XMLNode;
	
	import org.igniterealtime.xiff.core.EscapedJID;
	import org.igniterealtime.xiff.data.IQ;
	
	public class MakeCall extends IQ
	{	
		private var serverComponent:String;
		private var _type:String;
		private var _from:String;
		private var action:String;
		private var jid:String;
		private var interest:String;
		private var destination:String;
		private var feature:String;
		public function MakeCall(type:String,serverComponent:String,from:String,action:String)
		{
			this._type=type;
			this.action=action;
			this.serverComponent=serverComponent;
			this._from=from;
		}
		
		public function addQuery():IQ{
			
			var iq:IQ = new IQ(new EscapedJID(serverComponent), _type);
				
				var commandNode:XMLNode = new XMLNode(1,"command");
				commandNode.attributes.xmlns= "http://jabber.org/protocol/commands";
				commandNode.attributes.action = action;
				commandNode.attributes.node = "http://xmpp.org/protocol/openlink:01:00:00#make-call";
				
				var  iodataNode:XMLNode = new XMLNode(1,"iodata");
				iodataNode.attributes.xmlns = "urn:xmpp:tmp:io-data";
				iodataNode.attributes.type = "input";
				commandNode.appendChild(iodataNode);
				
				var inNode:XMLNode = new XMLNode(1, "in");
				
				
				
				iodataNode.appendChild(inNode);
				
			
			
				if(getEscapedJID() != null){
				var jidNode:XMLNode = new XMLNode(1,"jid");
				inNode.appendChild(jidNode);
				var jidValueNode:XMLNode = new XMLNode(3,getEscapedJID());
				jidNode.appendChild(jidValueNode);
				}
				
				if(getInterest() != null){
				var intersetNode:XMLNode = new XMLNode(1,"interest");
				inNode.appendChild(intersetNode);
				var intersetValueNode:XMLNode = new XMLNode(3,getInterest());
				intersetNode.appendChild(intersetValueNode);
				}
								
				if(getDestination() != ""){
				var destinationNode:XMLNode= new XMLNode(1,"destination");
				inNode.appendChild(destinationNode);
				var destinationNodeValue:XMLNode = new XMLNode(3,getDestination());
				destinationNode.appendChild(destinationNodeValue);
				}
				
				var iqNode:XMLNode = iq.getNode();
				iqNode.appendChild(commandNode);
				iq.setNode(iqNode);
				iq.from = new EscapedJID(_from);
				
				
				return iq;
			
			
		} 
		
		
		public function setEscapedJID(jid:String):void{
			this.jid = jid;
		}
		public function getEscapedJID():String{
			return jid;
		} 
		
		public function setInterest(interest:String):void{
			this.interest = interest;
		}
		public function getInterest():String{
			return interest;
		} 
		public function setFeature(feature:String):void{
			this.feature = feature;
		}
		public function getFeature():String{
			return feature;
		} 
		
		public function setDestination(destination:String):void{
			this.destination = destination;
		}
		public function getDestination():String{
			return destination;
		} 

		
	}
}