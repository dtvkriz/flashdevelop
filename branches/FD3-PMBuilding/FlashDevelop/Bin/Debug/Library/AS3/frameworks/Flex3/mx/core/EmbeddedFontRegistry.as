﻿package mx.core
{
	import flash.text.FontStyle;
	import flash.utils.Dictionary;

	/**
	 *  @private
	 */
	public class EmbeddedFontRegistry implements IEmbeddedFontRegistry
	{
		/**
		 *  @private
		 */
		private static var fonts : Object;
		/**
		 *  @private
		 */
		private static var instance : IEmbeddedFontRegistry;

		/**
		 *  @private
		 */
		public static function getInstance () : IEmbeddedFontRegistry;
		/**
		 *  @private
		 */
		private static function createFontKey (font:EmbeddedFont) : String;
		/**
		 * Create an embedded font from a font key.
		 */
		private static function createEmbeddedFont (key:String) : EmbeddedFont;
		/**
		 * Test if a string end with another string.
		 */
		private static function endsWith (s:String, match:String) : int;
		/**
		 *  @private
		 */
		public static function registerFonts (fonts:Object, moduleFactory:IFlexModuleFactory) : void;
		/**
		 *  Convert a font styles into a String as using by flash.text.FontStyle.
		 */
		public static function getFontStyle (bold:Boolean, italic:Boolean) : String;
		/**
		 *  @inheritDoc
		 */
		public function registerFont (font:EmbeddedFont, moduleFactory:IFlexModuleFactory) : void;
		/**
		 *  @inheritDoc
		 */
		public function deregisterFont (font:EmbeddedFont, moduleFactory:IFlexModuleFactory) : void;
		/**
		 *  @inheritDoc
		 */
		public function getFonts () : Array;
		/**
		 *  @inheritDoc
		 */
		public function getAssociatedModuleFactory (font:EmbeddedFont, defaultModuleFactory:IFlexModuleFactory) : IFlexModuleFactory;
	}
}