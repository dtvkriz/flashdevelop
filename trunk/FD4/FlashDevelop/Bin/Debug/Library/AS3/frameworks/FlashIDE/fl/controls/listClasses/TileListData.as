﻿package fl.controls.listClasses
{
	import fl.controls.listClasses.ListData;
	import fl.core.UIComponent;

	/**
	 * TileListData is a messenger class that holds information relevant to a specific 
	 */
	public class TileListData extends ListData
	{
		/**
		 * @private (protected)
		 */
		protected var _source : Object;

		/**
		 * Gets or sets an absolute or relative URL that identifies the 
		 */
		public function get source () : Object;

		/**
		 * Creates a new instance of the TileListData class as specified by its 
		 */
		public function TileListData (label:String, icon:Object, source:Object, owner:UIComponent, index:uint, row:uint, col:uint = 0);
	}
}