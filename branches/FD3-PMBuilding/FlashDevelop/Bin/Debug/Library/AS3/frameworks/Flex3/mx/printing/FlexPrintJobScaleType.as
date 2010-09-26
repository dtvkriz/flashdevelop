﻿package mx.printing
{
	/**
	 *  Values for the <code>scaleType</code> property
	 */
	public class FlexPrintJobScaleType
	{
		/**
		 *  Scales the object to fill at least one page completely; 
		 */
		public static const FILL_PAGE : String = "fillPage";
		/**
		 *  Scales the object to fill the available page height. 
		 */
		public static const MATCH_HEIGHT : String = "matchHeight";
		/**
		 *  Scales the object to fill the available page width. 
		 */
		public static const MATCH_WIDTH : String = "matchWidth";
		/**
		 *  Does not scale the output. 
		 */
		public static const NONE : String = "none";
		/**
		 *  Scales the object to fit on a single page, filling one dimension; 
		 */
		public static const SHOW_ALL : String = "showAll";

	}
}