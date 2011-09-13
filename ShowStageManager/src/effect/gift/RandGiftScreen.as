package effect.gift 
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import org.flintparticles.common.emitters.Emitter;
	import org.flintparticles.twoD.renderers.BitmapRenderer;
	import org.flintparticles.common.initializers.SharedImage;
	import flash.display.Bitmap;
	
	/**
	 * ...
	 * @author Stefan
	 */
	public class RandGiftScreen extends Sprite 
	{
		private var stageWin:StageWin;
		private var emitter:Emitter;
		private var render:BitmapRenderer;
		private var emitterArray:Array = [];
		public static var W:uint = 600;
		public static var H:uint = 600;
		public function RandGiftScreen(win:StageWin, giftBmd:BitmapData, points:Array) 
		{
			stageWin = win;
			render = new BitmapRenderer(new Rectangle(0, 0, W, H));
			init(giftBmd, points);
			stageWin.addChild(this);
		}
		public function init(gift:BitmapData, points:Array):void
		{
			emitter = new GiftEmitter2D(render, gift);
			addChild(render);
			emitterArray.push(emitter);
		}
		public function action():void
		{
			for each (var em:Emitter in emitterArray)
			{
				em.start();
			}
		}
	}

}