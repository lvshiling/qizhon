package  
{
	import com.demonsters.debugger.MonsterDebugger;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.*;
	
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.ActivityEvent;
	import flash.events.AsyncErrorEvent;
	import flash.events.Event;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.StatusEvent;
	import flash.events.TimerEvent;
	import flash.media.Camera;
	import flash.media.Microphone;
	import flash.media.SoundCodec;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.net.URLVariables;
	import flash.system.Security;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	
	import mx.core.UIComponent;

	/**
	 * ...
	 * @author Stefan
	 */
	public class StageWin extends UIComponent
	{
		private const AVAIL_WIDTH:Number = 486;
		private const AVAIL_HEIGHT:Number = 424;
		private var gp:Graphics;

		public function StageWin()
		{
			MonsterDebugger.log("Enter StageWin");
			
			gp = this.graphics;
			gp.beginFill(0xCFDEE9, 1);
			gp.drawRect(0, 0, AVAIL_WIDTH, AVAIL_HEIGHT);
			gp.endFill();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		public function redraw(w:uint, h:uint):void
		{
			gp = this.graphics;
			gp.beginFill(0xCFDEE9, 1);
			gp.drawRect(0, 0, w, h);
			gp.endFill();
		}
		public function init(evt:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(BlockEvent.BLOCK_SELECTED, onBlockSelect);
		}		
		public function onBlockSelect(evt:BlockEvent):void
		{
			var selected:Block = evt.block;
			for(var i:uint=0; i<this.numChildren; i++)
			{
				var obj:DisplayObject = this.getChildAt(i);
				if(obj is Block )
				{
					var block:Block = obj as Block;
					if(selected != block)
					{
						block.selected = false;
					}
				}
			}
		}
	}
}