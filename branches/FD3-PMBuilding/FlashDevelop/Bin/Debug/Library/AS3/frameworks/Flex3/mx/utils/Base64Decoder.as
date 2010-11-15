﻿package mx.utils
{
	import flash.utils.ByteArray;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;

	/**
	 * A utility class to decode a Base64 encoded String to a ByteArray.
	 */
	public class Base64Decoder
	{
		private var count : int;
		private var data : ByteArray;
		private var filled : int;
		private var work : Array;
		/**
		 *  @private 
		 */
		private var resourceManager : IResourceManager;
		private static const ESCAPE_CHAR_CODE : Number = 61;
		private static const inverse : Array = [];

		/**
		 * Constructor.
		 */
		public function Base64Decoder ();
		/**
		 * Decodes a Base64 encoded String and adds the result to an internal
		 */
		public function decode (encoded:String) : void;
		/**
		 * @private
		 */
		public function drain () : ByteArray;
		/**
		 * @private
		 */
		public function flush () : ByteArray;
		/**
		 * Clears all buffers and resets the decoder to its initial state.
		 */
		public function reset () : void;
		/**
		 * Returns the current buffer as a decoded <code>flash.utils.ByteArray</code>.
		 */
		public function toByteArray () : ByteArray;
		private static function copyByteArray (source:ByteArray, destination:ByteArray, length:uint = 0) : void;
	}
}