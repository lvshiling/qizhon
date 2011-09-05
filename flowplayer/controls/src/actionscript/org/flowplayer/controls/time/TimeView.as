/* * This file is part of Flowplayer, http://flowplayer.org * * By: Anssi Piirainen, <support@flowplayer.org> *Copyright (c) 2008-2011 Flowplayer Oy * * Released under the MIT License: * http://www.opensource.org/licenses/mit-license.php */package org.flowplayer.controls.time {    import flash.display.DisplayObject;    import org.flowplayer.controls.time.TimeViewConfig;    import org.flowplayer.util.Arrange;    import org.flowplayer.util.TimeUtil;    import org.flowplayer.view.AbstractSprite;	import org.flowplayer.view.Flowplayer;		import org.flowplayer.ui.buttons.ConfigurableWidget;		import flash.events.Event;	import flash.text.TextField;	import flash.text.TextFieldAutoSize;	import flash.text.TextFormat;		import flash.display.BlendMode;	/**	 * @author api	 */	public class TimeView extends ConfigurableWidget {		public static const EVENT_REARRANGE:String = "onRearrange";		private var _config:TimeViewConfig;               private var _timeText:TextField;        private var _durationText:TextField;        private var _prevTextLength:Number = "00:00".length;        private var _player:Flowplayer;        public function TimeView(config:TimeViewConfig, player:Flowplayer) {            _config = config;            _player = player;            createTimeText();            createDurationText();                       duration = 0;            time = 0;        }        private function get borderRadius():Number {            return _config.borderRadius >= 0 ? _config.borderRadius : Math.floor(height / _config.heightRatio / 2);        }        override public function get name():String {            return "time";        }				override public function configure(config:Object):void {            _config = config as TimeViewConfig;			_timeText.textColor = _config.timeColor;			_timeText.alpha = _config.timeAlpha;			if (_durationText) {				_durationText.textColor = _config.durationColor;				_durationText.alpha = _config.durationAlpha;			}            drawBackground();		}				override public function get enabled():Boolean { return true; }		override public function set enabled(value:Boolean):void {  };				public function set time(value:Number):void {			_timeText.text = TimeUtil.formatSeconds(value);			if (_durationText) {				_timeText.appendText(_config.separator);			}			onResize();						var textLength:Number = _timeText.text.length + (_durationText ? _durationText.text.length : 0);			if (textLength != _prevTextLength)				dispatchEvent(new Event(EVENT_REARRANGE));			_prevTextLength = textLength;		}				public function set duration(value:Number):void {			if (value == -1 && _durationText) {				removeChild(_durationText);				_durationText = null;				onResize();				dispatchEvent(new Event(EVENT_REARRANGE));				return;			} else if (value > 0 && ! _durationText) {				createDurationText();				onResize();				dispatchEvent(new Event(EVENT_REARRANGE));			}			if (_durationText) {				var text:String = TimeUtil.formatSeconds(value);				if (text == _durationText.text)					return;				resizeFont(text.length);				_durationText.text = text;			}		}				private function resizeFont(durationLength:int):void {			var fontSize:Number = durationLength > "00:00".length ? 9 : 11;						fontSize = _config.fontSize ? _config.fontSize : fontSize;						initField(_durationText, _config.durationColor, _config.durationAlpha, fontSize);			initField(_timeText, _config.timeColor, _config.timeAlpha, fontSize);			onResize();		}           		override protected function onResize():void {			// if no border radius, add some space before text            _timeText.x = borderRadius == 0 ? 2 : borderRadius / 2;// + Math.max(borderRadius, 2);		//	_timeText.x -= _config.borderWidth * 2;            Arrange.center(_timeText, 0, height - _config.borderWidth);            if (_durationText) {                _durationText.x = _timeText.x + _timeText.textWidth + 2;                Arrange.center(_durationText, 0, height - _config.borderWidth );            }            drawBackground();             }        private function drawBackground():void {            graphics.clear();			var bgWidth:Number = _timeText.x + _timeText.textWidth;			if ( _durationText )				bgWidth = _durationText.x + _durationText.textWidth	;						// if no border radius, add some space before & after text			bgWidth += borderRadius == 0 ? 6 : borderRadius / 2;				_width =   bgWidth + x/2;			            if (_config.heightRatio == 0) return;            if (_config.borderWidth > 0 && _config.borderAlpha > 0 ) {				_width += _config.borderWidth * 2;                graphics.lineStyle(_config.borderWidth, _config.borderColor, _config.borderAlpha); // thinkness, color, alpha            }			graphics.beginFill(0x0000ff, 1);            		//	graphics.drawRect(0, 0, width, height);			            graphics.beginFill(_config.backgroundColor, _config.backgroundColor >= 0 ? _config.backgroundAlpha : 0);			            //var bgWidth:Number = (_durationText ? (_durationText.x + _durationText.textWidth) : (_timeText.x + _timeText.textWidth)) + borderRadius;						            var bgHeight:Number = height;// * _config.heightRatio;						            graphics.drawRoundRect(0 , height/2 - bgHeight/2, width, bgHeight, borderRadius, borderRadius);            graphics.endFill();            // reset the manged width value                    }		private function createDurationText():void {			_durationText = _player.createTextField();			initField(_durationText, _config.durationColor, _config.durationAlpha);			addChild(_durationText);		}		private function createTimeText():void {			_timeText = _player.createTextField();			initField(_timeText, _config.timeColor, _config.timeAlpha);			addChild(_timeText);		}		private function initField(field:TextField, color:Number, alpha:Number, size:Number = 13):void {			if (! field) return;			field.textColor = color;			field.selectable = false;			field.autoSize = TextFieldAutoSize.LEFT;			field.blendMode = BlendMode.LAYER;			field.alpha = alpha;			var format:TextFormat = field.defaultTextFormat;			format.size = size;			field.defaultTextFormat = format;		}	}}