﻿package mx.core
{
	import flash.text.TextField;
	import flash.utils.Dictionary;

	/**
	 *  @private
	 */
	public class TextFieldFactory implements ITextFieldFactory
	{
		/**
		 *  @private
		 */
		private static var instance : ITextFieldFactory;
		/**
		 *  @private
		 */
		private var textFields : Dictionary;

		/**
		 *  @private
		 */
		public static function getInstance () : ITextFieldFactory;
		/**
		 *  @private
		 */
		public function createTextField (moduleFactory:IFlexModuleFactory) : TextField;
	}
}