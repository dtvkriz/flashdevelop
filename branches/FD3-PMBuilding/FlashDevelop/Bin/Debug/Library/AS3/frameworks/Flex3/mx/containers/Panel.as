﻿package mx.containers
{
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextLineMetrics;
	import flash.utils.getQualifiedClassName;
	import mx.automation.IAutomationObject;
	import mx.containers.utilityClasses.BoxLayout;
	import mx.containers.utilityClasses.CanvasLayout;
	import mx.containers.utilityClasses.ConstraintColumn;
	import mx.containers.utilityClasses.ConstraintRow;
	import mx.containers.utilityClasses.IConstraintLayout;
	import mx.containers.utilityClasses.Layout;
	import mx.controls.Button;
	import mx.core.Container;
	import mx.core.ContainerLayout;
	import mx.core.EdgeMetrics;
	import mx.core.EventPriority;
	import mx.core.FlexVersion;
	import mx.core.IFlexDisplayObject;
	import mx.core.IFlexModuleFactory;
	import mx.core.IFontContextComponent;
	import mx.core.IUIComponent;
	import mx.core.IUITextField;
	import mx.core.UIComponent;
	import mx.core.UIComponentCachePolicy;
	import mx.core.UITextField;
	import mx.core.UITextFormat;
	import mx.core.mx_internal;
	import mx.effects.EffectManager;
	import mx.events.CloseEvent;
	import mx.events.SandboxMouseEvent;
	import mx.managers.ISystemManager;
	import mx.styles.ISimpleStyleClient;
	import mx.styles.IStyleClient;
	import mx.styles.StyleProxy;

	/**
	 *  Alpha of the title bar, control bar and sides of the Panel.
	 */
	[Style(name="borderAlpha", type="Number", inherit="no")] 
	/**
	 *  Thickness of the bottom border of the Panel control.
	 */
	[Style(name="borderThicknessBottom", type="Number", format="Length", inherit="no")] 
	/**
	 *  Thickness of the left border of the Panel.
	 */
	[Style(name="borderThicknessLeft", type="Number", format="Length", inherit="no")] 
	/**
	 *  Thickness of the right border of the Panel.
	 */
	[Style(name="borderThicknessRight", type="Number", format="Length", inherit="no")] 
	/**
	 *  Thickness of the top border of the Panel.
	 */
	[Style(name="borderThicknessTop", type="Number", format="Length", inherit="no")] 
	/**
	 *  Name of the CSS style declaration that specifies styles to apply to 
	 */
	[Style(name="controlBarStyleName", type="String", inherit="no")] 
	/**
	 *  Radius of corners of the window frame.
	 */
	[Style(name="cornerRadius", type="Number", format="Length", inherit="no")] 
	/**
	 *  Boolean property that controls the visibility
	 */
	[Style(name="dropShadowEnabled", type="Boolean", inherit="no")] 
	/**
	 *  Array of two colors used to draw the footer
	 */
	[Style(name="footerColors", type="Array", arrayType="uint", format="Color", inherit="yes")] 
	/**
	 *  Array of two colors used to draw the header.
	 */
	[Style(name="headerColors", type="Array", arrayType="uint", format="Color", inherit="yes")] 
	/**
	 *  Height of the header.
	 */
	[Style(name="headerHeight", type="Number", format="Length", inherit="no")] 
	/**
	 *  Alphas used for the highlight fill of the header.
	 */
	[Style(name="highlightAlphas", type="Array", arrayType="Number", inherit="no")] 
	/**
	 *  Number of pixels between the container's lower border
	 */
	[Style(name="paddingBottom", type="Number", format="Length", inherit="no")] 
	/**
	 *  Number of pixels between the container's top border
	 */
	[Style(name="paddingTop", type="Number", format="Length", inherit="no")] 
	/**
	 *  Flag to enable rounding for the bottom two corners of the container.
	 */
	[Style(name="roundedBottomCorners", type="Boolean", inherit="no")] 
	/**
	 *  Direction of drop shadow.
	 */
	[Style(name="shadowDirection", type="String", enumeration="left,center,right", inherit="no")] 
	/**
	 *  Distance of drop shadow.
	 */
	[Style(name="shadowDistance", type="Number", format="Length", inherit="no")] 
	/**
	 *  Style declaration name for the status in the title bar.
	 */
	[Style(name="statusStyleName", type="String", inherit="no")] 
	/**
	 *  The title background skin.
	 */
	[Style(name="titleBackgroundSkin", type="Class", inherit="no")] 
	/**
	 *  Style declaration name for the text in the title bar.
	 */
	[Style(name="titleStyleName", type="String", inherit="no")] 

	/**
	 *  A Panel container consists of a title bar, a caption, a border,
	 */
	public class Panel extends Container implements IConstraintLayout
	{
		/**
		 *  @private
		 */
		private static const HEADER_PADDING : Number = 14;
		/**
		 *  @private
		 */
		static var createAccessibilityImplementation : Function;
		/**
		 *  @private
		 */
		private var layoutObject : Layout;
		/**
		 *  @private
		 */
		local var _showCloseButton : Boolean;
		/**
		 *  @private
		 */
		local var titleBarBackground : IFlexDisplayObject;
		/**
		 *  @private
		 */
		local var titleIconObject : Object;
		/**
		 *  @private
		 */
		local var closeButton : Button;
		/**
		 *  @private
		 */
		private var initializing : Boolean;
		/**
		 *  @private
		 */
		private var panelViewMetrics : EdgeMetrics;
		/**
		 *  @private
		 */
		private var regX : Number;
		/**
		 *  @private
		 */
		private var regY : Number;
		/**
		 *  @private
		 */
		private var checkedForAutoSetRoundedCorners : Boolean;
		/**
		 *  @private
		 */
		private var autoSetRoundedCorners : Boolean;
		private static var _closeButtonStyleFilters : Object;
		/**
		 *  @private
		 */
		private var _constraintColumns : Array;
		/**
		 *  @private
		 */
		private var _constraintRows : Array;
		/**
		 *  A reference to this Panel container's control bar, if any.
		 */
		protected var controlBar : IUIComponent;
		/**
		 *  @private
		 */
		private var _layout : String;
		/**
		 *  @private
		 */
		private var _status : String;
		/**
		 *  @private
		 */
		private var _statusChanged : Boolean;
		/**
		 *  The UITextField sub-control that displays the status.
		 */
		protected var statusTextField : IUITextField;
		/**
		 *  @private
		 */
		private var _title : String;
		/**
		 *  @private
		 */
		private var _titleChanged : Boolean;
		/**
		 *  The TitleBar sub-control that displays the Panel container's title bar.
		 */
		protected var titleBar : UIComponent;
		/**
		 *  @private
		 */
		private var _titleIcon : Class;
		/**
		 *  @private
		 */
		private var _titleIconChanged : Boolean;
		/**
		 *  The UITextField sub-control that displays the title.
		 */
		protected var titleTextField : IUITextField;

		/**
		 *  @private
		 */
		public function get baselinePosition () : Number;
		/**
		 *  @private
		 */
		public function set cacheAsBitmap (value:Boolean) : void;
		/**
		 *  @private
		 */
		public function set enabled (value:Boolean) : void;
		/**
		 *  The set of styles to pass from the Panel to the close button.
		 */
		protected function get closeButtonStyleFilters () : Object;
		/**
		 *  @copy mx.containers.utilityClasses.IConstraintLayout#constraintColumns
		 */
		public function get constraintColumns () : Array;
		/**
		 *  @private
		 */
		public function set constraintColumns (value:Array) : void;
		/**
		 *  @copy mx.containers.utilityClasses.IConstraintLayout#constraintRows
		 */
		public function get constraintRows () : Array;
		/**
		 *  @private
		 */
		public function set constraintRows (value:Array) : void;
		/**
		 *  Proxy to the controlBar property which is protected and can't be accessed externally
		 */
		function get _controlBar () : IUIComponent;
		/**
		 *  @inheritDoc
		 */
		public function get fontContext () : IFlexModuleFactory;
		/**
		 *  @private
		 */
		public function set fontContext (moduleFactory:IFlexModuleFactory) : void;
		/**
		 *  Specifies the layout mechanism used for this container. 
		 */
		public function get layout () : String;
		/**
		 *  @private
		 */
		public function set layout (value:String) : void;
		/**
		 *  Text in the status area of the title bar.
		 */
		public function get status () : String;
		/**
		 *  @private
		 */
		public function set status (value:String) : void;
		/**
		 *  Title or caption displayed in the title bar.
		 */
		public function get title () : String;
		/**
		 *  @private
		 */
		public function set title (value:String) : void;
		/**
		 *  The icon displayed in the title bar.
		 */
		public function get titleIcon () : Class;
		/**
		 *  @private
		 */
		public function set titleIcon (value:Class) : void;
		/**
		 *  @private
		 */
		function get usePadding () : Boolean;
		/**
		 *  @private  
		 */
		public function get viewMetrics () : EdgeMetrics;

		/**
		 *  Constructor.
		 */
		public function Panel ();
		/**
		 *  @private
		 */
		public function getChildIndex (child:DisplayObject) : int;
		/**
		 *  @private
		 */
		protected function initializeAccessibility () : void;
		/**
		 *  @private
		 */
		protected function createChildren () : void;
		/**
		 *  @private
		 */
		protected function commitProperties () : void;
		/**
		 *  Calculates the default mininum and maximum sizes
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
		protected function layoutChrome (unscaledWidth:Number, unscaledHeight:Number) : void;
		/**
		 *  @private
		 */
		public function createComponentsFromDescriptors (recurse:Boolean = true) : void;
		/**
		 *  @private
		 */
		function createTitleTextField (childIndex:int) : void;
		/**
		 *  @private
		 */
		function removeTitleTextField () : void;
		/**
		 *  @private
		 */
		function createStatusTextField (childIndex:int) : void;
		/**
		 *  @private
		 */
		function removeStatusTextField () : void;
		/**
		 *  @private.
		 */
		private function measureHeaderText () : Rectangle;
		/**
		 *  Returns the height of the header.
		 */
		protected function getHeaderHeight () : Number;
		/**
		 *  @private
		 */
		function getHeaderHeightProxy () : Number;
		/**
		 *  @private
		 */
		private function showTitleBar (show:Boolean) : void;
		/**
		 *  @private
		 */
		private function setControlBar (newControlBar:IUIComponent) : void;
		/**
		 *  Called when the user starts dragging a Panel
		 */
		protected function startDragging (event:MouseEvent) : void;
		/**
		 *  Called when the user stops dragging a Panel
		 */
		protected function stopDragging () : void;
		/**
		 *  @private
		 */
		function getTitleBar () : UIComponent;
		/**
		 *  @private
		 */
		function getTitleTextField () : IUITextField;
		/**
		 *  @private
		 */
		function getStatusTextField () : IUITextField;
		/**
		 *  @private
		 */
		function getControlBar () : IUIComponent;
		/**
		 *  @private
		 */
		private function titleBar_mouseDownHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function systemManager_mouseMoveHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function systemManager_mouseUpHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function stage_mouseLeaveHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function closeButton_clickHandler (event:MouseEvent) : void;
	}
}