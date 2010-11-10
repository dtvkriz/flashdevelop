﻿package mx.managers
{
	import flash.display.DisplayObject;
	import mx.core.IFlexDisplayObject;
	import mx.core.Singleton;

	/**
	 *  The PopUpManager singleton class creates new top-level windows and
	 */
	public class PopUpManager
	{
		/**
		 *  @private
		 */
		private static var implClassDependency : PopUpManagerImpl;
		/**
		 *  @private
		 */
		private static var _impl : IPopUpManager;

		/**
		 *  @private
		 */
		private static function get impl () : IPopUpManager;

		/**
		 *  Creates a top-level window and places it above other windows in the
		 */
		public static function createPopUp (parent:DisplayObject, className:Class, modal:Boolean = false, childList:String = null) : IFlexDisplayObject;
		/**
		 *  Pops up a top-level window.
		 */
		public static function addPopUp (window:IFlexDisplayObject, parent:DisplayObject, modal:Boolean = false, childList:String = null) : void;
		/**
		 *  Centers a popup window over whatever window was used in the call 
		 */
		public static function centerPopUp (popUp:IFlexDisplayObject) : void;
		/**
		 *  Removes a popup window popped up by 
		 */
		public static function removePopUp (popUp:IFlexDisplayObject) : void;
		/**
		 *  Makes sure a popup window is higher than other objects in its child list
		 */
		public static function bringToFront (popUp:IFlexDisplayObject) : void;
	}
}