﻿package mx.events
{
	/**
	 *  The DataGridEventReason class defines constants for the values 
	 */
	public class DataGridEventReason
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
		 *  Specifies that the user moved focus to a new column in the same row. 
		 */
		public static const NEW_COLUMN : String = "newColumn";
		/**
		 *  Specifies that the user moved focus to a new row. 
		 */
		public static const NEW_ROW : String = "newRow";

	}
}