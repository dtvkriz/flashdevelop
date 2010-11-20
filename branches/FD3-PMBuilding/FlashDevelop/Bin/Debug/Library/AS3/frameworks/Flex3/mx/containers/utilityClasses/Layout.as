﻿package mx.containers.utilityClasses
{
	import mx.core.Container;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;

	/**
	 *  @private
	 */
	public class Layout
	{
		/**
		 *  @private
		 */
		protected var resourceManager : IResourceManager;
		/**
		 *  @private
		 */
		private var _target : Container;

		/**
		 *  The container associated with this layout.
		 */
		public function get target () : Container;
		/**
		 *  @private
		 */
		public function set target (value:Container) : void;

		/**
		 *  Constructor.
		 */
		public function Layout ();
		/**
		 *  @private
		 */
		public function measure () : void;
		/**
		 *  @private
		 */
		public function updateDisplayList (unscaledWidth:Number, unscaledHeight:Number) : void;
	}
}