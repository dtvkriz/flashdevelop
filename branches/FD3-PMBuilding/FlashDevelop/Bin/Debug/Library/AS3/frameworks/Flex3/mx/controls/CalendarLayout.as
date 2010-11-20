﻿package mx.controls
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextLineMetrics;
	import flash.ui.Keyboard;
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	import mx.core.IFlexDisplayObject;
	import mx.core.IFlexModuleFactory;
	import mx.core.IFontContextComponent;
	import mx.core.IUITextField;
	import mx.core.UIComponent;
	import mx.core.UITextField;
	import mx.core.mx_internal;
	import mx.events.CalendarLayoutChangeEvent;
	import mx.events.DateChooserEvent;
	import mx.events.DateChooserEventDetail;
	import mx.managers.IFocusManagerComponent;
	import mx.skins.halo.DateChooserIndicator;
	import mx.styles.ISimpleStyleClient;

	/**
	 *  Name of the skin for the <code>rollOverIndicator</code>.
	 */
	[Style(name="rollOverIndicatorSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the skin for <code>selectionIndicator</code>.
	 */
	[Style(name="selectionIndicatorSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the skin for <code>todayIndicator</code> style property. It can be customized
	 */
	[Style(name="todayIndicatorSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the style sheet definition to configure the appearence of the current day's
	 */
	[Style(name="todayStyleName", type="String", inherit="no")] 
	/**
	 *  Name of the style sheet definition to configure the weekday names of
	 */
	[Style(name="weekDayStyleName", type="String", inherit="no")] 

	/**
	 *  @private
	 */
	public class CalendarLayout extends UIComponent implements IFocusManagerComponent
	{
		/**
		 *  @private
		 */
		private var todayRow : int;
		/**
		 *  @private
		 */
		private var todayColumn : int;
		/**
		 *  @private
		 */
		private var enabledDaysInMonth : Array;
		/**
		 *  @private
		 */
		private var disabledRangeMode : Array;
		/**
		 *  @private
		 */
		private var cellHeight : Number;
		/**
		 *  @private
		 */
		private var cellWidth : Number;
		/**
		 *  @private
		 */
		private var yOffset : Number;
		/**
		 *  @private
		 */
		local var dayBlocksArray : Array;
		/**
		 *  @private
		 */
		private var disabledArrays : Array;
		/**
		 *  @private
		 */
		private var todaysLabelReference : IUITextField;
		/**
		 *  @private
		 */
		private var selectedMonthYearChanged : Boolean;
		/**
		 *  @private
		 */
		private var todayIndicator : IFlexDisplayObject;
		/**
		 *  @private
		 */
		private var selectionIndicator : Array;
		/**
		 *  @private
		 */
		private var rollOverIndicator : IFlexDisplayObject;
		/**
		 *  @private
		 */
		private var selectedRangeCount : int;
		/**
		 *  @private
		 */
		private var lastSelectedDate : Date;
		/**
		 *  @private
		 */
		private var rangeStartDate : Date;
		/**
		 *  @private
		 */
		local var selRangeMode : int;
		/**
		 *  @private
		 */
		private var _enabled : Boolean;
		/**
		 *  @private
		 */
		private var enabledChanged : Boolean;
		/**
		 *  @private
		 */
		private var _allowDisjointSelection : Boolean;
		/**
		 *  @private
		 */
		private var _allowMultipleSelection : Boolean;
		/**
		 *  @private
		 */
		private var _dayNames : Array;
		/**
		 *  @private
		 */
		private var dayNamesChanged : Boolean;
		/**
		 *  @private
		 */
		private var dayNamesOverride : Array;
		/**
		 *  @private
		 */
		private var _disabledDays : Array;
		/**
		 *  @private
		 */
		private var _disabledRanges : Array;
		/**
		 *  @private
		 */
		private var _displayedMonth : int;
		/**
		 *  @private
		 */
		private var _proposedDisplayedMonth : int;
		/**
		 *  @private
		 */
		private var _displayedYear : int;
		/**
		 *  @private
		 */
		private var _proposedDisplayedYear : int;
		/**
		 *  @private
		 */
		private var _firstDayOfWeek : int;
		/**
		 *  @private
		 */
		private var _selectableRange : Object;
		/**
		 *  @private
		 */
		private var _selectedRanges : Array;
		/**
		 *  @private
		 */
		private var _showToday : Boolean;
		/**
		 *  We don't use 'is' to prevent dependency issues
		 */
		private static var dcis : Object;

		/**
		 *  @private
		 */
		public function get enabled () : Boolean;
		/**
		 *  @private
		 */
		public function set enabled (value:Boolean) : void;
		/**
		 *  @private
		 */
		public function get allowDisjointSelection () : Boolean;
		/**
		 *  @private
		 */
		public function set allowDisjointSelection (value:Boolean) : void;
		/**
		 *  @private
		 */
		public function get allowMultipleSelection () : Boolean;
		/**
		 *  @private
		 */
		public function set allowMultipleSelection (value:Boolean) : void;
		/**
		 *  @private
		 */
		public function get dayNames () : Array;
		/**
		 *  @private
		 */
		public function set dayNames (value:Array) : void;
		/**
		 *  @private
		 */
		public function get disabledDays () : Array;
		/**
		 *  @private
		 */
		public function set disabledDays (value:Array) : void;
		/**
		 *  @private
		 */
		public function get disabledRanges () : Array;
		/**
		 *  @private
		 */
		public function set disabledRanges (value:Array) : void;
		/**
		 *  @private
		 */
		public function get displayedMonth () : int;
		/**
		 *  @private
		 */
		public function set displayedMonth (value:int) : void;
		/**
		 *  @private
		 */
		public function get displayedYear () : int;
		/**
		 *  @private
		 */
		public function set displayedYear (value:int) : void;
		/**
		 *  @private
		 */
		public function get firstDayOfWeek () : int;
		/**
		 *  @private
		 */
		public function set firstDayOfWeek (value:int) : void;
		/**
		 *  @private
		 */
		public function get fontContext () : IFlexModuleFactory;
		/**
		 *  @private
		 */
		public function set fontContext (moduleFactory:IFlexModuleFactory) : void;
		/**
		 *  @private
		 */
		public function get selectableRange () : Object;
		/**
		 *  @private
		 */
		public function set selectableRange (value:Object) : void;
		/**
		 *  @private
		 */
		public function get selectedRanges () : Array;
		/**
		 *  @private
		 */
		public function set selectedRanges (value:Array) : void;
		/**
		 *  @private
		 */
		public function get showToday () : Boolean;
		/**
		 *  @private
		 */
		public function set showToday (value:Boolean) : void;
		/**
		 *  @private
		 */
		public function get selectedDate () : Date;
		/**
		 *  @private
		 */
		public function set selectedDate (value:Date) : void;

		/**
		 *  Constructor.
		 */
		public function CalendarLayout ();
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
		public function styleChanged (styleProp:String) : void;
		/**
		 *  @private
		 */
		protected function resourcesChanged () : void;
		/**
		 *  @private
		 */
		function createDayLabels (childIndex:int) : void;
		/**
		 *  @private
		 */
		function removeDayLabels () : void;
		/**
		 *  @private
		 */
		function createTodayIndicator (childIndex:int) : void;
		/**
		 *  @private
		 */
		function removeTodayIndicator () : void;
		/**
		 *  @private
		 */
		function drawDayNames () : void;
		/**
		 *  @private
		 */
		function setSelectedMonthAndYear (monthVal:int = -1, yearVal:int = -1) : void;
		/**
		 *  @private
		 */
		function getOffsetOfMonth (year:int, month:int) : int;
		/**
		 *  @private
		 */
		function getNumberOfDaysInMonth (year:int, month:int) : int;
		/**
		 *  @private
		 */
		function stepDate (deltaY:int, deltaM:int, triggerEvent:Event = null) : void;
		/**
		 *  @private Takes a year and a month as well as an increment year and month value
		 */
		static function getNewIncrementDate (oldYear:int, oldMonth:int, deltaY:int, deltaM:int) : Object;
		/**
		 *  @private
		 */
		function dispatchChangeEvent (triggerEvent:Event = null) : void;
		/**
		 *  @private
		 */
		function isDateInRange (value:Date, dateRange:Object, rangeMode:int, ignoreDay:Boolean = false) : Boolean;
		/**
		 *  @private
		 */
		function checkDateIsDisabled (value:Date) : Boolean;
		/**
		 *  @private
		 */
		function addToSelected (newDate:Date, range:Boolean = false) : void;
		/**
		 *  @private
		 */
		function incrementDate (value:Date, amount:int = 1) : Date;
		/**
		 *  @private
		 */
		function isSelected (newDate:Date) : Boolean;
		/**
		 *  @private
		 */
		function removeRangeFromSelection (startDate:Date, endDate:Date) : void;
		/**
		 *  @private
		 */
		function setSelectedIndicators () : void;
		/**
		 *  @private
		 */
		function addSelectionIndicator (columnIndex:int, rowIndex:int) : void;
		/**
		 *  @private
		 */
		function removeSelectionIndicator (columnIndex:int, rowIndex:int) : void;
		/**
		 *  @private
		 */
		function removeSelectionIndicators () : void;
		/**
		 *  @private
		 */
		protected function keyDownHandler (event:KeyboardEvent) : void;
		/**
		 *  @private
		 */
		private function mouseOverHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function mouseOutHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function mouseMoveHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function mouseUpHandler (event:MouseEvent) : void;
		private static function isDateChooserIndicator (parent:Object) : Boolean;
	}
}