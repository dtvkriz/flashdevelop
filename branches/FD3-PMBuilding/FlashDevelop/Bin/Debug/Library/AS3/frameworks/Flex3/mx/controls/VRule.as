﻿package mx.controls
{
	import flash.display.Graphics;
	import mx.core.UIComponent;

	/**
	 *  The shadow color of the line. 
	 */
	[Style(name="shadowColor", type="uint", format="Color", inherit="yes")] 
	/**
	 *  The color of the line. 
	 */
	[Style(name="strokeColor", type="uint", format="Color", inherit="yes")] 
	/**
	 *  The thickness of the rule in pixels. 
	 */
	[Style(name="strokeWidth", type="Number", format="Length", inherit="yes")] 

	/**
	 *  The VRule control creates a single vertical line.
	 */
	public class VRule extends UIComponent
	{
		/**
		 *  @private
		 */
		private static const DEFAULT_PREFERRED_HEIGHT : Number = 100;

		/**
		 *  Constructor.
		 */
		public function VRule ();
		/**
		 *  @private
		 */
		protected function measure () : void;
		/**
		 *  @private
		 */
		protected function updateDisplayList (unscaledWidth:Number, unscaledHeight:Number) : void;
	}
}