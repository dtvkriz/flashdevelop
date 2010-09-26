﻿package mx.core
{
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import mx.controls.HScrollBar;
	import mx.controls.ToolTip;
	import mx.controls.VScrollBar;
	import mx.controls.scrollClasses.ScrollBar;
	import mx.events.ScrollEvent;
	import mx.events.ScrollEventDetail;
	import mx.events.ScrollEventDirection;
	import mx.managers.ToolTipManager;
	import mx.styles.ISimpleStyleClient;

	/**
	 *  Dispatched when the content is scrolled.
	 */
	[Event(name="scroll", type="mx.events.ScrollEvent")] 
	/**
	 *  Style name for horizontal scrollbar.  This allows more control over
	 */
	[Style(name="horizontalScrollBarStyleName", type="String", inherit="no")] 
	/**
	 *  Style name for vertical scrollbar.  This allows more control over
	 */
	[Style(name="verticalScrollBarStyleName", type="String", inherit="no")] 

	/**
	 *  The ScrollControlBase class is the base class for controls
	 */
	public class ScrollControlBase extends UIComponent
	{
		/**
		 *  The border object.
		 */
		protected var border : IFlexDisplayObject;
		/**
		 *  @private
		 */
		private var _viewMetrics : EdgeMetrics;
		/**
		 *  The mask. This property may be undefined if no scroll bars
		 */
		protected var maskShape : Shape;
		/**
		 *  The horizontal scroll bar.
		 */
		protected var horizontalScrollBar : ScrollBar;
		/**
		 *  The vertical scroll bar.
		 */
		protected var verticalScrollBar : ScrollBar;
		/**
		 *  @private
		 */
		private var numberOfCols : Number;
		/**
		 *  @private
		 */
		private var numberOfRows : Number;
		/**
		 *  @private
		 */
		local var _maxVerticalScrollPosition : Number;
		local var _maxHorizontalScrollPosition : Number;
		/**
		 *  @private
		 */
		private var viewableRows : Number;
		private var viewableColumns : Number;
		/**
		 *  @private
		 */
		private var propsInited : Boolean;
		/**
		 *  A flag that the scrolling area changed due to the appearance or disappearance of
		 */
		protected var scrollAreaChanged : Boolean;
		/**
		 *  @private
		 */
		private var invLayout : Boolean;
		/**
		 *  @private
		 */
		private var scrollTip : ToolTip;
		/**
		 *  @private
		 */
		private var scrollThumbMidPoint : Number;
		/**
		 *  @private
		 */
		private var oldTTMEnabled : Boolean;
		/**
		 *  @private
		 */
		local var _horizontalScrollPosition : Number;
		/**
		 *  @private
		 */
		local var _horizontalScrollPolicy : String;
		/**
		 *  A flag that indicates whether scrolling is live as the 
		 */
		public var liveScrolling : Boolean;
		/**
		 *  @private
		 */
		private var _scrollTipFunction : Function;
		/**
		 *  A flag that indicates whether a tooltip should appear
		 */
		public var showScrollTips : Boolean;
		/**
		 *  @private
		 */
		local var _verticalScrollPosition : Number;
		/**
		 *  @private
		 */
		local var _verticalScrollPolicy : String;

		/**
		 *  @private
		 */
		public function set enabled (value:Boolean) : void;
		/**
		 *  Returns an EdgeMetrics object that has four properties:
		 */
		public function get borderMetrics () : EdgeMetrics;
		/**
		 *  The offset into the content from the left edge.  This can
		 */
		public function get horizontalScrollPosition () : Number;
		/**
		 *  @private
		 */
		public function set horizontalScrollPosition (value:Number) : void;
		/**
		 *  A property that indicates whether the horizontal scroll 
		 */
		public function get horizontalScrollPolicy () : String;
		/**
		 *  @private
		 */
		public function set horizontalScrollPolicy (value:String) : void;
		/**
		 *  The maximum value for the <code>horizontalScrollPosition</code> property.
		 */
		public function get maxHorizontalScrollPosition () : Number;
		/**
		 *  @private
		 */
		public function set maxHorizontalScrollPosition (value:Number) : void;
		/**
		 *  The maximum value for the <code>verticalScrollPosition</code> property.
		 */
		public function get maxVerticalScrollPosition () : Number;
		/**
		 *  @private
		 */
		public function set maxVerticalScrollPosition (value:Number) : void;
		/**
		 *  A function that computes the string to be displayed as the ScrollTip.
		 */
		public function get scrollTipFunction () : Function;
		/**
		 *  @private
		 */
		public function set scrollTipFunction (value:Function) : void;
		/**
		 *  An EdgeMetrics object taking into account the scroll bars,
		 */
		public function get viewMetrics () : EdgeMetrics;
		/**
		 *  The offset into the content from the top edge.  This can
		 */
		public function get verticalScrollPosition () : Number;
		/**
		 *  @private
		 */
		public function set verticalScrollPosition (value:Number) : void;
		/**
		 *  A property that indicates whether the vertical scroll bar is always on, always off,
		 */
		public function get verticalScrollPolicy () : String;
		/**
		 *  @private
		 */
		public function set verticalScrollPolicy (value:String) : void;
		/**
		 *  @private
		 */
		function get scroll_verticalScrollBar () : ScrollBar;
		/**
		 *  @private
		 */
		function get scroll_horizontalScrollBar () : ScrollBar;

		/**
		 *  Constructor.
		 */
		public function ScrollControlBase ();
		/**
		 *  Creates objects that are children of this ScrollControlBase,
		 */
		protected function createChildren () : void;
		/**
		 *  @private
		 */
		protected function updateDisplayList (unscaledWidth:Number, unscaledHeight:Number) : void;
		/**
		 *  @private
		 */
		public function styleChanged (styleProp:String) : void;
		/**
		 *  Responds to size changes by setting the positions and sizes
		 */
		protected function layoutChrome (unscaledWidth:Number, unscaledHeight:Number) : void;
		/**
		 *  Creates the border for this component.
		 */
		protected function createBorder () : void;
		/**
		 *  Returns <code>true</code> if a border is needed for this component based
		 */
		private function isBorderNeeded () : Boolean;
		/**
		 *  Causes the ScrollControlBase to show or hide scrollbars based
		 */
		protected function setScrollBarProperties (totalColumns:int, visibleColumns:int, totalRows:int, visibleRows:int) : void;
		/**
		 *  @private
		 */
		private function createHScrollBar (visible:Boolean) : ScrollBar;
		/**
		 *  @private
		 */
		private function createVScrollBar (visible:Boolean) : ScrollBar;
		/**
		 *  Determines if there is enough space in this component to display 
		 */
		protected function roomForScrollBar (bar:ScrollBar, unscaledWidth:Number, unscaledHeight:Number) : Boolean;
		/**
		 *  Default event handler for the <code>scroll</code> event.
		 */
		protected function scrollHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function scrollTipHandler (event:Event) : void;
		/**
		 *  Event handler for the mouse wheel scroll event.
		 */
		protected function mouseWheelHandler (event:MouseEvent) : void;
	}
}