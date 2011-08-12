package org.igniterealtime.xiff.openlink
{	
	import flash.xml.XMLNode;
	
	import org.igniterealtime.xiff.core.EscapedJID;
	import org.igniterealtime.xiff.data.IQ;
	
	
	public class QueryFeatures extends IQ
	{
		private var serverComponent:String;
		private var _type:String;
		private var _from:String;
		private var action:String;
		private var profileId:String;
		
		public function QueryFeatures(type:String,serverComponent:String,from:String,action:String)
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
				commandNode.attributes.node = "http://xmpp.org/protocol/openlink:01:00:00#query-features";
				
				var  iodataNode:XMLNode = new XMLNode(1,"iodata");
				iodataNode.attributes.xmlns = "urn:xmpp:tmp:io-data";
				iodataNode.attributes.type = "input";
				commandNode.appendChild(iodataNode);
				
				var inNode:XMLNode = new XMLNode(1, "in");
				var profileNode:XMLNode = new XMLNode(1,"profile");
				iodataNode.appendChild(inNode);
				inNode.appendChild(profileNode);
				
				if(getProfileId() != null){
				var profileNodeValue:XMLNode = new XMLNode(3,getProfileId());
				profileNode.appendChild(profileNodeValue);
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
		


	}
}