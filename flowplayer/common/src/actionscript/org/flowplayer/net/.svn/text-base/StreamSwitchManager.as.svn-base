/*
 * This file is part of Flowplayer, http://flowplayer.org
 *
 * By: Daniel Rossi <electroteque@gmail.com>, Anssi Piirainen <api@iki.fi> Flowplayer Oy
 * Copyright (c) 2009, 2010 Electroteque Multimedia, Flowplayer Oy
 *
 * Released under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 */
package org.flowplayer.net {

    import flash.net.NetStream;
    import flash.net.NetStreamPlayOptions;
    import flash.net.NetStreamPlayTransitions;

    import flash.events.NetStatusEvent;

    import org.flowplayer.model.ClipEvent;
    import org.flowplayer.view.Flowplayer;
    import org.flowplayer.util.Log;


    public class StreamSwitchManager {

        private var _netStream:NetStream;
        private var _streamSelectionManager:IStreamSelectionManager;
        private var _player:Flowplayer;
        private var _previousBitrateItem:BitrateItem;


        protected var log:Log = new Log(this);

        public function StreamSwitchManager(netStream:NetStream, streamSelectionManager:IStreamSelectionManager, player:Flowplayer) {
            _netStream = netStream;
            _streamSelectionManager = streamSelectionManager;
            _player = player;
        }

        public function get previousBitrateItem():BitrateItem {
            return _previousBitrateItem;
        }


        public function switchStream(bitrateItem:BitrateItem):void {
            _previousBitrateItem = _streamSelectionManager.currentBitrateItem;
            _streamSelectionManager.changeStreamNames(bitrateItem);

            //fixes for #279 now switches correctly when in a paused state for http streams
            //keep check here for rtmp and httpstreaming provider as play2 method is enabled for http streams
            if (_netStream && _netStream.hasOwnProperty("play2") && (_player.streamProvider.type == "rtmp" || _player.streamProvider.type == "httpstreaming")) {

                var netStreamPlayOptions:NetStreamPlayOptions = new NetStreamPlayOptions();
                if (_previousBitrateItem) {
                    netStreamPlayOptions.oldStreamName = _previousBitrateItem.url;
                    netStreamPlayOptions.transition = NetStreamPlayTransitions.SWITCH;
                } else {
                    netStreamPlayOptions.transition = NetStreamPlayTransitions.RESET;
                }
                netStreamPlayOptions.streamName = bitrateItem.url;

                log.debug("calling switchStream with dynamic stream switch support, stream name is " + netStreamPlayOptions.streamName);

                _player.switchStream(_player.currentClip, netStreamPlayOptions);
            } else {
                log.debug("calling switchStream, stream name is " + bitrateItem.url);
                _player.switchStream(_player.currentClip);
            }

        }
    }
}
