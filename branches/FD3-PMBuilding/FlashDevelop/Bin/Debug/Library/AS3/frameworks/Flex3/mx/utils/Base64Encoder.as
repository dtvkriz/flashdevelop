﻿package mx.utils
{
	import flash.utils.ByteArray;

	/**
	 * A utility class to encode a String or ByteArray as a Base64 encoded String.
	 */
	public class Base64Encoder
	{
		public static const CHARSET_UTF_8 : String = "UTF-8";
		/**
		 * The character codepoint to be inserted into the encoded output to
		 */
		public static var newLine : int;
		/**
		 * A Boolean flag to control whether the sequence of characters specified
		 */
		public var insertNewLines : Boolean;
		/**
		 * An Array of buffer Arrays.
		 */
		private var _buffers : Array;
		private var _count : uint;
		private var _line : uint;
		private var _work : Array;
		/**
		 * This value represents a safe number of characters (i.e. arguments) that
		 */
		public static const MAX_BUFFER_SIZE : uint = 32767;
		private static const ESCAPE_CHAR_CODE : Number = 61;
		/**
		 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
		 */
		private static const ALPHABET_CHAR_CODES : Array = [];

		/**
		 * Constructor.
		 */
		public function Base64Encoder ();
		/**
		 * @private
		 */
		public function drain () : String;
		/**
		 * Encodes the characters of a String in Base64 and adds the result to
		 */
		public function encode (data:String, offset:uint = 0, length:uint = 0) : void;
		/**
		 * Encodes the UTF-8 bytes of a String in Base64 and adds the result to an
		 */
		public function encodeUTFBytes (data:String) : void;
		/**
		 * Encodes a ByteArray in Base64 and adds the result to an internal buffer.
		 */
		public function encodeBytes (data:ByteArray, offset:uint = 0, length:uint = 0) : void;
		/**
		 * @private
		 */
		public function flush () : String;
		/**
		 * Clears all buffers and resets the encoder to its initial state.
		 */
		public function reset () : void;
		/**
		 * Returns the current buffer as a Base64 encoded String. Note that
		 */
		public function toString () : String;
		/**
		 * @private
		 */
		private function encodeBlock () : void;
	}
}