﻿package mx.validators
{
	import mx.managers.ISystemManager;
	import mx.managers.SystemManager;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;

	/**
	 *  The SocialSecurityValidator class validates that a String
	 */
	public class SocialSecurityValidator extends Validator
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
		private var _wrongFormatError : String;
		/**
		 *  @private
		 */
		private var wrongFormatErrorOverride : String;
		/**
		 *  @private
		 */
		private var _zeroStartError : String;
		/**
		 *  @private
		 */
		private var zeroStartErrorOverride : String;

		/**
		 *  Specifies the set of formatting characters allowed in the input.
		 */
		public function get allowedFormatChars () : String;
		/**
		 *  @private
		 */
		public function set allowedFormatChars (value:String) : void;
		/**
		 *  Error message when the value contains characters
		 */
		public function get invalidCharError () : String;
		/**
		 *  @private
		 */
		public function set invalidCharError (value:String) : void;
		/**
		 *  Error message when the value is incorrectly formatted.
		 */
		public function get wrongFormatError () : String;
		/**
		 *  @private
		 */
		public function set wrongFormatError (value:String) : void;
		/**
		 *  Error message when the value contains an invalid Social Security number.
		 */
		public function get zeroStartError () : String;
		/**
		 *  @private
		 */
		public function set zeroStartError (value:String) : void;

		/**
		 *  Convenience method for calling a validator.
		 */
		public static function validateSocialSecurity (validator:SocialSecurityValidator, value:Object, baseField:String) : Array;
		/**
		 *  Constructor.
		 */
		public function SocialSecurityValidator ();
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