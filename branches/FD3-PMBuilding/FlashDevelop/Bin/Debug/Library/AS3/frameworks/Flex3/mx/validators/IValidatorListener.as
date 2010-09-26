﻿package mx.validators
{
	import mx.events.ValidationResultEvent;

	/**
	 *  The interface that components implement to support
	 */
	public interface IValidatorListener
	{
		/**
		 *  The text that will be displayed by a component's error tip when a
		 */
		public function get errorString () : String;
		/**
		 *  @private
		 */
		public function set errorString (value:String) : void;
		/**
		 *  Used by a validator to assign a subfield.
		 */
		public function get validationSubField () : String;
		/**
		 *  @private
		 */
		public function set validationSubField (value:String) : void;

		/**
		 *  Handles both the <code>valid</code> and <code>invalid</code> events
		 */
		public function validationResultHandler (event:ValidationResultEvent) : void;
	}
}