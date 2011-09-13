package sina.ui.events
{
	import flash.events.Event;

	/**
	 * @author     mole<mole1230@gmail.com>
	 * @version    $Id: BuiEvent.as 7 2010-10-19 10:38:30Z mole1230 $
	 */
	public class BuiEvent extends Event
	{
		public static const POSITION_CHANGE:String = "positionChange";
		public static const BUTTON_REPEAT:String = "buttonRepeat";
		public static const SIZE_CHANGE:String = "sizeChange";
		public static const VISIABLE_CHANGE:String = "visiableChange";
		public static const SELECTED_CHANGE:String = "selectedChange";
		public static const LABEL_CHANGE:String = "labelChange";
		public static const ENTER:String = "enter";
		
		public var data:Object;
		
		public function BuiEvent(type:String, bubbles:Boolean  = false, cancelable:Boolean  = false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			var e:* = new BuiEvent(this.type, this.bubbles, this.cancelable);
			e.data = this.data;
			
			return e;
		}
		
		override public function toString() : String
		{
			return this.formatToString('BuiEvent', 'type', 'bubbles', 'cancelable');
		}
	}
}