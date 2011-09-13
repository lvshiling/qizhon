package sina.ui.events 
{
	/**
	 * @author     mole<mole1230@gmail.com>
	 * @version    $Id: ItemEvent.as 7 2010-10-19 10:38:30Z mole1230 $
	 */
	public class ItemEvent
	{

		public static const DELETE:String = "delete";
		public static const DOWN:String = "down";
		public static const PRELOAD_FAILURE:String = "preload_failure";
		public static const PRELOAD_COMPLETE:String = "preload_complete";
		public static const SELECT_CHANGED:String = "select_changed";
		public static const UNSELECT_OTHERS:String = "unselect_others";
		public static const UPLOAD_SIZE_ERROR:String = "upload_size_error";
		public static const UPLOAD_PRELOAD_ERROR:String = "upload_preload_error";
		public static const UPLOAD_START:String = "upload_start";
		public static const UPLOAD_FAILURE:String = "upload_failure";
		public static const UPLOAD_SUCCESS:String = "upload_success";
		public static const UPLOAD_COMPLETE:String = "upload_complete";
		
		public function ItemEvent() 
		{	
		}
		
	}

}