/***************************************************************************************************
 * Copyright (C) 2007 - 2010  : Rivello Multimedia Consulting
 * For more information email : presentations2010@RivelloMultimediaConsulting.com
 * For more information see   : http://www.RivelloMultimediaConsulting.com
 * 
 * This file and/or its constituents are licensed under the terms of the MIT license, 
 * which is included in the License.html file at the root directory of this SDK.
 ***************************************************************************************************/

//Marks the right margin of code *******************************************************************
package com.rmc.projects.pbflyergame.screens
{
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import com.pblabs.engine.PBE;
	import com.pblabs.screens.BaseScreen;
	import com.rmc.projects.pbflyergame.PBFlyerGame;
	
	
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
	public class GameScreen extends BaseScreen
	{		
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * 
		 */
		public function GameScreen ()
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
		
		
		//--------------------------------------
		//  Events
		//--------------------------------------		
		//Event Handlers
		/**
		 * Handles the event: SHOW
		 * 
		 */
		override public function onShow () : void 
		{				
			(PBE.mainClass as PBFlyerGame).restartGame();
		}
		
		
		/**
		 * Handles the event: HIDE
		 * 
		 */
		override public function onHide () : void 
		{				
			
		}
		
	}
}