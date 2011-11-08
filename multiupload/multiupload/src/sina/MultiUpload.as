package sina
{
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.media.Video;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.FileReferenceList;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.system.Capabilities;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.*;
	import com.demonsters.debugger.MonsterDebugger;
	import sina.external.ExternalCall;
	import sina.ui.controls.Button;
	import sina.ui.controls.Item;
	import sina.ui.events.ItemEvent;
	import sina.ui.skin.AllSkins;
	import sina.ui.skin.DotLine;
	
	/**
	 * @author     mole<mole1230@gmail.com>
	 * @version    $Id: MultiUpload.as 7 2010-10-19 10:38:30Z mole1230 $
	 */
	public class MultiUpload extends Sprite
	{
		private const START_X:Number = 0;
		private const START_Y_HEAD:Number = 10;
		private const START_Y_IMG:Number = 60;
		private const START_Y_FOOT_PADDING:Number = 10;
		
		private const ITEM_MARGIN_RIGHT:Number = 10;
		private const ITEM_MARGIN_BOTTOM:Number = 10;
		private const ITEM_NUM_X:int = 6;
		
		private const IMAGE_GROUP_PADDING_X:Number = 10;
		private const IMAGE_GROUP_PADDING_Y:Number = 10;
		private const IMAGE_GROUP_MENU_HEIGHT:Number = 22;
		
		private const REMOVE_ONE:String = "remove_one";
		private const REMOVE_ALL:String = "remove_all";
		private const REMOVE_REMAIN:String = "remove_remain";
		
		private const UPDATE_TYPE_ADD:String = "update_type_add";
		private const UPDATE_TYPE_NEW:String = "update_type_new";
		private const UPDATE_TYPE_DELETE:String = "update_type_delete";
		
		private const PHASE_NORMAL:String = "phase_normal";
		private const PHASE_UPLOADING:String = "phase_uploading";
		private const PHASE_PAUSE:String = "phase_pause";
		private const PHASE_UPLOADED:String = "phase_uploaded";

		private var _uploadUrl:String = "http://www.mole.com/flash/upload.php";
		private var _imgFormat:String = "图片文件|*.jpg;*.jpeg;*.gif;*.png;*.bmp";
		private var _token:String = "";
		private var _uid:int = 0;
		private var _maxNum:int = 32;
		private var _maxSize:Number = 3;
		private var _movieName:String = "Multiupload_0";
		
		private var _numImg:int = 0;
		private var _numImgUploadedError:int = 0;
		private var _numImgUploaded:int = 0;
		private var _fileList:Array = [];
		private var _preloadStack:Array = [];
		private var _selectedStack:Array = [];
		private var _uploadStack:Array = [];
		private var _itemUploading:Item;
		private var _phase:String = PHASE_NORMAL;
		private var _response:Array = [];
		
		private var _fp:int = 10;
		private var _isIe:int;
		private var _fileFilter:FileFilter;
		private var _fileReferenceList:FileReferenceList;
		
		private var _lineWidth:Number;
		private var _skins:AllSkins = new AllSkins();
		private var _browseBtn:Button;
		private var _headGroup:Sprite;
		private var _headGroupFlash9Tips:Button;
		private var _imgGroup:Sprite;
		private var _imgGroupBg:Sprite;
		private var _imgGroupTips:TextField;
		private var _imgGroupErrorTips:TextField;
		private var _imgGroupBrowseBtn:Button;
		private var _imgGroupNoImg:TextField;
		private var _imgGroupCleanBtn:Button;
		private var _imgGroupRemoveRemainBtn:Button;
		private var _imgGroupGRACWBtn:Button;
		private var _imgGroupGRCWBtn:Button;
		private var _imgGroupGDBtn:Button;
		private var _progressBar:Sprite;
		private var _progressBarBg:Sprite;
		private var _filePanel:Sprite;
		private var _footGroup:Sprite;
		private var _uploadBtn:Button;
		private var _pauseBtn:Button;
		private var _continueBtn:Button;
		
		private var _setHeightCallback:String;
		private var _endUploadCallback:String;

		public function MultiUpload() 
		{
			var v:int = int(Capabilities.version.replace(/,/, " ").split(" ")[1]);
			if (v) {
				_fp = int(v);
			}
			
			_lineWidth = IMAGE_GROUP_PADDING_X * 2 + ITEM_NUM_X * Item.WIDTH + (ITEM_NUM_X - 1) * ITEM_MARGIN_RIGHT + 1;
		}
		
		public function init():void
		{
			_setHeightCallback = "setHeight";
			_endUploadCallback = "endUpload";
			
			_addHeadGroup();
			_addImgGroup();
			_addFootGroup();
			_setupExternalInterface();
 		}
		
		private function _setupExternalInterface():void
		{
			try {
				ExternalInterface.addCallback('startUpload', _startUpload);
			} catch (e:Error) {
				MonsterDebugger.trace('startUpload', e);
			}
		}
		
		private function _addHeadGroup():void
		{
			var paddingY:Number = 13;
			
			// head container  
			_headGroup = new Sprite();
		
			// line
			//var headDotLine:Sprite = new DotLine() as Sprite;
			//headDotLine.x = 0;
			//headDotLine.y = 0;
			//headDotLine.width = _lineWidth;
			//_headGroup.addChild(headDotLine);
			
			// browse button
			_browseBtn = new Button();
			_browseBtn.setStyle("skin", _skins.browse);
			_browseBtn.x = 0;
			_browseBtn.y = 10;
			_browseBtn.addEventListener(MouseEvent.CLICK, _browseFile);
			_headGroup.addChild(_browseBtn);
			
			// tip string
			var headGroupNormalTips:TextField = new TextField();
			var tf:TextFormat = new TextFormat("宋体", 12, 0x666666);
			headGroupNormalTips.autoSize = TextFieldAutoSize.LEFT;
			headGroupNormalTips.selectable = false;
			headGroupNormalTips.defaultTextFormat = tf;
			var str:String = "可一次批量上传" + this._maxNum + "张；";
			str = str + ("每张不超过" + (this._fp >= 10 ? (this._maxSize) : (3)) + "M");
			//if (this._fp >= 10) {
			//	str = str + "（BMP、GIF图片每张不超过3M）";
			//}
			str = str + ("；支持格式：" + _imgFormat.split("|")[1].replace(/\*./g, "").replace(/;/g, "、").toUpperCase());
			headGroupNormalTips.appendText(str);
			headGroupNormalTips.x = 75;
			headGroupNormalTips.y = paddingY;
			_headGroup.addChild(headGroupNormalTips);
			
			// flash player < 10
			_headGroupFlash9Tips = new Button();
			_headGroup.addChild(_headGroupFlash9Tips);
			_headGroupFlash9Tips.setStyle("skin", _skins["fp10"]);
			_headGroupFlash9Tips.x = headGroupNormalTips.x + headGroupNormalTips.width + 10;
			_headGroupFlash9Tips.y = paddingY;
			_headGroupFlash9Tips.useHandCursor = true;
			_headGroupFlash9Tips.visible = _fp < 10;
			_headGroupFlash9Tips.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void {
				try {
					navigateToURL(
						new URLRequest("http://fpdownload.adobe.com/get/flashplayer/current/install_flash_player_ax.exe")
					);
				} catch (e:Error) {}
			});

			_headGroup.x = START_X;
			_headGroup.y = START_Y_HEAD;
			addChild(_headGroup);
		}
		
		private function _addImgGroup():void
		{
			var paddingX:Number = 5;
			var paddingY:Number = 3;
			var btnDistance:Number = 60;
			
			// image group container
			_imgGroup = new Sprite();
			
			// background
			_imgGroupBg = new Sprite();
			_imgGroup.addChild(_imgGroupBg);
			_imgGroupBg.x = 0;
			_imgGroupBg.y = 0;
			_drawImgGroupBg();
			_imgGroupBg.addEventListener(MouseEvent.CLICK, _gloalHandleItems);

			// tips
			var tf:TextFormat = new TextFormat("宋体", 12, 0x8C8C8C);
			tf.bold = true;
			_imgGroupTips = new TextField();
			_imgGroupTips.defaultTextFormat = tf;
			_imgGroupTips.autoSize = TextFieldAutoSize.LEFT;
			_imgGroupTips.selectable = false;
			_imgGroupTips.text = "0张图片等待上传";
			_imgGroupTips.x = paddingX;
			_imgGroupTips.y = paddingY;
			_imgGroup.addChild(_imgGroupTips);
			
			// error tips
			var etf:TextFormat = new TextFormat("宋体", 12, 0xFF0000);
			etf.bold = true;
			_imgGroupErrorTips = new TextField();
			_imgGroupErrorTips.defaultTextFormat = etf;
			_imgGroupErrorTips.autoSize = TextFieldAutoSize.LEFT;
			_imgGroupErrorTips.selectable = false;
			_imgGroupErrorTips.text = "一次最多可以上传" + _maxNum + "个文件";
			_imgGroupErrorTips.x = 180;
			_imgGroupErrorTips.y = paddingY;
			_imgGroupErrorTips.visible = false;
			_imgGroup.addChild(_imgGroupErrorTips);			
			
			// clean up button
			_imgGroupCleanBtn = new Button();
			_imgGroupCleanBtn.setStyle("skin", _skins.rmvall);
			_imgGroupCleanBtn.x = 120;
			_imgGroupCleanBtn.y = paddingY;
			_imgGroupCleanBtn.useHandCursor = true;
			_imgGroupCleanBtn.visible = false;
			_imgGroupCleanBtn.addEventListener(MouseEvent.CLICK, _gloalHandleItems);
			_imgGroup.addChild(_imgGroupCleanBtn);
			
			// remove remain button
			_imgGroupRemoveRemainBtn = new Button();
			_imgGroupRemoveRemainBtn.setStyle("skin", _skins.rmvremain);
			_imgGroupRemoveRemainBtn.x = 320;
			_imgGroupRemoveRemainBtn.y = paddingY;
			_imgGroupRemoveRemainBtn.useHandCursor = true;
			_imgGroupRemoveRemainBtn.visible = false;
			_imgGroupRemoveRemainBtn.addEventListener(MouseEvent.CLICK, _gloalHandleItems);
			_imgGroup.addChild(_imgGroupRemoveRemainBtn);
			
			// progress bar
			var gp:Graphics;
			_progressBar = new Sprite();
			_progressBarBg = new Sprite();
			gp = _progressBarBg.graphics;
			gp.lineStyle(1, 0xD3D3D3);
			gp.beginFill(0xFFFFFF);
			gp.drawRect(0, 0, 126, 12);
			gp.endFill();
			_progressBarBg.x = 180;
			_progressBarBg.y = paddingY + 2;
			_progressBarBg.visible = false;
			_imgGroup.addChild(_progressBarBg);
			gp = _progressBar.graphics;
			gp.lineStyle();
			gp.beginGradientFill(GradientType.LINEAR, [0xE7ECF0, 0x1B68AB], [1, 1], [0, 255]);
			gp.drawRect(0, 0, 124, 10);
			gp.endFill();
			_progressBar.x = 180 + 1.5;
			_progressBar.y = paddingY + 3.5;
			_progressBar.scaleX = 0;
			_progressBar.visible = false;
			_imgGroup.addChild(_progressBar);
			
			// acw button
			_imgGroupGRACWBtn = new Button();
			_imgGroupGRACWBtn.setStyle("skin", _skins.gacw);
			_imgGroupGRACWBtn.x = _lineWidth - 180;
			_imgGroupGRACWBtn.y = paddingY;
			_imgGroupGRACWBtn.useHandCursor = true;
			_imgGroupGRACWBtn.enabled = false;
			_imgGroupGRACWBtn.addEventListener(MouseEvent.CLICK, _gloalHandleItems);
			_imgGroup.addChild(_imgGroupGRACWBtn);
			
			// cw button
			_imgGroupGRCWBtn = new Button();
			_imgGroupGRCWBtn.setStyle("skin", _skins.gcw);
			_imgGroupGRCWBtn.x = _imgGroupGRACWBtn.x + btnDistance;
			_imgGroupGRCWBtn.y = paddingY;
			_imgGroupGRCWBtn.useHandCursor = true;
			_imgGroupGRCWBtn.enabled = false;
			_imgGroupGRCWBtn.addEventListener(MouseEvent.CLICK, _gloalHandleItems);
			_imgGroup.addChild(_imgGroupGRCWBtn);
			
			// delete button
			_imgGroupGDBtn = new Button();
			_imgGroupGDBtn.setStyle("skin", _skins.gd);
			_imgGroupGDBtn.x = _imgGroupGRCWBtn.x + btnDistance;
			_imgGroupGDBtn.y = paddingY;
			_imgGroupGDBtn.useHandCursor = true;
			_imgGroupGDBtn.enabled = false;
			_imgGroupGDBtn.addEventListener(MouseEvent.CLICK, _gloalHandleItems);
			_imgGroup.addChild(_imgGroupGDBtn);
			
			// group browse button
			_imgGroupBrowseBtn = new Button();
			_imgGroupBrowseBtn.setStyle("skin", _skins.browseC);
			_imgGroupBrowseBtn.x = (_imgGroupBg.width - 157) / 2;
			_imgGroupBrowseBtn.y = (_imgGroupBg.height - 45) / 2;
			_imgGroupBrowseBtn.useHandCursor = true;
			_imgGroupBrowseBtn.addEventListener(MouseEvent.CLICK, _browseFile);
			_imgGroup.addChild(_imgGroupBrowseBtn);
			
			// no image
			var tfNoImg:TextFormat = new TextFormat("宋体", 12, 0x006530);
			tfNoImg.bold = true;
			_imgGroupNoImg = new TextField();
			_imgGroupNoImg.defaultTextFormat = tfNoImg;
			_imgGroupNoImg.autoSize = TextFieldAutoSize.LEFT;
			_imgGroupNoImg.selectable = false;
			_imgGroupNoImg.text = "可一次批量上传 " + this._maxNum + " 张图片";
			_imgGroupNoImg.x = (_imgGroupBg.width - _imgGroupNoImg.width) / 2;
			_imgGroupNoImg.y = (_imgGroupBg.height - _imgGroupNoImg.height) / 2 + 35;
			_imgGroup.addChild(_imgGroupNoImg);
			
			// image container
			_filePanel = new Sprite();
			_filePanel.x = IMAGE_GROUP_PADDING_X;
			_filePanel.y = IMAGE_GROUP_PADDING_Y + IMAGE_GROUP_MENU_HEIGHT;
			_imgGroup.addChild(_filePanel);

			
			_imgGroup.x = START_X;
			_imgGroup.y = START_Y_IMG;
			addChild(_imgGroup);
		}
		
		private function _addFootGroup():void
		{
			var paddingY:Number = 10;
			
			// foot container;
			_footGroup = new Sprite();
			
			// line
			//var headDotLine:Sprite = new DotLine() as Sprite;
			//headDotLine.x = 0;
			//headDotLine.y = 0;
			//headDotLine.width = _lineWidth;
			//_footGroup.addChild(headDotLine);
			
			// upload button
			_uploadBtn = new Button();
			_uploadBtn.setStyle("skin", _skins.start);
			_uploadBtn.x = 0;
			_uploadBtn.y = paddingY;
			_uploadBtn.useHandCursor = true;
			_uploadBtn.enabled = false;
			_uploadBtn.addEventListener(MouseEvent.CLICK, _startUpload);
			_footGroup.addChild(_uploadBtn);
			
			// pause button
			_pauseBtn = new Button();
			_pauseBtn.setStyle("skin", _skins.pause);
			_pauseBtn.x = 0;
			_pauseBtn.y = paddingY
			_pauseBtn.useHandCursor = true;
			_pauseBtn.visible = false;
			_pauseBtn.addEventListener(MouseEvent.CLICK, _pauseUpload);
			_footGroup.addChild(_pauseBtn);
			
			// continue button
			_continueBtn = new Button();
			_continueBtn.setStyle("skin", _skins.contn);
			_continueBtn.x = 0;
			_continueBtn.y = paddingY;
			_continueBtn.useHandCursor = true;
			_continueBtn.visible = false;
			_continueBtn.addEventListener(MouseEvent.CLICK, _continueUpload);
			_footGroup.addChild(_continueBtn);
			
			_footGroup.x = START_X;
			_footGroup.y = _imgGroup.y + _imgGroup.height + START_Y_FOOT_PADDING;
			addChild(_footGroup);
		}
		
		private function _continueUpload(e:MouseEvent):void
		{
			_phase = PHASE_UPLOADING;
			_handleUpload();
		}
		
		private function _pauseUpload(e:MouseEvent):void
		{
			_phase = PHASE_PAUSE;
			_itemUploading.pauseUpload();
			_uploadStack.unshift(_itemUploading);
			_updateStatus(false);
		}
	
		private function _startUpload(e:MouseEvent = null):void
		{
			_phase = PHASE_UPLOADING;
			_selectedStack = [];
			_uploadStack = [];

			var i:int = 0;
			var length:int = _filePanel.numChildren;
			var node:Item;
			while (i < length) {
				node = _filePanel.getChildAt(i) as Item;
				node.uploadStatus = Item.UPLOAD_STATUS_WAITING;
				_uploadStack.push(node);
				i++;
			}
			
			_handleUpload();
		}
		
		private function _handleUpload():void
		{
			_updateStatus(false);
			if (_uploadStack.length > 0) {
				var node:Item;
				node = _uploadStack.shift();
				_itemUploading = node;
				node.startUpload();
			} else {
				_endUpload();
			}
		}
		
		private function _endUpload():void
		{
			_itemUploading = null;
			_phase = PHASE_UPLOADED;
			_updateStatus(false);
			
			if (_numImgUploadedError <= 0) {
				try {
					ExternalCall.endUpload(_endUploadCallback, _response);
					MonsterDebugger.log("endUpload", _response);
					
				} catch (e:Error) {
					MonsterDebugger.trace("endUpload", e);
				}
			}
		}
		
		private function _gloalHandleItems(e:MouseEvent):void
		{
			var node:* = e.target;
			var item:Item;
			switch (node) {
				case _imgGroupBg:
					for each (item in _selectedStack) {
						item.selected = false;
					}
					
					_selectedStack = [];
					_updateBtnStatus();
					break;
				case _imgGroupCleanBtn:
					_updateFilePanel(null, UPDATE_TYPE_DELETE, null, REMOVE_ALL);
					break;
				case _imgGroupGDBtn:
					while (_selectedStack.length > 0) {
						_updateFilePanel(null, UPDATE_TYPE_DELETE, _selectedStack[0]);
					}
					break;
				case _imgGroupGRCWBtn:
					for each (item in _selectedStack) {
						item.rotationImg(Item.ROTATE_CW);
					}
					break;
				case _imgGroupGRACWBtn:
					for each (item in _selectedStack) {
						item.rotationImg(Item.ROTATE_ACW);
					}
					break;
				case _imgGroupRemoveRemainBtn:
					_updateFilePanel(null, UPDATE_TYPE_DELETE, null, REMOVE_REMAIN);
					break;
				default:
					break;
			}
		}
		
		private function _drawImgGroupBg():void
		{
			var allHeight:Number;
			var imgGroupWidth:Number = _lineWidth - 1;
			var num:int = _filePanel ? _filePanel.numChildren : 0;
			var rows:int = Math.max(Math.ceil(num / ITEM_NUM_X) , 1);
			var bgHeight:Number = IMAGE_GROUP_PADDING_Y * 2 + IMAGE_GROUP_MENU_HEIGHT + rows * Item.HEIGHT + (rows - 1) * ITEM_MARGIN_BOTTOM;
			
			if (_imgGroupBg && bgHeight != (_imgGroupBg.height - 1)) {
				var gp:Graphics = _imgGroupBg.graphics;
				gp.clear();
				gp.lineStyle(1, 0xD0D0D0);
				gp.beginFill(0xFFFFFF);
				gp.drawRect(0, 0, imgGroupWidth, bgHeight);
				gp.endFill();
				gp.lineStyle();
				gp.beginFill(0xEEEEEE);
				gp.drawRect(0.5, 0.5, imgGroupWidth - 0.5, IMAGE_GROUP_MENU_HEIGHT);
				gp.endFill();
				
				if (_footGroup) {
					_footGroup.y = _imgGroup.y + _imgGroup.height + START_Y_FOOT_PADDING;
					allHeight = _footGroup.y + _footGroup.height + 10;
				
					try {
						ExternalCall.setHeight(_setHeightCallback, allHeight);
					} catch (e:Error) {
						MonsterDebugger.trace("setHeight", e);
					}
				} 
			}
		}

		private function _browseFile(e:MouseEvent):void
		{
			_fileReferenceList = new FileReferenceList();
			_fileReferenceList.addEventListener(Event.SELECT, _selectFile);
			_fileReferenceList.addEventListener(Event.CANCEL, _selectFile);
			_fileReferenceList.browse([_fileFilter]);
		}
		
		private function _selectFile(e:Event):void
		{
			var num:int;
			var preloadFileList:Array;
			
			switch (e.type) {
				case Event.SELECT:
					if (!_fileList) {
						preloadFileList = _fileReferenceList.fileList;
						num = preloadFileList.length;
						if (num > _maxNum) {
							_fileList = _fileList.splice(0, _maxNum);
							_showErrorTips();
						}
						_fileList = preloadFileList;
						_updateFilePanel(preloadFileList);
					} else {
						preloadFileList = _uniqueFileList(_fileReferenceList.fileList);
						num = _maxNum - _numImg;
						if (num > 0) {
							if (num < preloadFileList.length) {
								preloadFileList = preloadFileList.splice(0, num);
								_showErrorTips();
							}
							
							_fileList = _fileList.concat(preloadFileList);
							_updateFilePanel(preloadFileList, UPDATE_TYPE_ADD);
						}
					}
					break;
				case Event.CANCEL:
					break;
				default:
					break;
			}
			
		}
		
		private function _showErrorTips(str:String = ""):void
		{
			if (str) {
				_imgGroupErrorTips.text = str;
			}
			_imgGroupErrorTips.visible = true;
			setTimeout(function():void {
					_imgGroupErrorTips.visible = false;
				}, 5000);
		}
		
		private function _updateFilePanel(fileList:Array, type:String = UPDATE_TYPE_NEW, node:Item = null, rmType:String = REMOVE_ONE):void
		{
			switch (type) {
				case UPDATE_TYPE_NEW:
					_pushPreloadStack(fileList, UPDATE_TYPE_NEW);
					_numImg = fileList.length;
					_startPreload();
					break;
				case UPDATE_TYPE_ADD:
					_pushPreloadStack(fileList, UPDATE_TYPE_ADD);
					_numImg += fileList.length;
					_startPreload();
					break;
				case UPDATE_TYPE_DELETE:
					switch (rmType) {
						case REMOVE_ALL:
							while (_filePanel.numChildren) {
								_filePanel.removeChildAt(0);
							}
							_resetVariables();
							break;
						case REMOVE_REMAIN:
							var node:Item;
							while (_uploadStack.length) {
								node = _uploadStack[_uploadStack.length - 1] as Item;
								_filePanel.removeChild(node);
								_spliceVariables(node);
							}
							break;
						default:
							_filePanel.removeChild(node);
							_spliceVariables(node);
							break;
					}
					_rearrangeFilePanelChildren();
					break;
				default:
					break;
			}

			_updateStatus(true);
		}
		
		private function _spliceVariables(node:Item):void
		{
			var pos:int;
			pos = _selectedStack.indexOf(node);
			(pos > -1) && _selectedStack.splice(pos, 1);
			pos = _fileList.indexOf(node.fileReference);
			(pos > -1) && _fileList.splice(pos, 1);
			pos = _uploadStack.indexOf(node);
			(pos > -1) && _uploadStack.splice(pos, 1);
			_numImg--;
		}
		
		private function _rearrangeFilePanelChildren():void
		{
			var length:int = _filePanel.numChildren;
			var i:int = 0;
			var node:Item;
			while (i < length) {
				node = _filePanel.getChildAt(i) as Item;
				if (node) {
					node.index = i;
					node.x = i % ITEM_NUM_X * (Item.WIDTH + ITEM_MARGIN_RIGHT);
					node.y = Math.floor(i / ITEM_NUM_X) * (Item.HEIGHT + ITEM_MARGIN_BOTTOM);
				}
				i++;
			}
		}
		
		private function _updateStatus(isDrawBg:Boolean = true):void
		{
			_updateTips();
			_updateBtnStatus();
			if (isDrawBg) {
				_drawImgGroupBg()
			}
		}
		
		private function _updateTips():void
		{
			var str:String;
			switch (_phase) {
				case PHASE_NORMAL:
					str = _numImg + "张图片等待上传";
					break;
				default:
					str = "共" + _numImg + "张图片，上传完成" + _numImgUploaded + "张";
					break;
			}
			
			_imgGroupTips.text = str;
		}
		
		private function _updateBtnStatus():void
		{
			_numImg = (_numImg < 0) ? 0 : _numImg;
			_numImgUploaded = (_numImgUploaded < 0) ? 0 : _numImgUploaded;
			
			_imgGroupGDBtn.enabled = 
			_imgGroupGRCWBtn.enabled = 
			_imgGroupGRACWBtn.enabled = Boolean(_selectedStack.length);

			_imgGroupNoImg.visible = 
			_imgGroupBrowseBtn.visible = (_numImg == 0);

			if (_phase == PHASE_NORMAL) {
				_imgGroupCleanBtn.visible = Boolean(_numImg);
				if (_numImg < _maxNum) {
					_browseBtn.enabled = (_preloadStack.length == 0);
				}
				
				if (_numImg > 0) {
					_uploadBtn.enabled = (_preloadStack.length == 0);
				} else {
					_uploadBtn.enabled = false
				}
			} else {
				_progressBarBg.visible = true;
				_progressBar.visible = true;
				_progressBar.scaleX = _numImgUploaded / _numImg;
				_browseBtn.enabled = false;
				_imgGroupCleanBtn.visible = false;
				_imgGroupRemoveRemainBtn.visible = !(_filePanel.numChildren == _numImgUploaded);
				_uploadBtn.visible = false;
				
				if (_phase == PHASE_UPLOADING) {
					_pauseBtn.visible = true;
					_continueBtn.visible = false;
				} else if (_phase == PHASE_PAUSE) {
					_pauseBtn.visible = false;
					_continueBtn.visible = true;
				} else if (_phase == PHASE_UPLOADED) {
					_uploadBtn.visible = false;
					_pauseBtn.visible = false;
					_continueBtn.visible = false;
				}
			}
		}
		
		private function _resetVariables():void
		{
			_numImg = 0;
			_numImgUploadedError = 0;
			_numImgUploaded = 0;
			_fileList = [];
			_preloadStack = [];
			_selectedStack = [];
			_uploadStack = [];
			_phase = PHASE_NORMAL;
		}
		
		private function _pushPreloadStack(fileList:Array, type:String = UPDATE_TYPE_NEW):void
		{
			var file:FileReference;
			var node:Item;
			var i:*;

			for (i in fileList) {
				i = int(i);
				file = fileList[i]; 
				node = new Item();
				node.fp = _fp;
				node.index = _numImg + i;
				node.uploadUrl = _uploadUrl;
				node.delay = i;
				node.maxSize = _maxSize;
				node.fileReference = file;
				node.setRequestVariables("token", _token);
				node.setRequestVariables("uid", _uid);
				node.x = (_numImg + i) % ITEM_NUM_X * (Item.WIDTH + ITEM_MARGIN_RIGHT);
				node.y = Math.floor((_numImg + i) / ITEM_NUM_X) * (Item.HEIGHT + ITEM_MARGIN_BOTTOM);
				
				node.addEventListener(ItemEvent.DOWN, _itemEvent);
				node.addEventListener(ItemEvent.DELETE, _itemEvent);
				node.addEventListener(ItemEvent.SELECT_CHANGED, _itemEvent);
				node.addEventListener(ItemEvent.UNSELECT_OTHERS, _itemEvent);
				node.addEventListener(ItemEvent.PRELOAD_COMPLETE, _itemEvent);
				node.addEventListener(ItemEvent.UPLOAD_SIZE_ERROR, _itemEvent);
				node.addEventListener(ItemEvent.UPLOAD_PRELOAD_ERROR, _itemEvent);
				node.addEventListener(ItemEvent.UPLOAD_START, _itemEvent);
				node.addEventListener(ItemEvent.UPLOAD_SUCCESS, _itemEvent);
				node.addEventListener(ItemEvent.UPLOAD_FAILURE, _itemEvent);
				node.addEventListener(ItemEvent.UPLOAD_COMPLETE, _itemEvent);
				
				_filePanel.addChild(node);
				_preloadStack.push(node);
			}
		}
		
		private function _itemEvent(e:Event):void
		{
			var node:Item = e.target as Item;
			switch (e.type) {
				case ItemEvent.DELETE:
					_updateFilePanel(null, UPDATE_TYPE_DELETE, node);
					break;
				case ItemEvent.UNSELECT_OTHERS:
					var tmp:Item;
					for each (tmp in _selectedStack) {
						if (tmp != node) {
							tmp.selected = false;
						}
					}
					_selectedStack = [node];
					_updateBtnStatus();
					break;
				case ItemEvent.SELECT_CHANGED:
					if (node.selected) {
						_selectedStack.push(node);
					} else {
						_selectedStack.splice(_selectedStack.indexOf(node), 1);
					}
					_updateBtnStatus();
					break;
				case ItemEvent.PRELOAD_COMPLETE:
					_handlePreload();
					break;
				case ItemEvent.UPLOAD_START:
					node.selected = false;
					var pos:int = _selectedStack.indexOf(node);
					(pos > -1) && _selectedStack.splice(pos, 1);
					break;
				case ItemEvent.UPLOAD_SUCCESS:
					_response.push(e.target.json);
					break;
				case ItemEvent.UPLOAD_SIZE_ERROR:
				case ItemEvent.UPLOAD_FAILURE:
					_numImgUploadedError++;
					break;
				case ItemEvent.UPLOAD_COMPLETE:
					_numImgUploaded++;
					_handleUpload();
					break;
				default:
					break;
			}
		}
		
		private function _startPreload():void
		{	
			_browseBtn.enabled = false;
			_uploadBtn.enabled = false;
			_handlePreload();
		}
		
		private function _handlePreload():void
		{
			if (_preloadStack.length > 0) {
				var node:Item;
				node = _preloadStack.shift();
				node.starPreload();
			} else {
				_endPreload();
			}
		}
		
		private function _endPreload():void
		{
			_updateBtnStatus();
		}
		
		private function _uniqueFileList(fileList:Array):Array
		{
			var collectList:Array = [];
			var item:*;
			var sItem:*;
			
			for each (item in fileList) {
				var isNew:Boolean = true;
				for each (sItem in _fileList) {
					if (item.type == sItem.type
					  && item.size == sItem.size
					  && item.modificationDate.time == sItem.modificationDate.time
					  && item.creationDate.time == sItem.creationDate.time) {
						isNew = false;
						break;
					}
				}

				if (isNew) {
					collectList.push(item);
				}
			}

			return collectList;
		}
		
		public function set uploadUrl(value:String):void 
		{
			if (value) {
				_uploadUrl = value;
			}
		}
		
		public function set imgFormat(value:String):void 
		{
			var arr:Array;
			if (value) {
				_imgFormat = value;
			}
			
			arr = _imgFormat.split("|");
			if (arr.length > 1) {
				_fileFilter = new FileFilter(arr[0], arr[1]);
			}
		}
		
		public function set token(value:String):void 
		{
			if (value) {
				_token = value;
			}
		}
		
		public function set uid(value:int):void
		{
			if (value) {
				_uid = value;
			}
		}
		
		public function set maxNum(value:int):void 
		{
			if (value) {
				_maxNum = value;
			}
		}
		
		public function set maxSize(value:Number):void 
		{
			if (value) {
				_maxSize = value;
			}
		}
		
		public function set movieName(value:String):void 
		{
			if (value) {
				_movieName = value;
			}
		}
		
	}

}