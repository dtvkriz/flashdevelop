﻿package fl.events
{
	/**
	 * The DataChangeType class defines constants for the <code>DataChangeEvent.changeType</code>
	 */
	public class DataChangeType
	{
		/**
		 * A change was made to the component data. This value does not affect the
		 */
		public static const CHANGE : String = "change";
		/**
		 * A change was made to the data contained in an item.
		 */
		public static const INVALIDATE : String = "invalidate";
		/**
		 * The data set is invalid.
		 */
		public static const INVALIDATE_ALL : String = "invalidateAll";
		/**
		 * Items were added to the data provider.
		 */
		public static const ADD : String = "add";
		/**
		 * Items were removed from the data provider.
		 */
		public static const REMOVE : String = "remove";
		/**
		 * All items were removed from the data provider.
		 */
		public static const REMOVE_ALL : String = "removeAll";
		/**
		 * The items in the data provider were replaced by new items.
		 */
		public static const REPLACE : String = "replace";
		/**
		 * The data provider was sorted. This constant is used to indicate
		 */
		public static const SORT : String = "sort";

	}
}