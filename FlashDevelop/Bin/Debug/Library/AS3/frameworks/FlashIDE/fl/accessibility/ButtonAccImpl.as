﻿package fl.accessibility
{
	import fl.controls.Button;
	import fl.core.UIComponent;

	/**
	 *  The ButtonAccImpl class, also called the Button Accessibility Implementation class, 
	 */
	public class ButtonAccImpl extends LabelButtonAccImpl
	{
		/**
		 *  @private
		 */
		private static var accessibilityHooked : Boolean;

		/**
		 *  @private
		 */
		private static function hookAccessibility () : Boolean;
		/**
		 *  @private
		 */
		public static function createAccessibilityImplementation (component:UIComponent) : void;
		/**
		 * Enables accessibility for a Button component.
		 */
		public static function enableAccessibility () : void;
		/**
		 * @private
		 */
		public function ButtonAccImpl (component:UIComponent);
	}
}