package com.codeazur.as3redis
{
	import flash.net.Responder;

	public class RedisResponder extends Responder
	{
		public var result:Function;
		public var status:Function;
		
		public function RedisResponder(result:Function, status:Function = null)
		{
			super(result, status);
		}
		
	}

}