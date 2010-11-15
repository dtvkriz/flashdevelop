﻿package mx.containers.utilityClasses
{
	import mx.core.Container;
	import mx.core.EdgeMetrics;
	import mx.core.IFlexDisplayObject;
	import mx.core.mx_internal;

	/**
	 *  @private
	 */
	public class ApplicationLayout extends BoxLayout
	{
		/**
		 *  Constructor.
		 */
		public function ApplicationLayout ();
		/**
		 *  @private
		 */
		public function updateDisplayList (unscaledWidth:Number, unscaledHeight:Number) : void;
	}
}