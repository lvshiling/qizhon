package sina.avatar 
{
	import flash.display.Sprite;
	import flash.events.*;
	import com.demonsters.debugger.MonsterDebugger;
	import sina.ui.skin.LeftIcon;
	import sina.ui.skin.ResetBtn;
	import sina.ui.skin.RestBtn;
	import sina.ui.skin.RightIcon;
	import sina.ui.skin.SlideBarBg;
	import sina.ui.skin.SlideBtn;
	
	/**
	 * @author     mole<mole1230@gmail.com>
	 * @version    $Id: ZoomBar.as 7 2010-10-19 10:38:30Z mole1230 $
	 */
	public class ZoomBar extends Sprite
	{
		public static const SEEKING:String = "zoombar_seeking";
		public static const SEEKEND:String = "zoombar_seekend";
		
		private var bgSkin:SlideBarBg;
		private var slideSkin:SlideBtn;
		private var leftSkin:LeftIcon;
		private var rightSkin:RightIcon;
		private var resetSkin:ResetBtn;
		private var leftWrapper:Sprite;
		private var rightWrapper:Sprite;
		private var middWrapper:Sprite;
		
		private var offsetSlide:Number;
		private var barWidth:Number;
		private var _rate:Number;
		private var _leftMargin:Number;
		
		public function ZoomBar() 
		{
			this.bgSkin = new SlideBarBg();
			this.slideSkin = new SlideBtn();
			this.leftSkin = new LeftIcon();
			this.rightSkin = new RightIcon();
			this.resetSkin = new ResetBtn();
			
			this.barWidth = this.bgSkin.width;
			this.offsetSlide = this.slideSkin.width / 2;
			this.drawZoomComponent();
			this.initLinsteners()
		}
		
		public function set rate(rate:Number):void
		{
			if (rate > 1) {
				rate = 1;
			} else if (rate < 0) {
				rate = 0;
			}
	
			this._rate = rate;
			this.slideSkin.x = this.barWidth * this._rate - this.offsetSlide;
		}
		
		public function get rate():Number
		{
			return this._rate;
		}
		
		public function get leftMargin():Number
		{
			return this._leftMargin;
		}
		
		private function initLinsteners():void
		{
			this.slideSkin.addEventListener(MouseEvent.MOUSE_DOWN, this.slideHandler);
			this.slideSkin.addEventListener(MouseEvent.MOUSE_UP, this.slideHandler);
			this.bgSkin.addEventListener(MouseEvent.CLICK, this.slideHandler);
			this.leftSkin.addEventListener(MouseEvent.CLICK, this.iconHandler);
			this.rightSkin.addEventListener(MouseEvent.CLICK, this.iconHandler);
		}
		
		private function iconHandler(event:MouseEvent):void
		{
			if (event.target == this.leftSkin) {
				this.rate = this.rate - 0.05;
			} else {
				this.rate = this.rate + 0.05;
			}
			event.updateAfterEvent();
			dispatchEvent(new Event(SEEKING));
			dispatchEvent(new Event(SEEKEND));
		}
		
		private function slideHandler(event:MouseEvent):void
		{
			switch (event.type) {
				case MouseEvent.MOUSE_DOWN:
					stage.addEventListener(MouseEvent.MOUSE_MOVE, this.slideHandler);
					stage.addEventListener(MouseEvent.MOUSE_UP, this.slideHandler);
					break;
				case MouseEvent.MOUSE_UP:
					stage.removeEventListener(MouseEvent.MOUSE_MOVE, this.slideHandler);
					stage.removeEventListener(MouseEvent.MOUSE_UP, this.slideHandler);
					this.dispatchEvent(new Event(SEEKEND));
					break;
				case MouseEvent.MOUSE_MOVE:
					this.rate = this.mouseX / this.barWidth;
					this.dispatchEvent(new Event(SEEKING));
					break;
				case MouseEvent.CLICK:
					this.rate = this.mouseX / this.barWidth;
					event.updateAfterEvent();
					this.dispatchEvent(new Event(SEEKING));
					this.dispatchEvent(new Event(SEEKEND));
				default:
					break;
			}
		}
		
		private function drawZoomComponent():void
		{
			this.leftSkin.x = -this.leftSkin.width - 12;
			this.rightSkin.x = this.bgSkin.width + 12;
			this.bgSkin.x = 0;

			this._leftMargin = Math.abs(this.leftSkin.x);
			this.leftSkin.y = (this.slideSkin.height - this.leftSkin.height) / 2;
			this.bgSkin.y = (this.slideSkin.height - this.bgSkin.height) / 2;
			this.rightSkin.y = (this.slideSkin.height - this.rightSkin.height) / 2;
			this.leftSkin.useHandCursor = true;
			this.rightSkin.useHandCursor = true;
			this.leftSkin.buttonMode = true;
			this.rightSkin.buttonMode = true;
			this.bgSkin.buttonMode = true;
			
			this.addChild(this.leftSkin);
			this.addChild(this.bgSkin);
			this.addChild(this.rightSkin);
			this.addChild(this.slideSkin);
			this.rate = 1;
		}
		
	}

}