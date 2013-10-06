﻿package fl.events
{
	/**
	 *  The DataGridEventReason class defines constants that are used for the  
	 */
	public class DataGridEventReason
	{
		/**
		 *  The user canceled editing and does not want to save the edited 
		 */
		public static const CANCELLED : String = "cancelled";
		/**
		 *  The list component lost focus, was scrolled, or is in a state where 
		 */
		public static const OTHER : String = "other";
		/**
		 *  The user moved focus to a new column in the same row.
		 */
		public static const NEW_COLUMN : String = "newColumn";
		/**
		 *  Indicates that the user moved focus to a new row.
		 */
		public static const NEW_ROW : String = "newRow";

	}
}