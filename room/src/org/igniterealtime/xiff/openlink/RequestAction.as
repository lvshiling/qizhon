package org.igniterealtime.xiff.openlink
{	
	import flash.xml.XMLNode;
	
	import org.igniterealtime.xiff.core.EscapedJID;
	import org.igniterealtime.xiff.data.IQ;
	
	public class RequestAction
	{	
		private var serverComponent:String;
		private var _type:String;
		private var _from:String;
		private var action:String;
		private var jid:String;
		private var actionType:String;
		private var interest:String;
		private var callID:String;
		private var value1:String;
		
		
		public function RequestAction(type:String,serverComponent:String,from:String,action:String)
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
				commandNode.attributes.node = "http://xmpp.org/protocol/openlink:01:00:00#request-action";
				
				var  iodataNode:XMLNode = new XMLNode(1,"iodata");
				iodataNode.attributes.xmlns = "urn:xmpp:tmp:io-data";
				iodataNode.attributes.type = "input";
				commandNode.appendChild(iodataNode);
				
				var inNode:XMLNode = new XMLNode(1, "in");
				var interestNode:XMLNode = new XMLNode(1,"interest");
				var actionNode:XMLNode = new XMLNode(1,"action");
				var value1Node:XMLNode = new XMLNode(1,"value1");
				var callNode:XMLNode = new XMLNode(1,"call");
				iodataNode.appendChild(inNode);
				inNode.appendChild(interestNode);
				inNode.appendChild(actionNode);
				
				inNode.appendChild(callNode);
				
				if(getInterest() != null){
				var interestNodeValue:XMLNode = new XMLNode(3,getInterest());
				interestNode.appendChild(interestNodeValue);
				}
				
				if(getActionType() != null){
				var actionNodeValue:XMLNode = new XMLNode(3,getActionType());
				actionNode.appendChild(actionNodeValue);
				}
				if(getValue1() != null)
				{
					inNode.appendChild(value1Node);
					var value1NodeValue:XMLNode = new XMLNode(3,getValue1());
					value1Node.appendChild(value1NodeValue);
				}
				
				if(getCallID() != null){
				var callNodeValue:XMLNode = new XMLNode(3,getCallID());
				callNode.appendChild(callNodeValue);
				}
				
				
				var iqNode:XMLNode = iq.getNode();
				iqNode.appendChild(commandNode);
				iq.setNode(iqNode);
				iq.from = new EscapedJID(_from);
				return iq;
					
		} 
		
		public function setCallID(callID:String):void{
			this.callID = callID;
		}
		public function getCallID():String{
			return callID;
		} 
		
		public function setActionType(actionType:String):void{
			this.actionType = actionType;
		}
		public function getActionType():String{
			return actionType;
		} 
		public function setInterest(interest:String):void{
			this.interest = interest;
		}
		public function getInterest():String{
			return interest;
		} 
		public function setValue1(value1:String):void{
			this.value1 = value1;
		}
		public function getValue1():String{
			return value1;
		} 
		
	}
}