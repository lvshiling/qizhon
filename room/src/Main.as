package 
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import com.demonsters.debugger.MonsterDebugger;
	/**
	 * ...
	 * @author Stefan
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.showDefaultContextMenu = false;
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			// entry point
			MonsterDebugger.initialize(this);
			var params:Params = Params.getInstance(this.loaderInfo);
			var trans:XmppTransporter = new XmppTransporter(params);
		}
		
	}
	
}