﻿package fl.accessibility
{
	import flash.accessibility.Accessibility;
	import flash.events.Event;
	import fl.controls.listClasses.ICellRenderer;
	import fl.controls.TileList;
	import fl.core.UIComponent;

	/**
	 *  The TileListAccImpl class, also called the Tile List Accessibility Implementation class, is
	 */
	public class TileListAccImpl extends SelectableListAccImpl
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
		 *  Enables accessibility for a TileList component. This method is required for 
		 */
		public static function enableAccessibility () : void;
		/**
		 * @private
		 */
		public function TileListAccImpl (master:UIComponent);
		/**
		 *  @private
		 */
		public function get_accValue (childID:uint) : String;
		/**
		 *  @private
		 */
		protected function getName (childID:uint) : String;
	}
}