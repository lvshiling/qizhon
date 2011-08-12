package
{
	import com.demonsters.debugger.MonsterDebugger;
	
	import flash.events.ActivityEvent;
	import flash.events.AsyncErrorEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.StatusEvent;
	import flash.events.TimerEvent;
	import flash.media.Camera;
	import flash.media.Microphone;
	import flash.media.SoundCodec;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.utils.Timer;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	public class TVShowMdr
	{
		private var tvShow:TVShow;
		//private var rtmpUrl:String = "rtmp://222.73.33.198/oflaDemo"; 
		private var rtmpUrl:String = "rtmp://127.0.0.1/tvshow"; 
		private var streamKey:String = "key";
		private var streamName:String = "me";
		private var nc:NetConnection = null;
		private var nsMe:NetStream;
		private var timer:Timer;
		private var camera:Camera;
		private var mic:Microphone;
		private var role:String = "publisher";
		private var videoPicQuality:int = 0;
		private var videoFps:int = 30;
		private var videoBandwidth:int = 256000;
		private var micSetRate:int = 11;
		private var micAllowed:Boolean;
		private var camAllowed:Boolean;
		private var toolbarTimer:Timer = new Timer(5000,1);
		public function TVShowMdr(app:TVShow)
		{
			MonsterDebugger.initialize(this);
			rtmpUrl		= FlexGlobals.topLevelApplication.parameters.rtmpUrl == null 	? rtmpUrl : 	FlexGlobals.topLevelApplication.parameters.rtmpUrl;
			streamKey	= FlexGlobals.topLevelApplication.parameters.key == null 	? streamKey : 	FlexGlobals.topLevelApplication.parameters.key;
			streamName	= FlexGlobals.topLevelApplication.parameters.streamMe == null 	? streamName : 	FlexGlobals.topLevelApplication.parameters.streamMe;
			role = FlexGlobals.topLevelApplication.parameters.role == null 	? role : 	FlexGlobals.topLevelApplication.parameters.role;
			MonsterDebugger.log('rtmpUrl: '+rtmpUrl);
			MonsterDebugger.log('streamKey: '+streamKey);
			MonsterDebugger.log('streamName: '+streamName);
			MonsterDebugger.log('role: '+role);
			tvShow = app;
			tvShow.main.visible = false;
			addListener();
			
		}
		private function addListener():void
		{
			tvShow.chooseDevice.ok.addEventListener(MouseEvent.CLICK, onChooseok);
			tvShow.main.volumeBar.addEventListener(Event.CHANGE, onVolumeBarChange);
			tvShow.main.startLiveBtn.addEventListener(MouseEvent.CLICK, onStartLive);
			tvShow.main.stopLiveBtn.addEventListener(MouseEvent.CLICK, onStopLive);
			toolbarTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onToolBarTimer);
			//TODO
		}
		private function onToolBarTimer(evt:TimerEvent):void
		{
			tvShow.main.mainTop.mouseEnabled = true;
			tvShow.main.liveCtlBar.visible = false;
			tvShow.main.audioBar.visible = false;
			tvShow.main.ActivityLevelBar.visible = false;
			trace('onToolBarTimer: visible = false');
		}
		private function onVideoDisplayMoveOver(evt:MouseEvent):void
		{
			trace("moveMove,"+ evt.target+' , '+ evt.currentTarget);
			//tvShow.main.liveCtlBarFadeIn.stop();
			//tvShow.main.liveCtlBarFadeIn.play();
			tvShow.main.liveCtlBar.visible = true;
			tvShow.main.audioBar.visible = true;
			tvShow.main.ActivityLevelBar.visible = true;
			tvShow.main.mainTop.mouseEnabled = false;
			toolbarTimer.reset();
			toolbarTimer.start();
			trace("evt.target.mouse,"+evt.target.mouseEnabled+', ' + evt.target.mouseChildren+', '+evt.target.alpha);
			
		}
		private function onVideoDisplayMoveOut(evt:MouseEvent):void
		{
			
			if(evt.target == tvShow.main.mainTop)
			{
				tvShow.main.liveCtlBar.visible = false;
			}
		}
		private function onChooseok(evt:MouseEvent):void
		{
			getCamera(tvShow.chooseDevice.selectCamera);
			getMicrophone(tvShow.chooseDevice.selectMic);
			tvShow.chooseDevice.visible = false;
			tvShow.main.visible = true;
			Alert.show('请晃动摄像头，以便将其激活','提示');
			tvShow.main.audioBar.visible = false;
			tvShow.main.ActivityLevelBar.visible = false;
			tvShow.main.liveCtlBar.visible = false;
		}
		private function onStartLive(evt:MouseEvent):void
		{
			tvShow.main.startLiveBtn.visible = false;
			tvShow.main.audioBar.visible = false;
			tvShow.main.ActivityLevelBar.visible = false;
			tvShow.main.liveCtlBar.visible = false;
			setupConnection();
			tvShow.main.mainTop.addEventListener(MouseEvent.MOUSE_MOVE, onVideoDisplayMoveOver);
		}
		private function onStopLive(evt:MouseEvent):void
		{
			if(nsMe)
			{
				nsMe.close();
			}
			if(nc)
			{
				nc.close();
			}
			tvShow.main.startLiveBtn.visible = true;
			tvShow.main.stateTip.text = '预览中';
			tvShow.main.mainTop.removeEventListener(MouseEvent.MOUSE_MOVE, onVideoDisplayMoveOver);
			tvShow.main.audioBar.visible = false;
			tvShow.main.ActivityLevelBar.visible = false;
			tvShow.main.liveCtlBar.visible = false;
		}
		
		private function onRecordStream(evt:MouseEvent):void
		{
			if(nsMe)
			{
				nsMe.publish(streamKey + streamName,'record');
				trace("onRecordStream: "+ 'record');
			}
		}
		private function onVolumeBarChange(evt:Event):void
		{
			if(mic != null)
			{
				if(tvShow.main.volumeBar.value > 0 && tvShow.main.volumeBar.value < 100)
				{
					mic.gain = tvShow.main.volumeBar.value;
				}
			}
		}
		private function tvShowEventLoop(evt:Event):void
		{
			tvShow.main.currActivityLevel.setProgress(mic.activityLevel, 100);
			//trace("mic.activityLevel: "+mic.activityLevel);
		}
		private function publishStared():void
		{
			tvShow.main.volumeBar.visible = true;
			tvShow.main.captureBtn.visible = true;
			tvShow.main.currActivityLevel.visible = true;
			tvShow.main.stateTip.text = '直播中';
			tvShow.main.volumeBar.value = mic.gain;
			tvShow.addEventListener(Event.ENTER_FRAME, tvShowEventLoop);
			
		}
		private function setupConnection():void
		{					
			nc = new NetConnection();
			nc.client = this;
			nc.addEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
			nc.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
			nc.connect(rtmpUrl);
		}
		private function onNetStatus(evt:NetStatusEvent):void
		{
			switch(evt.info.code) 
			{
				case "NetGroup.Connect.Success":
					connected();									
					break;
				
				case "NetConnection.Connect.Failed":
				case "NetConnection.Connect.Rejected":
					
					timer = new Timer(1000);
					timer.addEventListener(TimerEvent.TIMER, function onTimer(evt:TimerEvent):void
					{
						timer.stop();
						nc.close();
						nc.connect(rtmpUrl);															
					});
					
					timer.start();
					break;
				case "NetConnection.Connect.Success":
					try {
						connected();
					} catch (e:Error) {}
					break;
				
				default:
			}		    	
		}
		
		private function connected():void
		{	
			switch (role)
			{
				case "viewer":
					//handleView();
					break;
				case "publisher":
					//attach my camera and microphone to nsMe, publish them to nsMe
					handlePublish();
					break;
				default:
			}			
		}
		private function handlePublish():void
		{
			trace("handlePublish");
			MonsterDebugger.log('handlePublish');
			nsMe = new NetStream(nc);
			nsMe.bufferTime = 0;		
			nsMe.addEventListener(NetStatusEvent.NET_STATUS, function (evt:NetStatusEvent ):void 
			{	
				
				switch(evt.info.code) 
				{
					case "NetStream.Connect.Success":
						
					case "NetStream.Play.StreamNotFound":
						break;
					
					case "NetStream.Play.Failed":	
						break;
					
					case "NetStream.Play.Start":							
						break;
					
					case "NetStream.Play.Stop":
						break;
					
					case "NetStream.Buffer.Full":
						break;
					
					default:
				}		    	
			});
			
			
			nsMe.addEventListener(AsyncErrorEvent.ASYNC_ERROR, function (event:AsyncErrorEvent):void 
			{		    	
				
			});
			
			if (camera != null) 
			{
				nsMe.attachCamera(camera);
			}
			if (mic != null)
			{
				nsMe.attachAudio(mic);
			}
			
			//nsMe.publish(streamKey + streamName, "live");
			nsMe.publish(streamKey + streamName, "record");
			MonsterDebugger.log('published: '+streamKey+streamName);
			publishStared();
		}
		private function getCamera(name:String):void
		{
			camera = Camera.getCamera(name);
			if (!camera)
			{
				camera = Camera.getCamera();
			}
			if (camera != null)
			{
				camera.addEventListener(ActivityEvent.ACTIVITY, cameraActivityHandler);
				camera.addEventListener(StatusEvent.STATUS, onCameraStatus);
				switch (camera.width) 
				{
					case 160:
					case 320:
						camera.setMode(320, 240, 10); 
						break;
					default:
						camera.setMode(160, 120, 15);
						break;
				}
				camera.setQuality(videoBandwidth, videoPicQuality);
				tvShow.main.videoDisplay.attachCamera(camera);

			}
			else
			{
				if(Camera.names.length > 0)
				{
					Alert.show('其他程序正在使用你的摄像头','提示');
				}
				else
				{
					Alert.show('没发现任何摄像头','提示');
				}
				
			}
		}
		private function getMicrophone(idx:int):void
		{
			//var mic:Microphone = Microphone.getEnhancedMicrophone();	
			mic = Microphone.getMicrophone(idx);
			//mic.setLoopBack(true);
			mic.setLoopBack(false);
			if (mic != null)
			{
				mic.setUseEchoSuppression(true);
				mic.setSilenceLevel(10, 20000);
				mic.gain = 60;
				mic.rate = micSetRate;
				mic.codec = SoundCodec.SPEEX;
				mic.addEventListener(ActivityEvent.ACTIVITY, micActivityHandler);
				mic.addEventListener(StatusEvent.STATUS, micStatusHandler);
				
			}
		}
		private function onCameraStatus(s:StatusEvent):void
		{
			switch(s.code)
			{
				case "Camera.Unmuted":
					camAllowed = true;
					break;
				
				case "Camera.Muted":
					camAllowed = false;
					break;
			}
			if(!camAllowed)
			{
				Alert.show('你已经设置禁止使用摄像头', '提示');
			}
			else
			{
				tvShow.chooseDevice.visible = false;
			}
		}
		private function onSecurityError(evt:SecurityError):void
		{
			trace("onSecurityError");	
		}
		private function cameraActivityHandler(event:ActivityEvent):void 
		{
			trace("activityHandler: " + event);
			
		}
		private function micActivityHandler(event:ActivityEvent):void
		{
			trace("micActivityHandler: " + event);
			
		}
		private function micStatusHandler(event:StatusEvent):void
		{
			trace("micStatusHandler" + event);
			switch(event.code)
			{
				case "Microphone.Unmuted":
					micAllowed = true;
					break;
				case "Microphone.Muted":
					micAllowed = false;
					break;
			}
			if(!micAllowed)
			{
				Alert.show('你已经设置禁止使用麦克风', '提示');
			}
			else
			{
				tvShow.chooseDevice.visible = false;
			}
			
		}
	}
}