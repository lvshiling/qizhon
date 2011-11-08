package com.codeazur.as3redis.commands
{
	import flash.utils.ByteArray;

	public class SETNX extends SET
	{
		public function SETNX(key:String, value:*)
		{
			super(key, value);
		}
		
		override public function get name():String {
			return "SETNX";
		}
	}
}
