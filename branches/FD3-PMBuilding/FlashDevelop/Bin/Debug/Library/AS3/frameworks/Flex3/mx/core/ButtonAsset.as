﻿package mx.core
{
	import mx.core.FlexSimpleButton;

	/**
	 *  ButtonAsset is a subclass of the flash.display.SimpleButton class
	 */
	public class ButtonAsset extends FlexSimpleButton implements IFlexAsset
	{
		/**
		 *  @private
		 */
		private var _measuredHeight : Number;
		/**
		 *  @private
		 */
		private var _measuredWidth : Number;

		/**
		 *  @inheritDoc
		 */
		public function get measuredHeight () : Number;
		/**
		 *  @inheritDoc
		 */
		public function get measuredWidth () : Number;

		/**
		 *  Constructor.
		 */
		public function ButtonAsset ();
		/**
		 *  @inheritDoc
		 */
		public function move (x:Number, y:Number) : void;
		/**
		 *  @inheritDoc
		 */
		public function setActualSize (newWidth:Number, newHeight:Number) : void;
	}
}