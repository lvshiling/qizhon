package org.igniterealtime.xiff.openlink
{	
	import flash.xml.XMLNode;
	
	import org.igniterealtime.xiff.core.EscapedJID;
	import org.igniterealtime.xiff.data.IQ;
	
	public class Subscribe
	{	
		private var serverComponent:String;
		private var _type:String;
		private var _from:String;
		private var node:String;
		private var jid:String;
		public function Subscribe(type:String,serverComponent:String,from:String)
		{
			this._type=type;
			this.serverComponent=serverComponent;
			this._from=from;
		}
		
		public function addQuery():IQ{
			
			var iq:IQ = new IQ(new EscapedJID(serverComponent), _type);
				
				var pubsubNode:XMLNode = new XMLNode(1,"pubsub");
				pubsubNode.attributes.xmlns= "http://jabber.org/protocol/pubsub";
				
				var  subscribeNode:XMLNode = new XMLNode(1,"subscribe");
				if(getNode() != null){
				subscribeNode.attributes.node = getNode();
				}
				if(getJID() != null){
				subscribeNode.attributes.jid = getJID();
				}
				pubsubNode.appendChild(subscribeNode);
				
								
				var iqNode:XMLNode = iq.getNode();
				iqNode.appendChild(pubsubNode);
				iq.setNode(iqNode);
				iq.from = new EscapedJID(_from);
				
				
				return iq;
					
		} 
		
		public function setNode(node:String):void{
			this.node = node;
		}
		public function getNode():String{
			return node;
		} 
		public function setJID(jid:String):void{
			this.jid = jid;
		}
		public function getJID():String{
			return jid;
		} 
	}
}