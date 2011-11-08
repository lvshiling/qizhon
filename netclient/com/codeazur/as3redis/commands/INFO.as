package com.codeazur.as3redis.commands
{
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	import com.codeazur.as3redis.RedisCommand;
	
	public class INFO extends RedisCommand
	{
		public static const REDIS_VERSION:String = "redis_version";
		public static const UPTIME_IN_SECONDS:String = "uptime_in_seconds";
		public static const UPTIME_IN_DAYS:String = "uptime_in_days";
		public static const CONNECTED_CLIENTS:String = "connected_clients";
		public static const CONNECTED_SLAVES:String = "connected_slaves";
		public static const USED_MEMORY:String = "used_memory";
		public static const CHANGES_SINCE_LAST_SAVE:String = "changes_since_last_save";
		public static const BGSAVE_IN_PROGRESS:String = "bgsave_in_progress";
		public static const LAST_SAVE_TIME:String = "last_save_time";
		public static const TOTAL_CONNECTIONS_RECEIVED:String = "total_connections_received";
		public static const TOTAL_COMMANDS_PROCESSED:String = "total_commands_processed";
		public static const ROLE:String = "role";
		
		protected var _params:Dictionary;
		protected var _paramCount:uint = 0;
		
		public function INFO()
		{
			_params = new Dictionary();
		}
		
		public function get params():Dictionary { return _params; }
		
		override public function get name():String {
			return "INFO";
		}
		
		override protected function processBulkResponse(response:ByteArray):void {
			_paramCount = 0;
			if (response && response.length > 0) {
				var p:String = response.readUTFBytes(response.length);
				var pa:Array = p.split("\r\n");
				for (var i:uint = 0; i < pa.length; i++) {
					var kv:Array = pa[i].split(":");
					if (kv.length == 2) {
						_params[kv[0]] = kv[1];
						_paramCount++;
					}
				}
			}
		}

		override public function toString():String {
			var s:String = toStringCommand();
			if (params[ROLE]) { s += "\r  Role: " + params[ROLE]; }
			if (params[REDIS_VERSION]) { s += "\r  RedisVersion: " + params[REDIS_VERSION]; }
			if (params[USED_MEMORY]) { s += "\r  UsedMemory: " + params[USED_MEMORY]; }
			if (params[UPTIME_IN_SECONDS]) { s += "\r  UptimeInSeconds: " + params[UPTIME_IN_SECONDS]; }
			if (params[UPTIME_IN_DAYS]) { s += "\r  UptimeInDays: " + params[UPTIME_IN_DAYS]; }
			if (params[CONNECTED_CLIENTS]) { s += "\r  ConnectedClients: " + params[CONNECTED_CLIENTS]; }
			if (params[CONNECTED_SLAVES]) { s += "\r  ConnectedSlaves: " + params[CONNECTED_SLAVES]; }
			if (params[LAST_SAVE_TIME]) { s += "\r  LastSaveTime: " + (new Date(parseFloat(params[LAST_SAVE_TIME]) * 1000)); }
			if (params[CHANGES_SINCE_LAST_SAVE]) { s += "\r  ChangesSinceLastSave: " + params[CHANGES_SINCE_LAST_SAVE]; }
			if (params[BGSAVE_IN_PROGRESS]) { s += "\r  BGSaveInProgress: " + params[BGSAVE_IN_PROGRESS]; }
			if (params[TOTAL_CONNECTIONS_RECEIVED]) { s += "\r  TotalConnectionsReceived: " + params[TOTAL_CONNECTIONS_RECEIVED]; }
			if (params[TOTAL_COMMANDS_PROCESSED]) { s += "\r  TotalCommandsProcessed: " + params[TOTAL_COMMANDS_PROCESSED]; }
			return s;
		}
	}
}
