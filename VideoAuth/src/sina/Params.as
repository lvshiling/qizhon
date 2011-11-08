package sina 
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
		
		private var loaderInfo:LoaderInfo;
		private var _saveUrl:String;
		private var _photoUrl:String ;
		private var _uid:String;
		private var _token:String;
		private var _submitUrl:String;
		
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
		
		public function get saveUrl():String
		{
			return _saveUrl;
		}
		
		public function get photoUrl():String
		{
			return _photoUrl;
		}
		
		public function get uid():String
		{
			return _uid;
		}
		
		public function get token():String
		{
			return _token;
		}
		
		public function get submitUrl():String
		{
			return _submitUrl;
		}
		
		private function parse():void
		{
			if (!(this.loaderInfo is LoaderInfo)) {
				return;
			}
			
			_saveUrl = String(parseParam("saveUrl", "http://127.0.0.1/avatar/save.php"));
			_photoUrl = String(parseParam("photoUrl", "http://127.0.0.1/avatar/default.jpg"));
			_uid = String(int(parseParam("uid", "0")));
			_token = String(parseParam("token", "8594A690213CAE455BF63C921B8D4BED"));
			_submitUrl = String(parseParam("submitUrl", "http://127.0.0.1/avatar/save.php"));
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