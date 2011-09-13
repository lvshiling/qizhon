package effect.love 
{
	/**
	 * ...
	 * @author Stefan
	 */
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.renderers.PixelRenderer;

	import flash.display.Sprite;
	import flash.filters.BlurFilter;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Rectangle;
	public class WordFireWork extends Sprite
	{
		private var emitter:Emitter2D;
		
		public function WordFireWork() 
		{
			emitter = new WordEmitter2D;

			var renderer:PixelRenderer = new PixelRenderer( new Rectangle( 0, 0, 500, 300 ) );
			renderer.addFilter( new BlurFilter( 2, 2, 1 ) );
			renderer.addFilter( new ColorMatrixFilter( [ 1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0.96,0 ] ) );
			renderer.addEmitter( emitter );
			addChild( renderer );
			emitter.x = 250;
			emitter.y = 300;
			emitter.start( );
		}
		
	}

}