package
{
	import flash.events.Event;
	
	public class BlockEvent extends Event
	{
		public static const BLOCK_SELECTED:String = 'BLOCK_SELECTED';
		public var block:Block;
		public function BlockEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}