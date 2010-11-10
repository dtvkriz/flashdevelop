﻿package mx.utils
{
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import mx.core.IPropertyChangeNotifier;
	import mx.core.IUIComponent;
	import mx.core.IUID;
	import mx.core.mx_internal;

	/**
	 *  The UIDUtil class is an all-static class
	 */
	public class UIDUtil
	{
		/**
		 *  @private
		 */
		private static const ALPHA_CHAR_CODES : Array = [];
		/**
		 *  This Dictionary records all generated uids for all existing items.
		 */
		private static var uidDictionary : Dictionary;

		/**
		 *  Generates a UID (unique identifier) based on ActionScript's
		 */
		public static function createUID () : String;
		/**
		 * Converts a 128-bit UID encoded as a ByteArray to a String representation.
		 */
		public static function fromByteArray (ba:ByteArray) : String;
		/**
		 * A utility method to check whether a String value represents a 
		 */
		public static function isUID (uid:String) : Boolean;
		/**
		 * Converts a UID formatted String to a ByteArray. The UID must be in the
		 */
		public static function toByteArray (uid:String) : ByteArray;
		/**
		 *  Returns the UID (unique identifier) for the specified object.
		 */
		public static function getUID (item:Object) : String;
		/**
		 * Returns the decimal representation of a hex digit.
		 */
		private static function getDigit (hex:String) : uint;
	}
}