﻿package fl.accessibility
{
	import flash.accessibility.Accessibility;
	import flash.accessibility.AccessibilityProperties;
	import fl.controls.ScrollBar;
	import fl.core.UIComponent;
	import flash.events.Event;

	/**
	 * The UIComponentAccImpl class, also called the UIComponent Accessibility Implementation class,
	 */
	public class UIComponentAccImpl extends AccessibilityProperties
	{
		/**
		 *  @private
		 */
		private static var accessibilityHooked : Boolean;
		/**
		 *  @private (protected)
		 */
		protected var master : UIComponent;

		/**
		 * @private
		 */
		private static function hookAccessibility () : Boolean;
		/**
		 *  @private
		 */
		public static function createAccessibilityImplementation (component:UIComponent) : void;
		/**
		 *  Enables accessibility for a UIComponent component.
		 */
		public static function enableAccessibility () : void;
		/**
		 * @private
		 */
		public function UIComponentAccImpl (component:UIComponent);
		/**
		 *  @private (protected)
		 */
		protected function eventHandler (event:Event) : void;
	}
}