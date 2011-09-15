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
	import com.pblabs.engine.components.TickedComponent;
	import com.pblabs.engine.core.ITickedObject;
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
	public class FaceForwardComponent extends TickedComponent implements ITickedObject
	{		
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC CONSTANTS
		/**
		 * Name of Component
		 */
		public static const NAME : String	 = "FaceForwardComponent";
		
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
		 * The previous position
		 */
		private var _positionPrevious_point : Point;

		/**
		 * The current position
		 */
		private var _positionCurrent_point : Point;
		
		/**
		 * The current rotation
		 */
		private var _rotationCurrent_num: Number;
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * ...
		 * 
		 * <span class="hide">Any hidden comments go here.</span>
		 *
		 */
		public function FaceForwardComponent ()
		{
			//SUPER
			super (); 
			
			//VARIABLES
			
			//PROPERTIES
			_position_propertyreference = new PropertyReference (FlyerGameHelper.SPATIAL_POSITION);
			_rotation_propertyreference = new PropertyReference (FlyerGameHelper.SPATIAL_ROTATION);
			_positionPrevious_point = new Point (0,1000); //FAKE SO FACES UP AT START
			
			//METHODS
			
			//EVENTS
			
			
		}

		//--------------------------------------
		//  Events
		//--------------------------------------		
		//Event Handlers
		/**
		 * Handles the event: 'Tick' to update facing direction
		 * 
		 * @return void
		 */
		override public function onTick (aDeltaTime_num : Number ) :void
		{
			// Copy the owner entity's position into a local Point structure
			_positionCurrent_point 	= owner.getProperty(_position_propertyreference);
			_rotationCurrent_num 	= owner.getProperty(_rotation_propertyreference);
			
			var positionDeltaX_num : Number = _positionCurrent_point.x - _positionPrevious_point.x;
			var positionDeltaY_num : Number = _positionCurrent_point.y - _positionPrevious_point.y;

			if (positionDeltaX_num < 0) {
				//	MOVING LEFT
				_rotationCurrent_num = -90;
			} else if (positionDeltaX_num > 0) {
				//	MOVING RIGHT
				_rotationCurrent_num = 90;
			}
			
			if (positionDeltaY_num < 0) {
				//	MOVING UP
				_rotationCurrent_num = 0;
			} else if (positionDeltaY_num > 0) {
				//	MOVING DOWN
				_rotationCurrent_num = 180;
			}


			//	UPDATE PROPERTY REFERENCE(S)
			owner.setProperty(_rotation_propertyreference, _rotationCurrent_num);

			//	UPDATE PREVIOUS POSITION
			_positionPrevious_point = _positionCurrent_point;
		}
		
		
	}
}

