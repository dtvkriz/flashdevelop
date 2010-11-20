﻿package mx.controls
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import mx.core.Application;
	import mx.core.IFlexDisplayObject;
	import mx.core.IMXMLObject;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.events.ItemClickEvent;

	/**
	 *  Dispatched when the value of the selected RadioButton control in 
	 */
	[Event(name="change", type="flash.events.Event")] 
	/**
	 *  Dispatched when a user selects a RadioButton control in the group.
	 */
	[Event(name="itemClick", type="mx.events.ItemClickEvent")] 

	/**
	 *  The RadioButtonGroup control defines a group of RadioButton controls
	 */
	public class RadioButtonGroup extends EventDispatcher implements IMXMLObject
	{
		/**
		 *  @private
		 */
		private var document : IFlexDisplayObject;
		/**
		 *  @private
		 */
		private var radioButtons : Array;
		/**
		 *  @private
		 */
		private var indexNumber : int;
		/**
		 *  @private
		 */
		private var _labelPlacement : String;
		/**
		 *  @private
		 */
		private var _selectedValue : Object;
		/**
		 *  @private
		 */
		private var _selection : RadioButton;

		/**
		 *  Determines whether selection is allowed.
		 */
		public function get enabled () : Boolean;
		/**
		 *  @private
		 */
		public function set enabled (value:Boolean) : void;
		/**
		 *  Position of the RadioButton label relative to the RadioButton icon
		 */
		public function get labelPlacement () : String;
		/**
		 *  @private
		 */
		public function set labelPlacement (value:String) : void;
		/**
		 *  The number of RadioButtons that belong to this RadioButtonGroup.
		 */
		public function get numRadioButtons () : int;
		/**
		 *  The value of the <code>value</code> property of the selected
		 */
		public function get selectedValue () : Object;
		/**
		 *  @private.
		 */
		public function set selectedValue (value:Object) : void;
		/**
		 *  Contains a reference to the currently selected
		 */
		public function get selection () : RadioButton;
		/**
		 *  @private
		 */
		public function set selection (value:RadioButton) : void;

		/**
		 *  Constructor.
		 */
		public function RadioButtonGroup (document:IFlexDisplayObject = null);
		/**
		 *  Implementation of the <code>IMXMLObject.initialized()</code> method 
		 */
		public function initialized (document:Object, id:String) : void;
		/**
		 *  Returns the RadioButton control at the specified index.
		 */
		public function getRadioButtonAt (index:int) : RadioButton;
		/**
		 *  @private
		 */
		function addInstance (instance:RadioButton) : void;
		/**
		 *  @private
		 */
		function removeInstance (instance:RadioButton) : void;
		/**
		 *  @private
		 */
		private function getValue () : String;
		/**
		 *  @private
		 */
		function setSelection (value:RadioButton, fireChange:Boolean = true) : void;
		/**
		 *  @private
		 */
		private function changeSelection (index:int, fireChange:Boolean = true) : void;
		/**
		 *  @private
		 */
		private function radioButton_removedHandler (event:Event) : void;
	}
}