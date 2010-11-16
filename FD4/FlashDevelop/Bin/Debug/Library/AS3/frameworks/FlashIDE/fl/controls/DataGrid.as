﻿package fl.controls
{
	import fl.controls.dataGridClasses.DataGridColumn;
	import fl.controls.dataGridClasses.HeaderRenderer;
	import fl.controls.listClasses.CellRenderer;
	import fl.controls.listClasses.ICellRenderer;
	import fl.controls.listClasses.ListData;
	import fl.controls.ScrollPolicy;
	import fl.controls.SelectableList;
	import fl.controls.TextInput;
	import fl.core.UIComponent;
	import fl.core.InvalidationType;
	import fl.data.DataProvider;
	import fl.events.ScrollEvent;
	import fl.events.ListEvent;
	import fl.events.DataGridEvent;
	import fl.events.DataGridEventReason;
	import fl.events.DataChangeType;
	import fl.events.DataChangeEvent;
	import fl.managers.IFocusManager;
	import fl.managers.IFocusManagerComponent;
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.display.InteractiveObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.FocusEvent;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	import flash.display.DisplayObject;
	import flash.utils.Dictionary;
	import flash.utils.describeType;
	import flash.geom.Point;
	import flash.system.IME;

	/**
	 * Dispatched after the user clicks a header cell.
	 */
	[Event(name="headerRelease", type="fl.events.DataGridEvent")] 
	/**
	 * Dispatched after a user expands a column horizontally.
	 */
	[Event(name="columnStretch", type="fl.events.DataGridEvent")] 
	/**
	 * Dispatched after a user prepares to edit an item, for example,
	 */
	[Event(name="itemEditBeginning", type="fl.events.DataGridEvent")] 
	/**
	 *  Dispatched after the <code>editedItemPosition</code> property is set
	 */
	[Event(name="itemEditBegin", type="fl.events.DataGridEvent")] 
	/**
	 *  Dispatched when an item editing session ends for any reason.
	 */
	[Event(name="itemEditEnd", type="fl.events.DataGridEvent")] 
	/**
	 *  Dispatched after an item receives focus.
	 */
	[Event(name="itemFocusIn", type="fl.events.DataGridEvent")] 
	/**
	 *  Dispatched after an item loses focus.
	 */
	[Event(name="itemFocusOut", type="fl.events.DataGridEvent")] 
	/**
	 * The name of the class that provides the cursor that is used when 
	 */
	[Style(name="columnStretchCursorSkin", type="Class")] 
	/**
	 * The name of the class that provides the divider that appears
	 */
	[Style(name="columnDividerSkin", type="Class")] 
	/**
	 * The name of the class that provides the background for each column header.
	 */
	[Style(name="headerUpSkin", type="Class")] 
	/**
	 * The name of the class that provides the background for each column header
	 */
	[Style(name="headerOverSkin", type="Class")] 
	/**
	 * The name of the class that provides the background for each column header
	 */
	[Style(name="headerDownSkin", type="Class")] 
	/**
	 * The name of the class that provides the background for each column header
	 */
	[Style(name="headerDisabledSkin", type="Class")] 
	/**
	 * The name of the class that provides the sort arrow when the sorted
	 */
	[Style(name="headerSortArrowDescSkin", type="Class")] 
	/**
	 * The name of the class that provides the sort arrow when the sorted
	 */
	[Style(name="headerSortArrowAscSkin", type="Class")] 
	/**
	 * The format to be applied to the text contained in each column header.
	 */
	[Style(name="headerTextFormat", type="flash.text.TextFormat")] 
	/**
	 * The format to be applied to the text contained in each column header 
	 */
	[Style(name="headerDisabledTextFormat", type="flash.text.TextFormat")] 
	/**
	 * The padding that separates the column header border from the column header 
	 */
	[Style(name="headerTextPadding", type="Number", format="Length")] 
	/**
	 * The name of the class that provides each column header.
	 */
	[Style(name="headerRenderer", type="Class")] 

	/**
	 * The DataGrid class is a list-based component that provides a grid of
	 */
	public class DataGrid extends SelectableList implements IFocusManagerComponent
	{
		/**
		 * @private (protected)
		 */
		protected var _rowHeight : Number;
		/**
		 * @private (protected)
		 */
		protected var _headerHeight : Number;
		/**
		 * @private (protected)
		 */
		protected var _showHeaders : Boolean;
		/**
		 * @private (protected)
		 */
		protected var _columns : Array;
		/**
		 * @private (protected)
		 */
		protected var _minColumnWidth : Number;
		/**
		 * @private (protected)
		 */
		protected var header : Sprite;
		/**
		 * @private (protected)
		 */
		protected var headerMask : Sprite;
		/**
		 * @private (protected)
		 */
		protected var headerSortArrow : Sprite;
		/**
		 * @private (protected)
		 */
		protected var _cellRenderer : Object;
		/**
		 * @private (protected)
		 */
		protected var _headerRenderer : Object;
		/**
		 * @private (protected)
		 */
		protected var _labelFunction : Function;
		/**
		 * @private (protected)
		 */
		protected var visibleColumns : Array;
		/**
		 * @private (protected)
		 */
		protected var displayableColumns : Array;
		/**
		 * @private (protected)
		 */
		protected var columnsInvalid : Boolean;
		/**
		 * @private (protected)
		 */
		protected var minColumnWidthInvalid : Boolean;
		/**
		 * @private (protected)
		 */
		protected var activeCellRenderersMap : Dictionary;
		/**
		 * @private (protected)
		 */
		protected var availableCellRenderersMap : Dictionary;
		/**
		 * @private (protected)
		 */
		protected var dragHandlesMap : Dictionary;
		/**
		 * @private (protected)
		 */
		protected var columnStretchIndex : Number;
		/**
		 * @private (protected)
		 */
		protected var columnStretchStartX : Number;
		/**
		 * @private (protected)
		 */
		protected var columnStretchStartWidth : Number;
		/**
		 * @private (protected)
		 */
		protected var columnStretchCursor : Sprite;
		/**
		 *  @private (protected)
		 */
		protected var _sortIndex : int;
		/**
		 *  @private (protected)
		 */
		protected var lastSortIndex : int;
		/**
		 *  @private (protected)
		 */
		protected var _sortDescending : Boolean;
		/**
		 *  @private (protected)
		 */
		protected var _editedItemPosition : Object;
		/**
		 *  @private (protected)
		 */
		protected var editedItemPositionChanged : Boolean;
		/**
		 *  @private (protected)
		 */
		protected var proposedEditedItemPosition : *;
		/**
		 *  @private (protected)
		 */
		protected var actualRowIndex : int;
		/**
		 *  @private (protected)
		 */
		protected var actualColIndex : int;
		/**
		 *  @private (protected)
		 */
		protected var isPressed : Boolean;
		/**
		 *  @private (protected)
		 */
		protected var losingFocus : Boolean;
		/**
		 *  @private (protected)
		 */
		protected var maxHeaderHeight : Number;
		/**
		 *  @private (protected)
		 */
		protected var currentHoveredRow : int;
		/**
		 * @private (protected)
		 */
		private static var defaultStyles : Object;
		/**
		 * @private (protected)
		 */
		protected static const HEADER_STYLES : Object;
		/**
		 *  @private
		 */
		public var createAccessibilityImplementation : Function;
		/**
		 *  Indicates whether or not the user can edit items in the data provider.
		 */
		public var editable : Boolean;
		/**
		 *  Indicates whether the user can change the size of the
		 */
		public var resizableColumns : Boolean;
		/**
		 * Indicates whether the user can sort the items in the data provider 
		 */
		public var sortableColumns : Boolean;
		/**
		 *  A reference to the currently active instance of the item editor,
		 */
		public var itemEditorInstance : Object;

		/**
		 * @private (setter)
		 */
		public function set dataProvider (dataSource:DataProvider) : void;
		/**
		 * @private (protected)
		 */
		public function set enabled (value:Boolean) : void;
		/**
		 * Gets or sets a Boolean value that indicates whether the 
		 */
		public function get horizontalScrollPolicy () : String;
		/**
		 * @private (protected)
		 */
		public function set horizontalScrollPolicy (policy:String) : void;
		/**
		 * Gets or sets an array of DataGridColumn objects, one for each column that can be displayed.
		 */
		public function get columns () : Array;
		/**
		 * @private (setter)
		 */
		public function set columns (value:Array) : void;
		/**
		 * Gets or sets the minimum width of a DataGrid column, in pixels. 
		 */
		public function get minColumnWidth () : Number;
		/**
		 * @private (setter)
		 */
		public function set minColumnWidth (value:Number) : void;
		/**
		 * Gets or sets a function that determines which fields of each 
		 */
		public function get labelFunction () : Function;
		/**
		 * @private (setter)
		 */
		public function set labelFunction (value:Function) : void;
		/**
		 * Gets or sets the number of rows that are at least partially visible in the
		 */
		public function get rowCount () : uint;
		/**
		 * @private (setter)
		 */
		public function set rowCount (value:uint) : void;
		/**
		 * Gets or sets the height of each row in the DataGrid component, in pixels.
		 */
		public function get rowHeight () : Number;
		/**
		 * @private (setter)
		 */
		public function set rowHeight (value:Number) : void;
		/**
		 * Gets or sets the height of the DataGrid header, in pixels.
		 */
		public function get headerHeight () : Number;
		/**
		 * @private (setter)
		 */
		public function set headerHeight (value:Number) : void;
		/**
		 * Gets or sets a Boolean value that indicates whether the DataGrid component shows column headers. 
		 */
		public function get showHeaders () : Boolean;
		/**
		 * @private (setter)
		 */
		public function set showHeaders (value:Boolean) : void;
		/**
		 * Gets the index of the column to be sorted.
		 */
		public function get sortIndex () : int;
		/**
		 * Gets the order in which a column is sorted when 
		 */
		public function get sortDescending () : Boolean;
		/**
		 * @copy fl.controls.TextArea#imeMode
		 */
		public function get imeMode () : String;
		/**
		 * @private (protected)
		 */
		public function set imeMode (value:String) : void;
		/**
		 * Gets a reference to the item renderer in the DataGrid component whose item is currently being  
		 */
		public function get editedItemRenderer () : ICellRenderer;
		/**
		 * Gets or sets the column and row index of the item renderer for 
		 */
		public function get editedItemPosition () : Object;
		/**
		 * @private (setter)
		 */
		public function set editedItemPosition (value:Object) : void;

		/**
		 * @copy fl.core.UIComponent#getStyleDefinition()
		 */
		public static function getStyleDefinition () : Object;
		/**
		 * Creates a new DataGrid component instance.
		 */
		public function DataGrid ();
		/**
		 * @private (protected)
		 */
		public function setSize (w:Number, h:Number) : void;
		/**
		 * @private (protected)
		 */
		protected function calculateAvailableHeight () : Number;
		/**
		 * Adds a column to the end of the <code>columns</code> array.
		 */
		public function addColumn (column:*) : DataGridColumn;
		/**
		 * Inserts a column at the specified index in the <code>columns</code> array.
		 */
		public function addColumnAt (column:*, index:uint) : DataGridColumn;
		/**
		 * Removes the column that is located at the specified index of the <code>columns</code> array.
		 */
		public function removeColumnAt (index:uint) : DataGridColumn;
		/**
		 * Removes all columns from the DataGrid component.
		 */
		public function removeAllColumns () : void;
		/**
		 * Retrieves the column that is located at the specified index of the <code>columns</code> array.
		 */
		public function getColumnAt (index:uint) : DataGridColumn;
		/**
		 * Retrieves the index of the column of the specified name,
		 */
		public function getColumnIndex (name:String) : int;
		/**
		 * Retrieves the number of columns in the DataGrid component.
		 */
		public function getColumnCount () : uint;
		/**
		 * Resets the widths of the visible columns to the same size.
		 */
		public function spaceColumnsEqually () : void;
		/**
		 * Edits a given field or property in the DataGrid component.
		 */
		public function editField (index:uint, dataField:String, data:Object) : void;
		/**
		 * The DataGrid component has multiple cells for any given item, so the <code>itemToCellRenderer</code>
		 */
		public function itemToCellRenderer (item:Object) : ICellRenderer;
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
		protected function drawList () : void;
		/**
		 * @private (protected)
		 */
		protected function updateRendererStyles () : void;
		/**
		 * @private (protected)
		 */
		protected function removeCellRenderers () : void;
		/**
		 * @private (protected)
		 */
		protected function removeCellRenderersByColumn (col:DataGridColumn) : void;
		/**
		 * @private (protected)
		 */
		protected function handleCellRendererMouseEvent (event:MouseEvent) : void;
		/**
		 * @private (protected)
		 */
		protected function isHovered (renderer:ICellRenderer) : Boolean;
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
		public function columnItemToLabel (columnIndex:uint, item:Object) : String;
		/**
		 * @private (protected)
		 */
		protected function calculateColumnSizes () : void;
		/**
		 * @private (protected)
		 */
		protected function calculateContentWidth () : void;
		/**
		 * @private (protected)
		 */
		protected function handleHeaderRendererClick (event:MouseEvent) : void;
		/**
		 * @private (protected)
		 */
		public function resizeColumn (columnIndex:int, w:Number) : void;
		/**
		 *  @private (protected)
		 */
		protected function sortByColumn (index:int) : void;
		/**
		 * @private (protected)
		 */
		protected function createColumnsFromDataProvider () : void;
		/**
		 * @private (protected)
		 */
		protected function getVisibleColumnIndex (column:DataGridColumn) : int;
		/**
		 * @private (protected)
		 */
		protected function handleHeaderResizeOver (event:MouseEvent) : void;
		/**
		 * @private (protected)
		 */
		protected function handleHeaderResizeOut (event:MouseEvent) : void;
		/**
		 * @private (protected)
		 */
		protected function handleHeaderResizeDown (event:MouseEvent) : void;
		/**
		 * @private (protected)
		 */
		protected function handleHeaderResizeMove (event:MouseEvent) : void;
		/**
		 * @private (protected)
		 */
		protected function handleHeaderResizeUp (event:MouseEvent) : void;
		/**
		 * @private (protected)
		 */
		protected function showColumnStretchCursor (show:Boolean = true) : void;
		/**
		 * @private (protected)
		 */
		protected function positionColumnStretchCursor (event:MouseEvent) : void;
		/**
		 * @private (protected)
		 */
		protected function setEditedItemPosition (coord:Object) : void;
		/**
		 *  @private (protected)
		 */
		protected function commitEditedItemPosition (coord:Object) : void;
		/**
		 *  @private (protected)
		 */
		protected function itemEditorItemEditBeginningHandler (event:DataGridEvent) : void;
		/**
		 *  @private (protected)
		 */
		protected function itemEditorItemEditBeginHandler (event:DataGridEvent) : void;
		/**
		 *  @private (protected)
		 */
		protected function itemEditorItemEditEndHandler (event:DataGridEvent) : void;
		/**
		 *  @private (protected)
		 */
		protected function focusInHandler (event:FocusEvent) : void;
		/**
		 *  @private (protected)
		 */
		protected function focusOutHandler (event:FocusEvent) : void;
		/**
		 *  @private (protected)
		 */
		protected function editorMouseDownHandler (event:MouseEvent) : void;
		/**
		 *  @private (protected)
		 */
		protected function editorKeyDownHandler (event:KeyboardEvent) : void;
		/**
		 *  @private (protected)
		 */
		protected function findNextItemRenderer (shiftKey:Boolean) : Boolean;
		/**
		 *  @private (protected)
		 */
		protected function findNextEnterItemRenderer (event:KeyboardEvent) : void;
		/**
		 *  @private (protected)
		 */
		protected function mouseFocusChangeHandler (event:MouseEvent) : void;
		/**
		 *  @private (protected)
		 */
		protected function keyFocusChangeHandler (event:FocusEvent) : void;
		/**
		 *  @private
		 */
		private function itemEditorFocusOutHandler (event:FocusEvent) : void;
		/**
		 *  @private (protected)
		 */
		protected function deactivateHandler (event:Event) : void;
		/**
		 *  @private (protected)
		 */
		protected function mouseDownHandler (event:MouseEvent) : void;
		/**
		 *  @private (protected)
		 */
		protected function mouseUpHandler (event:MouseEvent) : void;
		/**
		 * @private (protected)
		 */
		protected function handleCellRendererClick (event:MouseEvent) : void;
		/**
		 *  Uses the editor specified by the <code>itemEditor</code> property to 
		 */
		public function createItemEditor (colIndex:uint, rowIndex:uint) : void;
		/**
		 *  Closes an item editor that is currently open on an item renderer. This method is 
		 */
		public function destroyItemEditor () : void;
		/**
		 *  @private (protected)
		 */
		protected function endEdit (reason:String) : Boolean;
		/**
		 * Get the instance of a cell renderer at the specified position
		 */
		public function getCellRendererAt (row:uint, column:uint) : ICellRenderer;
		/**
		 * @private (protected)
		 */
		protected function itemRendererContains (renderer:Object, object:DisplayObject) : Boolean;
		/**
		 * @private (protected)
		 */
		protected function handleDataChange (event:DataChangeEvent) : void;
		/**
		 * @private (protected)
		 */
		protected function keyDownHandler (event:KeyboardEvent) : void;
		/**
		 * @private (protected)
		 */
		protected function moveSelectionHorizontally (code:uint, shiftKey:Boolean, ctrlKey:Boolean) : void;
		/**
		 * @private (protected)
		 */
		protected function moveSelectionVertically (code:uint, shiftKey:Boolean, ctrlKey:Boolean) : void;
		/**
		 * @copy fl.controls.SelectableList#scrollToIndex()
		 */
		public function scrollToIndex (newCaretIndex:int) : void;
		/**
		 * @private (protected)
		 */
		protected function scrollToPosition (rowIndex:int, columnIndex:int) : void;
		/**
		 * @private (protected)
		 */
		protected function doKeySelection (newCaretIndex:int, shiftKey:Boolean, ctrlKey:Boolean) : void;
		/**
		 * @private (protected)
		 */
		protected function initializeAccessibility () : void;
	}
}