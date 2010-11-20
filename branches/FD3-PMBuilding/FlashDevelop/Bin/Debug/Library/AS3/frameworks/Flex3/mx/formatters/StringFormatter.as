﻿package mx.formatters
{
	/**
	 *  @private
	 */
	public class StringFormatter
	{
		/**
		 *  @private
		 */
		private var extractToken : Function;
		/**
		 *  @private
		 */
		private var reqFormat : String;
		/**
		 *  @private
		 */
		private var patternInfo : Array;

		/**
		 *  Constructor.
		 */
		public function StringFormatter (format:String, tokens:String, extractTokenFunc:Function);
		/**
		 *  Returns the formatted String using the format, tokens,
		 */
		public function formatValue (value:Object) : String;
		/**
		 *  @private
		 */
		private function formatPattern (format:String, tokens:String) : void;
		/**
		 *  @private
		 */
		private function compareValues (a:Object, b:Object) : int;
	}
}