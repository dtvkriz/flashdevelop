﻿package mx.validators
{
	/**
	 *  The EmailValidator class validates that a String has a single &#64; sign,
	 */
	public class EmailValidator extends Validator
	{
		/**
		 *  @private
		 */
		private static const DISALLOWED_LOCALNAME_CHARS : String = "()<>,;:[] `~!#$%^&*={}|/?'";
		/**
		 *  @private
		 */
		private static const DISALLOWED_DOMAIN_CHARS : String = "()<>,;:[] `~!#$%^&*+={}|/?'";
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
		private var _invalidDomainError : String;
		/**
		 *  @private
		 */
		private var invalidDomainErrorOverride : String;
		/**
		 *  @private
		 */
		private var _invalidIPDomainError : String;
		/**
		 *  @private
		 */
		private var invalidIPDomainErrorOverride : String;
		/**
		 *  @private
		 */
		private var _invalidPeriodsInDomainError : String;
		/**
		 *  @private
		 */
		private var invalidPeriodsInDomainErrorOverride : String;
		/**
		 *  @private
		 */
		private var _missingAtSignError : String;
		/**
		 *  @private
		 */
		private var missingAtSignErrorOverride : String;
		/**
		 *  @private
		 */
		private var _missingPeriodInDomainError : String;
		/**
		 *  @private
		 */
		private var missingPeriodInDomainErrorOverride : String;
		/**
		 *  @private
		 */
		private var _missingUsernameError : String;
		/**
		 *  @private
		 */
		private var missingUsernameErrorOverride : String;
		/**
		 *  @private
		 */
		private var _tooManyAtSignsError : String;
		/**
		 *  @private
		 */
		private var tooManyAtSignsErrorOverride : String;

		/**
		 *  Error message when there are invalid characters in the e-mail address.
		 */
		public function get invalidCharError () : String;
		/**
		 *  @private
		 */
		public function set invalidCharError (value:String) : void;
		/**
		 *  Error message when the suffix (the top level domain)
		 */
		public function get invalidDomainError () : String;
		/**
		 *  @private
		 */
		public function set invalidDomainError (value:String) : void;
		/**
		 *  Error message when the IP domain is invalid. The IP domain must be enclosed by square brackets.
		 */
		public function get invalidIPDomainError () : String;
		/**
		 *  @private
		 */
		public function set invalidIPDomainError (value:String) : void;
		/**
		 *  Error message when there are continuous periods in the domain.
		 */
		public function get invalidPeriodsInDomainError () : String;
		/**
		 *  @private
		 */
		public function set invalidPeriodsInDomainError (value:String) : void;
		/**
		 *  Error message when there is no at sign in the email address.
		 */
		public function get missingAtSignError () : String;
		/**
		 *  @private
		 */
		public function set missingAtSignError (value:String) : void;
		/**
		 *  Error message when there is no period in the domain.
		 */
		public function get missingPeriodInDomainError () : String;
		/**
		 *  @private
		 */
		public function set missingPeriodInDomainError (value:String) : void;
		/**
		 *  Error message when there is no username.
		 */
		public function get missingUsernameError () : String;
		/**
		 *  @private
		 */
		public function set missingUsernameError (value:String) : void;
		/**
		 *  Error message when there is more than one at sign in the e-mail address.
		 */
		public function get tooManyAtSignsError () : String;
		/**
		 *  @private
		 */
		public function set tooManyAtSignsError (value:String) : void;

		/**
		 *  Convenience method for calling a validator
		 */
		public static function validateEmail (validator:EmailValidator, value:Object, baseField:String) : Array;
		/**
		 * Validate a given IP address
		 */
		private static function isValidIPAddress (ipAddr:String) : Boolean;
		/**
		 *  Constructor.
		 */
		public function EmailValidator ();
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