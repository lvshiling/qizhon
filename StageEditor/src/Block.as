package
{
	import flash.display.Sprite;
	import flash.events.*;
	
	import org.flintparticles.common.displayObjects.Rect;
	public class Block extends Sprite
	{
		private var _width:Number;
		private var _height:Number;
		private var _color:uint;
		private var _lineColor:uint;
		private var _selected:Boolean;
		private var _oldColor:uint;
		private var _stageWin:StageWin;
		public function Block(width:Number=1, height:Number=1, color:uint=0xFFFFFF, lineColor:uint=0xFFFFFF, bm:String="normal"):void
		{
			_width = width;
			_height = height;
			_color = color;
			_lineColor = lineColor;
			draw();
			blendMode = bm;
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			addEventListener(MouseEvent.CLICK, onMouseClick);
		}
		public function set selected(val:Boolean):void
		{
			_selected = val;
			if(val)
			{
				_color = 0xFFFF00;
			}
			else
			{
				_color = 0xFF0000;
			}
				
			draw();
		}
		public function get selected():Boolean
		{
			return _selected;
		}
		private function onMouseDown(evt:MouseEvent):void
		{
			Sprite(evt.target).startDrag();
		
		}
		private function onMouseUp(evt:MouseEvent):void
		{
			Sprite(evt.target).stopDrag();
		}
		private function onMouseClick(evt:MouseEvent):void
		{
			selected = true;
			var event:BlockEvent = new BlockEvent(BlockEvent.BLOCK_SELECTED); 
			event.block = this;
			this.parent.dispatchEvent(event); 
		}
		private function draw():void
		{
			graphics.clear();
			graphics.lineStyle(2,_lineColor,1);
			graphics.beginFill( _color );
			graphics.drawRect( 0, 0, _width, _height );
			graphics.endFill();
		}
		
		override public function get width():Number
		{
			return _width;
		}
		override public function set width( value:Number ):void
		{
			_width = value;
			draw();
		}
		
		override public function get height():Number
		{
			return _height;
		}
		override public function set height( value:Number ):void
		{
			_height = value;
			draw();
		}
		
		public function get color():uint
		{
			return _color;
		}
		public function set color( value:uint ):void
		{
			_color = value;
			draw();
		}
	}
}