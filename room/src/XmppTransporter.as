package  
{
	/**
	 * ...
	 * @author Stefan
	 */
	import com.adobe.serialization.json.JSON;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.net.NetConnection;
	import flash.external.*;
	import flash.utils.Timer;	
	import flash.xml.XMLNode;
	import mx.core.*;
	import mx.controls.Alert;	
	import mx.messaging.errors.MessageSerializationError;
	import org.igniterealtime.xiff.conference.Room;
	import org.igniterealtime.xiff.conference.RoomOccupant;
	import org.igniterealtime.xiff.core.*;
	import org.igniterealtime.xiff.data.*;
	import org.igniterealtime.xiff.events.*;		
	import org.igniterealtime.xiff.auth.Anonymous;
    import org.igniterealtime.xiff.vcard.VCard;
	import org.igniterealtime.xiff.openlink.*;
	import com.demonsters.debugger.MonsterDebugger;
	
	public class XmppTransporter 
	{
		private var connection:XMPPConnection;
		private var connectiontype:String = "socket";
		private var keepAliveTimer:Timer;
		private var _lastSent:int = 0;
		
		private var userName:String;
		private var password:String;
		private var displayName:String;
		private var nickName:String;
		private var groupName:String;
		private var anonymous:String;
		
		private var resource:String;
		private var domain:String;
		private var server:String;
	
		private var room:Room;
		/**
		 * For openfire system params,pls reference
		 * http://community.igniterealtime.org/docs/DOC-1061
		 * @param	param
		 */
		public function XmppTransporter(param:Params) 
		{
			userName = param.userName;
			password = param.password;
			nickName = param.nickName;
			groupName = param.groupName;
			anonymous = param.anonymous;
			server = param.server; 
			domain = param.domain;
			resource = param.resource;
			
			weblog("XmppTransporter:", userName + '|' + password + '|' + nickName + '|' + groupName + '|' + anonymous + '|' + server + '|' + domain + '|' + resource);
			MonsterDebugger.log(userName + '|' + password + '|' + nickName + '|' + groupName + '|' + anonymous + '|' + server + '|' + domain + '|' + resource);
			addCallBack();
			init();
			
		}
		private function init():void
		{
			weblog("init:", "setup");
			MonsterDebugger.log("init");
		
			connection = new XMPPConnection();
			connection.port = 5222;
			
			connection.addEventListener(OutgoingDataEvent.OUTGOING_DATA, onOutGoingData);
			connection.addEventListener(ConnectionSuccessEvent.CONNECT_SUCCESS, onConnectSuccess);
			connection.addEventListener(LoginEvent.LOGIN, onLogin);
			connection.addEventListener(XIFFErrorEvent.XIFF_ERROR, onXiffError);
			connection.addEventListener(DisconnectionEvent.DISCONNECT, onDisConnect); 	
			connection.addEventListener(MessageEvent.MESSAGE, onMessage);
			
			if (anonymous == 'YES')
			{
				connection.useAnonymousLogin = true;
				ExternalInterface.call("log", "anonymous:", "YES");
				
			} else {
			
				connection.username = userName;
				connection.password = password;
				ExternalInterface.call("log", "anonymous:", "NO");
			}
			
			connection.resource = resource;
			connection.domain = domain;     			
			connection.server = server;
			connection.connect(XMPPConnection.STREAM_TYPE_STANDARD);
			ExternalInterface.call("log", "connect:", "connecting");
		}
		private function onOutGoingData(evt:OutgoingDataEvent):void
		{
			_lastSent = new Date().getTime();
		}
		private function onConnectSuccess(evt:ConnectionSuccessEvent):void
		{
			MonsterDebugger.trace(this, "ConnectionSuccessEvent");
			weblog( "connect:", " success");
		}
		private function  onLogin(event:LoginEvent):void
		{
			trace("addEventListener: LoginEvent.LOGIN " + event);
			weblog("login:", " success");
			ExternalInterface.call("onRoomComplete");
			
			var recipient:EscapedJID = new EscapedJID(connection.domain);
			var availablePresence:Presence = new Presence(recipient, null, null, null, "Logged In");
			connection.send(availablePresence);
			
			weblog("server: ", connection.server);
			weblog("domain: ", connection.domain);
			weblog("resource: ", connection.resource);
			
			if (keepAliveTimer) 
				keepAliveTimer.stop();
			keepAliveTimer = new Timer(15000);
			keepAliveTimer.addEventListener(TimerEvent.TIMER, checkKeepAlive);
			keepAliveTimer.start();
			
			var vcard:VCard = VCard.getVCard(connection, connection.jid);
			
			if (vcard != null)
			{
				if (vcard.loaded)
				{
					handleVCard(vcard);

				} else	{
					vcard.addEventListener(VCardEvent.LOADED, 
											function(event:VCardEvent):void 
											{ 
												handleVCard(event.vcard); 
											}
										   );
				}
			}
			
			loginRoom();
		}
		private function onDisConnect(evt:DisconnectionEvent):void
		{
			MonsterDebugger.trace(this, "DisconnectionEvent.DISCONNECT");
			weblog("Event: ", "DisconnectionEvent.DISCONNECT");
			if (keepAliveTimer) 
				keepAliveTimer.stop();
		}
		private function onMessage(event:MessageEvent):void
		{
			trace("addEventListener: MessageEvent.MESSAGE " + event);
			
			var message:Message = event.data as Message;
			var xNode:XMLNode = message.getNode().firstChild;
			
			weblog("onMessage: ", "xNode");
		}
		private function onXiffError(event:XIFFErrorEvent):void
		{
			trace("addEventListener: XIFFErrorEvent.XIFF_ERROR " + event);
			MonsterDebugger.trace(this, event.errorCondition + "|" + event.errorMessage);
			weblog("error", event.errorCondition + event.errorMessage);
		}
		private function checkKeepAlive(event:TimerEvent):void 
		{
			MonsterDebugger.trace(this, "checkKeepAlive");
			if (new Date().getTime() - _lastSent > 15000)
			{
				if (connection.isLoggedIn() && connection.isActive())
				{
					//connection.sendKeepAlive();
					//weblog("heartbeat: ", "null package");
				}
			}
		}
		
		private function handleVCard(card:VCard):void 
		{	
			MonsterDebugger.trace(this, "handleVCard.....");
			if (card != null)
			{
				var nickname:String = card.nickname;
				var firstName:String = "";
				var lastName:String = "";			
				
				if (card.name != null)
				{
					firstName = card.name.given;
					lastName = card.name.family;
					
					if(firstName && firstName.length > 0 && lastName && lastName.length > 0)
						displayName = firstName + " " + lastName;									
				}

				if(nickname && nickname.length > 0)
					displayName = nickname;
					
				MonsterDebugger.trace(this, "ExternalInterface.call displayName");
			}
			
		}
		
		public function loginRoom():void
		{
			MonsterDebugger.trace(this, "loginRoom");
			weblog("action:", "loginRoom");
			room = new Room(connection);
			room.roomJID = new UnescapedJID(groupName+'@conference.'+connection.domain);
			room.nickname = nickName;
			room.addEventListener(RoomEvent.ROOM_JOIN, onRoomJoin);
			room.addEventListener(RoomEvent.GROUP_MESSAGE, onGroupMsg);
			room.addEventListener(RoomEvent.ROOM_LEAVE, onRoomLeave);
			room.addEventListener(RoomEvent.USER_JOIN, onUserJoin);
			room.addEventListener(RoomEvent.USER_DEPARTURE, onUserDeparture);
			room.join();
		}
		
		private function getPartList():String
		{
			var ret:String = '';
			if (room)
			{
				for each ( var occ:RoomOccupant in room )
				{
					ret = ret +';' + occ.displayName;
				}
			}
			return ret;
		}
		private function onUserJoin(evt:RoomEvent):void
		{
			ExternalInterface.call("onUserJoin", ''+evt.nickname);
		}
		private function onUserDeparture(evt:RoomEvent):void
		{
			ExternalInterface.call("onUserDeparture", ''+evt.nickname);
		}
		private function onRoomJoin(e:RoomEvent):void
		{
			MonsterDebugger.trace(this, "onRoomJoin......");
			var msg:Message = e.data as Message;
			if(msg)
				ExternalInterface.call("onRoomJoin", '' + msg.from.resource, '' + msg.body);
				
		}
		private function onRoomLeave(e:RoomEvent):void
		{
			MonsterDebugger.log("onRoomLeave");
			var msg:Message = e.data as Message;
			if(msg)
				ExternalInterface.call("onRoomLeave", ''+msg.from.resource, ''+msg.body);
		}
		private function onGroupMsg(evt:RoomEvent):void
		{
			
			MonsterDebugger.trace(this, "onGroupMsg");
			MonsterDebugger.trace(this, "evt.data: " + evt.data);
			
			var msg:Message = evt.data as Message;
			ExternalInterface.call("onReceivedGroupMsg", ''+msg.from.resource,  ''+msg.body);
			MonsterDebugger.trace(this, ''+msg.from.resource, "%%%%%%" + msg.body);
			ExternalInterface.call("log", 'onGroupMsg', ''+msg.body);
			
		}
		private function sendGroupMsg(msg:String):void
		{
			MonsterDebugger.trace(this, 'send msg:' + msg);
			if (room) {
				room.sendMessage(msg);
			}
		}
		
		private function weblog(p1:String, p2:String):void
		{
			ExternalInterface.call("log", p1, p2);
		}
		private function addCallBack():void
		{
			ExternalInterface.addCallback("sendGroupMsg", sendGroupMsg);
			ExternalInterface.addCallback("getPartList", getPartList);
		}
	}

}