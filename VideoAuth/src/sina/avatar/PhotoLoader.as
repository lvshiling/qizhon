package sina.avatar 
{
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	import com.demonsters.debugger.MonsterDebugger;
	import sina.ui.skin.InfoSpriteLoading;
	
	/**
	 * @author     mole<mole1230@gmail.com>
	 * @version    $Id: PhotoLoader.as 7 2010-10-19 10:38:30Z mole1230 $
	 */
	public class PhotoLoader extends Sprite implements IEditSource
	{
		public static const COMPLETE:String = "COMPLETE";
		private var loader:Loader;
		private var fileReference:FileReference;
		private var fileFilters:Array;
		private var bitmapData:BitmapData;
		private var loadding:InfoSpriteLoading;
		private var _isLocal:Boolean = false;
		
		public function PhotoLoader() 
		{
			this.loadding = new InfoSpriteLoading();
			this.loadding.visible = false;
			this.addChild(this.loadding);
		}
		
		public function get editData():BitmapData
		{
			return this.bitmapData;
		}
		
		public function get isLocal():Boolean
		{
			return this._isLocal;
		}
		
		public function loadFromRemote(path:String):void
		{
			this._isLocal = false;
			this.load(path);
		}
		
		public function loadFromLocal():void
		{
			if (!this.fileReference) {
				this.fileFilters = new Array(new FileFilter("图片文件 (*.JPG;*.JPEG;*.GIF;*.PNG)", "*.jpg;*.jpeg;*.gif;*.png"));
				this.fileReference = new FileReference();
				this.fileReference.addEventListener(Event.SELECT, loaderHandler);
				this.fileReference.addEventListener(Event.COMPLETE, loaderHandler);
				this.fileReference.addEventListener(IOErrorEvent.IO_ERROR, loaderHandler);
				this.fileReference.addEventListener(SecurityErrorEvent.SECURITY_ERROR, loaderHandler);
			}
			this._isLocal = true;
			this.fileReference.browse(this.fileFilters);
		}
		
		private function load(path:*):void
		{
			if (!this.loader) {
				this.loader = new Loader();
				this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaderHandler);
				this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loaderHandler);
				this.loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, loaderHandler);
			}
			
			if (path is String) {
				this.loader.load(new URLRequest(path), new LoaderContext(true));
			} else {
				this.loader.loadBytes(path);
			}
		}
		
		private function loaderHandler(event:*):void
		{
			switch (event.type) {
				case Event.SELECT:
					this.loadding.visible = true;
					this.fileReference.load();
					break;
				case Event.COMPLETE:
					if (event.target is FileReference) {
						this.load(event.target.data);
					} else {
						this.loadding.visible = false;
						this.bitmapData = new BitmapData(event.target.content.width, event.target.content.height);
						this.bitmapData.draw(event.target.content, null, null, null, null, true);
						this.dispatchEvent(new Event(COMPLETE));
					}
					break;
				case SecurityErrorEvent.SECURITY_ERROR:
				case IOErrorEvent.IO_ERROR:
					this.loadding.visible = false;
					MonsterDebugger.trace(this, event);
					break;
				default:
					break;
			}
		}
	}

}