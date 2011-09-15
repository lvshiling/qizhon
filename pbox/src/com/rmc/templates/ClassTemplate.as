/***************************************************************************************************
 * Copyright (C) 2007 - 2010  : Rivello Multimedia Consulting
 * For more information email : presentations2010@RivelloMultimediaConsulting.com
 * For more information see   : http://www.RivelloMultimediaConsulting.com
 * 
 * This file and/or its constituents are licensed under the terms of the MIT license, 
 * which is included in the License.html file at the root directory of this SDK.
 ***************************************************************************************************/

//Marks the right margin of code *******************************************************************
package com.rmc.templates
{
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import flash.display.Sprite;
	import flash.events.Event;
	
	
	//--------------------------------------
	//  Class
	//--------------------------------------
	/**
	 * <p>CLASS   : </p>
	 * 
	 * <p>DATE    : May 02, 2010</p>
	 * <p>AUTHOR  : Samuel Asher Rivello</p>
	 * <p>CONTACT : presentations2010@RivelloMultimediaConsulting.com</p>
	 * 
	 * @example Here is a code example.  
	 * <listing version="3.0" >
	 * 	//Code example goes here.
	 * </listing>
	 *
	 * <span class="hide">Any hidden comments go here.</span>
	 *
	 */
	public class ClassTemplate
	{		
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC GETTER/SETTERS
		/**
		 * ...
		 * 
		 */		
		public function get sample () 					: String 	{ 	return _sample_str; 		}
		public function set sample (aValue : String) 	: void 		{ 	_sample_str = aValue; 		}
		private var _sample_str : String;
		
		
		//PUBLIC CONST
		/**
		 * ...
		 * 
		 * @default PUBLIC_STATIC_CONSTANT 
		 */
		public static const PUBLIC_STATIC_CONSTANT : String = "PUBLIC_STATIC_CONSTANT";
		
		
		//PRIVATE
		/**
		 * ... 
		 * 
		 */
		private var _sample2_str : String;		
		
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * ...
		 * 
		 * <span class="hide">Any hidden comments go here.</span>
		 *
		 * @param param1 Describe param1 here.
		 */
		public function ClassTemplate ()
		{
			//SUPER
			super (); 
			
			//VARIABLES
			
			//PROPERTIES
			
			//METHODS
			
			//EVENTS
			
			
		}
		
		//--------------------------------------
		//  Methods
		//--------------------------------------		
		//PUBLIC	
		/**
		 * ...
		 * 
		 * @param param1 Describe param1 here.
		 * 
		 * @return void
		 */
		public function sampleMethod (aArgument_str : String) : void 
		{
			_sampleMethod2 (aArgument_str);
		}
		
		
		//PRIVATE	
		/**
		 * ...
		 * 
		 * @param param1 Describe param1 here.
		 * 
		 * @return void
		 */
		private function _sampleMethod2 (aArgument_str : String) : void 
		{
			_dispatchSample ();	
		}
		
		
		//--------------------------------------
		//  Events
		//--------------------------------------		
		//Event Dispatchers
		/**
		 * Dispatches the event: Event.SAMPLE
		 *  
		 * @eventType flash.events.Event
		 */
		private function _dispatchSample () : void
		{
			//dispatchEvent ( new Event (Event.SAMPLE) );			
		}
		
		
		//Event Handlers
		/**
		 * Handles the event: Event.INIT
		 * 
		 */
		private function _onInit (aEvent : Event) : void 
		{				
			
		}
		
		
	}
}