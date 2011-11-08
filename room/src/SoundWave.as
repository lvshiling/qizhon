package {
    import flash.display.Sprite;
    import flash.display.Graphics;
    import flash.events.Event;
    import flash.media.Sound;
    import flash.media.SoundChannel;
    import flash.media.SoundMixer;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    import flash.text.TextField;

    public class SoundWave extends Sprite {

        public function SoundWave() {
            var snd:Sound = new Sound();
            var req:URLRequest = new URLRequest("喊麦.mp3");
            snd.load(req);
            
            var channel:SoundChannel;
            channel = snd.play();
            addEventListener(Event.ENTER_FRAME, onEnterFrame);
            channel.addEventListener(Event.SOUND_COMPLETE, onPlaybackComplete);
        }

        private function onEnterFrame(event:Event):void {
            var bytes:ByteArray = new ByteArray();
            const PLOT_HEIGHT:int = 200;
            const CHANNEL_LENGTH:int = 256;

            SoundMixer.computeSpectrum(bytes, false, 0);
            
            var g:Graphics = this.graphics;
            
            g.clear();
       
            g.lineStyle(0, 0x6600CC);
            g.beginFill(0x6600CC);
            g.moveTo(0, PLOT_HEIGHT);
            
            var n:Number = 0;
            
            for (var i:int = 0; i < CHANNEL_LENGTH; i++) {
                n = (bytes.readFloat() * PLOT_HEIGHT);
                g.lineTo(i * 2, PLOT_HEIGHT - n);
            }

            g.lineTo(CHANNEL_LENGTH * 2, PLOT_HEIGHT);
            g.endFill();
 
            g.lineStyle(0, 0xCC0066);
            g.beginFill(0xCC0066, 0.5);
            g.moveTo(CHANNEL_LENGTH * 2, PLOT_HEIGHT);
            
            for (i = CHANNEL_LENGTH; i > 0; i--) {
                n = (bytes.readFloat() * PLOT_HEIGHT);
                g.lineTo(i * 2, PLOT_HEIGHT - n);
            }
  
            g.lineTo(0, PLOT_HEIGHT);
            g.endFill();
        }
        
        private function onPlaybackComplete(event:Event):void {
            removeEventListener(Event.ENTER_FRAME, onEnterFrame);
        }
    }
}