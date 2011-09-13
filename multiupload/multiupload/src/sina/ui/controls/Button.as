package sina.ui.controls 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import sina.ui.core.*;
	import sina.ui.events.BuiEvent;
	import com.demonsters.debugger.MonsterDebugger;
	
	/**
	 * @author     mole<mole1230@gmail.com>
	 * @version    $Id: Button.as 7 2010-10-19 10:38:30Z mole1230 $
	 */
	public class Button extends Bui
	{
		public static const MOUSE_UP:String = "up";
		public static const MOUSE_DOWN:String = "down";
		public static const MOUSE_OVER:String = "over";
		
		public static var defaultStyles:Object = {
			skin: "ButtonSkin", 
			repeatDelay: 500, 
			repeatInterval: 50
		};
		
		public static var frameDict:Object = {
			up: 1, 
			over: 2, 
			down: 3, 
			disabled: 4, 
			selectedUp: 5, 
			selectedOver: 6, 
			selectedDown: 7, 
			selectedDisabled: 8
		};
		
		protected var _pressTimer:Timer;
		protected var _selected:Boolean;
		protected var _background:DisplayObject;
		protected var _mouseState:String;
		protected var _autoRepeat:Boolean;
		private var _mouseStateLocked:Boolean;
		private var _unlockedMouseState:String;
		
		public function Button() 
		{
			buttonMode = true;
			mouseChildren = false;
			useHandCursor = true;
			_enabled = true;
			_selected = false;
			_autoRepeat = false;
			_mouseStateLocked = false;
			_mouseState = "up";
			_pressTimer = new Timer(1, 0);
			_setupMouseEvents();
		}
		
		override public function get classStyles() : Object
		{
			return Bui.mergeStyles(super.classStyles, defaultStyles);
		}
		
		override public function set enabled(value:Boolean) : void
		{
			super.enabled = value;
			mouseEnabled = value;
		}
		
		public function get selected() : Boolean
		{
			return _selected;
		}
		
		public function set selected(value:Boolean) : void
		{
			if (value == _selected) {
				return;
			}
			_selected = value;
			invalidate(Invalidation.STATE);
		}
		
		public function set autoRepeat(value:Boolean) : void
		{
			_autoRepeat = value;
		}
		
		public function get autoRepeat() : Boolean
		{
			return _autoRepeat;
		}
		
		public function set mouseState(state:String) : void
		{
			if (_mouseStateLocked) {
				_unlockedMouseState = state;
				return;
			}

			if (_mouseState == state) {
				return;
			}
			_mouseState = state;
			invalidate(Invalidation.STATE);
		}
		
		public function get mouseState() : String
		{
			return _mouseState;
		}
		
		public function set mouseStateLocked(value:Boolean) : void
		{
			_mouseStateLocked = value;
			if (!value) {
				mouseState = _unlockedMouseState;
			} else {
				_unlockedMouseState = mouseState; 
			}
		}
		
		public function get mouseStateLocked() : Boolean
		{
			return _mouseStateLocked;
		}
		
		protected function _setupMouseEvents() : void
		{
			addEventListener(MouseEvent.ROLL_OVER, _mouseEventHandler, false, 0, true);
			addEventListener(MouseEvent.MOUSE_DOWN, _mouseEventHandler, false, 0, true);
			addEventListener(MouseEvent.MOUSE_UP, _mouseEventHandler, false, 0, true);
			addEventListener(MouseEvent.ROLL_OUT, _mouseEventHandler, false, 0, true);
		}
		
		protected function _mouseEventHandler(e:MouseEvent) : void
		{
			switch (e.type) {
				case MouseEvent.MOUSE_DOWN:
					mouseState = MOUSE_DOWN;
					invalidate(Invalidation.STATE);
					break;
				case MouseEvent.MOUSE_UP:
				case MouseEvent.ROLL_OVER:
					mouseState = MOUSE_OVER;
					invalidate(Invalidation.STATE);
					break;
				case MouseEvent.ROLL_OUT:
					mouseState = MOUSE_UP;
					invalidate(Invalidation.STATE);
					break;
				default:
					break;
			}
		}
		
		protected function _startPress() : void
		{
			if (_autoRepeat) {
				_pressTimer.delay = Number(getStyleValue("repeatDelay"));
				_pressTimer.start();
			}
			dispatchEvent(new BuiEvent(BuiEvent.BUTTON_REPEAT, true));
		}
		
		protected function _endPress() : void
		{
			_pressTimer.reset();
		}
		
		override protected function _draw() : void
		{
			if (_isInvalid(Invalidation.STYLES, Invalidation.STATE)) {
				_drawBackground();
				invalidate(Invalidation.SIZE, false);
			}
			if (_isInvalid(Invalidation.SIZE)) {
				_drawLayout();
			}
			super._draw();
		}
		
		protected function _drawBackground() : void
		{
			var mc:MovieClip = _background as MovieClip;
			_background = getSkinInstance(getStyleValue("skin")) as MovieClip;
			addChildAt(_background, 0);
			if (mc != null && mc != _background && contains(mc)) {
				removeChild(mc);
			}
			if (isNaN(width)) {
				width = _background.width;
			}
			if (isNaN(height)) {
				height = _background.height;
			}
			var status:String = enabled ? mouseState : "disabled";
			if (selected) {
				status = "selected" + status.substr(0, 1).toUpperCase() + status.substr(1);
			}
			(_background as MovieClip).gotoAndStop(frameDict[status]);
		}
		
		protected function _drawLayout() : void
		{
			_background.width = width;
			_background.height = height;
		}
	}
}
