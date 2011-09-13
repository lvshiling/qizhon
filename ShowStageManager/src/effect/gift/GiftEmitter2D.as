package effect.gift 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import org.flintparticles.common.actions.Age;
	import org.flintparticles.common.counters.Steady;
	import org.flintparticles.common.initializers.ImageClass;
	import org.flintparticles.twoD.actions.Move;
	import org.flintparticles.twoD.actions.TweenPosition;
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.initializers.Position;
	import org.flintparticles.common.initializers.SharedImage;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.twoD.initializers.Velocity;
	import flash.display.DisplayObject;
	import org.flintparticles.twoD.renderers.BitmapRenderer;
	import org.flintparticles.twoD.zones.RectangleZone;
	import flash.display.Bitmap;
	import org.flintparticles.common.events.EmitterEvent;
	import org.flintparticles.common.events.ParticleEvent;
	
	/**
	 * ...
	 * @author Stefan
	 */
	public class GiftEmitter2D extends Emitter2D 
	{
		
		public function GiftEmitter2D(renderer:BitmapRenderer, gift:BitmapData) 
		{
			counter = new Steady(1);
			addInitializer(new Lifetime( 2, 4 ) );
			addInitializer(new Position(new RectangleZone(0,0,600,600)));
			addInitializer(new SharedImage(new Bitmap(gift, 'auto', true)));
			//addInitializer(new Velocity(new RectangleZone(0, 0, 100, 100)));
			addAction(new Age());
			addAction(new Move());
			//addAction(new TweenPosition(0, 0, p.x, p.y));
			//addAction(new Explosion());
			//addAction(new MouseGravity(100,renderer,70));
			//addAction(new RotateToDirection());
			//addActivity(new FollowMouse(renderer));
			renderer.addEmitter(this);
			
			addEventListener( EmitterEvent.COUNTER_COMPLETE, onComplete, false, 0, true );
		    addEventListener( ParticleEvent.PARTICLE_DEAD, onParticleDead);
		}
		private function onComplete(event:EmitterEvent):void
		{
			//this.stop();
			trace("....xxx")
			//this.killAllParticles();
		}
		private function onParticleDead(event:ParticleEvent):void
		{
			//this.stop();
			trace("....dead")
			//this.killAllParticles();
		}
	}

}