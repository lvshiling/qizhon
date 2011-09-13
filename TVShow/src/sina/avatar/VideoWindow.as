package sina.avatar 
{
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.ActivityEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.media.Camera;
	import flash.media.Video;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import qizhon.ui.skin.CaptureBtn;
	import qizhon.ui.skin.WaitMc;
	/**
	 * ...
	 * @author Stefan
	 */
	public class VideoWindow extends Sprite
	{
		public static const COMPLETE:String = "complete";
		private var headBar:Sprite;
		private var footBar:Sprite;
		private var captureBtn:CaptureBtn;
		private var video:Video;
		private var tipText:TextField;
		private	var camera:Camera;
		private var waitMc:WaitMc;
		private var bitmapData:BitmapData;
		
		private var WIDTH:uint = 300;
		private var HEIGHT:uint = 300;
		
		private var defaultWidth:uint;
		private var defaultHight:uint;
		
		public function VideoWindow() 
		{
			create();
			this.visible = true;
		}
		public function create():void
		{
			
			var g:Graphics;
			headBar = new Sprite;
			footBar = new Sprite;
			captureBtn = new CaptureBtn;
			captureBtn.buttonMode = true;
			waitMc = new WaitMc;
			g = headBar.graphics;
			g.beginFill(0x0000ff, 0);
			g.drawRect(0, 0, WIDTH, 10);
			g.endFill();
			
			g = footBar.graphics;
			g.beginFill(0x0000ff, 0);
			g.drawRect(0, 0, WIDTH, 10);
			g.endFill();
			footBar.y = HEIGHT - footBar.height - captureBtn.height;
			
			g = captureBtn.graphics;
			g.beginFill(0xFFFF00, 0);
			g.drawRect(0, 0, 60, 20);
			g.endFill();
			
			
			addChild(headBar);
			addChild(footBar);
			
			getVideoWin();
			if (video)
			{
				addChild(video);
				video.x = (this.width - video.width) / 2;
				video.y = (this.height - video.height) / 2;
				this.height = video.y + video.height + 40;
				captureBtn.y = this.height - captureBtn.height - 5;
				addChild(captureBtn);
				captureBtn.addEventListener(MouseEvent.CLICK, captureHandler);
				addChild(waitMc);
				waitMc.x = (this.width - waitMc.width) / 2;
				waitMc.y = (this.height - waitMc.height) / 2;
			}
			else if (tipText)
			{
				addChild(tipText);
				tipText.x = (this.width - tipText.width) / 2;
				tipText.y = (this.height - tipText.height) / 2;
			}
		}
		public function getVideoWin():void
		{
			camera = Camera.getCamera();
			defaultWidth = camera.width;
			defaultHight = camera.height;
			if (camera != null)
			{
				camera.addEventListener(ActivityEvent.ACTIVITY, activityHandler);
				trace("--camera.width--" + camera.width);
				switch (camera.width) 
				{
					case 160:
						camera.setMode(320, 240, 10); 
						break;
					case 320:
						camera.setMode(640, 480, 5); 
						break;
					default:
						camera.setMode(160, 120, 15);
						break;
				}
				video = new Video(camera.width, camera.height);
				video.attachCamera(camera);
				
				trace('camera.size='+camera.width + '|'+camera.height);
			}
			else
			{
				trace("---can't find camera---");
				tipText = new TextField;
				var tf:TextFormat = new TextFormat("宋体", 13, 0xcd6500);
				tipText.defaultTextFormat = tf;
				tipText.selectable = false;
				tipText.autoSize = TextFieldAutoSize.LEFT;
				tipText.text = "没发现摄像头，请尝试刷新页面";
				
			}
		}
		public function get editData():BitmapData
		{
			return this.bitmapData;
		}
		private function activityHandler(event:ActivityEvent):void 
		{
			trace("activityHandler: " + event);
			if (waitMc && this.contains(waitMc))
			{
				removeChild(waitMc);
			}
		}
		private function captureHandler(evt:MouseEvent):void
		{
			trace("--captureBtn clicked---");
			this.bitmapData = new BitmapData(video.width, video.height);
			this.bitmapData.draw(video, null, null, null, null, true);
			this.dispatchEvent(new Event(COMPLETE));
		}
		public function destroy():void
		{
			this.removeChild(headBar);
			this.removeChild(footBar);
			this.removeChild(captureBtn);
			this.removeChild(video);
			if (tipText) this.removeChild(tipText);
			this.camera.setMode(defaultWidth, defaultHight, 10);
			trace('destroy camera.size='+camera.width + '|'+camera.height);
			captureBtn.removeEventListener(MouseEvent.CLICK, captureHandler);
			
		}
	}

}