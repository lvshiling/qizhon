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
	import org.igniterealtime.xiff.data.im.RosterGroup;
	import org.igniterealtime.xiff.data.im.RosterItemVO;
	import org.igniterealtime.xiff.events.*;		
	import org.igniterealtime.xiff.auth.Anonymous;
    import org.igniterealtime.xiff.vcard.VCard;
	import org.igniterealtime.xiff.openlink.*;
	import org.igniterealtime.xiff.im.Roster;
	import org.igniterealtime.xiff.events.RosterEvent;
	import com.demonsters.debugger.MonsterDebugger;
	
	public class XmppTransporter 
	{
		private var connection:XMPPConnection;
		private var connectiontype:String = "socket";
		private var keepAliveTimer:Timer;
		private var KEEP_ALIVE_PERIOD:int = 5 * 60 * 1000;
		private var _lastSent:int = 0;
		
		private var userName:String;
		private var password:String;
		private var displayName:String;
		private var nickName:String;
		private var groupName:String;
		private var anonymous:String;
		private var priority:uint;
		private var resource:String;
		private var domain:String;
		private var server:String;
		private var subject:String;
		private var room:Room;
		private var _roster:Roster;
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
			priority = param.priority;
			weblog("XmppTransporter:", userName + '|' + password + '|' + nickName + '|' + groupName + '|' + anonymous + '|' + server + '|' + domain + '|' + resource+'|'+priority);
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
			setupRoster();
			if (anonymous == 'YES')
			{
				connection.useAnonymousLogin = true;
				weblog("anonymous:", "YES");
				
			} else {
			
				connection.username = userName;
				connection.password = password;
				weblog("anonymous:", "NO");
			}
			
			connection.resource = resource;
			connection.domain = domain;     			
			connection.server = server;
			connection.connect(XMPPConnection.STREAM_TYPE_STANDARD);
			weblog("connect:", "connecting");
			
		}
		private function onOutGoingData(evt:OutgoingDataEvent):void
		{
			_lastSent = new Date().getTime();
			weblog("send msg success", 'onOutGoingData');
		}
		private function onConnectSuccess(evt:ConnectionSuccessEvent):void
		{
			MonsterDebugger.trace(this, "ConnectionSuccessEvent");
			weblog( "connect:", " success");
		}
		private function  onLogin(event:LoginEvent):void
		{
			weblog("login:", " success");
			//TOOPEN
			ExternalInterface.call(CallList.onRoomComplete);
			weblog("server: ", connection.server);
			weblog("domain: ", connection.domain);
			weblog("resource: ", connection.resource);
			
			if (keepAliveTimer) 
				keepAliveTimer.stop();
			keepAliveTimer = new Timer(KEEP_ALIVE_PERIOD);
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
			var from:String = message.from.node;
			var text:String = message.body;
			var type:String = message.type;
			//TOOPEN
			//when type equals null,the message is a administrator msg.
			//<message from="zt-2006009">
			//  <body>nima</body>
			//</message>
			
			ExternalInterface.call(CallList.onReceivedPrivateMsg, ''+from,  ''+text, ''+type);
			MonsterDebugger.log('onMessage from '+ from, text+'|'+type);
			
		}
		private function onXiffError(event:XIFFErrorEvent):void
		{
			MonsterDebugger.log('xifferror:'+event.errorCode+'|'+event.errorMessage);
			weblog("error", event.errorCondition + event.errorMessage);
			if (event.errorCode == 503)
			{
				//reconnect
			}
		}
		private function checkKeepAlive(event:TimerEvent):void 
		{
			MonsterDebugger.trace(this, "checkKeepAlive");
			if (new Date().getTime() - _lastSent > KEEP_ALIVE_PERIOD)
			{
				if (connection.isLoggedIn() && connection.isActive())
				{
					connection.sendKeepAlive();
					_lastSent = new Date().getTime();
					weblog("heartbeat: ", "ping package");
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
			//room.subject = subject;
			room.addEventListener(RoomEvent.ROOM_JOIN, onRoomJoin);
			room.addEventListener(RoomEvent.GROUP_MESSAGE, onGroupMsg);
			room.addEventListener(RoomEvent.ROOM_LEAVE, onRoomLeave);
			room.addEventListener(RoomEvent.USER_JOIN, onUserJoin);
			room.addEventListener(RoomEvent.USER_DEPARTURE, onUserDeparture);
			room.addEventListener(RoomEvent.ADMIN_ERROR, onAdminError);
			room.addEventListener(RoomEvent.AFFILIATION_CHANGE_COMPLETE, onAffiliationChangeComplete);
			room.addEventListener(RoomEvent.AFFILIATIONS, onAffiliations);
			room.addEventListener(RoomEvent.USER_KICKED, onUserKicked);
			room.addEventListener(RoomEvent.USER_BANNED, onUserBanded);
			room.addEventListener(RoomEvent.USER_PRESENCE_CHANGE, onRoomUserPresenceChanged);
			room.join();
			
		}
		
		private function getPartList():String
		{
			var ret:String = '';
			if (room)
			{
				for each ( var occ:RoomOccupant in room )
				{
					//ret = ret +';' + occ.displayName+','+occ.jid.node;
					ret = ret +';' + occ.displayName;
				}
			}
			return ret;
		}
		
		private function nicknameToUid(nickname:String):String
		{
			var ret:String = '';
			if (room)
			{
				for each ( var occ:RoomOccupant in room )
				{
	
					if (occ.displayName == nickname)
					{
						ret = occ.jid.node;
					}
				}
			}
			MonsterDebugger.log("nicknameToUid: ", ret);
			return ret;
		}
		
		private function onRoomUserPresenceChanged(evt:RoomEvent):void
		{
			MonsterDebugger.log("onRoomUserPresenceChanged", evt);
		}
		
		private function onUserKicked(evt:RoomEvent):void
		{
			MonsterDebugger.log("onUserKicked", evt);
			ExternalInterface.call(CallList.onUserKicked, evt.nickname);
		}
		
		private function onUserBanded(evt:RoomEvent):void
		{
			MonsterDebugger.log("onUserBanded", evt);
			ExternalInterface.call(CallList.onUserBaned, evt.nickname);
		}
			
		private function onAffiliations(evt:RoomEvent):void
		{
			MonsterDebugger.log("onAffiliations", evt);
		}
		
		private function onAdminError(evt:RoomEvent):void
		{
			MonsterDebugger.log("onAdminError:" + evt.errorMessage);
		}
		
		private function onAffiliationChangeComplete(evt:RoomEvent):void
		{
			MonsterDebugger.log("onAffiliationChangeComplete", evt);
		}
		
		private function onUserJoin(evt:RoomEvent):void
		{
			MonsterDebugger.log(this, "onUserJoin......", evt);
			if (evt.data)
			{
				//var uid:String = nicknameToUid(evt.nickname);
				MonsterDebugger.trace(this, "onUserJoin......", evt.nickname, room.role);
				//TOOPEN
				ExternalInterface.call(CallList.onUserJoin,''+evt.nickname, ''+ room.affiliation);
			}
		}
		
		private function onUserDeparture(evt:RoomEvent):void
		{
			if (evt.data)
			{
				//var uid:String = nicknameToUid(evt.nickname);
				MonsterDebugger.trace(this, "onUserDeparture......", evt.nickname);
				ExternalInterface.call(CallList.onUserDeparture, ''+evt.nickname);
			}
		}
		
		private function onRoomJoin(e:RoomEvent):void
		{
			MonsterDebugger.trace(this, "onRoomJoin......");
			var msg:Message = e.data as Message;
			if(msg)
				ExternalInterface.call(CallList.onUserJoin, '' + msg.from.resource, '' + msg.body);
		
		}
		
		private function onRoomLeave(e:RoomEvent):void
		{
			MonsterDebugger.log("onRoomLeave");
			var msg:Message = e.data as Message;
			if(msg)
				ExternalInterface.call(CallList.onRoomLeave, ''+msg.from.resource, ''+msg.body);
		}
		
		private function onGroupMsg(evt:RoomEvent):void
		{
			
			var msg:Message = evt.data as Message;
			//TOOPEN
			ExternalInterface.call(CallList.onReceivedGroupMsg, ''+msg.from.resource,  ''+msg.body);
			MonsterDebugger.trace(this, ''+msg.from.resource, "%%%%%%" + msg.body);
			weblog('onGroupMsg', ''+msg.body);
			
		}
		
		private function sendGroupMsg(msg:String):void
		{
			MonsterDebugger.trace(this, 'send msg:' + msg);
			if (room) {
				room.sendMessage(msg);
			}
		}
		
		private function sendPrivate(to:String, text:String, res:String=null):void
		{
			var toJid:EscapedJID
			if (!to || !text) 
				return;
			if (res)
			{
				 toJid = new EscapedJID(to + '@'+connection.domain+'/'+res);
			}
			else
			{
				 toJid = new EscapedJID(to + '@'+connection.domain);
			}
			var msg:Message = new Message(toJid, null, text,null,Message.TYPE_CHAT);
			connection.send(msg);
			ExternalInterface.call(CallList.onOutGoing, to, text);
			weblog('private msg to '+toJid.bareJID, text+'|'+toJid.resource);
			MonsterDebugger.log('private msg to '+toJid.bareJID, text);
		}
		
		private function setPassword(pw:String):void
		{
			if (room.isActive)
			{
				room.password = pw;	
			}
		}
		/**
		 * 
		 * @param	role admin/none
		 * @param	uid
		 */
		private function setRole(role:String, uid:String):void
		{
			MonsterDebugger.log('setRole '+role, uid);
			var uids:Array = [];
			uids.push(new UnescapedJID(uid + '@'+connection.domain));
			if (role == Configure.admin)
			{
				room.grant(Room.AFFILIATION_ADMIN, uids);
			} 
			else if (role == Configure.none)
			{
				room.revoke(uids);	
			}
		}
		
		private function kickUser(nickName:String):void
		{
			room.kickOccupant(nickName, "对不起");
		}
		
		private function banUser(uid:String):void
		{
			MonsterDebugger.log('banUser '+uid);

			var uids:Array = [];
			uids.push(new UnescapedJID(uid + '@'+connection.domain));
			room.ban(uids);	
		}
		
		private function allowUser(uid:String):void
		{
			var uids:Array = [];
			uids.push(new UnescapedJID(uid + '@'+connection.domain));
			room.allow(uids);	
		}
		
		private function weblog(p1:String, p2:String):void
		{	
			//TOOPEN
			ExternalInterface.call(CallList.log, p1, p2);
		}
		
		private function addCallBack():void
		{
			//TOOPEN
			ExternalInterface.addCallback(CallBackList.sendGroupMsg, sendGroupMsg);
			ExternalInterface.addCallback(CallBackList.getPartList, getPartList);
			ExternalInterface.addCallback(CallBackList.sendPrivate, sendPrivate);
			ExternalInterface.addCallback(CallBackList.setPassword, setPassword);
			ExternalInterface.addCallback(CallBackList.setRole, setRole);
			ExternalInterface.addCallback(CallBackList.kickUser, kickUser);
			ExternalInterface.addCallback(CallBackList.banUser, banUser);
			ExternalInterface.addCallback(CallBackList.allowUser, allowUser);
		}
		private function getArchiveMsg():void
		{
			//var iq:IQ = new IQ(
		}
		private function setupRoster():void
		{
			_roster = new Roster();
			_roster.addEventListener( RosterEvent.ROSTER_LOADED, onRosterLoaded );
			_roster.addEventListener( RosterEvent.SUBSCRIPTION_DENIAL, onSubscriptionDenial );
			_roster.addEventListener( RosterEvent.SUBSCRIPTION_REQUEST, onSubscriptionRequest );
			_roster.addEventListener( RosterEvent.SUBSCRIPTION_REVOCATION, onSubscriptionRevocation );
			_roster.addEventListener( RosterEvent.USER_ADDED, onUserAdded );
			_roster.addEventListener( RosterEvent.USER_AVAILABLE, onUserAvailable );
			_roster.addEventListener( RosterEvent.USER_PRESENCE_UPDATED, onUserPresenceUpdated );
			_roster.addEventListener( RosterEvent.USER_REMOVED, onUserRemoved );
			_roster.addEventListener( RosterEvent.USER_SUBSCRIPTION_UPDATED, onUserSubscriptionUpdated );
			_roster.addEventListener( RosterEvent.USER_UNAVAILABLE, onUserUnavailable );
			_roster.connection = connection;
			
		}
		private function onRosterLoaded( event:RosterEvent ):void
		{
			
			var recipient:EscapedJID = new EscapedJID(connection.domain);
			MonsterDebugger.log('onRosterLoaded 1');
			var availablePresence:Presence = new Presence(recipient, null, null, null, "Logged In",priority);
			connection.send(availablePresence);
			
			MonsterDebugger.log('onRosterLoaded');
			var group:RosterGroup = _roster.getGroup('Buddies');
			//MonsterDebugger.log(group.label);
			//MonsterDebugger.log(group.items);
			
		}
		
		private function onSubscriptionDenial( event:RosterEvent ):void
		{
		}
		
		private function onSubscriptionRequest( event:RosterEvent ):void
		{
			if( _roster.contains( RosterItemVO.get( event.jid, false ) ) )
			{
				_roster.grantSubscription( event.jid, true );
			}
			
		}
		
		private function onSubscriptionRevocation( event:RosterEvent ):void
		{
		}
		private function onUserAdded( event:RosterEvent ):void
		{
			MonsterDebugger.log('onUserAdded');
		}
		
		private function onUserAvailable( event:RosterEvent ):void
		{
			MonsterDebugger.log('onUserAvailable');
			
		}
		
		private function onUserPresenceUpdated( event:RosterEvent ):void
		{
			MonsterDebugger.log('onUserPresenceUpdated');
		}
		
		private function onUserRemoved( event:RosterEvent ):void
		{
			MonsterDebugger.log('onUserRemoved');
		}
		
		private function onUserSubscriptionUpdated( event:RosterEvent ):void
		{
			MonsterDebugger.log('onUserSubscriptionUpdated');
		}
		
		private function onUserUnavailable( event:RosterEvent ):void
		{
			MonsterDebugger.log('onUserUnavailable');
		}
	}

}