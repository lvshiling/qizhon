package 
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.events.Event;
	import flash.system.Capabilities;
	import sina.MultiUpload;
	import sina.ui.core.*;
	import sina.ui.controls.*;
	import sina.ui.skin.*;
	import com.demonsters.debugger.MonsterDebugger;
	
	/**
	 * @author     mole<mole1230@gmail.com>
	 * @version    $Id: Main.as 7 2010-10-19 10:38:30Z mole1230 $
	 */
	public class Main extends Sprite 
	{
		private var _multiupload:MultiUpload;
		
		public function Main():void 
		{
			if (stage) { 
				_init();
			} else {
				addEventListener(Event.ADDED_TO_STAGE, _init);
			}
			MonsterDebugger.initialize(this);
			MonsterDebugger.trace(this, "Main init");
			
		}
		
		private function _init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.showDefaultContextMenu = false;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			_multiupload = new MultiUpload();
			_multiupload.uploadUrl = String(_getParam("uploadUrl", ""));
			_multiupload.imgFormat = String(_getParam("imgFormat", ""));
			_multiupload.maxNum = int(_getParam("maxNum", 0));
			_multiupload.maxSize = Number(_getParam("maxSize", 0));
			_multiupload.movieName = String(_getParam("movieName", ""));
			_multiupload.token = String(_getParam("token", ""));
			_multiupload.uid = int(_getParam("uid", 0));
			_multiupload.init();
			addChild(_multiupload);
			
			// debug

		}
		
		private function _getParam(name:String, defaultValue:* = null):*
		{
			var params:Object = loaderInfo.parameters;
			if (params.hasOwnProperty(name)) {
				return params[name];
			}
			
			return defaultValue;
		}
		
	}
	
}