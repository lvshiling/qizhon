package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import com.demonsters.debugger.MonsterDebugger;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	/**
	 * ...
	 * @author Stefan
	 */
	public class Main extends Sprite 
	{
		private var stageWin:StageWin;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			stage.showDefaultContextMenu = false;
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			MonsterDebugger.initialize(this);
			var params:Params = Params.getInstance(this.loaderInfo); 
			stageWin = new StageWin(params);
			stageWin.addEventListener(Event.ADDED_TO_STAGE, stageWin.init);
			addChild(stageWin);
			stageWin.x = (this.width - stageWin.width) / 2;
			stageWin.y = (this.height - stageWin.height) / 2;
		}
		
	}
	
}