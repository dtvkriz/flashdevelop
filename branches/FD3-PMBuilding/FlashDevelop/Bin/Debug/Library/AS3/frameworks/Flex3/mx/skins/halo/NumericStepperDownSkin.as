﻿package mx.skins.halo
{
	import flash.display.GradientType;
	import flash.display.Graphics;
	import mx.skins.Border;
	import mx.styles.StyleManager;
	import mx.utils.ColorUtil;

	/**
	 *  The skin for all the states of the down button in a NumericStepper.
	 */
	public class NumericStepperDownSkin extends Border
	{
		/**
		 *  @private
		 */
		private static var cache : Object;

		/**
		 *  @private
		 */
		public function get measuredWidth () : Number;
		/**
		 *  @private
		 */
		public function get measuredHeight () : Number;

		/**
		 *  @private
		 */
		private static function calcDerivedStyles (themeColor:uint, borderColor:uint, fillColor0:uint, fillColor1:uint) : Object;
		/**
		 *  Constructor.
		 */
		public function NumericStepperDownSkin ();
		/**
		 *  @private
		 */
		protected function updateDisplayList (w:Number, h:Number) : void;
	}
}