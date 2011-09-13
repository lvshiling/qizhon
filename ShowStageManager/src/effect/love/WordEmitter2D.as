package effect.love 
{
	import org.flintparticles.common.actions.Age;
	import org.flintparticles.common.actions.Fade;
	import org.flintparticles.common.counters.Blast;
	import org.flintparticles.common.easing.Quadratic;
	import org.flintparticles.common.events.EmitterEvent;
	import org.flintparticles.common.initializers.ColorInit;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.twoD.actions.Accelerate;
	import org.flintparticles.twoD.actions.LinearDrag;
	import org.flintparticles.twoD.actions.Move;
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.initializers.Position;
	import org.flintparticles.twoD.initializers.Velocity;
	import org.flintparticles.twoD.zones.BitmapDataZone;
	import org.flintparticles.twoD.zones.DiscZone;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Stefan
	 */
	public class WordEmitter2D  extends Emitter2D
	{
		
		public function WordEmitter2D() 
		{
			counter = new Blast( 4000 );
			
			addInitializer( new ColorInit( 0xFFFF0000, 0xFFFF0000 ) );
			addInitializer( new Lifetime( 6 ) );
			addInitializer( new Position( new DiscZone( new Point( 0, 0 ), 10 ) ) );
			addInitializer( new Velocity( new BitmapDataZone( new Logo( 265, 80 ), -132, -300 ) ) );
			
			addAction( new Age( Quadratic.easeIn ) );
			addAction( new Fade( 1.0, 0 ) );
			addAction( new Move() );
			addAction( new LinearDrag( 0.5 ) );
			addAction( new Accelerate( 0, 70 ) );
			addEventListener( EmitterEvent.EMITTER_EMPTY, restart, false, 0, true );
		}
		public function restart( ev:EmitterEvent ):void
		{
			Emitter2D( ev.target ).start();
		}
		
	}

}