package sina.avatar 
{
	import com.adobe.images.JPGEncoder;
	import com.adobe.serialization.json.JSON;
	import com.adobe.serialization.json.JSONParseError;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.external.ExternalInterface;
	import flash.net.*;
	import flash.utils.ByteArray;
	import com.demonsters.debugger.MonsterDebugger;
	import sina.Params;
	import sina.ui.skin.InfoSpriteLoading;
	
	/**
	 * @author     mole<mole1230@gmail.com>
	 * @version    $Id: BinaryTransfer.as 7 2010-10-19 10:38:30Z mole1230 $
	 */
	public class BinaryTransfer extends Sprite
	{
		public static const COMPLETE:String = "binarytransfer_complete";
		public static const ERROR:String = "binarytransfer_error";
		private var loading:InfoSpriteLoading;
		private var loader:URLLoader;
		private var _json:Object = { };
		private var _responseText:String;
		
		public function BinaryTransfer() 
		{
			this.loading = new InfoSpriteLoading();
			this.loading.visible = false;
			this.addChild(this.loading);
			
			this.loader = new URLLoader();
			this.loader.addEventListener(Event.COMPLETE, this.transferHandler);
			this.loader.addEventListener(IOErrorEvent.IO_ERROR, this.transferHandler);
			this.loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.transferHandler);
		}
		
		public function get json():Object
		{
			return this._json;
		}
		
		public function get responseText():String
		{
			return this._responseText;
		}
		
		public function transfer(image:BitmapData, postUrl:String, params:Object = null):void
		{
			this.loading.visible = true;
			this.loader.load(this.request(image, postUrl, params));
		}
		
		private function transferHandler(event:*):void
		{
			switch (event.type) {
				case Event.COMPLETE:
					this.loading.visible = false;
					try {
						this._json = JSON.decode(event.target.data);
						this.dispatchEvent(new Event(COMPLETE));
					} catch (e:JSONParseError) {
						this._json = {};
						MonsterDebugger.trace('binary transfer', event.target.data);
						this._responseText = event.target.data;
						Params.call('M00001', this.responseText);
					}
					break;
				case SecurityErrorEvent.SECURITY_ERROR:
				case IOErrorEvent.IO_ERROR:
					MonsterDebugger.trace('binary transfer', event);
					this.loading.visible = false;
					break;
				default:
					break;
			}
		}
		
		private function request(image:BitmapData, postUrl:String, params:Object = null):URLRequest
		{
			if (params is Object) {
				var tmp:Array = new Array();
				for (var key:String in params) {
					tmp.push(key + "=" + encodeURIComponent(params[key]));
				}
				
				postUrl += (postUrl.indexOf("?") > -1) ? "&" : "?";
				postUrl += tmp.join("&");
			}
			var jpeg:JPGEncoder = new JPGEncoder(85);
			var binary:ByteArray = jpeg.encode(image);
			var request:URLRequest = new URLRequest(postUrl);
			request.method = URLRequestMethod.POST;
			request.data = binary;
			request.contentType = "application/octet-stream";
			return request;
		}
		
	}
}
