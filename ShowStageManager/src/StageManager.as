package  
{
	import com.greensock.loading.*;
	import com.greensock.events.LoaderEvent;
	import effect.gift.RandGiftScreen;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	import flash.net.URLVariables;
	import flash.display.Sprite;
	import flash.external.ExternalInterface;
	import com.greensock.loading.display.ContentDisplay;
	import com.greensock.*;
	import org.flintparticles.common.actions.Age;
	import org.flintparticles.common.counters.Blast;
	import org.flintparticles.common.counters.Steady;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.common.initializers.SharedImage;
	import org.flintparticles.twoD.actions.Explosion;
	import org.flintparticles.twoD.actions.Move;
	import org.flintparticles.twoD.actions.TweenPosition;
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.initializers.Position;
	import org.flintparticles.twoD.initializers.Velocity;
	import org.flintparticles.twoD.renderers.BitmapRenderer;
	import org.flintparticles.twoD.zones.RectangleZone;
	import com.demonsters.debugger.MonsterDebugger;
	import flash.events.Event;
	/**
	 * ...
	 * @author Stefan
	 */
	public class StageManager 
	{
		private var loader:DataLoader;
		private var stageWin:StageWin;
		private static var _instance:StageManager = null;
		private var stageWidth:uint = 0;
		private var stageHeight:uint = 0;
		public static const RAND_POINT:String = 'RAND_POINT';
		public static const FIXED_POINT:String = 'FIXED_POINT';
		public static const MC:String = "MC";
		public static const ASSET_PATH:String = '/images/gift/';
		public function StageManager(win:StageWin) 
		{	
			stageWin = win;
			stageWidth = stageWin.width;
			stageHeight = stageWin.height;
			ExternalInterface.addCallback("sendGift", sendGift);
		}
		public static function getInstance(win:StageWin):StageManager
		{
			if (!_instance)
			{
				_instance  = new StageManager(win);
			}
			return _instance;
		}
		private function sendGift(giftName:String, giftNum:String, type:String, shapeName:String):void
		{
			if (type == RAND_POINT)
			{
				loadRandShow(giftName, int(giftNum));
			}
			else if (type == FIXED_POINT)
			{
				loadShapeShow(giftName, shapeName);
			}
			else if (type == MC)
			{
				loadMcShow(giftName, int(giftNum));
			}
		}
		public function loadMcShow(mcName:String, num:int):void
		{
			MonsterDebugger.log("loadMcShow", mcName, num+'');
			var loaderError:Boolean = false;
			var queue:LoaderMax = new LoaderMax( { name:"McShowQueue", 
												   onProgress:mcShowProgressHandler, 
												   onComplete:mcShowCompleteHandler, 
												   onError:mcShowErrorHandler
												 }
											    );
			for (var i:uint = 0; i < num; i++ )
			{
				queue.append( new SWFLoader(generateMcUrl(mcName), 
						{ container:stageWin, hAlign:'center', name:'giftMc' + i, y:0, autoPlay:false , noCache:false, onComplete:onloaderComplete  } ));
			}
			//var sound:MP3Loader = new MP3Loader(generateMp3Url(''), { name:"sound", repeat:0, autoPlay:true, autoDispose:false });
			//queue.append(sound);
			//LoaderMax.prioritize('giftMc');
			queue.load();
			function onloaderComplete(event:LoaderEvent):void
			{
				var giftMc:ContentDisplay = event.target.content;
				MonsterDebugger.log(giftMc,"onloaderComplete");
				
			}
			function mcShowProgressHandler(event:LoaderEvent):void
			{
				MonsterDebugger.log("mcShowProgressHandler");
			}
			function mcShowCompleteHandler(event:LoaderEvent):void
			{
				if (loaderError)
					return;
				MonsterDebugger.log("mcShowComplete");
				var gift:ContentDisplay;
				ExternalInterface.call('OnBeginShowGift');
				for (var i:uint = 0; i < num; i++)
				{
					gift = LoaderMax.getContent('giftMc' + i);
					gift.y = i * 20;
					gift.rawContent.play();
					gift.addEventListener(Event.ENTER_FRAME, onMcGiftEnterFrame);
					//TweenLite.to(giftBitmap, 3, { alpha:1, onComplete:onTweenComplete,onCompleteParams:[gift] });
				}
				
			}
			function mcShowErrorHandler(event:LoaderEvent):void
			{
				MonsterDebugger.log("mcShowErrorHandler");
				loaderError = true;
			}
			function onTweenComplete(gift:ContentDisplay):void
			{
				
			}
			var removeNum:int = 0;
			function onMcGiftEnterFrame(evt:Event):void
			{
			
				var mcGift:ContentDisplay = evt.target as ContentDisplay;
				var mc:MovieClip = mcGift.rawContent as MovieClip;
				
				
				if (mc.currentFrame == mc.totalFrames)
				{
					mcGift.removeEventListener(Event.ENTER_FRAME, onMcGiftEnterFrame);
					MonsterDebugger.log("onMcGiftEnterFrame", mcGift);
					stageWin.removeChild(mcGift);
					mcGift.dispose();
					removeNum = removeNum + 1;
					if (removeNum == num)
					{
						ExternalInterface.call('onEndShowGift');
						//sound.soundPaused = true;
						//sound.unload();
					}
				}
			}
		}
		public function loadRandShow(giftName:String, giftNum:int):void
		{
			var queue:LoaderMax = new LoaderMax( { name:"RandShowQueue", 
													onProgress:randShowProgressHandler, 
													onComplete:randShowCompleteHandler, 
													onError:randShowErrorHandler});
			//queue.append( new DataLoader(generateGiftUrl(giftName), { name:"giftBin", format:"binary", estimatedBytes:3500 } ) );
			//queue.append( new ImageLoader("img/photo1.jpg", {name:"photo1", estimatedBytes:2400, container:this, alpha:0, width:250, height:150, scaleMode:"proportionalInside"}) );
			queue.append( new ImageLoader(generateGiftUrl(giftName), { name:'gift' } ));
			//var sound:MP3Loader = new MP3Loader(generateMp3Url(''), { name:"sound", repeat:0, autoPlay:true, autoDispose:false });
			//queue.append(sound);
			queue.load();
			
			function randShowProgressHandler(event:LoaderEvent):void
			{
				trace('rand show progress.......');
			}
			function randShowCompleteHandler(event:LoaderEvent):void
			{
				var gift:ContentDisplay;
				var giftBitmapData:BitmapData;
				var giftBitmap:Bitmap;
				
				ExternalInterface.call('OnBeginShowGift');
				gift = LoaderMax.getContent('gift');
				if (!gift) 
					return;
				giftBitmapData = new BitmapData(gift.width, gift.height, true, 0xFFFFFF);
				giftBitmapData.draw(gift,null,null,null,null,true);
				
				var points:Array = generatePointArray(giftNum);
				
				for each( var p:Point in points )
				{
					trace(p.x + '|' + p.y);
					giftBitmap = new Bitmap(giftBitmapData);
					giftBitmap.x = (stageWin.width - giftBitmap.width) / 2;
					giftBitmap.y = (stageWin.height - giftBitmap.height) / 2;
					stageWin.addChild(giftBitmap);
					TweenLite.to(giftBitmap, 3, { alpha:1, x:p.x, y:p.y, onComplete:onTweenComplete,onCompleteParams:[giftBitmap] });
				
				}
				//TODO,Another way by partical system to generate effect
				//var randGiftScreen:RandGiftScreen = new RandGiftScreen(stageWin, giftBitmapData, points);	
				//randGiftScreen.action();
				var tweenGiftNum:int = 0;
				function onTweenComplete(gift:Bitmap):void
				{
					tweenGiftNum = tweenGiftNum + 1;
					stageWin.removeChild(gift);
					if (tweenGiftNum == points.length)
					{
						ExternalInterface.call('onEndShowGift');
						MonsterDebugger.log("random show end");
						//sound.soundPaused = true;
						//sound.unload();
					}
				}
			}
			function randShowErrorHandler(event:LoaderEvent):void
			{
				//if (sound)
				//{
					//sound.soundPaused = true;
					//sound.unload();
				//}
			}
		}
		
		
		public function loadShapeShow(giftName:String, shapeName:String):void
		{
			var shapeUrl:String = generateShapeUrl(shapeName);
			var giftUrl:String = generateGiftUrl(giftName);
			var varUrl:String = generateVarUrl(shapeName);
			var queue:LoaderMax = new LoaderMax({name:"mainQueue", onProgress:progressHandler, onComplete:completeHandler, onError:errorHandler});
			loader = new DataLoader(shapeUrl, { name:"myText", requireWithRoot:this.stageWin.root, estimatedBytes:900 } );
			queue.append(loader);
			queue.append( new DataLoader(varUrl, {name:"myVariables", format:"variables"}) );
			queue.append( new ImageLoader(giftUrl, { name:'gift' } ));
			//var sound:MP3Loader = new MP3Loader(generateMp3Url(''), { name:"sound", repeat:0, autoPlay:true, autoDispose:false });
			//queue.append(sound);
			queue.load();
		
			function progressHandler(event:LoaderEvent):void 
			{
				trace("shape show progress: " + event.target.progress);
			}
		
			function completeHandler(event:LoaderEvent):void 
			{
				var giftBitmapData:BitmapData;
				var giftBitmap:Bitmap;
				var text:String = LoaderMax.getContent("myText");
				var variables:URLVariables = LoaderMax.getContent("myVariables");
				var gift:ContentDisplay = LoaderMax.getContent("gift");
				var gift_shape:XML = new XML(text);
				var bornPoints:Array = [];
				var shapePoints:Array = [];
				
				if (!gift)
					return;
				
				ExternalInterface.call('OnBeginShowGift');
				MonsterDebugger.log('OnBeginShowGift');
				giftBitmapData = new BitmapData(gift.width, gift.height, true, 0xFFFFFF);
				giftBitmapData.draw(gift,null,null,null,null,true);
				
				var left:uint = gift_shape.points.@leftWidth;
				var top:uint = gift_shape.points.@topHeight;
				var plist:XMLList = gift_shape..point;
				
				for each(var point:XML in plist)
				{
					//var item:Sprite = BaseGemo.drawRectSprite(20, 20, 0xFF0000);
					//item.x = left + uint(point.@x);
					//item.y = top + uint(point.@y);
					//giftBitmap = new Bitmap(giftBitmapData);
					//stageWin.addChild(giftBitmap);
					shapePoints.push(new Point(point.@x, point.@y));
				}
				bornPoints = generatePointArray(shapePoints.length);
				for each (var bornPoint:Point in bornPoints)
				{
					giftBitmap = new Bitmap(giftBitmapData);
					giftBitmap.x = bornPoint.x;
					giftBitmap.y = bornPoint.y;
					stageWin.addChild(giftBitmap);
					var p:Point = shapePoints.pop();
					TweenLite.to(giftBitmap, 4, { alpha:1, x:(p.x+left), y:(p.y+top),onComplete:onTweenComplete,onCompleteParams:[giftBitmap] });
				}
				var tweenGiftNum:int = 0;
				function onTweenComplete(gift:Bitmap):void
				{
					tweenGiftNum = tweenGiftNum + 1;
					stageWin.removeChild(gift);
					if (tweenGiftNum == bornPoints.length)
					{
						ExternalInterface.call('onEndShowGift');
						MonsterDebugger.log('shape show end');
						//sound.soundPaused = true;
						//sound.unload();
					}
				}
				
			}
		
			function errorHandler(event:LoaderEvent):void 
			{
				trace("error occured with " + event.target + ": " + event.text);
				//if (sound)
				//{
				//	sound.soundPaused = true;
				//	sound.unload();
				//}
			}
			
		}
		
		private function generateMcUrl(giftName:String):String
		{
			var ret:String = '';
			ret = ASSET_PATH + giftName +'.swf';
			return ret;
		}
		private function generateGiftUrl(giftName:String):String
		{
			var ret:String = '';
			ret = ASSET_PATH + giftName +'.png';
			return ret;
		}
		
		private function generateShapeUrl(shape:String):String
		{
			var ret:String = '';
			ret = ASSET_PATH + shape + '.xml';
			return ret;
		}
		private function generateVarUrl(shapeName:String):String
		{
			var ret:String = '';
			ret = ASSET_PATH + shapeName + '_var.txt';
			return ret;
		}
		private function generateMp3Url(shapeName:String):String
		{
			shapeName = 'sexmic';
			var ret:String = '';
			ret = ASSET_PATH + shapeName + '.mp3';
			return ret;
		}
		
		private function generatePointArray(num:uint):Array
		{
			var ret:Array = [];
			var p:Point;
			for (var i:uint = 0; i < num; i++ )
			{
				p = new Point();
				p.x = Math.random() * stageWidth;
				p.y = Math.random() * stageHeight;
				ret.push(p);
			}
			return ret;
		}
		private function weblog(p1:String, p2:String):void
		{	
			//TOOPEN
			ExternalInterface.call("log", p1, p2);
		}
	}

}