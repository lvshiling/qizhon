package com.codeazur.as3redis.commands
{
	import flash.utils.ByteArray;

	import com.codeazur.as3redis.RedisCommand;
	
	public class MGET extends RedisCommand
	{
		protected var _keys:Array;
		
		public function MGET(keys:Array)
		{
			_keys = keys;
		}
		
		override public function get name():String {
			return "MGET";
		}
		
		override protected function createRequest():ByteArray {
			var ba:ByteArray = new ByteArray();
			var cmd:String = name;
			for (var i:uint = 0; i < _keys.length; i++) {
				cmd += " " + _keys[i];
			}
			cmd += "\r\n";
			ba.writeUTFBytes(cmd);
			return ba;
		}

		override public function toStringCommand():String {
			return "[" + name + ((_keys.length > 0) ? " " + _keys.join(" ") : "") + "]";
		}
	}
}
