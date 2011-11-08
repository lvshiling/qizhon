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
		private static var callBack:String = null;
		
		private var loaderInfo:LoaderInfo;
		private var _saveUrl:String = "http://127.0.0.1/avatar/save.php";
		private var _photoUrl:String ;
		private var _uid:String = '89';
		private var _token:String;
		
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
			MonsterDebugger.log(callBack, json);
		}
		
		public function Params(loaderInfo:LoaderInfo = null) 
		{
			this.loaderInfo = loaderInfo;
			this.parse();
		}
		public function set saveUrl(val:String):void
		{
			_saveUrl = val;
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
		public function set uid(val:String):void
		{
			_uid = val;
		}
		public function get token():String
		{
			return _token;
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
			
			// static
			callBack = String(parseParam("callBack", "savePicHander"));
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