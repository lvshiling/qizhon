package com.codeazur.as3redis.commands
{
	import flash.utils.ByteArray;

	import com.codeazur.as3redis.RedisCommand;
	
	public class ECHO extends RedisCommand
	{
		protected var _text:String;
		
		public function ECHO(text:String)
		{
			_text = text;
		}
		
		override public function get name():String {
			return "ECHO";
		}
		
		override protected function createRequest():ByteArray {
			var ba:ByteArray = new ByteArray();
			var baText:ByteArray = new ByteArray();
			baText.writeUTFBytes(_text);
			ba.writeUTFBytes(name + " " + baText.length + "\r\n" + _text + "\r\n");
			return ba;
		}

		override public function toStringCommand():String {
			return "[" + name + " " + _text + "]";
		}
	}
}
