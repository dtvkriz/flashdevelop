﻿package fl.accessibility
{
	import flash.accessibility.Accessibility;
	import flash.events.Event;
	import fl.controls.listClasses.ICellRenderer;
	import fl.controls.List;
	import fl.core.UIComponent;

	/**
	 * The ListAccImpl class, also called the List Accessiblity Implementation class, 
	 */
	public class ListAccImpl extends SelectableListAccImpl
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
		 *  Enables accessibility for a List component.
		 */
		public static function enableAccessibility () : void;
		/**
		 * @private
		 */
		public function ListAccImpl (master:UIComponent);
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