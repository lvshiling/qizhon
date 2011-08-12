package org.igniterealtime.xiff.openlink
{
	import org.igniterealtime.xiff.data.IQ;
	import org.igniterealtime.xiff.core.EscapedJID;
	
	import flash.xml.XMLNode;
	
	public class ManageVoiceBridge
	{
		private var serverComponent:String;
		private var _type:String;
		private var _from:String;
		private var action:String;
		private var jid:String;
		private var actions:Array;
		
		public function ManageVoiceBridge(type:String,serverComponent:String,from:String,action:String)
		{
			this._type = type;
			this._from = from;
			this.action = action;
			this.serverComponent = serverComponent;
		}
		
		public function addQuery():IQ
		{
			var iq:IQ = new IQ(new EscapedJID(serverComponent), _type);
				
			var commandNode:XMLNode = new XMLNode(1,"command");
			commandNode.attributes.xmlns= "http://jabber.org/protocol/commands";
			commandNode.attributes.action = action;
			commandNode.attributes.node = "http://xmpp.org/protocol/openlink:01:00:00#manage-voice-bridge";

			var  iodataNode:XMLNode = new XMLNode(1,"iodata");
			iodataNode.attributes.xmlns = "urn:xmpp:tmp:io-data";
			iodataNode.attributes.type = "input";

			commandNode.appendChild(iodataNode);
			var inNode:XMLNode = new XMLNode(1, "in");
			iodataNode.appendChild(inNode);

			
			var jidNode:XMLNode = new XMLNode(1,"jid");
			inNode.appendChild(jidNode);

			var actionsNode:XMLNode = new XMLNode(1,"actions");
			inNode.appendChild(actionsNode);


			if(getJID() != null)
			{
				var jidNodeNodeValue:XMLNode = new XMLNode(3, getJID());
				jidNode.appendChild(jidNodeNodeValue);
			}
			
			if(getActions() != null)
			{
				for (var i:int = 0; i < actions.length; i++) 
				{
					var actionNode:XMLNode = new XMLNode(1,"action");
					actionsNode.appendChild(actionNode);
										
					var nameNode:XMLNode = new XMLNode(1,"name");
					actionNode.appendChild(nameNode);	
					
					var nameNodeValue:XMLNode = new XMLNode(3, actions[i][0]);
					nameNode.appendChild(nameNodeValue);					
										
					var value1Node:XMLNode = new XMLNode(1,"value1");
					actionNode.appendChild(value1Node);

					var value1NodeValue:XMLNode = new XMLNode(3, actions[i][1]);
					value1Node.appendChild(value1NodeValue);					
										
					if (actions[i].length == 3 && actions[i][2] != null)
					{
						var value2Node:XMLNode = new XMLNode(1,"value2");
						actionNode.appendChild(value2Node);

						var value2NodeValue:XMLNode = new XMLNode(3, actions[i][2]);
						value2Node.appendChild(value2NodeValue);																				
					}
				}
				
			}			
			
			var iqNode:XMLNode = iq.getNode();
			iqNode.appendChild(commandNode);
			
			iq.setNode(iqNode);
			iq.from = new EscapedJID(_from);
			
			return iq;					
		} 
		
		
		public function setActions(actions:Array):void
		{
			this.actions = actions;
		}
		
		public function getActions():Array
		{
			return actions;
		} 

		public function setJID(jid:String):void{
			this.jid = jid;
		}
		
		public function getJID():String{
			return jid;
		} 		
	}
}