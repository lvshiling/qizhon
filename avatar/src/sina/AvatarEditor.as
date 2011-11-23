package sina 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.geom.Rectangle;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import com.demonsters.debugger.MonsterDebugger;
	import qizhon.ui.skin.TakePicBtn;
	import sina.avatar.BinaryTransfer;
	import sina.avatar.DragBox;
	import sina.avatar.EditWindow;
	import sina.avatar.PhotoLoader;
	import sina.avatar.ThumbButton;
	import sina.avatar.VideoWindow;
	import sina.avatar.ZoomBar;
	import sina.ui.skin.MainLoading;
	//import sina.ui.skin.SaveBtn;
	//import sina.ui.skin.SelectBtn;
	import qizhon.ui.skin.SaveBtn;
	import qizhon.ui.skin.SelectBtn;
	import sina.ui.skin.SplitLine;
	import sina.utils.BaseGemo;
	
	/**
	 * @author     mole<mole1230@gmail.com>
	 * @version    $Id: AvatarEditor.as 7 2010-10-19 10:38:30Z mole1230 $
	 */
	public class AvatarEditor extends Sprite
	{
		private const MARGIN_X:Number = 20;
		private const MARGIN_Y:Number = 10;
		private const AVAIL_WIDTH:Number = 670;
		private const AVAIL_HEIGHT:Number = 460;
		private const HEAD_GROUP_HEIGHT:Number = 40;
		private const EDIT_GROUP_HEIGHT:Number = 370;
		private const FOOT_GROUP_HEIGHT:Number = 50;
		private const EDITWINDOW_HEIGHT:Number = 300;
		private const EDITWINDOW_WIDTH:Number = 300;
		private const WRAPPER_WIDTH:Number = EDITWINDOW_WIDTH;
		private const WRAPPER_HEIGHT:Number = EDIT_GROUP_HEIGHT;
		private const SMALL_THUMB_WIDTH:Number = 30;
		private const SMALL_THUMB_HEIGHT:Number = 30;
		private const MIDDLE_THUMB_WIDTH:Number = 50;
		private const MIDDLE_THUMB_HEIGHT:Number = 50;
		private const BIG_THUMB_WIDTH:Number = 180;
		private const BIG_THUMB_HEIGHT:Number = 180;
		
		private var thumbs:Object;
		private var mainLoading:MainLoading;
		private var photoLoader:PhotoLoader;
		private var binaryTransfer:BinaryTransfer;
		
		private var headGroup:Sprite;
		private var footGroup:Sprite;
		private var editGroup:Sprite;
		private var editLeft:Sprite;
		private var editRight:Sprite;
		private var editLeftWrapper:Sprite;
		private var editRightWrapper:Sprite;
		private var splitLine:SplitLine;
		private var selectBtn:SelectBtn;
		private var zoomBar:ZoomBar;
		private var previewWindow:Sprite;
		private var smallEditWindow:Sprite;
		private var middleEditWindow:Sprite;
		private var bigEditWindow:EditWindow;
		private var smallThumb:ThumbButton;
		private var middleThumb:ThumbButton;
		private var bigThumb:ThumbButton;
		private var saveBtn:SaveBtn;
		private var thumbWrapper:Sprite;
		
		//add by stefan
		private var takePicBtn:TakePicBtn;
		private var editMiddle:Sprite;
		
		public function AvatarEditor() 
		{
			var gp:Graphics;
			this.headGroup = new Sprite();
			this.footGroup = new Sprite();
			this.editGroup = new Sprite();
			
			gp = this.headGroup.graphics;
			gp.beginFill(0xc2edf4, 0);
			gp.drawRect(0, 0, AVAIL_WIDTH - 2 * MARGIN_X, HEAD_GROUP_HEIGHT);
			gp.endFill();
			this.headGroup.x = MARGIN_X;
			this.headGroup.y = MARGIN_Y;
			
			gp = this.editGroup.graphics;
			gp.beginFill(0xeeb059, 0);
			gp.drawRect(0, 0, AVAIL_WIDTH - 2 * MARGIN_X, EDIT_GROUP_HEIGHT);
			gp.endFill();
			this.editGroup.x = MARGIN_X;
			this.editGroup.y = this.headGroup.y + this.headGroup.height;
			
			gp = this.footGroup.graphics;
			gp.beginFill(0xCFDEE9, 0);
			gp.drawRect(0, 0, AVAIL_WIDTH, FOOT_GROUP_HEIGHT);
			gp.endFill();
			this.footGroup.x = 0;
			this.footGroup.y = this.editGroup.y + this.editGroup.height;
			
			this.addChild(this.headGroup);
			this.addChild(this.editGroup);
			this.addChild(this.footGroup);
		}
		
		public function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, this.init);
			this.addHeadGroup();
			this.addEditGroup();
			this.addFootGroup();
			this.initListeners();
			this.resetThumbs();
		}
		
		private function initListeners():void
		{
			this.selectBtn.addEventListener(MouseEvent.CLICK, browser);
			this.takePicBtn.addEventListener(MouseEvent.CLICK,takePicHandler);
			this.photoLoader.addEventListener(PhotoLoader.COMPLETE, editPhoto);
			this.zoomBar.addEventListener(ZoomBar.SEEKING, this.zoomHandler);
			this.zoomBar.addEventListener(ZoomBar.SEEKEND, this.zoomHandler);
			this.bigEditWindow.addEventListener(EditWindow.SNAP, this.editWindowHandler);
			this.saveBtn.addEventListener(MouseEvent.CLICK, this.saveHandler);
			this.binaryTransfer.addEventListener(BinaryTransfer.COMPLETE, transferHandler);
			this.binaryTransfer.addEventListener(BinaryTransfer.ERROR, transferHandler);
			//
		}
		
		private function saveHandler(event:MouseEvent):void
		{
			switch (event.type) {
				case MouseEvent.CLICK:
					this.transfer('small');
					break;
				default:
					break;
			}
		}
		
		private function transferHandler(event:Event):void
		{
			switch (event.type) {
				case BinaryTransfer.COMPLETE:
					var complete:Boolean = true;
					for (var type:String in this.thumbs) {
						if (!this.thumbs[type]['transfered']) {
							complete = false
							this.transfer(type);
							break;
						}
					}
					if (complete) {
						Params.call({code:"A00001"});
					}
					break;
				case BinaryTransfer.ERROR:
					break;
				default:
					break;
			}
		}
		
		private function zoomHandler(event:Event):void
		{
			switch (event.type) {
				case ZoomBar.SEEKING:
					this.bigEditWindow.photoScale(this.zoomBar.rate);
					break;
				case ZoomBar.SEEKEND:
					this.bigEditWindow.snap();
					break;
				default:
					break;
			}
		}
		
		private function editWindowHandler(event:Event):void
		{
			switch (event.target) {
				case this.bigEditWindow:
					this.bigThumb.draw(this.bigEditWindow.bigThumbData);
					this.middleThumb.draw(this.bigEditWindow.middleThumbData);
					this.smallThumb.draw(this.bigEditWindow.smallThumbData);
					this.resetThumbs();
					break;
				default:
					break;
			}
		}
		
		private function transfer(type:String):void
		{
			if (this.thumbs[type]['transfered']) {
				return;
			}
			
			this.thumbs[type]['transfered'] = true;
			var params:Params = Params.getInstance();
			var gets:Object = {
					size: this.thumbs[type]['size'],
					uid: params.uid,
					token: params.token
				};
			this.binaryTransfer.transfer(this.bigEditWindow[this.thumbs[type]['data']], params.saveUrl, gets);
		}
		
		private function resetThumbs():void
		{
			this.thumbs = {
				small: { transfered: false, size: SMALL_THUMB_WIDTH + "x" + SMALL_THUMB_HEIGHT, data: "smallThumbData" },
				middle: { transfered: false, size: MIDDLE_THUMB_WIDTH + "x" + MIDDLE_THUMB_HEIGHT, data: "middleThumbData" },
				big: { transfered: false, size: BIG_THUMB_WIDTH + "x" + BIG_THUMB_HEIGHT, data: "bigThumbData" }
			}
		}
		
		private function addHeadGroup():void
		{
			this.selectBtn = new SelectBtn();
			this.selectBtn.buttonMode = true;
			this.headGroup.addChild(this.selectBtn);
			
			var guideText:TextField = new TextField();
			var tf:TextFormat = new TextFormat("宋体", 13, 0x0099FF);
			guideText.defaultTextFormat = tf;
			guideText.selectable = false;
			guideText.autoSize = TextFieldAutoSize.LEFT;
			guideText.text = "仅支持JPG、GIF、PNG图片文件，且文件小于10M";
			this.headGroup.addChild(guideText);
			guideText.x = this.selectBtn.x + this.selectBtn.width + 10;
			guideText.y = (this.selectBtn.height - guideText.height) / 2;
			
			this.photoLoader = new PhotoLoader();
			this.photoLoader.x = guideText.x + guideText.width + 10;
			this.photoLoader.y = (this.selectBtn.height - this.photoLoader.height) / 2
			this.headGroup.addChild(this.photoLoader);
			
			//
			this.takePicBtn = new TakePicBtn;
			this.takePicBtn.buttonMode = true;
			takePicBtn.x = this.photoLoader.x + this.photoLoader.width + 10;
			takePicBtn.y = (this.photoLoader.height - photoLoader.height) / 2;
			this.headGroup.addChild(takePicBtn);
			
		}
		
		private function addEditGroup():void
		{	
			var gp:Graphics;
			this.splitLine = new SplitLine();
			this.editLeft = new Sprite();
			this.editRight = new Sprite();
			//
			this.editMiddle = new Sprite();
			
			this.editLeftWrapper = new Sprite();
			this.editRightWrapper = new Sprite();
			this.thumbWrapper = new Sprite();
			this.editGroup.addChild(this.splitLine);
			this.editGroup.addChild(this.editLeft);
			this.editGroup.addChild(this.editRight);
			//
			this.editGroup.addChild(this.editMiddle);
			
			this.editLeft.addChild(this.editLeftWrapper);
			this.editLeft.addChild(this.editRightWrapper);
			this.editLeftWrapper.visible = false;
			this.splitLine.x = (this.editGroup.width - this.splitLine.width) / 2;
			this.splitLine.y = (this.editGroup.height - this.splitLine.height) / 2;
			
			gp = this.editLeft.graphics;
			gp.beginFill(0xab8244, 0);
			gp.drawRect(0, 0, (this.editGroup.width - this.splitLine.width) / 2, this.editGroup.height);
			gp.endFill();
			
			gp = this.editRight.graphics;
			gp.beginFill(0xf5d832, 0);
			gp.drawRect(0, 0, (this.editGroup.width - this.splitLine.width) / 2, this.editGroup.height);
			gp.endFill();
			this.editRight.x = this.splitLine.x + this.splitLine.width;
			//
			gp = this.editMiddle.graphics;
			gp.beginFill(0xab8244, 0);
			gp.drawRect(0, 0, (this.editGroup.width - this.splitLine.width) / 2, this.editGroup.height);
			gp.endFill();
			this.editMiddle.x = (this.editGroup.width - this.editMiddle.width) / 2;
			
			this.editLeftWrapper.x = (this.editLeft.width - WRAPPER_WIDTH) / 2;
			this.editRightWrapper.x = (this.editRight.width - WRAPPER_WIDTH) / 2;
			
			var guideText:TextField = new TextField();
			var tf:TextFormat = new TextFormat("宋体", 13, 0x0099FF);
			guideText.defaultTextFormat = tf;
			guideText.selectable = false;
			guideText.autoSize = TextFieldAutoSize.LEFT;
			guideText.text = "您上传的头像会自动生成三种尺寸，\n请注意中小尺寸的头像是否清晰。";
			this.editRightWrapper.addChild(guideText);
			
			gp = this.thumbWrapper.graphics;
			gp.beginFill(0xFFFFFF, 0);
			gp.drawRect(0, 0, this.editRight.width, this.editRight.height - guideText.y - guideText.height - 20);
			gp.endFill();
			this.editRightWrapper.addChild(this.thumbWrapper);
			this.thumbWrapper.y = guideText.y + guideText.height + 20;
			
			this.zoomBar = new ZoomBar();
			this.zoomBar.y = EDITWINDOW_HEIGHT + 10;
			this.zoomBar.x = this.zoomBar.leftMargin;
			this.editLeftWrapper.addChild(this.zoomBar);
			
			this.createWindows();

		}
		
		private function addFootGroup():void
		{
			this.saveBtn = new SaveBtn();
			this.saveBtn.buttonMode = true;
			this.saveBtn.visible = false;
			this.saveBtn.x = (this.footGroup.width - this.saveBtn.width) / 2;
			this.saveBtn.y = (this.footGroup.height - this.saveBtn.height) / 2;
			this.footGroup.addChild(this.saveBtn);
			
			this.binaryTransfer = new BinaryTransfer();
			this.binaryTransfer.x = this.saveBtn.x + this.saveBtn.width + 5;
			this.binaryTransfer.y = (this.footGroup.height - this.binaryTransfer.height) / 2;
			this.footGroup.addChild(this.binaryTransfer);
		}
		
		private function createWindows():void
		{
			//this.smallEditWindow = new EditWindow(EDITWINDOW_WIDTH, EDITWINDOW_HEIGHT, SMALL_THUMB_WIDTH, SMALL_THUMB_HEIGHT);
			//this.middleEditWindow = new EditWindow(EDITWINDOW_WIDTH, EDITWINDOW_HEIGHT, MIDDLE_THUMB_WIDTH, MIDDLE_THUMB_HEIGHT);
			this.bigEditWindow = new EditWindow(EDITWINDOW_WIDTH, EDITWINDOW_HEIGHT, BIG_THUMB_WIDTH, BIG_THUMB_HEIGHT);
			
			var text:String = SMALL_THUMB_WIDTH + "x" + SMALL_THUMB_HEIGHT + "像素";
			this.smallThumb = new ThumbButton(SMALL_THUMB_WIDTH, SMALL_THUMB_HEIGHT, text);
			text = MIDDLE_THUMB_WIDTH + "x" + MIDDLE_THUMB_HEIGHT + "像素";
			this.middleThumb = new ThumbButton(MIDDLE_THUMB_WIDTH, MIDDLE_THUMB_HEIGHT, text);
			text = BIG_THUMB_WIDTH + "x" + BIG_THUMB_WIDTH + "像素";
			this.bigThumb = new ThumbButton(BIG_THUMB_WIDTH, BIG_THUMB_HEIGHT, text);
			
			//this.smallEditWindow.visible = false;
			//this.middleEditWindow.visible = false;
			//this.bigEditWindow.visible = false;
			
			//this.editLeftWrapper.addChild(this.smallEditWindow);
			//this.editLeftWrapper.addChild(this.middleEditWindow);
			this.editLeftWrapper.addChild(this.bigEditWindow);
			
			this.thumbWrapper.addChild(this.smallThumb);
			this.thumbWrapper.addChild(this.middleThumb);
			this.thumbWrapper.addChild(this.bigThumb);
		
			this.middleThumb.x = this.bigThumb.x + this.bigThumb.width + 20;
			this.smallThumb.x = this.middleThumb.x;
			this.smallThumb.y = this.middleThumb.y + this.middleThumb.height + 30;
			
			this.photoLoader.loadFromRemote(Params.getInstance().photoUrl);
		}
		
		private function browser(event:MouseEvent):void
		{
			this.photoLoader.loadFromLocal();
		}
		private function takePicHandler(event:MouseEvent):void
		{
			trace("---trace takepic ---");
			this.takePicBtn.mouseChildren = false;
			this.takePicBtn.mouseEnabled = false;
			this.takePicBtn.enabled = false;
			var win:Sprite = new VideoWindow();
			editMiddle.addChild(win);
			if (!this.editGroup.contains(editMiddle))
			{
				this.editGroup.addChild(editMiddle);
			}
			this.editLeftWrapper.visible = false;
			this.editRightWrapper.visible = false;
			this.saveBtn.visible = false;
			this.splitLine.visible = false;
			win.addEventListener(Event.COMPLETE, onCaptureComplete);
			
		}
		private function editPhoto(event:Event):void
		{
			if (this.photoLoader.isLocal) {
				this.editLeftWrapper.visible = true;
				this.saveBtn.visible = true;
				if (!this.editRight.contains(this.editRightWrapper)) {
					this.editRight.addChild(this.editRightWrapper);
				}
				this.editRightWrapper.visible = true;
			} else {
				this.editLeftWrapper.visible = false;
				this.saveBtn.visible = false;
			}
			if (this.editGroup.contains(this.editMiddle))
			{
				this.editGroup.removeChild(this.editMiddle);
				if (this.editMiddle.numChildren > 0)
				{
					(this.editMiddle.getChildAt(0) as VideoWindow).destroy();
				}
			}
			this.bigEditWindow.edit(event.target.editData, BIG_THUMB_WIDTH, BIG_THUMB_HEIGHT);
			this.bigEditWindow.forcePhotoScale(0, this.zoomBar);
			this.takePicBtn.mouseChildren = true;
			this.takePicBtn.mouseEnabled = true;
		}
		private function onCaptureComplete(event:Event):void
		{
			trace("--onCaptureComplete--");
			
			var videoWin:VideoWindow = event.target as VideoWindow;
			videoWin.removeEventListener(Event.COMPLETE, onCaptureComplete);
			videoWin.destroy();
			this.editMiddle.removeChild(videoWin);
			this.editGroup.removeChild(this.editMiddle);
			this.editLeftWrapper.visible = true;
			this.saveBtn.visible = true;
			if (!this.editRight.contains(this.editRightWrapper)) {
				this.editRight.addChild(this.editRightWrapper);
			}
			this.editRightWrapper.visible = true;
			this.splitLine.visible = true;
			this.takePicBtn.mouseChildren = true;
			this.takePicBtn.mouseEnabled = true;
			this.bigEditWindow.edit(event.target.editData, BIG_THUMB_WIDTH, BIG_THUMB_HEIGHT);
			this.bigEditWindow.forcePhotoScale(0, this.zoomBar);
			
		}
	}

}