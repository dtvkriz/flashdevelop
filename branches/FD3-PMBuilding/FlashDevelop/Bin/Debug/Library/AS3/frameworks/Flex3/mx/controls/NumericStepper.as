﻿package mx.controls
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.text.TextLineMetrics;
	import flash.ui.Keyboard;
	import mx.controls.listClasses.BaseListData;
	import mx.controls.listClasses.IDropInListItemRenderer;
	import mx.controls.listClasses.IListItemRenderer;
	import mx.core.FlexVersion;
	import mx.core.IDataRenderer;
	import mx.core.IFlexDisplayObject;
	import mx.core.IIMESupport;
	import mx.core.UIComponent;
	import mx.core.UITextField;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.events.NumericStepperEvent;
	import mx.managers.IFocusManager;
	import mx.managers.IFocusManagerComponent;
	import mx.styles.StyleProxy;

	/**
	 *  Dispatched when the value of the NumericStepper control changes
	 */
	[Event(name="change", type="mx.events.NumericStepperEvent")] 
	/**
	 *  Dispatched when the <code>data</code> property changes.
	 */
	[Event(name="dataChange", type="mx.events.FlexEvent")] 
	/**
	 *  Name of the class to use as the default skin for the down arrow.
	 */
	[Style(name="downArrowSkin", type="Class", inherit="no", states="up, over, down, disabled")] 
	/**
	 *  Name of the class to use as the skin for the Down arrow
	 */
	[Style(name="downArrowDisabledSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the class to use as the skin for the Down arrow
	 */
	[Style(name="downArrowDownSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the class to use as the skin for the Down arrow
	 */
	[Style(name="downArrowOverSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the class to use as the skin for the Down arrow
	 */
	[Style(name="downArrowUpSkin", type="Class", inherit="no")] 
	/**
	 *  Alphas used for the highlight fill of controls.
	 */
	[Style(name="highlightAlphas", type="Array", arrayType="Number", inherit="no")] 
	/**
	 *  Name of the class to use as the default skin for the up arrow.
	 */
	[Style(name="upArrowSkin", type="Class", inherit="no", states="up, over, down, disabled")] 
	/**
	 *  Name of the class to use as the skin for the Up arrow
	 */
	[Style(name="upArrowDisabledSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the class to use as the skin for the Up arrow
	 */
	[Style(name="upArrowDownSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the class to use as the skin for the Up arrow
	 */
	[Style(name="upArrowOverSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the class to use as the skin for the Up arrow
	 */
	[Style(name="upArrowUpSkin", type="Class", inherit="no")] 

	/**
	 *  The NumericStepper control lets the user select
	 */
	public class NumericStepper extends UIComponent implements IDataRenderer
	{
		/**
		 *  @private
		 */
		local var inputField : TextInput;
		/**
		 *  @private
		 */
		local var nextButton : Button;
		/**
		 *  @private
		 */
		local var prevButton : Button;
		/**
		 *  @private
		 */
		private var valueSet : Boolean;
		/**
		 *  @private
		 */
		private var enabledChanged : Boolean;
		/**
		 *  @private
		 */
		private var _tabIndex : int;
		/**
		 *  @private
		 */
		private var tabIndexChanged : Boolean;
		/**
		 *  @private
		 */
		private var _data : Object;
		private static var _downArrowStyleFilters : Object;
		/**
		 *  @private
		 */
		private var _imeMode : String;
		private static var _inputFieldStyleFilters : Object;
		/**
		 *  @private
		 */
		private var _listData : BaseListData;
		/**
		 *  @private
		 */
		private var _maxChars : int;
		/**
		 *  @private
		 */
		private var maxCharsChanged : Boolean;
		/**
		 *  @private
		 */
		private var _maximum : Number;
		/**
		 *  @private
		 */
		private var _minimum : Number;
		/**
		 *  @private
		 */
		private var _nextValue : Number;
		/**
		 *  @private
		 */
		private var _previousValue : Number;
		/**
		 *  @private
		 */
		private var _stepSize : Number;
		private static var _upArrowStyleFilters : Object;
		/**
		 *  @private
		 */
		private var _value : Number;
		/**
		 *  @private
		 */
		private var lastValue : Number;
		/**
		 *  @private
		 */
		private var proposedValue : Number;
		/**
		 *  @private
		 */
		private var valueChanged : Boolean;

		/**
		 *  @private
		 */
		public function get baselinePosition () : Number;
		/**
		 *  @private
		 */
		public function set enabled (value:Boolean) : void;
		/**
		 *  @private
		 */
		public function get enabled () : Boolean;
		/**
		 *  @private
		 */
		public function get tabIndex () : int;
		/**
		 *  @private
		 */
		public function set tabIndex (value:int) : void;
		/**
		 *  The <code>data</code> property lets you pass a value to the component
		 */
		public function get data () : Object;
		/**
		 *  @private
		 */
		public function set data (value:Object) : void;
		/**
		 *  Set of styles to pass from the NumericStepper to the down arrow.
		 */
		protected function get downArrowStyleFilters () : Object;
		/**
		 *  Specifies the IME (Input Method Editor) mode.
		 */
		public function get imeMode () : String;
		/**
		 *  @private
		 */
		public function set imeMode (value:String) : void;
		/**
		 *  Set of styles to pass from the NumericStepper to the input field.
		 */
		protected function get inputFieldStyleFilters () : Object;
		/**
		 *  When a component is used as a drop-in item renderer or drop-in
		 */
		public function get listData () : BaseListData;
		/**
		 *  @private
		 */
		public function set listData (value:BaseListData) : void;
		/**
		 *  The maximum number of characters that can be entered in the field.
		 */
		public function get maxChars () : int;
		public function set maxChars (value:int) : void;
		/**
		 *  Maximum value of the NumericStepper.
		 */
		public function get maximum () : Number;
		public function set maximum (value:Number) : void;
		/**
		 *  Minimum value of the NumericStepper.
		 */
		public function get minimum () : Number;
		public function set minimum (value:Number) : void;
		/**
		 *  The value that is one step larger than the current <code>value</code>
		 */
		public function get nextValue () : Number;
		/**
		 *  The value that is one step smaller than the current <code>value</code>
		 */
		public function get previousValue () : Number;
		/**
		 *  Non-zero unit of change between values.
		 */
		public function get stepSize () : Number;
		/**
		 *  @private
		 */
		public function set stepSize (value:Number) : void;
		/**
		 *  Set of styles to pass from the NumericStepper to the up arrow.
		 */
		protected function get upArrowStyleFilters () : Object;
		/**
		 *  Current value displayed in the text area of the NumericStepper control.
		 */
		public function get value () : Number;
		/**
		 *  @private
		 */
		public function set value (value:Number) : void;

		/**
		 *  Constructor.
		 */
		public function NumericStepper ();
		/**
		 *  @private
		 */
		protected function createChildren () : void;
		/**
		 *  @private
		 */
		protected function commitProperties () : void;
		/**
		 *  @private
		 */
		protected function measure () : void;
		/**
		 *  @private
		 */
		protected function updateDisplayList (unscaledWidth:Number, unscaledHeight:Number) : void;
		/**
		 *  @private
		 */
		public function setFocus () : void;
		/**
		 *  @private
		 */
		protected function isOurFocus (target:DisplayObject) : Boolean;
		/**
		 *  @private
		 */
		private function checkRange (v:Number) : Boolean;
		/**
		 *  @private
		 */
		private function checkValidValue (value:Number) : Number;
		/**
		 *  @private
		 */
		private function setValue (value:Number, sendEvent:Boolean = true, trigger:Event = null) : void;
		/**
		 *  @private
		 */
		private function takeValueFromTextField (trigger:Event = null) : void;
		/**
		 *  @private
		 */
		private function buttonPress (button:Button, trigger:Event = null) : void;
		/**
		 *  @private
		 */
		protected function focusInHandler (event:FocusEvent) : void;
		/**
		 *  @private
		 */
		protected function focusOutHandler (event:FocusEvent) : void;
		/**
		 *  @private
		 */
		private function buttonDownHandler (event:FlexEvent) : void;
		/**
		 *  @private
		 */
		private function buttonClickHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function inputField_focusInHandler (event:FocusEvent) : void;
		/**
		 *  @private
		 */
		private function inputField_focusOutHandler (event:FocusEvent) : void;
		/**
		 *  @private
		 */
		private function inputField_keyDownHandler (event:KeyboardEvent) : void;
		/**
		 *  @private
		 */
		private function inputField_changeHandler (event:Event) : void;
	}
}