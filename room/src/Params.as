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
		
		private var loaderInfo:LoaderInfo;
		private var _saveUrl:String;
		private var _photoUrl:String ;
		private var _uid:String;
		private var _token:String;
		private var _userName:String;
		private var _password:String;
		private var _nickName:String;
		private var _groupName:String;
		private var _server:String;
		private var _domain:String;
		private var _resource:String;
		private var _anonymous:String;
		
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
		public function get userName():String
		{
			return _userName;
		}
		public function get password():String
		{
			return _password;
		}
		public function get nickName():String
		{
			return _nickName;
		}
		public function get groupName():String
		{
			return _groupName;
		}
		public function get server():String
		{
			return _server;
		}
		public function get domain():String
		{
			return _domain;
		}
		public function get resource():String
		{
			return _resource;
		}
		public function get anonymous():String
		{
			return _anonymous;
		}
		private function parse():void
		{
			if (!(this.loaderInfo is LoaderInfo)) {
				return;
			}
			
			_saveUrl = String(parseParam("saveUrl", "http://www.mole.com/avatar/save.php"));
			_photoUrl = String(parseParam("photoUrl", "http://www.mole.com/avatar/default.jpg"));
			_uid = String(int(parseParam("uid", "0")));
			_token = String(parseParam("token", "8594A690213CAE455BF63C921B8D4BED"));
			_userName = String(parseParam("userName", "9999"));
			_password = String(parseParam("password", "123456"));
			_nickName = String(parseParam("nickName", "lover"));
			_groupName = String(parseParam("groupName", "1"));
			_server = String(parseParam("server", "127.0.0.1"));
			_domain = String(parseParam("domain", ""));
			_resource = String(parseParam("resource", "web"));
			_anonymous = String(parseParam("anonymous", "YES"));
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