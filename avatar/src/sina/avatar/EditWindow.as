package sina.avatar 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import com.demonsters.debugger.MonsterDebugger;
	import sina.utils.BaseGemo;
	
	/**
	 * @author     mole<mole1230@gmail.com>
	 * @version    $Id: EditWindow.as 123 2011-05-27 03:00:47Z mole1230 $
	 */
	public class EditWindow extends Sprite
	{
		public static const SNAP:String = "editwindow_snap";
		
		public var smallThumbData:BitmapData;
		public var middleThumbData:BitmapData;
		public var bigThumbData:BitmapData;
		
		private const SMALL_THUMB_WIDTH:Number = 30;
		private const SMALL_THUMB_HEIGHT:Number = 30;
		private const MIDDLE_THUMB_WIDTH:Number = 50;
		private const MIDDLE_THUMB_HEIGHT:Number = 50;
		private const BIG_THUMB_WIDTH:Number = 180;
		private const BIG_THUMB_HEIGHT:Number = 180;
		
		private var editData:BitmapData;
		private var thumbData:BitmapData;
		private var winWidth:Number;
		private var winHeight:Number;
		private var snapWidth:Number;
		private var snapHeight:Number;
		private var photoWidth:Number;
		private var photoHeight:Number;
		private var dragBoxWidth:Number;
		private var dragBoxHeight:Number;
		private var scaleRate:Number;
		private var scalePhoto:Number = 1;
		private var range:Number;
		
		private var photoContainer:Sprite;
		private var maskContainer:Sprite;
		private var photoMask:Sprite;
		private var photoSpace:Sprite;
		private var alphaBg:Sprite;
		private var maskBlock:Sprite;
		private var dragRect:Rectangle;
		private var dragBox:DragBox;
		
		public function EditWindow(winWidth:Number, winHeight:Number, dragBoxWidth:Number, dragBoxHeight:Number) 
		{
			this.winWidth = winWidth;
			this.winHeight = winHeight;
			this.dragBoxWidth = dragBoxWidth;
			this.dragBoxHeight = dragBoxHeight;
			
			this.smallThumbData = new BitmapData(SMALL_THUMB_WIDTH, SMALL_THUMB_HEIGHT);
			this.middleThumbData = new BitmapData(MIDDLE_THUMB_WIDTH, MIDDLE_THUMB_HEIGHT);
			this.bigThumbData = new BitmapData(BIG_THUMB_WIDTH, BIG_THUMB_HEIGHT);
			
			this.init();
		}
		
		public function edit(editData:BitmapData, width:Number = 180, height:Number = 180):void
		{
			this.snapWidth = width;
			this.snapHeight = height;
			this.editData = editData;
			
			while (this.photoSpace.numChildren) {
				this.photoSpace.removeChildAt(0);
			}
			
			var bitmap:Bitmap = new Bitmap(this.editData, "never", true);
			this.photoSpace.addChild(bitmap);
			this.photoSpace.width = bitmap.width;
			this.photoSpace.height = bitmap.height;
			this.photoWidth = this.photoSpace.width;
			this.photoHeight = this.photoSpace.height;
			this.centerSprite(this.photoSpace);
			this.centerSprite(this.photoMask);
			this.centerSprite(this.maskBlock);
			
			this.addDragBox();
			if (this.dragBox.width > this.photoWidth || this.dragBox.height > this.photoHeight) {
				this.dragBox.resize(Math.min(this.photoWidth, this.photoHeight));
			}
			this.centerSprite(this.dragBox);
			this.adjustMask();
			this.dragBox.addEventListener(DragBox.START_RESIZE, dragBoxHandler);
			this.dragBox.addEventListener(DragBox.STOP_MOVE, dragBoxHandler);
			this.dragBox.addEventListener(DragBox.START_MOVE, dragBoxHandler);
			
			this.range = Math.min(this.photoWidth, this.photoHeight) / this.dragBox.maxLength;
			this.snap();
		}
		
		public function get thumbBmpData():BitmapData
		{
			return this.thumbData;
		}
		
		public function get scaleRange():Number
		{
			return this.range;
		}
		
		public function snap():void
		{
			var x:Number = this.dragBox.x - this.photoSpace.x;
			var y:Number = this.dragBox.y - this.photoSpace.y;
			var rect:Rectangle = new Rectangle(x, y, this.dragBox.width, this.dragBox.height);
			/*
			var smoothing:Boolean;
			var rateW:Number = this.snapWidth / this.dragBox.width;
			var rateH:Number = this.snapHeight / this.dragBox.height;
			var thumbMatrix:Matrix = null;
			if (rateW > 0.98 && rateW < 1) {
				smoothing = false;
			} else {
				smoothing = true;
				thumbMatrix = new Matrix();
				thumbMatrix.scale(rateW, rateH);
			}
			
			var dragBmp:BitmapData = new BitmapData(this.dragBox.width, this.dragBox.height);
			var photoBmp:BitmapData = new BitmapData(this.photoSpace.width, this.photoSpace.height);
			this.thumbData = new BitmapData(this.snapWidth, this.snapHeight);
			var photoMatrix:Matrix = new Matrix();
			photoMatrix.scale(this.scalePhoto, this.scalePhoto);
			photoBmp.draw(this.photoSpace, photoMatrix, null, null, null, smoothing);
			dragBmp.copyPixels(photoBmp, rect, new Point(0, 0));
			this.thumbData.draw(dragBmp, thumbMatrix, null, null, null, smoothing);
			dragBmp.dispose();
			photoBmp.dispose();
			*/
			
			this.smallThumbData.dispose();
			this.middleThumbData.dispose();
			this.bigThumbData.dispose();
			
			var photoBmp:BitmapData = new BitmapData(this.photoSpace.width, this.photoSpace.height);
			var photoMatrix:Matrix = new Matrix();
			photoMatrix.scale(this.scalePhoto, this.scalePhoto);
			photoBmp.draw(this.photoSpace, photoMatrix);
			this.smallThumbData = this._snap(photoBmp, SMALL_THUMB_WIDTH, SMALL_THUMB_HEIGHT, rect);
			this.middleThumbData = this._snap(photoBmp, MIDDLE_THUMB_WIDTH, MIDDLE_THUMB_HEIGHT, rect);
			this.bigThumbData = this._snap(photoBmp, BIG_THUMB_WIDTH, BIG_THUMB_HEIGHT, rect);
			photoBmp.dispose();
			
			this.dispatchEvent(new Event(SNAP));
		}
		
		private function _snap(photoBmp:BitmapData, width:Number, height:Number, rect:Rectangle):BitmapData
		{
			var smoothing:Boolean;
			var rateW:Number = width / this.dragBox.width;
			var rateH:Number = height / this.dragBox.height;
			var thumbMatrix:Matrix = null;
			if (rateW > 0.98 && rateW < 1) {
				smoothing = false;
			} else {
				smoothing = true;
				thumbMatrix = new Matrix();
				thumbMatrix.scale(rateW, rateH);
			}
			
			var dragBmp:BitmapData = new BitmapData(this.dragBox.width, this.dragBox.height);
			var thumbData:BitmapData = new BitmapData(width, height);
			dragBmp.copyPixels(photoBmp, rect, new Point(0, 0));
			thumbData.draw(dragBmp, thumbMatrix, null, null, null, smoothing);
			dragBmp.dispose();
			
			return thumbData;
		}
		
		public function photoScale(rate:Number):void
		{
			this.scaleRate = rate;
			var inverse:Number = 1 / this.range;
			this.scalePhoto = inverse + (1 - inverse) * this.scaleRate;
			this.photoSpace.scaleX = this.scalePhoto;
			this.photoSpace.scaleY = this.scalePhoto;
			this.movePhoto();
			if (this.photoSpace.width < this.winWidth) {
				this.photoSpace.x = (this.winWidth - this.photoSpace.width) / 2;
			}
			if (this.photoSpace.height < this.winHeight) {
				this.photoSpace.y = (this.winHeight - this.photoSpace.height) / 2;
			}

			this.addDragBox();
			this.dragBox.x = Math.max(this.dragBox.x, this.photoSpace.x);
			this.dragBox.y = Math.max(this.dragBox.y, this.photoSpace.y);
			var minBox:Number = Math.min(this.dragBox.width, this.dragBox.height);
			var minPhoto:Number = Math.min(this.photoSpace.width, this.photoSpace.height);
			if (this.dragBox.x + this.dragBox.width > this.photoSpace.x + this.photoSpace.width) {
				if (minBox > minPhoto) {
					this.dragBox.resize(minPhoto);
				}
				this.dragBox.x = this.photoSpace.x + this.photoSpace.width - this.dragBox.width;
			}
			if (this.dragBox.y + this.dragBox.height > this.photoSpace.y + this.photoSpace.height) {
				if (minBox > minPhoto) {
					this.dragBox.resize(minPhoto);
				}
				this.dragBox.y = this.photoSpace.y + this.photoSpace.height - this.dragBox.height;
			}
			this.adjustMask();
		}
		
		public function forcePhotoScale(rate:Number, zoomBar:ZoomBar):void
		{
			zoomBar.rate = rate;
			this.photoScale(rate);
			this.snap();
		}
		
		private function init():void
		{
			this.maskContainer = new Sprite();
			this.photoSpace = new Sprite();
			this.photoContainer = BaseGemo.drawRectSprite(this.winWidth, this.winHeight, 0xFFFFFF, 0);
			this.photoMask = BaseGemo.drawRectSprite(this.winWidth, this.winHeight);
			this.alphaBg = BaseGemo.drawRectSprite(this.winWidth, this.winHeight, 0x000000, 0.1);
			this.maskBlock = BaseGemo.drawRectSprite(100, 100, 0x000000);
			
			this.maskContainer.addChild(this.alphaBg);
			this.maskContainer.addChild(this.maskBlock);
			this.photoContainer.addChild(this.photoSpace);
			this.addChild(this.photoContainer);
			this.addChild(this.photoMask);
			
			this.photoContainer.mask = this.photoMask;
			this.maskContainer.blendMode = BlendMode.LAYER;
			this.maskBlock.blendMode = BlendMode.ERASE;
			this.addChild(this.maskContainer);
			
			this.centerSprite(this.photoSpace);
			this.centerSprite(this.photoMask);
			this.centerSprite(this.maskBlock);

		}
		
		private function dragBoxHandler(event:Event):void
		{
			switch (event.type) {
				case DragBox.START_RESIZE:
					stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
					break;
				case DragBox.START_MOVE:
					stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
					break;
				case DragBox.STOP_MOVE:
					stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
					this.adjustMask();
					this.snap();
				default:
					break;
			}
		}
		
		private function onMouseMove(event:MouseEvent):void
		{
			this.adjustMask();
			if (!this.dragBox.isResizing) {
				this.movePhoto();
			}
		}
		
		private function movePhoto():void
		{
			var dym:Number = (this.winHeight - this.dragBox.height) / 2;
			var pym:Number = (this.winHeight - this.photoSpace.height) / 2;
			var dxm:Number = (this.winWidth - this.dragBox.width) / 2;
			var pxm:Number = (this.winWidth - this.photoSpace.width) / 2;
			if (this.photoSpace.height > this.dragRect.height) {
				this.photoSpace.y = pym -  (dym - this.dragBox.y) * pym / dym;
			}
			if (this.photoSpace.width > this.dragRect.width) {
				this.photoSpace.x = pxm - (dxm - this.dragBox.x) * pxm / dxm;
			}
		}
		
		private function adjustMask():void
		{
			this.maskBlock.x = this.dragBox.x;
			this.maskBlock.y = this.dragBox.y;
			this.maskBlock.width = this.dragBox.width;
			this.maskBlock.height = this.dragBox.height;
		}
		
		private function addDragBox():void
		{
			var x:Number;
			var y:Number;
			var width:Number = this.photoSpace.width;
			var height:Number = this.photoSpace.height;
			
			if (width > this.winWidth) {
				x = 0;
				width = this.winWidth;
			} else {
				x = this.photoSpace.x;
				width = this.photoSpace.width;
			}
			
			if (height > this.winHeight) {
				y = 0;
				height = this.winHeight;
			} else {
				y = this.photoSpace.y;
				height = this.photoSpace.height;
			}

			this.dragRect = new Rectangle(x, y, width, height);
			if (!this.dragBox) {
				this.dragBox = new DragBox(this.dragRect, this.dragBoxWidth, this.dragBoxHeight);
				this.addChild(this.dragBox);
			} else {
				this.dragBox.resetBoundary(this.dragRect);
			}
		}
		
		private function centerSprite(sprite:Sprite):void
		{
			sprite.x = (this.winWidth - sprite.width) / 2;
			sprite.y = (this.winHeight - sprite.height) / 2;
		}
	}
}