/*
 * Author: Thomas Dubois, <thomas _at_ flowplayer org>
 * This file is part of Flowplayer, http://flowplayer.org
 *
 * Copyright (c) 2011 Flowplayer Ltd
 *
 * Released under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 */
package org.flowplayer.ui.controllers {
    
	import org.flowplayer.view.Flowplayer;
	import org.flowplayer.view.AbstractSprite;
	import org.flowplayer.model.Clip;
	import org.flowplayer.model.ClipEvent;
	import org.flowplayer.model.Status;
		
	import org.flowplayer.ui.buttons.ConfigurableWidget;
	import org.flowplayer.ui.buttons.WidgetDecorator;
	
	import flash.utils.*;
	import flash.events.TimerEvent;

	import org.flowplayer.util.PropertyBinder;
	import org.flowplayer.util.Log;
	
	import flash.display.DisplayObjectContainer;
	

	public class AbstractWidgetController {

		protected var _config:Object;
		protected var _player:Flowplayer;
		protected var _controlbar:DisplayObjectContainer;
		
		protected var _widget:ConfigurableWidget;
		protected var _decoratedView:ConfigurableWidget;
		
		protected var log:Log = new Log(this);
		
		public function AbstractWidgetController() {
		}
		
		public function init(player:Flowplayer, controlbar:DisplayObjectContainer, defaultConfig:Object):ConfigurableWidget {
			_player 	= player;
			_controlbar = controlbar;
			_config 	= defaultConfig;
			
			addPlayerListeners();
			
			createWidget();
			initWidget();
			
			createDecorator();
			
			return _widget;
		}
		
		public function configure(config:Object):void {
			_config = config;
			_decoratedView.configure(_config);
		}
		
		public function get config():Object {
			return _config;
		}

		public function get view():ConfigurableWidget {
			return _decoratedView;
		}
		
		public function set decorator(decorator:WidgetDecorator):void {
			_decoratedView = decorator.init(_widget);
		}
		
		// this is what you should override 
		
		protected function createWidget():void {			
			throw new Error("You need to override createWidget");
		}
		
		protected function createDecorator():void {
			_decoratedView = _widget
		}
		
		public function get name():String {
			throw new Error("You need to override name accessor");
			return null;
		}
		
		public function get groupName():String {
			return null;
		}
		
		public function get defaults():Object {
			throw new Error("You need to override defaults accessor");
			return null;
		}

		protected function initWidget():void {
			_widget.name    = name;
		}
		
		protected function addPlayerListeners():void {
            _player.playlist.onConnect(onPlayStarted);
            _player.playlist.onBeforeBegin(onPlayStarted);
            _player.playlist.onBegin(onPlayStarted);
            _player.playlist.onMetaData(onPlayStarted);
            _player.playlist.onStart(onPlayStarted); // bug #120

            _player.playlist.onPause(onPlayPaused);
            _player.playlist.onResume(onPlayResumed);

            _player.playlist.onStop(onPlayStopped);
            _player.playlist.onBufferStop(onPlayStopped);
            _player.playlist.onFinish(onPlayStopped);
        }

		// This is some handy functions you can override to handle your buttons' state.

        protected function onPlayStarted(event:ClipEvent):void {

        }

        protected function onPlayPaused(event:ClipEvent):void {
           
        }
        
        protected function onPlayResumed(event:ClipEvent):void {
           
        }

		protected function onPlayStopped(event:ClipEvent):void {

        }

		
		
	}
}

