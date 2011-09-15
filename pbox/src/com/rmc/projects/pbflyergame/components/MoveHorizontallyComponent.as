/***************************************************************************************************
 * Copyright (C) 2007 - 2010  : Rivello Multimedia Consulting
 * For more information email : presentations2010@RivelloMultimediaConsulting.com
 * For more information see   : http://www.RivelloMultimediaConsulting.com
 * 
 * This file and/or its constituents are licensed under the terms of the MIT license, 
 * which is included in the License.html file at the root directory of this SDK.
 ***************************************************************************************************/

//Marks the right margin of code *******************************************************************
package com.rmc.projects.pbflyergame.components
{
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import com.pblabs.engine.components.ThinkingComponent;
	import com.pblabs.engine.components.TickedComponent;
	import com.pblabs.engine.entity.PropertyReference;
	import com.rmc.utils.pbe.FlyerGameHelper;
	
	import flash.geom.Point;
	
	
	//--------------------------------------
	//  Class
	//--------------------------------------
	/**
	 * <p>CLASS   : The 'brain' of the obstacles (blimps and biplanes)
	 * 				This controls the movement and 'thinking'.</p>
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
	public class MoveHorizontallyComponent extends TickedComponent
	{		
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC CONSTANTS
		/**
		 * Name of Component
		 */
		public static const NAME : String	 = "MoveHorizontallyComponent";
		
		//PRIVATE
		/**
		 * Property Reference: The position of the entity
		 */
		public var _position_propertyreference:PropertyReference;
		
		/**
		 * Property Reference: The rotation of the entity
		 */
		public var _rotation_propertyreference:PropertyReference;
		
		/**
		 * The current position
		 */
		private var _position_point:Point;
		
		/**
		 * Fun Property (Experiment with new values): Horizontal direction (Try -1 or 1)
		 */
		public var horizontalDirection_int:int = 1; 
		
		/**
		 * Fun Property (Experiment with new values): Horizontal speed (Try 1 to 100)
		 */
		public var horizontalSpeed_num:int = 3; 
		
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * Setup repeating 'thinking'
		 * 
		 */
		public function MoveHorizontallyComponent () : void 
		{
			//SUPER
			super (); 
			
			//PROPERTIES
			_position_propertyreference = new PropertyReference (FlyerGameHelper.SPATIAL_POSITION);
			
			//METHODS
			
		}
		
		//--------------------------------------
		//  Methods
		//--------------------------------------		

		
		//--------------------------------------
		//  Events
		//--------------------------------------		
		//Event Handlers
		/**
		 * Handles the event: Think about position and movement
		 * 
		 * @return void
		 */
		override public function onTick (aDeltaTime_num : Number) :void
		{
			// Copy the owner entity's position into a local Point structure
			_position_point = owner.getProperty(_position_propertyreference);
			var r : * = owner.getProperty(_rotation_propertyreference);
			
			_position_point.x += horizontalDirection_int * horizontalSpeed_num/2;

			// Set the spatial component's position based on our new value
			owner.setProperty(_position_propertyreference, _position_point);

		}
		
		
	}
}

	