﻿package mx.logging
{
	import mx.core.IMXMLObject;
	import mx.logging.errors.InvalidFilterError;
	import mx.managers.ISystemManager;
	import mx.managers.SystemManager;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;
	import mx.utils.UIDUtil;

	/**
	 *  This class provides the basic functionality required by the logging framework 
	 */
	public class AbstractTarget implements ILoggingTarget
	{
		/**
		 *  @private
		 */
		private var _loggerCount : uint;
		/**
		 *  @private
		 */
		private var resourceManager : IResourceManager;
		/**
		 *  @private
		 */
		private var _filters : Array;
		/**
		 *  @prviate
		 */
		private var _id : String;
		/**
		 *  @private
		 */
		private var _level : int;

		/**
		 *  In addition to the <code>level</code> setting, filters are used to
		 */
		public function get filters () : Array;
		/**
		 *  @private
		 */
		public function set filters (value:Array) : void;
		/**
		 *  Provides access to the id of this target.
		 */
		public function get id () : String;
		/**
		 *  Provides access to the level this target is currently set at.
		 */
		public function get level () : int;
		/**
		 *  @private
		 */
		public function set level (value:int) : void;

		/**
		 *  Constructor.
		 */
		public function AbstractTarget ();
		/**
		 *  Sets up this target with the specified logger.
		 */
		public function addLogger (logger:ILogger) : void;
		/**
		 *  Stops this target from receiving events from the specified logger.
		 */
		public function removeLogger (logger:ILogger) : void;
		/**
		 *  Called after the implementing object has been created
		 */
		public function initialized (document:Object, id:String) : void;
		/**
		 *  This method handles a <code>LogEvent</code> from an associated logger.
		 */
		public function logEvent (event:LogEvent) : void;
		/**
		 *  @private
		 */
		private function logHandler (event:LogEvent) : void;
	}
}