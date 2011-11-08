package 
{
	import flash.display.*;
	import flash.events.*;
	import com.demonsters.debugger.MonsterDebugger;
	import sina.AvatarEditor;
	import sina.Params;
	
	/**
	 * @author     mole<mole1230@gmail.com>
	 * @version    $Id: Main.as 7 2010-10-19 10:38:30Z mole1230 $
	 */
	public class Main extends Sprite 
	{
		private var avatarEditor:AvatarEditor;
		
		public function Main():void 
		{
			if (stage) {
				init();
			} else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
			MonsterDebugger.initialize(this);
			MonsterDebugger.trace(this, "Main init....");
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.showDefaultContextMenu = false;
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var params:Params = Params.getInstance(this.loaderInfo);
			MonsterDebugger.trace('photourl', params.photoUrl);
			MonsterDebugger.trace('saveurl', params.saveUrl);
			MonsterDebugger.trace('loaderinfo', this.loaderInfo);
			avatarEditor = new AvatarEditor();
			avatarEditor.addEventListener(Event.ADDED_TO_STAGE, avatarEditor.init);
			addChild(avatarEditor);
		}
		
	}
	
}