package  {
//import org.flowplayer.rtmp.RTMPStreamProvider;
//import org.flowplayer.controls.Controls;
//    import org.flowplayer.shareembed.ShareEmbed;
//    import org.flowplayer.pseudostreaming.PseudoStreaming;
   
 import org.flowplayer.rtmp.RTMPStreamProvider;
 import org.flowplayer.controls.Controls;  
public class BuiltInConfig {
//    private var pseudo:org.flowplayer.rtmp.RTMPStreamProvider;
//    private var controls:org.flowplayer.controls.Controls;
//    private var share:org.flowplayer.shareembed.ShareEmbed;
//    private var pseudo:org.flowplayer.pseudostreaming.PseudoStreamProvider;

//    [Embed(source="../assets/play.png")]
//    public var PlayButton:Class;
//
//    [Embed(source="../assets/play.png")]
//    public var Logo:Class;

	private var rtmp:org.flowplayer.rtmp.RTMPStreamProvider;
    private var controls:org.flowplayer.controls.Controls;
	
	/*
    public static const config:Object = { 
       "plugins": {
//           "psuedo": {
//               "url": 'org.flowplayer.psuedostreaming.PseudoStreamProvider'
//           }
        "rtmp": {
            "url": 'org.flowplayer.rtmp.RTMPStreamProvider'
        },
        "controls": {
            "url": 'org.flowplayer.controls.Controls'
		}
//           viral: {
//               url: 'org.flowplayer.shareembed.ShareEmbed'
           }
       }
    }; 
	*/
	public static const config:Object = {
		plugins:{
			controls: {
				url: "org.flowplayer.controls.Controls"
			},
			rtmp: {
				url: "org.flowplayer.rtmp.RTMPStreamProvider",
				netConnectionUrl: 'rtmp://222.73.33.198/oflaDemo'
			}
		},
		play: {
			replayLabel: 'ÖØ²¥'
		}
    }
}
}