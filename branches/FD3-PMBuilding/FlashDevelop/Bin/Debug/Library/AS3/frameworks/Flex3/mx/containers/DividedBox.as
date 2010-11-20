﻿package mx.containers
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import mx.containers.dividedBoxClasses.BoxDivider;
	import mx.core.EdgeMetrics;
	import mx.core.IFlexDisplayObject;
	import mx.core.IInvalidating;
	import mx.core.IUIComponent;
	import mx.core.UIComponent;
	import mx.core.mx_internal;
	import mx.events.ChildExistenceChangedEvent;
	import mx.events.DividerEvent;
	import mx.managers.CursorManager;
	import mx.managers.CursorManagerPriority;
	import mx.styles.StyleManager;

	/**
	 *  Dispatched multiple times as the user drags any divider.
	 */
	[Event(name="dividerDrag", type="mx.events.DividerEvent")] 
	/**
	 *  Dispatched when the user presses any divider in this container.
	 */
	[Event(name="dividerPress", type="mx.events.DividerEvent")] 
	/**
	 *  Dispatched when the user releases a divider.
	 */
	[Event(name="dividerRelease", type="mx.events.DividerEvent")] 
	/**
	 *  Thickness in pixels of the area where the user can click to drag a 
	 */
	[Style(name="dividerAffordance", type="Number", format="Length", inherit="no")] 
	/**
	 *  The alpha value that determines the transparency of the dividers.
	 */
	[Style(name="dividerAlpha", type="Number", inherit="no")] 
	/**
	 *  Color of the dividers when the user presses or drags the dividers
	 */
	[Style(name="dividerColor", type="uint", format="Color", inherit="yes")] 
	/**
	 *  The divider skin.
	 */
	[Style(name="dividerSkin", type="Class", inherit="no")] 
	/**
	 *  Thickness in pixels of the dividers when the user presses or drags the 
	 */
	[Style(name="dividerThickness", type="Number", format="Length", inherit="no")] 
	/**
	 *  The cursor skin for a horizontal DividedBox.
	 */
	[Style(name="horizontalDividerCursor", type="Class", inherit="no")] 
	/**
	 *  The cursor skin for a vertical DividedBox.
	 */
	[Style(name="verticalDividerCursor", type="Class", inherit="no")] 

	/**
	 *  A DividedBox container measures and lays out its children
	 */
	public class DividedBox extends Box
	{
		/**
		 *  @private
		 */
		private static const PROXY_DIVIDER_INDEX : int = 999;
		/**
		 *  @private
		 */
		private static var classInitialized : Boolean;
		/**
		 *  @private
		 */
		private var dividerLayer : UIComponent;
		/**
		 *  @private
		 */
		local var activeDivider : BoxDivider;
		/**
		 *  @private
		 */
		private var activeDividerIndex : int;
		/**
		 *  @private
		 */
		private var activeDividerStartPosition : Number;
		/**
		 *  @private
		 */
		private var dragStartPosition : Number;
		/**
		 *  @private
		 */
		private var dragDelta : Number;
		/**
		 *  @private
		 */
		private var oldChildSizes : Array;
		/**
		 *  @private
		 */
		private var minDelta : Number;
		/**
		 *  @private
		 */
		private var maxDelta : Number;
		/**
		 *  @private
		 */
		private var dontCoalesceDividers : Boolean;
		/**
		 *  @private
		 */
		private var cursorID : int;
		/**
		 *  @private
		 */
		private var dbMinWidth : Number;
		private var dbMinHeight : Number;
		private var dbPreferredWidth : Number;
		private var dbPreferredHeight : Number;
		/**
		 *  @private
		 */
		private var layoutStyleChanged : Boolean;
		/**
		 *  @private
		 */
		private var _resizeToContent : Boolean;
		/**
		 *  @private
		 */
		private var numLayoutChildren : int;
		/**
		 *  The class for the divider between the children.
		 */
		protected var dividerClass : Class;
		/**
		 *  If <code>true</code>, the children adjacent to a divider
		 */
		public var liveDragging : Boolean;

		/**
		 *  @private
		 */
		public function set direction (value:String) : void;
		/**
		 *  The number of dividers. 
		 */
		public function get numDividers () : int;
		/**
		 *  If <code>true</code>, the DividedBox automatically resizes to the size
		 */
		public function get resizeToContent () : Boolean;
		/**
		 *  @private
		 */
		public function set resizeToContent (value:Boolean) : void;

		/**
		 *  @private
		 */
		private static function initializeClass () : void;
		/**
		 *  Constructor.
		 */
		public function DividedBox ();
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
		protected function scrollChildren () : void;
		/**
		 *  Returns a reference to the specified BoxDivider object
		 */
		public function getDividerAt (i:int) : BoxDivider;
		/**
		 *  Move a specific divider a given number of pixels.
		 */
		public function moveDivider (i:int, amt:Number) : void;
		/**
		 *  @private
		 */
		private function createDivider (i:int) : BoxDivider;
		/**
		 *  @private
		 */
		private function layoutDivider (i:int, unscaledWidth:Number, unscaledHeight:Number) : void;
		/**
		 *  @private
		 */
		function changeCursor (divider:BoxDivider) : void;
		/**
		 *  @private
		 */
		function restoreCursor () : void;
		/**
		 *  @private
		 */
		function getDividerIndex (divider:BoxDivider) : int;
		/**
		 *  @private
		 */
		private function getMousePosition (event:MouseEvent) : Number;
		/**
		 *  @private
		 */
		function startDividerDrag (divider:BoxDivider, trigger:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function cacheSizes () : void;
		/**
		 *  @private
		 */
		private function cacheChildSizes () : void;
		/**
		 *  @private
		 */
		private function mouseMoveHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		function stopDividerDrag (divider:BoxDivider, trigger:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function resetDividerTracking () : void;
		/**
		 *  @private
		 */
		private function computeAllowableMovement (at:int) : void;
		/**
		 *  @private
		 */
		private function computeMinAndMaxDelta () : void;
		/**
		 *  @private
		 */
		private function limitDelta (delta:Number) : Number;
		/**
		 *  @private
		 */
		private function distributeDelta () : void;
		/**
		 *  @private
		 */
		private function adjustChildSizes () : void;
		/**
		 *  @private
		 */
		private function preLayoutAdjustment () : void;
		/**
		 *  @private
		 */
		private function childAddHandler (event:ChildExistenceChangedEvent) : void;
		/**
		 *  @private
		 */
		private function childRemoveHandler (event:ChildExistenceChangedEvent) : void;
		/**
		 *  @private
		 */
		private function child_includeInLayoutChangedHandler (event:Event) : void;
	}
	/**
	 *  @private
	 */
	internal class ChildSizeInfo
	{
		/**
		 *  @private
		 */
		public var deltaMin : Number;
		/**
		 *  @private
		 */
		public var deltaMax : Number;
		/**
		 *  @private
		 */
		public var min : Number;
		/**
		 *  @private
		 */
		public var max : Number;
		/**
		 *  @private
		 */
		public var size : Number;

		/**
		 *  @private
		 */
		public function ChildSizeInfo (size:Number, min:Number = 0, max:Number = 0, deltaMin:Number = 0, deltaMax:Number = 0);
	}
}