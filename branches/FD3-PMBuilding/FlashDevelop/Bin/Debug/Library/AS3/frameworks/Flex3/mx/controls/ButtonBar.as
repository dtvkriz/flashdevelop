﻿package mx.controls
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.EventPhase;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import mx.containers.BoxDirection;
	import mx.controls.buttonBarClasses.ButtonBarButton;
	import mx.core.ClassFactory;
	import mx.core.EdgeMetrics;
	import mx.core.IFlexDisplayObject;
	import mx.core.IUIComponent;
	import mx.core.mx_internal;
	import mx.events.ChildExistenceChangedEvent;
	import mx.events.ItemClickEvent;
	import mx.managers.IFocusManagerComponent;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;

	/**
	 *  Dispatched when a user clicks a button.
	 */
	[Event(name="itemClick", type="mx.events.ItemClickEvent")] 
	/**
	 *  Height of each button, in pixels.
	 */
	[Style(name="buttonHeight", type="Number", format="Length", inherit="no")] 
	/**
	 *  Name of CSS style declaration that specifies styles for the buttons.
	 */
	[Style(name="buttonStyleName", type="String", inherit="no")] 
	/**
	 *  Width of each button, in pixels.
	 */
	[Style(name="buttonWidth", type="Number", format="Length", inherit="no")] 
	/**
	 *  Name of CSS style declaration that specifies styles for the first button.
	 */
	[Style(name="firstButtonStyleName", type="String", inherit="no")] 
	/**
	 * Horizontal alignment of all buttons within the ButtonBar. Since individual 
	 */
	[Style(name="horizontalAlign", type="String", enumeration="left,center,right", inherit="no")] 
	/**
	 *  Number of pixels between children in the horizontal direction.
	 */
	[Style(name="horizontalGap", type="Number", format="Length", inherit="no")] 
	/**
	 * Vertical alignment of all buttons within the ButtonBar. Since individual 
	 */
	[Style(name="lastButtonStyleName", type="String", inherit="no")] 
	/**
	 * Vertical alignment of all buttons within the ButtonBar. Since individual 
	 */
	[Style(name="verticalAlign", type="String", enumeration="top,middle,bottom", inherit="no")] 
	/**
	 *  Number of pixels between children in the vertical direction.
	 */
	[Style(name="verticalGap", type="Number", format="Length", inherit="no")] 

	/**
	 *  The ButtonBar control defines a horizontal or vertical group of 
	 */
	public class ButtonBar extends NavBar implements IFocusManagerComponent
	{
		/**
		 *  @private
		 */
		local var simulatedClickTriggerEvent : Event;
		/**
		 *  @private
		 */
		local var buttonStyleNameProp : String;
		/**
		 *  @private
		 */
		local var firstButtonStyleNameProp : String;
		/**
		 *  @private
		 */
		local var lastButtonStyleNameProp : String;
		/**
		 *  @private
		 */
		local var buttonWidthProp : String;
		/**
		 *  @private
		 */
		local var buttonHeightProp : String;
		/**
		 *  @private
		 */
		private var recalcButtonWidths : Boolean;
		/**
		 *  @private
		 */
		private var recalcButtonHeights : Boolean;
		/**
		 *  @private
		 */
		private var oldUnscaledWidth : Number;
		/**
		 *  @private
		 */
		private var oldUnscaledHeight : Number;
		/**
		 *  @private
		 */
		local var focusedIndex : int;
		/**
		 *  @private
		 */
		private var directionChanged : Boolean;

		/**
		 *  @private
		 */
		public function get borderMetrics () : EdgeMetrics;
		/**
		 *  @private
		 */
		public function set direction (value:String) : void;
		/**
		 *  @private
		 */
		public function get viewMetrics () : EdgeMetrics;

		/**
		 *  Constructor.
		 */
		public function ButtonBar ();
		/**
		 *  @private
		 */
		public function styleChanged (styleProp:String) : void;
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
		public function drawFocus (isFocused:Boolean) : void;
		/**
		 *  @private
		 */
		protected function createNavItem (label:String, icon:Class = null) : IFlexDisplayObject;
		/**
		 *  @private
		 */
		protected function resetNavItems () : void;
		/**
		 *  @private
		 */
		private function calcFullWidth () : Number;
		/**
		 *  @private
		 */
		private function calcFullHeight () : Number;
		/**
		 *  @private
		 */
		function prevIndex (index:int) : int;
		/**
		 *  @private
		 */
		function nextIndex (index:int) : int;
		/**
		 *  @private
		 */
		function drawButtonFocus (index:int, focused:Boolean) : void;
		/**
		 *  @private
		 */
		protected function keyDownHandler (event:KeyboardEvent) : void;
		/**
		 *  @private
		 */
		protected function keyUpHandler (event:KeyboardEvent) : void;
		/**
		 *  @private
		 */
		protected function clickHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function childRemoveHandler (event:ChildExistenceChangedEvent) : void;
		/**
		 *  @private
		 */
		private function scaleChangedHandler (event:Event) : void;
	}
}