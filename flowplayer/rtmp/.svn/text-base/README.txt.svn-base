Version history:

3.2.4
-----
- FMS smart seeking (in buffer seeking): http://blogs.adobe.com/actionscriptdocs/2010/06/flash_media_server_stream_reco.html
  There is a new clip property backBufferLength, that can be used to control the buffer size for backward seeking and rewind.
- p2p multicast support, added property p2pGroupSpec
- Added stream switching event handlers to be used with the switchStream api method.
Fixes:
- Fixes for #247, native switching on transition failures requires live stream check.
- Issue #327, onStart was not dispatched for mp3 streams
- Issue #338 don't set clip currentTime when dynamic stream switching.
- Issue #355, setup targeted options for Flash 10.1 to provide support for 10.0
- Issue #351, connectionArgs are not passed to RTMPT connections

3.2.3
-----
Fixes:
- Unnecessarily displays the "play again" button with live streams: http://flowplayer.org/forum/8/46963

3.2.2
-----
Fixes:
- Now reaches the end of the video when the server sends a NetStream.Play.Stop.
- Now reaches the end of the video when the server sends a little bit less stream than expected, using start:
- Fix for rtmpt connection arguments passing: http://flowplayer.org/forum/8/45714#post-45714
- Moved parallel connection mechanism to core.

3.2.1
-----
Fixes:
- Does not report connection errors unnecessarily any more

3.2.0
-----
- changes related to bandwidth detection compatibility

3.1.4
-----
Fixes:
- Now resets the bufferStart value to zero when replaying a clip. Because it failed to reset it the buffer bar and
  progress bar were not drawn correctly when replaying.
- Now supports rtmpe/rtmpte parallel connecting attempts

3.1.3
-----
- Supports connection redirects as described here: http://www.wowzamedia.com/forums/showthread.php?t=6206#2
- New configuration option 'connectionArgs' that accepts an array of arguments to be passed to NetConnection.connect().
  This is needed for example with the Internap CDN.
- Now correctly recognizes fully qualified RTMP clip urls (no need to specify netConnectionUrl separately)

3.1.2
-----
- compatible with the new ConnectionProvider and URLResolver API
- Starts RTMP and RTMPT connection attempts in parallel. The one who succeeds first will be used and the other one is discarded.
  The approach is described here: http://kb2.adobe.com/cps/185/tn_18537.html#http_improv
- New configuration option proxyType. Default value is "best". See http://livedocs.adobe.com/flash/9.0/ActionScriptLangRefV3/flash/net/NetConnection.html#proxyType

3.1.1
-----
- Possibility to query stream durations from the server. New config option 'durationFunc' for this.

3.1.0
------
- Subscribing connection establishment for Akamai and Limelight. Enabled by setting subscribe: true in the plugin config.
- Added objectEncoding config option, needed to connect to FMS2

3.0.2
-----
- the progress bar now moves to the latest seek position
- bufferbar now shows how much data has been buffered ahead of the current playhead position
- compatible with flowplayer 3.0.3 provider API
- made it possible to specify a full rtmp URL in clip's url. In this case the netConnectionUrl variable is not needed in the provider config.

3.0.1
-----
- dispatches the LOAD event when initialized (needed for flowplayer 3.0.2 compatibility)

3.0.0
---
- 3.0.0 final

beta3
-----
- compatibility with core rc4

beta1
-----
- First public beta release
