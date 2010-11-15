﻿package mx.core
{
	import flash.display.FocusDirection;
	import flash.html.HTMLLoader;
	import mx.managers.IFocusManagerComplexComponent;
	import mx.utils.NameUtil;

	/**
	 *  FlexHTMLLoader is a subclass of the Player's HTMLLoader class used by the
	 */
	public class FlexHTMLLoader extends HTMLLoader implements IFocusManagerComplexComponent
	{
		/**
		 *  @private
		 */
		private var _focusEnabled : Boolean;
		/**
		 *  @private
		 */
		private var _mouseFocusEnabled : Boolean;

		/**
		 *  A flag that indicates whether the component can receive focus when selected.
		 */
		public function get focusEnabled () : Boolean;
		/**
		 *  @private
		 */
		public function set focusEnabled (value:Boolean) : void;
		/**
		 *  Whether the component can receive focus when clicked on.
		 */
		public function get mouseFocusEnabled () : Boolean;
		/**
		 *  @private
		 */
		public function set mouseFocusEnabled (value:Boolean) : void;

		/**
		 *  Constructor.
		 */
		public function FlexHTMLLoader ();
		/**
		 *  Called by the FocusManager when the component receives focus.
		 */
		public function setFocus () : void;
		/**
		 *  Called by the FocusManager when the component receives focus.
		 */
		public function drawFocus (isFocused:Boolean) : void;
		/**
		 *  Called by the FocusManager when the component receives focus.
		 */
		public function assignFocus (direction:String) : void;
		/**
		 *  Returns a string indicating the location of this object
		 */
		public function toString () : String;
	}
}