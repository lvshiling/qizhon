package  
{
	import com.demonsters.debugger.MonsterDebugger;
	import com.greensock.*;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.*;
	import com.greensock.loading.display.ContentDisplay;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.FileReference;
	import flash.net.URLVariables;
	import flash.utils.ByteArray;
	
	import mx.controls.Tree;
	import mx.events.*;
	
	import org.flintparticles.common.displayObjects.Rect;

	/**
	 * ...
	 * @author Stefan
	 */
	public class StageManager 
	{
		private var editorZone:StageWin;
		private var loader:DataLoader;
		private var stageEditor:StageEditor;
		private static var _instance:StageManager = null;
		private var stageWidth:uint = 0;
		private var stageHeight:uint = 0;
		public static const RAND_POINT:String = 'RAND_POINT';
		public static const FIXED_POINT:String = 'FIXED_POINT';
		public static const ASSET_PATH:String = '/images/gift/';
		public static const shapeUrl:String = "/images/gift/shape.xml"
		private var file:FileReference = new FileReference();
		public function StageManager(win:StageEditor) 
		{	
			stageEditor = win;
			stageWidth = stageEditor.width;
			stageHeight = stageEditor.height;
			editorZone = new StageWin();
			stageEditor.editor.addChild(editorZone);
			stageEditor.shapes.addEventListener(ListEvent.ITEM_CLICK, onShapeClick);
			stageEditor.newObjBtn.addEventListener(MouseEvent.CLICK, onNewObjClick);
			stageEditor.saveBtn.addEventListener(MouseEvent.CLICK, onSave);
			stageEditor.setBtn.addEventListener(MouseEvent.CLICK, onSetBtn);
			stageEditor.resetEditor.addEventListener(MouseEvent.CLICK, onResetEditor);
		}
		public static function getInstance(win:StageEditor):StageManager
		{
			if (!_instance)
			{
				_instance  = new StageManager(win);
			}
			return _instance;
		}
		private function onResetEditor(evt:MouseEvent):void
		{
			while(editorZone.numChildren)
			{
				editorZone.removeChildAt(0);
			}
		}
		private function onSetBtn(evt:MouseEvent):void
		{
			var left:uint = stageEditor.leftNS.value;
			var top:uint = stageEditor.topNS.value;
			var w:uint = stageEditor.widthNS.value;
			var h:uint = stageEditor.heightNS.value;
			
			stageEditor.editor.x = left;
			stageEditor.editor.y = top;
			editorZone.redraw(stageWidth - 2 * left, stageHeight - 2 * top);
		}
		private function onSave(evt:MouseEvent):void
		{
			var xml:XML = new XML('<gift_shape></gift_shape>');
			xml.appendChild(<points leftWidth={stageEditor.editor.x} topHeight={stageEditor.editor.y}></points>);
			for(var i:uint=0; i<editorZone.numChildren; i++)
			{
				var obj:DisplayObject = editorZone.getChildAt(i);
				if(obj is Block || obj is Bitmap )
				{
					var block:Block = obj as Block;
					xml.points.appendChild(<point x={obj.x} y={obj.y} /> );
					
				}
			}
			trace(xml);
			file.save(xml,'tmp.xml');
		}
		private function onNewObjClick(evt:MouseEvent):void
		{
			var block:Block = new Block(70, 70, 0xFF0000);
			editorZone.addChild(block);
		}
		private function onShapeClick(evt:ListEvent):void
		{
			var selected:XML;
			var item:Object = (evt.currentTarget as Tree).selectedItem;
			trace(item.@label);
			
			while(editorZone.numChildren)
			{
				editorZone.removeChildAt(0);
			}
			
			if(item.@label != 'main')
				loadShapeShow('rose', item.@label);
		}
		public function loadConfig():void
		{
			var queue:LoaderMax = new LoaderMax({name:"confQueue", onProgress:progressHandler, onComplete:completeHandler, onError:errorHandler});
			loader = new DataLoader(shapeUrl, { name:"shapetxt", requireWithRoot:this.stageEditor.root, estimatedBytes:900 } );
			queue.append(loader);
			queue.load();
			function progressHandler(event:LoaderEvent):void 
			{
				trace("shape show progress: " + event.target.progress);
			}
			
			function errorHandler(event:LoaderEvent):void 
			{
				trace("error occured with " + event.target + ": " + event.text);
			}
			
			function completeHandler(event:LoaderEvent):void 
			{
				var giftBitmapData:BitmapData;
				var giftBitmap:Bitmap;
				var text:String = LoaderMax.getContent("shapetxt");
				var gift_shape:XML = new XML(text);
				stageEditor.shapes.dataProvider = gift_shape;
			}
		}
		
		public function loadShapeShow(giftName:String, shapeName:String):void
		{
			
			var shapeUrl:String = generateShapeUrl(shapeName);
			var giftUrl:String = generateGiftUrl(giftName);
			var varUrl:String = generateVarUrl(shapeName);
			var queue:LoaderMax = new LoaderMax({name:"mainQueue", onProgress:progressHandler, onComplete:completeHandler, onError:errorHandler});
			loader = new DataLoader(shapeUrl, { name:"myText", requireWithRoot:this.stageEditor.root, estimatedBytes:900 } );
			queue.append(loader);
			queue.append( new DataLoader(varUrl, {name:"myVariables", format:"variables"}) );
			queue.append( new ImageLoader(giftUrl, {name:'gift'}));
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
				
				MonsterDebugger.log('OnBeginShowGift');
				giftBitmapData = new BitmapData(gift.width, gift.height, true, 0xFFFFFF);
				giftBitmapData.draw(gift,null,null,null,null,true);
				
				var left:uint = gift_shape.points.@leftWidth;
				var top:uint = gift_shape.points.@topHeight;
				var plist:XMLList = gift_shape..point;
				
				stageEditor.editor.x = left;
				stageEditor.editor.y = top;
				trace('left: '+ left + '|' + 'top: ' + top);
				editorZone.redraw(stageWidth - 2 * left, stageHeight - 2 * top);
				trace(editorZone.x+'||'+editorZone.y);
				
				stageEditor.leftNS.value = left;
				stageEditor.topNS.value = top;
				stageEditor.widthNS.value = stageWidth - 2 * left;
				stageEditor.heightNS.value = stageHeight - 2 * top;
				
				for each(var point:XML in plist)
				{
					shapePoints.push(new Point(point.@x, point.@y));
				}
				bornPoints = generatePointArray(shapePoints.length);
				for each (var bornPoint:Point in bornPoints)
				{
					giftBitmap = new Bitmap(giftBitmapData);
					giftBitmap.x = bornPoint.x;
					giftBitmap.y = bornPoint.y;
					editorZone.addChild(giftBitmap);
					var p:Point = shapePoints.shift();
					TweenLite.to(giftBitmap, 4, { alpha:1, x:(p.x), y:(p.y),onComplete:onTweenComplete,onCompleteParams:[giftBitmap] });
				}
				var tweenGiftNum:int = 0;
				function onTweenComplete(gift:Bitmap):void
				{
					tweenGiftNum = tweenGiftNum + 1;
					/*editorZone.removeChild(gift);
					if (tweenGiftNum == bornPoints.length)
					{
						MonsterDebugger.log('shape show end');
						editorZone.redraw(486, 424);
						stageEditor.editor.x = 202;
						stageEditor.editor.y = 0;
					}*/
				}
				
			}
		
			function errorHandler(event:LoaderEvent):void 
			{
				trace("error occured with " + event.target + ": " + event.text);
			}
			
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
	}

}