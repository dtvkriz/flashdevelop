﻿package mx.events
{
	/**
	 *  Constants for the values of the <code>reason</code> property of a 
	 */
	public class ListEventReason
	{
		/**
		 *  Specifies that the user cancelled editing and that they do not 
		 */
		public static const CANCELLED : String = "cancelled";
		/**
		 *  Specifies that the list control lost focus, was scrolled, 
		 */
		public static const OTHER : String = "other";
		/**
		 *  Specifies that the user moved focus to a new row in the control. 
		 */
		public static const NEW_ROW : String = "newRow";

	}
}