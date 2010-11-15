﻿package fl.containers
{
	import fl.core.InvalidationType;
	import fl.core.UIComponent;
	import fl.events.ComponentEvent;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.IOErrorEvent;
	import flash.events.HTTPStatusEvent;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;

	/**
	 * Dispatched when content loading is complete. This event is dispatched 
	 */
	[Event("complete", type="flash.events.Event")] 
	/**
	 * Dispatched when the properties and methods of a loaded SWF file are accessible. 
	 */
	[Event("init", type="flash.events.Event")] 
	/**
	 * Dispatched after an input or output error occurs.
	 */
	[Event("ioError", type="flash.events.IOErrorEvent")] 
	/**
	 * Dispatched after a network operation starts.
	 */
	[Event("open", type="flash.events.Event")] 
	/**
	 * Dispatched when content is loading. This event is dispatched regardless of
	 */
	[Event("progress", type="flash.events.ProgressEvent")] 
	/**
	 * Dispatched after the component is resized.
	 */
	[Event("resize", type="fl.events.ComponentEvent")] 
	/**
	 * Dispatched after a security error occurs while content is loading.
	 */
	[Event("securityError", type="flash.events.SecurityErrorEvent")] 

	/**
	 * The UILoader class makes it possible to set content to load and to then 
	 */
	public class UILoader extends UIComponent
	{
		/**
		 * @private (protected)
		 */
		protected var _scaleContent : Boolean;
		/**
		 * @private (protected)
		 */
		protected var _autoLoad : Boolean;
		/**
		 * @private (protected)
		 */
		protected var contentInited : Boolean;
		/**
		 * @private (protected)
		 */
		protected var _source : Object;
		/**
		 * @private (protected)
		 */
		protected var loader : Loader;
		/**
		 * @private (protected)
		 */
		protected var _maintainAspectRatio : Boolean;
		/**
		 * @private
		 */
		protected var contentClip : Sprite;
		/**
		 * @private
		 */
		private static var defaultStyles : Object;

		/**
		 * Gets or sets a value that indicates whether the UILoader instance automatically 
		 */
		public function get autoLoad () : Boolean;
		/**
		 * @private (setter)
		 */
		public function set autoLoad (value:Boolean) : void;
		/**
		 * Gets or sets a value that indicates whether to automatically scale the image to 
		 */
		public function get scaleContent () : Boolean;
		/**
		 * @private (setter)
		 */
		public function set scaleContent (value:Boolean) : void;
		/**
		 * Gets or sets a value that indicates whether to maintain
		 */
		public function get maintainAspectRatio () : Boolean;
		/**
		 * @private (setter)
		 */
		public function set maintainAspectRatio (value:Boolean) : void;
		/**
		 * @copy ScrollPane#bytesLoaded
		 */
		public function get bytesLoaded () : uint;
		/**
		 * @copy ScrollPane#bytesTotal
		 */
		public function get bytesTotal () : uint;
		/**
		 * Contains the root display object of the SWF file or image file (a JPEG, PNG, or GIF format file) 
		 */
		public function get content () : DisplayObject;
		/**
		 * @copy fl.containers.ScrollPane#source
		 */
		public function get source () : Object;
		/**
		 * @private (setter)
		 */
		public function set source (value:Object) : void;
		/**
		 * @copy ScrollPane#percentLoaded
		 */
		public function get percentLoaded () : Number;

		/**
		 * @copy fl.core.UIComponent#getStyleDefinition()
		 */
		public static function getStyleDefinition () : Object;
		/**
		 * Creates a new UILoader component instance.
		 */
		public function UILoader ();
		/**
		 * Resizes the component to the requested size. If the <code>scaleContent</code>
		 */
		public function setSize (w:Number, h:Number) : void;
		/**
		 * Loads binary data that is stored in a ByteArray object.
		 */
		public function loadBytes (bytes:ByteArray, context:LoaderContext = null) : void;
		/**
		 * Loads the specified content or, if no content is specified, loads the 
		 */
		public function load (request:URLRequest = null, context:LoaderContext = null) : void;
		/**
		 * Removes a child of this UILoader object that was loaded by using 
		 */
		public function unload () : void;
		/**
		 * Cancels a <code>load()</code> method operation that is currently in progress for the 
		 */
		public function close () : void;
		/**
		 * @private (protected)
		 */
		protected function _unload (throwError:Boolean = false) : void;
		/**
		 * @private (protected)
		 */
		protected function initLoader () : void;
		/**
		 * @private (protected)
		 */
		protected function handleComplete (event:Event) : void;
		/**
		 * @private (protected)
		 */
		protected function passEvent (event:Event) : void;
		/**
		 * @private (protected)
		 */
		protected function handleError (event:Event) : void;
		/**
		 * @private (protected)
		 */
		protected function handleInit (event:Event) : void;
		/**
		 * @private (protected)
		 */
		protected function clearLoadEvents () : void;
		/**
		 * @private (protected)
		 */
		protected function draw () : void;
		/**
		 * @private (protected)
		 */
		protected function drawLayout () : void;
		/**
		 * @private (protected)
		 */
		protected function sizeContent (target:DisplayObject, contentWidth:Number, contentHeight:Number, targetWidth:Number, targetHeight:Number) : void;
		/**
		 * @private (protected)
		 */
		protected function configUI () : void;
	}
}