package org.igniterealtime.xiff.openlink
{
	import org.igniterealtime.xiff.data.IQ;
	import org.igniterealtime.xiff.core.EscapedJID;
	import flash.xml.XMLNode;
	
	public class ManageVoiceMessage
	{
		private var serverComponent:String;
		private var _type:String;
		private var _from:String;
		private var action:String;
		private var actionType:String;
		private var feature:String;
		private var value1:String;
		public function ManageVoiceMessage(type:String,serverComponent:String,from:String,action:String)
		{
			this._type=type;
			this.action=action;
			this.serverComponent=serverComponent;
		}
		
		public function addQuery():IQ{
			var iq:IQ = new IQ(new EscapedJID(serverComponent), _type);
				
				var commandNode:XMLNode = new XMLNode(1,"command");
				commandNode.attributes.xmlns= "http://jabber.org/protocol/commands";
				commandNode.attributes.action = action;
				commandNode.attributes.node = "http://xmpp.org/protocol/openlink:01:00:00#manage-voice-message";
				
				var  iodataNode:XMLNode = new XMLNode(1,"iodata");
				iodataNode.attributes.xmlns = "urn:xmpp:tmp:io-data";
				iodataNode.attributes.type = "input";
				commandNode.appendChild(iodataNode);
				
				var inNode:XMLNode = new XMLNode(1, "in");
				var featureNode:XMLNode = new XMLNode(1,"feature");
				var actionNode:XMLNode = new XMLNode(1,"action");
				var value1Node:XMLNode = new XMLNode(1,"value1");
				iodataNode.appendChild(inNode);
				inNode.appendChild(featureNode);
				inNode.appendChild(actionNode);
				inNode.appendChild(value1Node);
				
				
				if(getActionType() != null){
				var actionTypeNodeValue:XMLNode = new XMLNode(3,getActionType());
				actionNode.appendChild(actionTypeNodeValue);
				}
				if(getFeature() != null){
				var featureNodeValue:XMLNode = new XMLNode(3,getFeature());
				featureNode.appendChild(featureNodeValue);
				}
				if(getValue1() != null){
				var value1NodeValue:XMLNode = new XMLNode(3,getValue1());
				value1Node.appendChild(value1NodeValue);
				}
				var iqNode:XMLNode = iq.getNode();
				iqNode.appendChild(commandNode);
				iq.setNode(iqNode);
				iq.from = new EscapedJID(_from);
				return iq;
					
		} 
		public function setActionType(actionType:String):void{
			this.actionType = actionType;
		}
		public function getActionType():String{
			return actionType;
		} 
		public function setFeature(feature:String):void{
			this.feature = feature;
		}
		public function getFeature():String{
			return feature;
		} 
		public function setValue1(value1:String):void{
			this.value1 = value1;
		}
		public function getValue1():String{
			return value1;
		} 
		
	}
}