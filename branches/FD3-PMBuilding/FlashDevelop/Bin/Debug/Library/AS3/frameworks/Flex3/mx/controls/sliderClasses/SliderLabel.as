﻿package mx.controls.sliderClasses
{
	import flash.text.TextLineMetrics;
	import mx.controls.Label;
	import mx.core.mx_internal;

	/**
	 *  The SliderLabel class defines the label used in the mx.controls.Slider component. 
	 */
	public class SliderLabel extends Label
	{
		/**
		 *  Constructor.
		 */
		public function SliderLabel ();
		/**
		 *  @private
		 */
		function getMinimumText (t:String) : String;
	}
}