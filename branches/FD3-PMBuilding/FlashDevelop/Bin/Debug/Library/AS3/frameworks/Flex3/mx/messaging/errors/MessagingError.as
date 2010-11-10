﻿package mx.messaging.errors
{
	/**
	 *  This is the base class for any messaging related error.
	 */
	public class MessagingError extends Error
	{
		/**
		 *  Constructs a new instance of a MessagingError with the
		 */
		public function MessagingError (msg:String);
		/**
		 *  Returns the string "[MessagingError]" by default, and includes the message property if defined.
		 */
		public function toString () : String;
	}
}