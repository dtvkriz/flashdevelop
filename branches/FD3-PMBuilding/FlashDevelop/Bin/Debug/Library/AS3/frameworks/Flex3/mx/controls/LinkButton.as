﻿package mx.controls
{
	import flash.text.TextLineMetrics;
	import mx.core.FlexVersion;
	import mx.core.mx_internal;

	/**
	 *  Corner radius of the highlighted rectangle around a LinkButton.
	 */
	[Style(name="cornerRadius", type="Number", format="Length", inherit="no")] 
	/**
	 *  Color of a LinkButton as a user moves the mouse pointer over it.
	 */
	[Style(name="rollOverColor", type="uint", format="Color", inherit="yes")] 
	/**
	 *  Background color of a LinkButton as a user presses it.
	 */
	[Style(name="selectionColor", type="uint", format="Color", inherit="yes")] 
	/**
	 *  Text color of a LinkButton as a user moves the mouse pointer over it.
	 */
	[Style(name="textRollOverColor", type="uint", format="Color", inherit="yes")] 
	/**
	 *  Text color of a LinkButton as a user presses it.
	 */
	[Style(name="textSelectedColor", type="uint", format="Color", inherit="yes")] 

	/**
	 *  The LinkButton control is a borderless Button control
	 */
	public class LinkButton extends Button
	{
		/**
		 *  @private
		 */
		static var createAccessibilityImplementation : Function;

		/**
		 *  @private
		 */
		public function set emphasized (value:Boolean) : void;

		/**
		 *  Constructor.
		 */
		public function LinkButton ();
		/**
		 *  @private
		 */
		protected function initializeAccessibility () : void;
		/**
		 *  @private
		 */
		protected function measure () : void;
	}
}