﻿package mx.validators
{
	import mx.managers.ISystemManager;
	import mx.managers.SystemManager;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;

	/**
	 *  The PhoneNumberValidator class validates that a string
	 */
	public class PhoneNumberValidator extends Validator
	{
		/**
		 *  @private
		 */
		private var _allowedFormatChars : String;
		/**
		 *  @private
		 */
		private var allowedFormatCharsOverride : String;
		/**
		 *  @private
		 */
		private var _invalidCharError : String;
		/**
		 *  @private
		 */
		private var invalidCharErrorOverride : String;
		/**
		 *  @private
		 */
		private var _wrongLengthError : String;
		/**
		 *  @private
		 */
		private var wrongLengthErrorOverride : String;

		/**
		 *  The set of allowable formatting characters.
		 */
		public function get allowedFormatChars () : String;
		/**
		 *  @private
		 */
		public function set allowedFormatChars (value:String) : void;
		/**
		 *  Error message when the value contains invalid characters.
		 */
		public function get invalidCharError () : String;
		/**
		 *  @private
		 */
		public function set invalidCharError (value:String) : void;
		/**
		 *  Error message when the value has fewer than 10 digits.
		 */
		public function get wrongLengthError () : String;
		/**
		 *  @private
		 */
		public function set wrongLengthError (value:String) : void;

		/**
		 *  Convenience method for calling a validator
		 */
		public static function validatePhoneNumber (validator:PhoneNumberValidator, value:Object, baseField:String) : Array;
		/**
		 *  Constructor.
		 */
		public function PhoneNumberValidator ();
		/**
		 *  @private
		 */
		protected function resourcesChanged () : void;
		/**
		 *  Override of the base class <code>doValidation()</code> method
		 */
		protected function doValidation (value:Object) : Array;
	}
}