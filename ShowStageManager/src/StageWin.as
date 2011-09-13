package  
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import com.demonsters.debugger.MonsterDebugger;
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
	import flash.system.Security;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	import com.greensock.loading.*;
	import com.greensock.events.LoaderEvent;
	import flash.utils.ByteArray;
	import flash.net.URLVariables;
	import effect.love.WordFireWork;
	/**
	 * ...
	 * @author Stefan
	 */
	public class StageWin extends Sprite 
	{
		private const MARGIN_X:Number = 20;
		private const MARGIN_Y:Number = 0;
		private const AVAIL_WIDTH:Number = 940;
		private const AVAIL_HEIGHT:Number = 500;
		private const HEAD_GROUP_HEIGHT:Number = 20;
		private const EDIT_GROUP_HEIGHT:Number = 560;
		private const EDIT_GROUP_WIDTH:Number = 760;
		private const FOOT_GROUP_HEIGHT:Number = 20;
		
		private var headGroup:Sprite;
		private var footGroup:Sprite;
		private var editGroup:Sprite;
		
		private var timer:Timer;
		private var debugLabel:TextField = new TextField;
		private var tipText:TextField;
		private var stageManager:StageManager;
		public function StageWin(param:Params)
		{
			MonsterDebugger.log("Enter StageWin");
			var gp:Graphics;
			this.headGroup = new Sprite();
			this.footGroup = new Sprite();
			this.editGroup = new Sprite();
			
			gp = this.headGroup.graphics;
			gp.beginFill(0xc2edf4, 0);
			gp.drawRect(0, 0, AVAIL_WIDTH - 2 * MARGIN_X, HEAD_GROUP_HEIGHT);
			gp.endFill();
			this.headGroup.x = MARGIN_X;
			this.headGroup.y = MARGIN_Y;
			
			gp = this.editGroup.graphics;
			gp.beginFill(0xeeb059, 0);
			gp.drawRect(0, 0, AVAIL_WIDTH - 2 * MARGIN_X, EDIT_GROUP_HEIGHT);
			gp.endFill();
			this.editGroup.x = MARGIN_X;
			this.editGroup.y = this.headGroup.y + this.headGroup.height;
			
			gp = this.footGroup.graphics;
			gp.beginFill(0xCFDEE9, 0);
			gp.drawRect(0, 0, AVAIL_WIDTH - 2 * MARGIN_X, FOOT_GROUP_HEIGHT);
			gp.endFill();
			this.footGroup.x = MARGIN_X;
			this.footGroup.y = this.editGroup.y + this.editGroup.height;
			
			this.addChild(this.headGroup);
			this.addChild(this.editGroup);
			this.addChild(this.footGroup);
		
			MonsterDebugger.log('begin......rese ');
			
			stageManager = StageManager.getInstance(this);
			//load();
			//action();
			//stageManager.loadRandShow('rose', 30);
			//stageManager.loadShapeShow('rose', 'xin');
			
		}
		public function init(evt:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
		}		
		private function action():void
		{
			var effect:WordFireWork = new WordFireWork;
			addChild(effect);
		}
	}
}