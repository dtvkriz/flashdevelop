﻿package fl.controls.listClasses
{
	import fl.controls.listClasses.CellRenderer;
	import fl.controls.listClasses.ICellRenderer;
	import fl.controls.listClasses.ListData;
	import fl.controls.listClasses.TileListData;
	import fl.controls.TextInput;
	import fl.containers.UILoader;
	import fl.core.InvalidationType;
	import fl.core.UIComponent;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.events.IOErrorEvent;

	/**
	 * The skin that is used to indicate the selected state.
	 */
	[Style(name="selectedSkin", type="Class")] 
	/**
	 * The padding that separates the edge of the cell from the edge of the text, 
	 */
	[Style(name="textPadding", type="Number", format="Length")] 
	/**
	 * The padding that separates the edge of the cell from the edge of the image, 
	 */
	[Style(name="imagePadding", type="Number", format="Length")] 
	/**
	 * The opacity of the overlay behind the cell label.
	 */
	[Style(name="textOverlayAlpha", type="Number", format="Length")] 

	/**
	 * The ImageCell is the default cell renderer for the TileList
	 */
	public class ImageCell extends CellRenderer implements ICellRenderer
	{
		/**
		 * @private (protected)
		 */
		protected var textOverlay : Shape;
		/**
		 * @private (protected)
		 */
		protected var loader : UILoader;
		/**
		 * @private
		 */
		private static var defaultStyles : Object;

		/**
		 * Gets or sets the list properties that are applied to the cell, for example,
		 */
		public function get listData () : ListData;
		/**
		 * @private (setter)
		 */
		public function set listData (value:ListData) : void;
		/**
		 * Gets or sets an absolute or relative URL that identifies the 
		 */
		public function get source () : Object;
		/**
		 * @private (setter)
		 */
		public function set source (value:Object) : void;

		/**
		 * @copy fl.core.UIComponent#getStyleDefinition()
		 */
		public static function getStyleDefinition () : Object;
		/**
		 * Creates a new ImageCell instance.
		 */
		public function ImageCell ();
		/**
		 * @private (protected)
		 */
		protected function configUI () : void;
		/**
		 * @private (protected)
		 */
		protected function draw () : void;
		/**
		 * @private (protected)
		 */
		protected function drawLayout () : void;
		/**
		 * @private (protected)
		 */
		protected function handleErrorEvent (event:IOErrorEvent) : void;
	}
}