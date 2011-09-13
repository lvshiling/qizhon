package  
{
	import com.demonsters.debugger.MonsterDebugger;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.external.ExternalInterface;
	
	/**
	 * @author     mole<mole1230@gmail.com>
	 * @version    $Id: Params.as 7 2010-10-19 10:38:30Z mole1230 $
	 */
	public class Params
	{
		private static var instance:Params = null;
		private static var callBack:String = "App.swfCall";
		private static var giftCallBack:String = 'sendGift';
		private var loaderInfo:LoaderInfo;
		private var _rtmpUrl:String;
		private var _streamKey:String ;
		private var _streamName:String;
		private var _role:String;
		
		public static function getInstance(loaderInfo:LoaderInfo = null):Params
		{
			if (instance === null || loaderInfo is LoaderInfo) {
				instance = new Params(loaderInfo);
			}
			
			return instance;
		}
		
		public static function call(code:*, data:Object = null):void
		{
			var json:Object = { };
			if (code is String) {
				json.code = code;
				json.data = data;
			} else {
				json = code;
			}
			try {
				ExternalInterface.call(callBack, json);
			} catch (e:Error) {
				MonsterDebugger.trace('Params.call', e);
			}
		}
		
		public function Params(loaderInfo:LoaderInfo = null) 
		{
			this.loaderInfo = loaderInfo;
			this.parse();
		}
		
		public function get rtmpUrl():String
		{
			return _rtmpUrl;
		}
		
		public function get streamKey():String
		{
			return _streamKey;
		}
		
		public function get streamName():String
		{
			return _streamName;
		}
		
		public function get role():String
		{
			return _role;
		}
		private function parse():void
		{
			if (!(this.loaderInfo is LoaderInfo)) {
				return;
			}
			
			_rtmpUrl = String(parseParam("rtmpUrl", "rtmp://192.168.82.234/oflaDemo"));
			_streamKey = String(parseParam("streamKey", "oxdxdfdsabdddddddddddf"));
			_streamName = String(parseParam("streamName", "9999"));
			_role = String(parseParam("role", "publisher"));
			// static
			callBack = String(parseParam("callBack", "App.swfCall"));
			
		}
		
		private function parseParam(key:String, defaults:* = null):*
		{
			var params:Object = this.loaderInfo.parameters as Object;
			if (params.hasOwnProperty(key)) {
				return params[key];
			}
			
			return defaults;
		}
	}

}