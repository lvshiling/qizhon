package com.codeazur.as3redis.commands
{
	import flash.utils.ByteArray;

	import com.codeazur.as3redis.RedisCommand;
	
	public class SET extends RedisCommand
	{
		protected var _key:String;
		protected var _value:*;
		
		public function SET(key:String, value:*)
		{
			_key = key;
			_value = value;
		}
		
		override public function get name():String {
			return "SET";
		}
		
		override protected function createRequest():ByteArray {
			var ba:ByteArray = new ByteArray();
			var baValue:ByteArray = serializeValue(_value);
			ba.writeUTFBytes(name + " " + _key + " " + baValue.length + "\r\n");
			ba.writeBytes(baValue);
			ba.writeUTFBytes("\r\n");
			return ba;
		}

		override public function toStringCommand():String {
			return "[" + name + " " + _key + " " + toStringValue(_value) + "]";
		}
	}
}
