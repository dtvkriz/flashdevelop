﻿package fl.controls
{
	import fl.controls.LabelButton;
	import fl.core.InvalidationType;
	import fl.core.UIComponent;
	import fl.managers.IFocusManagerComponent;
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	/**
	 * The skin to be used when a button has emphasis.
	 */
	[Style(name="emphasizedSkin", type="Class")] 
	/**
	 * The padding to be applied around the Buttons in an 
	 */
	[Style(name="emphasizedPadding", type="Number", format="Length")] 

	/**
	 * The Button component represents a commonly used rectangular button. 
	 */
	public class Button extends LabelButton implements IFocusManagerComponent
	{
		/**
		 * @private (protected)
		 */
		protected var _emphasized : Boolean;
		/**
		 * @private (protected)
		 */
		protected var emphasizedBorder : DisplayObject;
		/**
		 * @private
		 */
		private static var defaultStyles : Object;
		/**
		 *  @private
		 */
		public static var createAccessibilityImplementation : Function;

		/**
		 * Gets or sets a Boolean value that indicates whether a border is drawn 
		 */
		public function get emphasized () : Boolean;
		/**
		 * @private (setter)
		 */
		public function set emphasized (value:Boolean) : void;

		/**
		 * @copy fl.core.UIComponent#getStyleDefinition()
		 */
		public static function getStyleDefinition () : Object;
		/**
		 * Creates a new Button component instance.
		 */
		public function Button ();
		/**
		 * @private (protected)
		 */
		protected function draw () : void;
		/**
		 * @private (protected)
		 */
		protected function drawEmphasized () : void;
		/**
		 * @private
		 */
		public function drawFocus (focused:Boolean) : void;
		/**
		 * @private (protected)
		 */
		protected function initializeAccessibility () : void;
	}
}