﻿package mx.core
{
	import flash.display.DisplayObject;
	import flash.display.InteractiveObject;
	import flash.events.ContextMenuEvent;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.external.ExternalInterface;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.system.Capabilities;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	import flash.utils.setInterval;
	import mx.containers.utilityClasses.ApplicationLayout;
	import mx.effects.EffectManager;
	import mx.events.FlexEvent;
	import mx.managers.FocusManager;
	import mx.managers.ILayoutManager;
	import mx.managers.ISystemManager;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.IStyleClient;
	import mx.styles.StyleManager;

	/**
	 *  Dispatched after the Application has been initialized,
	 */
	[Event(name="applicationComplete", type="mx.events.FlexEvent")] 
	/**
	 *  Dispatched when an error occurs anywhere in the application,
	 */
	[Event(name="error", type="flash.events.ErrorEvent")] 
	/**
	 *  Specifies the alpha transparency values used for the background gradient fill of the application.
	 */
	[Style(name="backgroundGradientAlphas", type="Array", arrayType="Number", inherit="no")] 
	/**
	 *  Specifies the colors used to tint the background gradient fill of the application.
	 */
	[Style(name="backgroundGradientColors", type="Array", arrayType="uint", format="Color", inherit="no")] 
	/**
	 *  Number of pixels between the application's bottom border
	 */
	[Style(name="paddingBottom", type="Number", format="Length", inherit="no")] 
	/**
	 *  Number of pixels between the application's top border
	 */
	[Style(name="paddingTop", type="Number", format="Length", inherit="no")] 

	/**
	 *  Flex defines a default, or Application, container that lets you start
	 */
	public class Application extends LayoutContainer
	{
		/**
		 *  @private
		 */
		static var useProgressiveLayout : Boolean;
		/**
		 *  @private
		 */
		private var resizeHandlerAdded : Boolean;
		/**
		 *  @private
		 */
		private var preloadObj : Object;
		/**
		 *  @private
		 */
		private var creationQueue : Array;
		/**
		 *  @private
		 */
		private var processingCreationQueue : Boolean;
		/**
		 *  @private
		 */
		private var _applicationViewMetrics : EdgeMetrics;
		/**
		 *  @private
		 */
		private var resizeWidth : Boolean;
		/**
		 *  @private
		 */
		private var resizeHeight : Boolean;
		/**
		 * @private
		 */
		private var viewSourceCMI : ContextMenuItem;
		/**
		 *    Specifies the frame rate of the application.
		 */
		public var frameRate : Number;
		/**
		 *    Specifies a string that appears in the title bar of the browser.
		 */
		public var pageTitle : String;
		/**
		 *    Specifies the path of a SWC component class or ActionScript
		 */
		public var preloader : Object;
		/**
		 *    Specifies the maximum depth of Flash Player or AIR 
		 */
		public var scriptRecursionLimit : int;
		/**
		 *    Specifies the maximum duration, in seconds, that an ActionScript
		 */
		public var scriptTimeLimit : Number;
		/**
		 *    If <code>true</code>, specifies to display the application preloader.
		 */
		public var usePreloader : Boolean;
		/**
		 *  The ApplicationControlBar for this Application. 
		 */
		public var controlBar : IUIComponent;
		/**
		 *  If <code>false</code>, the history manager will be disabled.
		 */
		public var historyManagementEnabled : Boolean;
		/**
		 *  @private
		 */
		local var _parameters : Object;
		/**
		 *  If <code>true</code>, the application's history state is reset
		 */
		public var resetHistory : Boolean;
		/**
		 *  @private
		 */
		local var _url : String;
		/**
		 *  @private
		 */
		private var _viewSourceURL : String;

		/**
		 *  Note: here are two reasons that 'application' is typed as Object
		 */
		public static function get application () : Object;
		/**
		 *  @private
		 */
		public function set icon (value:Class) : void;
		/**
		 *  @private
		 */
		public function get id () : String;
		/**
		 *  @private
		 */
		public function set label (value:String) : void;
		/**
		 *  @private
		 */
		public function set percentHeight (value:Number) : void;
		/**
		 *  @private
		 */
		public function set percentWidth (value:Number) : void;
		/**
		 *  @private
		 */
		public function set tabIndex (value:int) : void;
		/**
		 *  @private
		 */
		public function set toolTip (value:String) : void;
		/**
		 *  @private
		 */
		public function get viewMetrics () : EdgeMetrics;
		/**
		 *  The parameters property returns an Object containing name-value
		 */
		public function get parameters () : Object;
		/**
		 *  The URL from which this Application's SWF file was loaded.
		 */
		public function get url () : String;
		/**
		 *  @private
		 */
		function get usePadding () : Boolean;
		/**
		 *  URL where the application's source can be viewed. Setting this
		 */
		public function get viewSourceURL () : String;
		/**
		 *  @private
		 */
		public function set viewSourceURL (value:String) : void;

		/**
		 *  Constructor.
		 */
		public function Application ();
		/**
		 *  @private
		 */
		function setUnscaledHeight (value:Number) : void;
		/**
		 *  @private
		 */
		function setUnscaledWidth (value:Number) : void;
		/**
		 *  @private
		 */
		public function getChildIndex (child:DisplayObject) : int;
		/**
		 *  @private
		 */
		public function initialize () : void;
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
		public function prepareToPrint (target:IFlexDisplayObject) : Object;
		/**
		 *  @private
		 */
		public function finishPrint (obj:Object, target:IFlexDisplayObject) : void;
		/**
		 *  @private
		 */
		function initThemeColor () : Boolean;
		/**
		 *  @private
		 */
		protected function resourcesChanged () : void;
		/**
		 *  @private
		 */
		protected function layoutChrome (unscaledWidth:Number, unscaledHeight:Number) : void;
		/**
		 *  @private
		 */
		private function debugTickler () : void;
		/**
		 *  @private
		 */
		private function initManagers (sm:ISystemManager) : void;
		/**
		 *  @private
		 */
		private function initContextMenu () : void;
		/**
		 *  Add a container to the Application's creation queue.
		 */
		public function addToCreationQueue (id:Object, preferredIndex:int = -1, callbackFunc:Function = null, parent:IFlexDisplayObject = null) : void;
		/**
		 *  @private
		 */
		private function doNextQueueItem (event:FlexEvent = null) : void;
		/**
		 *  @private
		 */
		private function processNextQueueItem () : void;
		/**
		 *  @private
		 */
		private function printCreationQueue () : void;
		/**
		 *  @private
		 */
		private function setControlBar (newControlBar:IUIComponent) : void;
		/**
		 *  @private
		 */
		function dockControlBar (controlBar:IUIComponent, dock:Boolean) : void;
		/**
		 *  @private
		 */
		private function addedHandler (event:Event) : void;
		/**
		 *  @private 
		 */
		private function resizeHandler (event:Event) : void;
		/**
		 *  @private
		 */
		protected function menuItemSelectHandler (event:Event) : void;
	}
}