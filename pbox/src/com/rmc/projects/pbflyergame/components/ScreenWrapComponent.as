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
	import com.pblabs.engine.PBE;
	import com.pblabs.engine.components.TickedComponent;
	import com.pblabs.engine.core.ITickedObject;
	import com.pblabs.engine.entity.PropertyReference;
	import com.rmc.utils.pbe.FlyerGameHelper;
	
	import flash.geom.Point;
	
	
	//--------------------------------------
	//  Class
	//--------------------------------------
	/**
	 * <p>CLASS   : Wrap the owner entity around the screen bounds (e.g. move off the left edge = arrive on the right)</p>
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
	public class ScreenWrapComponent extends TickedComponent implements ITickedObject
	{		
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC CONSTANTS
		/**
		 * Name of Component
		 */
		public static const NAME : String	 = "ScreenTrapComponent";
		
		//PRIVATE
		/**
		 * Property Reference: The position of the entity
		 */
		private var _position_propertyreference : PropertyReference;
		
		/**
		 * Property Reference: The size of the entity
		 */
		private var _size_propertyreference : PropertyReference;
		
		/**
		 * The position
		 */
		private var _position_point : Point;
		
		/**
		 * The size position
		 */
		private var _size_point : Point;
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		public function ScreenWrapComponent ()
		{
			//SUPER
			super (); 
			
			//VARIABLES
			
			//PROPERTIES
			_position_propertyreference 	= new PropertyReference (FlyerGameHelper.SPATIAL_POSITION);
			_size_propertyreference 		= new PropertyReference (FlyerGameHelper.SPATIAL_SIZE);
			
			//METHODS
			
			//EVENTS
			
			
		}
		
		//--------------------------------------
		//  Events
		//--------------------------------------		
		//Event Handlers
		/**
		 * Handles the event: 'Tick' 
		 * 
		 * @return void
		 */
		override public function onTick (aDeltaTime_num : Number ) :void
		{
			//	CHECK PROPERTIES
			_position_point = owner.getProperty(_position_propertyreference);
			_size_point 	= owner.getProperty(_size_propertyreference);
			
			//	CHECK BOUNDS: HORIZONTAL
			if (_position_point.x - _size_point.x /2 > PBE.scene.sceneViewBounds.right) {
				_position_point.x = PBE.scene.sceneViewBounds.left - _size_point.x / 2;
			} else if (_position_point.x + _size_point.x /2 < PBE.scene.sceneViewBounds.left) {
				_position_point.x = PBE.scene.sceneViewBounds.right + _size_point.x / 2;
			}
			
			//	CHECK BOUNDS: VERTICAL
			if (_position_point.y - _size_point.y /2 > PBE.scene.sceneViewBounds.bottom) {
				_position_point.y = PBE.scene.sceneViewBounds.top - _size_point.y / 2;
			} else if (_position_point.y + _size_point.y /2 < PBE.scene.sceneViewBounds.top) {
				_position_point.y = PBE.scene.sceneViewBounds.bottom - _size_point.y / 2;
			}
			
			//	UPDATE PROPERTY REFERENCE(S)
			owner.setProperty(_position_propertyreference, _position_point);
			
		}
		
		
	}
}

