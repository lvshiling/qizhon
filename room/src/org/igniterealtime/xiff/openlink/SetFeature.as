package org.igniterealtime.xiff.openlink
{
	import flash.xml.XMLNode;
	
	import org.igniterealtime.xiff.core.EscapedJID;
	import org.igniterealtime.xiff.data.IQ;
	
	public class SetFeature extends IQ
	{
		private var serverComponent:String;
		private var _type:String;
		private var _from:String;
		private var action:String;
		private var profileId:String;
		private var feature:String;
		private var value1:String;
		private var value2:String;
		
		public function SetFeature(type:String,serverComponent:String,from:String,action:String)
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
				commandNode.attributes.node = "http://xmpp.org/protocol/openlink:01:00:00#set-features";
				
				var  iodataNode:XMLNode = new XMLNode(1,"iodata");
				iodataNode.attributes.xmlns = "urn:xmpp:tmp:io-data";
				iodataNode.attributes.type = "input";
				commandNode.appendChild(iodataNode);
				
				var inNode:XMLNode = new XMLNode(1, "in");
				var profileNode:XMLNode = new XMLNode(1,"profile");
				var featureNode:XMLNode = new XMLNode(1,"feature");
				
				
				iodataNode.appendChild(inNode);
				inNode.appendChild(profileNode);
				inNode.appendChild(featureNode);
				
				
				if(getProfileId() != null){
				var profileNodeValue:XMLNode = new XMLNode(3,getProfileId());
				profileNode.appendChild(profileNodeValue);
				}
				if(getFeature() != null){
				var featureNodeValue:XMLNode = new XMLNode(3,getFeature());
				featureNode.appendChild(featureNodeValue);
				}
				if(getValue1() != ""){
				var value1Node:XMLNode = new XMLNode(1,"value1");
				inNode.appendChild(value1Node);
				var value1NodeValue:XMLNode = new XMLNode(3,getValue1());
				value1Node.appendChild(value1NodeValue);
				}
				if(getValue2() != ""){
				var value2Node:XMLNode = new XMLNode(1,"value2");
				inNode.appendChild(value2Node);
				var value2NodeValue:XMLNode = new XMLNode(3,getValue2());
				value2Node.appendChild(value2NodeValue);
				}
				
				
				var iqNode:XMLNode = iq.getNode();
				iqNode.appendChild(commandNode);
				iq.setNode(iqNode);
				iq.from = new EscapedJID(_from);
				
				
				return iq;
			
			
		} 
		
		
		public function setProfileId(profileId:String):void{
			this.profileId = profileId;
		}
		public function getProfileId():String{
			return profileId;
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
		
		public function setValue2(value2:String):void{
			this.value2 = value2;
		}
		public function getValue2():String{
			return value2;
		} 


	}
}