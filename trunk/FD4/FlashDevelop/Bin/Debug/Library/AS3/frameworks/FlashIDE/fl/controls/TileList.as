﻿package fl.controls
{
	import fl.controls.listClasses.CellRenderer;
	import fl.controls.listClasses.ICellRenderer;
	import fl.controls.listClasses.ImageCell;
	import fl.controls.listClasses.ListData;
	import fl.controls.listClasses.TileListData;
	import fl.controls.ScrollBar;
	import fl.controls.ScrollBarDirection;
	import fl.controls.ScrollPolicy;
	import fl.controls.SelectableList;
	import fl.core.InvalidationType;
	import fl.core.UIComponent;
	import fl.data.DataProvider;
	import fl.data.TileListCollectionItem;
	import fl.events.DataChangeEvent;
	import fl.events.DataChangeType;
	import fl.events.ListEvent;
	import fl.events.ScrollEvent;
	import fl.managers.IFocusManagerComponent;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.utils.Dictionary;

	/**
	 * The skin to be used as the background of the TileList component.
	 */
	[Style(name="skin", type="Class")] 
	/**
	 * The cell renderer to be used to render each item in the TileList component.
	 */
	[Style(name="cellRenderer", type="Class")] 

	/**
	 * The TileList class provides a grid of rows and columns that is typically used
	 */
	public class TileList extends SelectableList implements IFocusManagerComponent
	{
		/**
		 * @private (protected)
		 */
		protected var _rowHeight : Number;
		/**
		 * @private (protected)
		 */
		protected var _columnWidth : Number;
		/**
		 * @private (protected)
		 */
		protected var _scrollDirection : String;
		/**
		 * @private (protected)
		 */
		protected var _scrollPolicy : String;
		/**
		 * @private (protected)
		 */
		protected var _cellRenderer : Object;
		/**
		 * @private (protected)
		 */
		protected var oldLength : uint;
		/**
		 * @private (protected)
		 */
		protected var _labelField : String;
		/**
		 * @private (protected)
		 */
		protected var _labelFunction : Function;
		/**
		 * @private (protected)
		 */
		protected var _iconField : String;
		/**
		 * @private (protected)
		 */
		protected var _iconFunction : Function;
		/**
		 * @private (protected)
		 */
		protected var _sourceField : String;
		/**
		 * @private (protected)
		 */
		protected var _sourceFunction : Function;
		/**
		 * @private (protected)
		 */
		protected var __rowCount : uint;
		/**
		 * @private (protected)
		 */
		protected var __columnCount : uint;
		/**
		 * @private
		 */
		private var collectionItemImport : TileListCollectionItem;
		/**
		 * @private
		 */
		private static var defaultStyles : Object;
		/**
		 *  @private
		 */
		public static var createAccessibilityImplementation : Function;

		/**
		 * @copy fl.controls.SelectableList#dataProvider
		 */
		public function get dataProvider () : DataProvider;
		/**
		 * @private (setter)
		 */
		public function set dataProvider (value:DataProvider) : void;
		/**
		 * Gets or sets a field in each item that contains a label for each tile.
		 */
		public function get labelField () : String;
		/**
		 * @private (setter)
		 */
		public function set labelField (value:String) : void;
		/**
		 * Gets a function that indicates the fields of an item that provide the label text for a tile.
		 */
		public function get labelFunction () : Function;
		/**
		 * @private (setter)
		 */
		public function set labelFunction (value:Function) : void;
		/**
		 * Gets or sets the item field that provides the icon for the item. 
		 */
		public function get iconField () : String;
		/**
		 * @private (setter)
		 */
		public function set iconField (value:String) : void;
		/**
		 * Gets or sets the function to be used to obtain the icon for the item. 
		 */
		public function get iconFunction () : Function;
		/**
		 * @private (setter)
		 */
		public function set iconFunction (value:Function) : void;
		/**
		 * Gets or sets the item field that provides the source path for a tile.
		 */
		public function get sourceField () : String;
		/**
		 * @private (setter)
		 */
		public function set sourceField (value:String) : void;
		/**
		 * Gets or sets the function to be used to obtain the source path for a tile.
		 */
		public function get sourceFunction () : Function;
		/**
		 * @private (setter)
		 */
		public function set sourceFunction (value:Function) : void;
		/**
		 * Gets or sets the number of rows that are at least partially visible 
		 */
		public function get rowCount () : uint;
		/**
		 * @private (setter)
		 */
		public function set rowCount (value:uint) : void;
		/**
		 * Gets or sets the height that is applied to each row in the list, in pixels.
		 */
		public function get rowHeight () : Number;
		/**
		 * @private (setter)
		 */
		public function set rowHeight (value:Number) : void;
		/**
		 * Gets or sets the number of columns that are at least partially visible in the 
		 */
		public function get columnCount () : uint;
		/**
		 * @private (setter)
		 */
		public function set columnCount (value:uint) : void;
		/**
		 * Gets or sets the width that is applied to a column in the list, in pixels.
		 */
		public function get columnWidth () : Number;
		/**
		 * @private (setter)
		 */
		public function set columnWidth (value:Number) : void;
		/**
		 * Gets the width of the content area, in pixels. This value is the component width
		 */
		public function get innerWidth () : Number;
		/**
		 * Gets the height of the content area, in pixels. This value is the component height
		 */
		public function get innerHeight () : Number;
		/**
		 * Gets or sets a value that indicates whether the TileList component scrolls 
		 */
		public function get direction () : String;
		/**
		 * @private (setter)
		 */
		public function set direction (value:String) : void;
		/**
		 * Gets or sets the scroll policy for the TileList component. This
		 */
		public function get scrollPolicy () : String;
		/**
		 * @private (setter)
		 */
		public function set scrollPolicy (value:String) : void;
		/**
		 * @private (hidden)
		 */
		public function get verticalScrollPolicy () : String;
		/**
		 * @private (setter)
		 */
		public function set verticalScrollPolicy (value:String) : void;
		/**
		 * @private (hidden)
		 */
		public function get horizontalScrollPolicy () : String;
		/**
		 * @private (setter)
		 */
		public function set horizontalScrollPolicy (value:String) : void;
		/**
		 * Gets the maximum horizontal scroll position for the current content, in pixels.
		 */
		public function get maxHorizontalScrollPosition () : Number;
		/**
		 * @private (setter)
		 */
		public function set maxHorizontalScrollPosition (value:Number) : void;

		/**
		 * @copy fl.core.UIComponent#getStyleDefinition()
		 */
		public static function getStyleDefinition () : Object;
		/**
		 * Creates a new List component instance.
		 */
		public function TileList ();
		/**
		 * @copy fl.controls.SelectableList#scrollToIndex()
		 */
		public function scrollToIndex (newCaretIndex:int) : void;
		/**
		 * Retrieves the string that the renderer displays for a given data object
		 */
		public function itemToLabel (item:Object) : String;
		/**
		 * @private (protected)
		 */
		protected function configUI () : void;
		/**
		 * @private (protected)
		 */
		protected function setHorizontalScrollPosition (scroll:Number, fireEvent:Boolean = false) : void;
		/**
		 * @private (protected)
		 */
		protected function setVerticalScrollPosition (scroll:Number, fireEvent:Boolean = false) : void;
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
		protected function drawList () : void;
		/**
		 * @private (protected)
		 */
		protected function keyDownHandler (event:KeyboardEvent) : void;
		/**
		 * @private (protected)
		 */
		protected function calculateAvailableHeight () : Number;
		/**
		 * @private (protected)
		 */
		protected function moveSelectionVertically (code:uint, shiftKey:Boolean, ctrlKey:Boolean) : void;
		/**
		 * @private (protected)
		 */
		protected function moveSelectionHorizontally (code:uint, shiftKey:Boolean, ctrlKey:Boolean) : void;
		/**
		 * @private (protected)
		 */
		protected function doKeySelection (newCaretIndex:uint, shiftKey:Boolean, ctrlKey:Boolean) : void;
		/**
		 * @private (protected)
		 */
		protected function initializeAccessibility () : void;
	}
}