package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.ShaderParameter;
	import flash.display.Sprite;
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import com.greensock.plugins.TweenPlugin;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	
	/**
	 * ...
	 * @author Stefan
	 */
	public class ImageWheel extends Sprite 
	{
		private var center:Point = new Point;
		private var rotator:Rotator;
		private var pointer:Bitmap;
		private var FIX_SPEED:uint = 15;
		private var speed:uint = FIX_SPEED;

		private const MARGIN_X:Number = 20;
		private const MARGIN_Y:Number = 0;
		private const AVAIL_WIDTH:Number = 800;
		private const AVAIL_HEIGHT:Number = 800;
		private const HEAD_GROUP_HEIGHT:Number = 50;
		private const EDIT_GROUP_HEIGHT:Number = 700;
		private const EDIT_GROUP_WIDTH:Number = 760;
		private const FOOT_GROUP_HEIGHT:Number = 50;
		
		private var headGroup:Sprite;
		private var footGroup:Sprite;
		private var editGroup:Sprite;
		
		private var editGroupBg:Sprite;
		private var editGroupFg:Sprite;
		private var fgMask:FgMark;
		
		private var start:Sprite;
		private var stop:Sprite;
		private var timerText:TextField;
		private var wheelTimer:Timer;
		private var headImageNum:uint = 8;
		private var numHeadAngle:uint = 360 / headImageNum;
		private var headImages:Array = [];
		private var rotators:Array = [];
		
		[Embed (source = "curkey.png")] public static var cursorCls:Class;
		private var cursorKey:Bitmap;
		
		public function ImageWheel() 
		{
			super();
			var gp:Graphics;
			this.headGroup = new Sprite();
			this.footGroup = new Sprite();
			this.editGroup = new Sprite();
			
			gp = this.headGroup.graphics;
			gp.beginFill(0xc2edf4, 1);
			gp.drawRect(0, 0, AVAIL_WIDTH - 2 * MARGIN_X, HEAD_GROUP_HEIGHT);
			gp.endFill();
			this.headGroup.x = MARGIN_X;
			this.headGroup.y = MARGIN_Y;
			
			gp = this.editGroup.graphics;
			gp.beginFill(0xeeb059, 1);
			gp.drawRect(0, 0, AVAIL_WIDTH - 2 * MARGIN_X, EDIT_GROUP_HEIGHT);
			gp.endFill();
			this.editGroup.x = MARGIN_X;
			this.editGroup.y = this.headGroup.y + this.headGroup.height;
			
			gp = this.footGroup.graphics;
			gp.beginFill(0xCFDEE9, 1);
			gp.drawRect(0, 0, AVAIL_WIDTH, FOOT_GROUP_HEIGHT);
			gp.endFill();
			this.footGroup.x = 0;
			this.footGroup.y = this.editGroup.y + this.editGroup.height;
			
			this.addChild(this.headGroup);
			this.addChild(this.editGroup);
			this.addChild(this.footGroup);
			
			timerText = new TextField();
			var tf:TextFormat = new TextFormat("宋体", 40, 0x0099FF);
			timerText.defaultTextFormat = tf;
			timerText.selectable = false;
			timerText.autoSize = TextFieldAutoSize.LEFT;
			timerText.text = "3秒";
			this.headGroup.addChild(timerText);
			timerText.x = (this.headGroup.width - timerText.width) / 2;
			
			editGroupBg = new Sprite;
			gp = editGroupBg.graphics;
			gp.beginFill(0xff0000, 1);
			gp.drawCircle(EDIT_GROUP_WIDTH/2, EDIT_GROUP_HEIGHT/2, EDIT_GROUP_HEIGHT / 2);
			gp.endFill();
			this.editGroup.addChild(editGroupBg);
			
			
		}
		
		public function init(evt:Event = null):void
		{
			var gp:Graphics;
			removeEventListener(Event.ADDED_TO_STAGE, this.init);
			//
			var pointerData:BitmapData = new BitmapData(5, 5, true, 0x00000000);
			pointerData.fillRect(new Rectangle(2, 0, 1, 5), 0xffffffff);
			pointerData.fillRect(new Rectangle(0, 2, 5, 1), 0xffffffff);
			pointer = new Bitmap(pointerData);
			pointer.x = this.width / 2 - 3;
			pointer.y = this.height / 2 - 3;
			addChild(pointer);
			center.x = this.width / 2;
			center.y = this.height / 2;
			trace("center.x: " + center.x);
			trace("center.y: " + center.y);
			//layout
			createImageHeadSet();
			
			editGroupFg = new Sprite;
			gp = editGroupFg.graphics;
			gp.beginFill(0x00FF00, 1);
			gp.drawCircle(EDIT_GROUP_WIDTH/2, EDIT_GROUP_HEIGHT/2, EDIT_GROUP_HEIGHT / 2.5);
			gp.endFill();
			this.editGroup.addChild(editGroupFg);
			
			fgMask = new FgMark();
			editGroup.addChild(fgMask);
			fgMask.x = 32;
			editGroupFg.mask = fgMask;
			trace("fgMask.width " + fgMask.width);
			trace("fgMask.x " + fgMask.x);
			
			
			cursorKey = new cursorCls;
			editGroup.addChild(cursorKey);
			cursorKey.x = (editGroup.width - cursorKey.width) / 2;
			cursorKey.y = (editGroup.height - cursorKey.height) / 2 - 65;
			wheelTimer = new Timer(1000, 3);
			//handle event
			addListener();
		}
		
		private function createImageHeadSet(urls:Array = null):void
		{
			var innerRotator:Rotator;
			for (var i:uint = 0; i < headImageNum; i++) {
				var headImg:HeadImage = new HeadImage(i+'');
				this.editGroup.addChild(headImg);
				headImages.push(headImg);
				headImg.x = (this.editGroup.width - headImg.WIDTH) / 2;
				headImg.y = 0;
				innerRotator = new Rotator(headImg, new Point(editGroup.width / 2,
															  editGroup.height / 2
															));
				innerRotator.rotation = 360/headImageNum*i;
				rotators.push(innerRotator);
			}
			
			for (var i:uint = 0; i < rotators.length; i++)
			{
				var roter:Rotator = rotators[i] as Rotator;
				trace("9999999xxxxx: "+ roter.rotation);
			}
		}
		
		/*private function createImageHeadSet(urls:Array = null):void
		{
			var innerRotator:Rotator;
			for (var i:uint = 0; i < headImageNum; i++) {
				var headImg:HeadImage = new HeadImage(i+'');
				addChild(headImg);
				headImages.push(headImg);
				headImg.x = (this.width - headImg.WIDTH) / 2;
				headImg.y = 40;
				innerRotator = new Rotator(headImg, center);
				innerRotator.rotation = 360/headImageNum*i;
				rotators.push(innerRotator);
			}
		}*/
		
		public function addListener():void
		{
			stage.addEventListener(MouseEvent.CLICK, onClick);
			wheelTimer.addEventListener(TimerEvent.TIMER, onWheelTimer);
			wheelTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onWheelTimerDone);
		}
		public function startRock():void
		{
			
		}
		private var angleContrl:Number = 0;
		private function waveSpeed():void
		{
			//angleContrl = angleContrl + 0.1;
			//speed = FIX_SPEED + FIX_SPEED * Math.sin(angleContrl);
			//speed = FIX_SPEED;
		}
		private var rotateNum:uint = 0;
		private function calmDown():void
		{
			rotateNum = rotateNum + 1;
			var rotateAngle:uint = rotateNum * speed;
			trace("rotatAngel: "+ rotateAngle);
			if (rotateAngle%360 == 0)
			{
				speed = 0;
			}
		}
		public function rotateImage():void
		{
			
			for (var i:uint = 0; i < rotators.length; i++)
			{
				var roter:Rotator = rotators[i] as Rotator;
				roter.rotation += speed;
			}
		}
		private function rotate(e:Event):void {
			waveSpeed();
			rotateImage();
		}
		private function onClick(evt:MouseEvent):void
		{
			if (!hasEventListener(Event.ENTER_FRAME)) {
					addEventListener(Event.ENTER_FRAME, rotate);
				    wheelTimer.start();
            } 
		}
		
		private function onWheelTimer(evt:TimerEvent):void
		{
			timerText.text = "" + (wheelTimer.repeatCount - wheelTimer.currentCount) + "秒";
		}
		private function onWheelTimerDone(evt:TimerEvent):void
		{
			speed = 0;
			var firstH:Rotator = (rotators[0] as Rotator);
			trace("rotators[i] as Rotator: " + firstH.rotation);
			var gap:uint = 0;
			var res:uint = (firstH.rotation + 360) % numHeadAngle;
			trace("res: "+ res);
			gap = numHeadAngle - res;
			trace(gap);
			for (var i:uint = 0; i < rotators.length; i++)
			{
				var roter:Rotator = rotators[i] as Rotator;
				roter.rotation += gap;
			}
		}
		
	}

}