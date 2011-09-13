package  
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.ActivityEvent;
	import flash.media.Camera;
	import flash.media.Video;
	
	/**
	 * @author     mole<mole1230@gmail.com>
	 * @version    $Id: BaseGemo.as 7 2010-10-19 10:38:30Z mole1230 $
	 */
	public class BaseGemo extends Sprite
	{
		
		public function BaseGemo() 
		{
			
		}
		
		public static function drawRectSprite(width:Number, height:Number, color:uint = 0xFFFFFF, alpha:Number = 1.0):Sprite
		{
			var win:Sprite = new Sprite();
			var gp:Graphics = win.graphics;
			gp.beginFill(color, alpha);
			gp.drawRect(0, 0, width, height);
			gp.endFill();
			return win;
		}
		public static function getVideoWin():Sprite
		{
			var win:Sprite = new Sprite;
			var video:Video;
			var camera:Camera = Camera.getCamera();
			if (camera != null)
			{
				camera.addEventListener(ActivityEvent.ACTIVITY, activityHandler);
				video = new Video(camera.width * 2, camera.height * 2);
				video.attachCamera(camera);
				win.addChild(video);
				
			}
			else
			{
				trace("---can't find camera---");
			}
			return win;
		}
		private static function activityHandler(event:ActivityEvent):void 
		{
			trace("activityHandler: " + event);
		}
		
		
	}

}