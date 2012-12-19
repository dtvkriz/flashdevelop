﻿package fl.accessibility
{
	import flash.accessibility.Accessibility;
	import flash.events.Event;
	import fl.controls.ComboBox;
	import fl.core.UIComponent;

	/**
	 * The ComboBoxAccImpl class, also called the ComboBox Accessibility Implementation class,
	 */
	public class ComboBoxAccImpl extends AccImpl
	{
		/**
		 * @private
		 */
		private static var accessibilityHooked : Boolean;
		/**
		 * @private
		 */
		private static const ROLE_SYSTEM_LISTITEM : uint = 0x22;
		/**
		 *  @private
		 */
		private static const STATE_SYSTEM_FOCUSED : uint = 0x00000004;
		/**
		 *  @private
		 */
		private static const STATE_SYSTEM_SELECTABLE : uint = 0x00200000;
		/**
		 *  @private
		 */
		private static const STATE_SYSTEM_SELECTED : uint = 0x00000002;
		/**
		 *  @private
		 */
		private static const EVENT_OBJECT_VALUECHANGE : uint = 0x800E;
		/**
		 *  @private
		 */
		private static const EVENT_OBJECT_SELECTION : uint = 0x8006;

		/**
		 *  @private
		 */
		protected function get eventsToHandle () : Array;

		/**
		 * @private
		 */
		private static function hookAccessibility () : Boolean;
		/**
		 *  @private
		 */
		public static function createAccessibilityImplementation (component:UIComponent) : void;
		/**
		 *  Enables accessibility for a ComboBox component.
		 */
		public static function enableAccessibility () : void;
		/**
		 * @private
		 */
		public function ComboBoxAccImpl (master:UIComponent);
		/**
		 *  @private
		 */
		public function get_accRole (childID:uint) : uint;
		/**
		 *  @private
		 */
		public function get_accValue (childID:uint) : String;
		/**
		 *  @private
		 */
		public function get_accState (childID:uint) : uint;
		/**
		 *  @private
		 */
		public function getChildIDArray () : Array;
		/**
		 *  @private
		 */
		protected function getName (childID:uint) : String;
		/**
		 *  @private
		 */
		protected function eventHandler (event:Event) : void;
	}
}