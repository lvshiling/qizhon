package
{
	import com.demonsters.debugger.MonsterDebugger;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.ActivityEvent;
	import flash.events.AsyncErrorEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.StatusEvent;
	import flash.events.TimerEvent;
	import flash.external.ExternalInterface;
	import flash.media.Camera;
	import flash.media.Microphone;
	import flash.media.SoundCodec;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.utils.Timer;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	import sina.Params;
	
	import spark.components.Button;

	public class TVShowMdr
	{
		private var tvShow:TVShow;
		private var rtmpUrl:String = "rtmp://222.73.33.198/tvshow"; 
		//private var rtmpUrl:String = "rtmp://127.0.0.1/tvshow"; 
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
		private var capBitmapData:BitmapData;
		private var saveUrl:String = "http://127.0.0.1/avatar/save.php";
		private var uid:String='9999';
		private var callback:String = 'getRecordName';
		private var liveStartCallBack:String = 'onliveStart';
		private var liveEndCallBack:String = 'onliveEnd';
		private var id:String;
		public function TVShowMdr(app:TVShow)
		{
			MonsterDebugger.initialize(this);
			rtmpUrl		= FlexGlobals.topLevelApplication.parameters.rtmpUrl == null 	? rtmpUrl : 	FlexGlobals.topLevelApplication.parameters.rtmpUrl;
			streamKey	= FlexGlobals.topLevelApplication.parameters.key == null 	? streamKey : 	FlexGlobals.topLevelApplication.parameters.key;
			streamName	= FlexGlobals.topLevelApplication.parameters.streamMe == null 	? streamName : 	FlexGlobals.topLevelApplication.parameters.streamMe;
			role = FlexGlobals.topLevelApplication.parameters.role == null 	? role : 	FlexGlobals.topLevelApplication.parameters.role;
			saveUrl = FlexGlobals.topLevelApplication.parameters.saveUrl == null 	? saveUrl : 	FlexGlobals.topLevelApplication.parameters.saveUrl;
			uid = FlexGlobals.topLevelApplication.parameters.uid == null 	? uid : 	FlexGlobals.topLevelApplication.parameters.uid;
			var params:Params = Params.getInstance(FlexGlobals.topLevelApplication.loaderInfo);
			params.saveUrl = saveUrl;
			params.uid = uid;
			MonsterDebugger.log('rtmpUrl: '+rtmpUrl);
			MonsterDebugger.log('streamKey: '+streamKey);
			MonsterDebugger.log('streamName: '+streamName);
			MonsterDebugger.log('role: '+role);
			MonsterDebugger.log('saveUrl: '+params.saveUrl);
			MonsterDebugger.log('uid: '+params.uid);
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
			tvShow.main.captureBtn.addEventListener(MouseEvent.CLICK, onCaptureBtn);
			tvShow.main.recordBtn.addEventListener(MouseEvent.CLICK, onRecord);
			//tvShow.main.uploadBtn.addEventListener(MouseEvent.CLICK, onUploadBtn);
			//tvShow.main.uploadCancel.addEventListener(MouseEvent.CLICK, onUploadCancel);
			//TODO
		}
		private function getRecordFlvName():String
		{
			var ret:String = '3295C76ACBF4CAAED33C36B1B5FC2CB1';
			try {
				ret = ExternalInterface.call(callback);
			} catch (e:Error) {
				MonsterDebugger.trace(callback, e);
			}
			if(!ret) ret='3295C76ACBF4CAAED33C36B1B5FC2CB1';
			MonsterDebugger.log('getRecordFlvName: '+ ret);
			return ret;
		}
		private function onRecord(evt:MouseEvent):void
		{
			if(nsMe)
			{
				nsMe.attachAudio(null);
				nsMe.attachCamera(null);
				nsMe.close();
				nsMe = null;
			}
			var recordBtn:Button = evt.target as Button;
			if(recordBtn.label == '开始录像')
			{
				id = getRecordFlvName();
				handlePublish(id, 'record');
				tvShow.main.stateTip.text = '录像中';
				recordBtn.label = '结束录像';
				MonsterDebugger.log('onStartRecord');
			}
			else if (recordBtn.label == '结束录像')
			{
				try {
					ExternalInterface.call('onRecordEnd',id);
				} catch (e:Error) {
					MonsterDebugger.trace('onRecordEnd', e);
				}
				handlePublish(streamKey + streamName, 'live');
				tvShow.main.stateTip.text = '直播中';
				recordBtn.label = '开始录像';
				tvShow.main.currentState = 'recordEndState';
			}
		}
		
		private function onCaptureBtn(evt:MouseEvent):void
		{
			
			tvShow.main.currentState = 'captureState';
			capBitmapData = new BitmapData(tvShow.main.videoDisplay.width, tvShow.main.videoDisplay.height);
			capBitmapData.draw(tvShow.main.videoDisplay,null,null,null,null,true);
			tvShow.main.capImg.source = capBitmapData;
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
			
			try {
				ExternalInterface.call(liveEndCallBack);
			} catch (e:Error) {
				MonsterDebugger.trace(liveEndCallBack, e);
			}
			
			tvShow.main.startLiveBtn.visible = true;
			tvShow.main.stateTip.text = '预览中';
			tvShow.main.mainTop.removeEventListener(MouseEvent.MOUSE_MOVE, onVideoDisplayMoveOver);
			tvShow.main.audioBar.visible = false;
			tvShow.main.ActivityLevelBar.visible = false;
			tvShow.main.liveCtlBar.visible = false;
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
					tvShow.main.stateTip.text = '连接直播服务器失败，重连中';
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
					//Alert.show('错误码：'+evt.info.code, '出错了');
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
					handlePublish(streamKey + streamName,'live');
					break;
				default:
			}			
		}
		private function handlePublish(id:String, type:String):void
		{
			if(!id||!type)
				MonsterDebugger.log('handlePublish params error: ',id, type);
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
			
			nsMe.publish(id, type);
			MonsterDebugger.log(type + ' published: '+id);
			
			if(type == 'live')
			{
				try {
				 	ExternalInterface.call(liveStartCallBack);
				} catch (e:Error) {
					MonsterDebugger.trace(liveStartCallBack, e);
				}
			}
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