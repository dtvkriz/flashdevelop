﻿package mx.core
{
	import flash.geom.Rectangle;
	import mx.core.ISWFBridgeProvider;

	/**
	 *  The ISWFLoader interface defines an API with special properties
	 */
	public interface ISWFLoader extends ISWFBridgeProvider
	{
		/**
		 *  A flag that indicates whether the content is loaded so that it can
		 */
		public function get loadForCompatibility () : Boolean;
		/**
		 *  @private
		 */
		public function set loadForCompatibility (value:Boolean) : void;

		/**
		 *  Get the bounds of the loaded application that are visible to the user
		 */
		public function getVisibleApplicationRect (allApplications:Boolean = false) : Rectangle;
	}
}