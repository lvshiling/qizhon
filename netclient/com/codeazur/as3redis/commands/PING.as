package com.codeazur.as3redis.commands
{
	import com.codeazur.as3redis.RedisCommand;
	
	public class PING extends RedisCommand
	{
		public function PING()
		{
		}
		
		override public function get name():String {
			return "PING";
		}
	}
}
