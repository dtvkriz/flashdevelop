﻿package mx.containers
{
	import mx.core.mx_internal;

	/**
	 *  Dispatched when the user selects the close button.
	 */
	[Event(name="close", type="mx.events.CloseEvent")] 
	/**
	 *  The close button default skin.
	 */
	[Style(name="closeButtonSkin", type="Class", inherit="no", states="up, over, down, disabled")] 
	/**
	 *  The close button disabled skin.
	 */
	[Style(name="closeButtonDisabledSkin", type="Class", inherit="no")] 
	/**
	 *  The close button down skin.
	 */
	[Style(name="closeButtonDownSkin", type="Class", inherit="no")] 
	/**
	 *  The close button over skin.
	 */
	[Style(name="closeButtonOverSkin", type="Class", inherit="no")] 
	/**
	 *  The close button up skin.
	 */
	[Style(name="closeButtonUpSkin", type="Class", inherit="no")] 

	/**
	 *  A TitleWindow layout container contains a title bar, a caption,
	 */
	public class TitleWindow extends Panel
	{
		/**
		 *  @private
		 */
		static var createAccessibilityImplementation : Function;

		/**
		 *  Whether to display a Close button in the TitleWindow container.
		 */
		public function get showCloseButton () : Boolean;
		/**
		 *  @private
		 */
		public function set showCloseButton (value:Boolean) : void;

		/**
		 *  Constructor.
		 */
		public function TitleWindow ();
		/**
		 *  @private
		 */
		protected function initializeAccessibility () : void;
	}
}