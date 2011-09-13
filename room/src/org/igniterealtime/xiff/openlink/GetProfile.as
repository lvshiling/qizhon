package org.igniterealtime.xiff.openlink
{	
	import flash.xml.XMLNode;
	import org.igniterealtime.xiff.core.EscapedJID;
	import org.igniterealtime.xiff.data.IQ;

	public class GetProfile extends IQ
	{	
		private var serverComponent:String;
		private var _type:String;
		private var _from:String;
		private var _callBack:String;
		private var action:String;
		private var jid:String;

		public function GetProfile(type:String,serverComponent:String,from:String,action:String) 
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
			commandNode.attributes.node = "http://xmpp.org/protocol/openlink:01:00:00#get-profiles";

			var  iodataNode:XMLNode = new XMLNode(1,"iodata");
			iodataNode.attributes.xmlns = "urn:xmpp:tmp:io-data";
			iodataNode.attributes.type = "input";
			commandNode.appendChild(iodataNode);

			var inNode:XMLNode = new XMLNode(1, "in");
			var jidNode:XMLNode = new XMLNode(1,"jid");
			iodataNode.appendChild(inNode);
			inNode.appendChild(jidNode);

			if(getJId() != null){
			var jidNodeValue:XMLNode = new XMLNode(3,getJId());
			jidNode.appendChild(jidNodeValue);
			}

			var iqNode:XMLNode = iq.getNode();
			iqNode.appendChild(commandNode);
			iq.setNode(iqNode);
			iq.from = new EscapedJID(_from);
			return iq;
					
		} 
		
		public function setJId(jid:String):void{
			this.jid = jid;
		}
		public function getJId():String{
			return jid;
		} 

	}
}