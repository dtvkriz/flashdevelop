﻿package mx.skins.halo
{
	import flash.display.GradientType;
	import flash.display.Graphics;
	import mx.skins.Border;
	import mx.styles.StyleManager;
	import mx.utils.ColorUtil;

	/**
	 *  The skin for all the states of the button in a ComboBox.
	 */
	public class ComboBoxArrowSkin extends Border
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
		public function ComboBoxArrowSkin ();
		/**
		 *  @private
		 */
		protected function updateDisplayList (w:Number, h:Number) : void;
	}
}