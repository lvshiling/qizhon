package sina.ui.core
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.*;
	import flash.text.*;
	import flash.utils.Dictionary;
	import sina.ui.events.BuiEvent;
	import com.demonsters.debugger.MonsterDebugger;
	
	/**
	 * @author     mole<mole1230@gmail.com>
	 * @version    $Id: Bui.as 7 2010-10-19 10:38:30Z mole1230 $
	 */	
	public class Bui extends Sprite
	{
		public static var defaultStyles:Object = {
			textFormat: new TextFormat("宋体", 12, 0, false, false, false, "", "", "left", 0, 0, 0, 0), 
			disabledTextFormat: new TextFormat("宋体", 12, 10066329, false, false, false, "", "", "left", 0, 0, 0, 0)
		};
		public static var inCallLaterPhase:Boolean = false;
		
		protected var _enabled:Boolean;
		protected var _invalidHash:Object;
		protected var _callLaterMethods:Dictionary;
		protected var _instanceStyles:Object;
		
		public static function getEventTypeByOs():String
		{
			return Capabilities.os.toLowerCase().indexOf("linux") != -1 ? (Event.ENTER_FRAME) : (Event.RENDER);
		}
		
		public static function getSkinInstance(skin:*):DisplayObject
		{
			if (skin == null) {
				return null;
			}
			
			if (skin is Class) {
				return new skin as DisplayObject;
			}
			
			if (skin is DisplayObject) {
				skin.x = 0;
				skin.y = 0;
				return skin;
			}
			
			var classDef:Class;
			try {
				classDef = ApplicationDomain.currentDomain.getDefinition(skin) as Class;
			} catch (e:Error) {
				classDef;
			}
			if (classDef == null) {
				return null;
			}
			return new classDef as DisplayObject;
		}
		
		public static function mergeStyles(... args):Object
		{
			var result:Object = {};
			var tmp:Object;
			var key:String;
			var i:int;
			var length:*= args.length; 
			while (i < length) {
				tmp = args[i]; 
				for (key in tmp) {
					result[key] = tmp[key];
				}
				i++;
			}
			return result;
		}
		
		public function Bui()
		{
			_enabled = true;
			_instanceStyles = {};
			_invalidHash = {};
			_callLaterMethods = new Dictionary();
			_initUi();
			addEventListener(Event.ADDED_TO_STAGE, _addToStage, false, 0, true);
		}

		public function get enabled():Boolean
		{
			return _enabled;
		}

		public function set enabled(value:Boolean):void
		{
			if (value == _enabled) {
				return;
			}
			
			_enabled = value;
			invalidate(Invalidation.STATE);
		}
		
		public function get classStyles():Object
		{
			return defaultStyles;
		}
		
		public function setPosition(x:Number, y:Number, dispatch:Boolean = true):void
		{
			if (isNaN(x) || isNaN(y)) {
				return;
			}
			this.x = x;
			this.y = y;
			if (dispatch) {
				dispatchEvent(new BuiEvent(BuiEvent.POSITION_CHANGE));
			}
		}
		
		public function setStyle(name:String, style:Object):void
		{
			if (_instanceStyles[name] === style && !(style is TextFormat)) {
				return;
			}
			_instanceStyles[name] = style;
			invalidate(Invalidation.STYLES);
		}
		
		public function setStyles(styles:Object):void
		{
			var key:String;
			for (key in styles) {
				setStyle(key, styles[key]);
			}
		}
		
		public function getStyleValue(name:String):Object
		{
			return (_instanceStyles[name] == null) ? classStyles[name] : _instanceStyles[name];
		}
		
		public function invalidate(type:String = "all", isDraw:Boolean = true):void
		{
			_invalidHash[type] = true;
			if (isDraw) {
				_callLater(_draw);
			}
		}
		
		public function clearStyle(name:String):void
		{
			setStyle(name, null);
		}
		
		public function getStyle(name:String):Object
		{
			return _instanceStyles[name];
		}
		
		public function setSize(width:Number, height:Number, isDispach:Boolean = true):void
		{
			if (this.width == width && this.height == height) {
				return;
			}
			this.width = width;
			this.height = height;
			invalidate(Invalidation.SIZE);
			if (isDispach) {
				dispatchEvent(new BuiEvent(BuiEvent.SIZE_CHANGE, false));
			}
		}
		
		protected function _addToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, _addToStage);
			stage.addEventListener(Event.RENDER, _callLaterDispatcher, false, 0, true);
			stage.invalidate();
		}
		
		protected function _callLater(callback:Function):void
		{
			if (inCallLaterPhase) {
				return;
			}
			
			_callLaterMethods[callback] = true;
			if (stage) {
				stage.addEventListener(Event.RENDER, _callLaterDispatcher, false, 0, true);
				stage.invalidate();
			}
		}
	
		private function _callLaterDispatcher(e:Event):void
		{
			e.target.removeEventListener(Event.RENDER, _callLaterDispatcher);
			
			inCallLaterPhase = true;
			for (var func:* in _callLaterMethods) {
				func();
				delete _callLaterMethods[func];
			}
			inCallLaterPhase = false;
		}
		
		protected function _draw():void
		{
			_validate();
		}
		
		protected function _isInvalid(name:String, ... args):Boolean
		{
			if (_invalidHash[name] || _invalidHash[Invalidation.ALL]) {
				return true;
			}
			
			while (args.length > 0) {
				var key:* = args.pop();
				if (_invalidHash[key]) {
					return true;
				}
			}
			
			return false;
		}
		
		protected function _validate():void
		{
			_invalidHash = { };
		}

		protected function _initUi():void
		{
			setPosition(0, 0);
		}	
	}
}
