﻿package mx.controls.dataGridClasses
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.utils.Dictionary;
	import mx.controls.DataGrid;
	import mx.controls.TextInput;
	import mx.controls.listClasses.IListItemRenderer;
	import mx.core.ClassFactory;
	import mx.core.EmbeddedFont;
	import mx.core.EmbeddedFontRegistry;
	import mx.core.IEmbeddedFontRegistry;
	import mx.core.IFactory;
	import mx.core.IFlexModuleFactory;
	import mx.core.IIMESupport;
	import mx.core.mx_internal;
	import mx.core.Singleton;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;
	import mx.utils.StringUtil;
	import mx.core.ContextualClassFactory;

	/**
	 *  The Background color of the column.
	 */
	[Style(name="backgroundColor", type="uint", format="Color", inherit="no")] 
	/**
	 *  The name of a CSS style declaration for controlling other aspects of
	 */
	[Style(name="headerStyleName", type="String", inherit="no")] 
	/**
	 *  The number of pixels between the container's left border and its content 
	 */
	[Style(name="paddingLeft", type="Number", format="Length", inherit="no")] 
	/**
	 *  The number of pixels between the container's right border and its content 
	 */
	[Style(name="paddingRight", type="Number", format="Length", inherit="no")] 

	/**
	 *  The DataGridColumn class describes a column in a DataGrid control.
	 */
	public class DataGridColumn extends CSSStyleDeclaration implements IIMESupport
	{
		/**
		 *  @private
		 */
		private static var _embeddedFontRegistry : IEmbeddedFontRegistry;
		/**
		 *  @private
		 */
		local var owner : DataGridBase;
		/**
		 *  @private
		 */
		local var explicitWidth : Number;
		/**
		 *  @private
		 */
		private var oldEmbeddedFontContext : IFlexModuleFactory;
		/**
		 *  @private
		 */
		private var fontPropertiesSet : Boolean;
		/**
		 *  @private
		 */
		private var hasFontContextBeenSaved : Boolean;
		/**
		 * @private
		 */
		private var cachedEmbeddedFont : EmbeddedFont;
		/**
		 *  Indicates whether the column sort is
		 */
		public var sortDescending : Boolean;
		/**
		 *  @private
		 */
		private var _itemRenderer : IFactory;
		/**
		 *  @private
		 */
		local var colNum : Number;
		/**
		 *  The name of the field or property in the data provider item associated 
		 */
		public var dataField : String;
		/**
		 *  @private
		 */
		private var _dataTipField : String;
		/**
		 *  @private
		 */
		private var _dataTipFunction : Function;
		/**
		 *  A flag that indicates whether the user is allowed to drag
		 */
		public var draggable : Boolean;
		/**
		 *  A flag that indicates whether the items in the column are editable.
		 */
		public var editable : Boolean;
		/**
		 *  A class factory for the instances of the item editor to use for the 
		 */
		public var itemEditor : IFactory;
		/**
		 *  The name of the property of the item editor that contains the new
		 */
		public var editorDataField : String;
		/**
		 *  The height of the item editor, in pixels, relative to the size of the 
		 */
		public var editorHeightOffset : Number;
		/**
		 *  The width of the item editor, in pixels, relative to the size of the 
		 */
		public var editorWidthOffset : Number;
		/**
		 *  The x location of the upper-left corner of the item editor,
		 */
		public var editorXOffset : Number;
		/**
		 *  The y location of the upper-left corner of the item editor,
		 */
		public var editorYOffset : Number;
		/**
		 *  A flag that indicates whether the item editor uses Enter key.
		 */
		public var editorUsesEnterKey : Boolean;
		/**
		 *  @private
		 */
		private var _headerRenderer : IFactory;
		/**
		 *  @private
		 */
		private var _headerText : String;
		/**
		 *  @private
		 */
		private var _headerWordWrap : *;
		/**
		 *  @private
		 */
		private var _imeMode : String;
		/**
		 *  A flag that indicates that the item renderer is also an item editor.
		 */
		public var rendererIsEditor : Boolean;
		/**
		 *  @private
		 */
		private var _labelFunction : Function;
		/**
		 *  @private
		 */
		private var _minWidth : Number;
		/**
		 *  @private
		 */
		private var _nullItemRenderer : IFactory;
		/**
		 *  A flag that indicates whether the user is allowed to resize
		 */
		public var resizable : Boolean;
		/**
		 *  @private
		 */
		private var _showDataTips : *;
		/**
		 *  A flag that indicates whether the user can click on the
		 */
		public var sortable : Boolean;
		/**
		 *  @private
		 */
		private var _sortCompareFunction : Function;
		/**
		 *  @private
		 */
		private var _visible : Boolean;
		local var newlyVisible : Boolean;
		/**
		 *  @private
		 */
		private var _width : Number;
		local var preferredWidth : Number;
		/**
		 *  @private
		 */
		private var _wordWrap : *;
		/**
		 *  @private
		 */
		local var measuringObjects : Dictionary;
		/**
		 *  A map of free item renderers by factory.
		 */
		local var freeItemRenderersByFactory : Dictionary;

		/**
		 *  @private
		 */
		private static function get embeddedFontRegistry () : IEmbeddedFontRegistry;
		/**
		 *  The class factory for item renderer instances that display the 
		 */
		public function get itemRenderer () : IFactory;
		/**
		 *  @private
		 */
		public function set itemRenderer (value:IFactory) : void;
		/**
		 *  The name of the field in the data provider to display as the datatip. 
		 */
		public function get dataTipField () : String;
		/**
		 *  @private
		 */
		public function set dataTipField (value:String) : void;
		/**
		 *  Specifies a callback function to run on each item of the data provider 
		 */
		public function get dataTipFunction () : Function;
		/**
		 *  @private
		 */
		public function set dataTipFunction (value:Function) : void;
		/**
		 *  The class factory for item renderer instances that display the 
		 */
		public function get headerRenderer () : IFactory;
		/**
		 *  @private
		 */
		public function set headerRenderer (value:IFactory) : void;
		/**
		 *  Text for the header of this column. By default, the DataGrid
		 */
		public function get headerText () : String;
		/**
		 *  @private
		 */
		public function set headerText (value:String) : void;
		/**
		 *  A flag that indicates whether text in the header will be
		 */
		public function get headerWordWrap () : *;
		/**
		 *  @private
		 */
		public function set headerWordWrap (value:*) : void;
		/**
		 *  Specifies the IME (input method editor) mode. 
		 */
		public function get imeMode () : String;
		/**
		 *  @private
		 */
		public function set imeMode (value:String) : void;
		/**
		 *  A function that determines the text to display in this column.  By default
		 */
		public function get labelFunction () : Function;
		/**
		 *  @private
		 */
		public function set labelFunction (value:Function) : void;
		/**
		 *  The minimum width of the column.
		 */
		public function get minWidth () : Number;
		/**
		 *  @private
		 */
		public function set minWidth (value:Number) : void;
		/**
		 *  The class factory for item renderer instances that display the 
		 */
		public function get nullItemRenderer () : IFactory;
		/**
		 *  @private
		 */
		public function set nullItemRenderer (value:IFactory) : void;
		/**
		 *  A flag that indicates whether the datatips are shown in the column.
		 */
		public function get showDataTips () : *;
		/**
		 *  @private
		 */
		public function set showDataTips (value:*) : void;
		/**
		 *
		 */
		public function get sortCompareFunction () : Function;
		/**
		 *  @private
		 */
		public function set sortCompareFunction (value:Function) : void;
		/**
		 *  A flag that indicates whethe the column is visible.
		 */
		public function get visible () : Boolean;
		/**
		 *  @private
		 */
		public function set visible (value:Boolean) : void;
		/**
		 *  The width of the column, in pixels. 
		 */
		public function get width () : Number;
		/**
		 *  @private
		 */
		public function set width (value:Number) : void;
		/**
		 *  A flag that indicates whether the text in a row of this column
		 */
		public function get wordWrap () : *;
		/**
		 *  @private
		 */
		public function set wordWrap (value:*) : void;

		/**
		 *  Constructor.
		 */
		public function DataGridColumn (columnName:String = null);
		/**
		 *  @private
		 */
		function setWidth (value:Number) : void;
		/**
		 *  @private
		 */
		function addStyleToProtoChain (chain:Object, target:DisplayObject, filterMap:Object = null) : Object;
		/**
		 *  @private
		 */
		public function setStyle (styleProp:String, value:*) : void;
		/**
		 *  Returns the String that the item renderer displays for the given data object.
		 */
		public function itemToLabel (data:Object) : String;
		/**
		 *  Returns a String that the item renderer displays as the datatip for the given data object,
		 */
		public function itemToDataTip (data:Object) : String;
		/**
		 *  Return the appropriate factory, using the default factory if none specified.
		 */
		public function getItemRendererFactory (forHeader:Boolean, data:Object) : IFactory;
		/**
		 * @private
		 */
		private function replaceItemRendererFactory (rendererFactory:IFactory) : IFactory;
		function getMeasuringRenderer (forHeader:Boolean, data:Object) : IListItemRenderer;
		/**
		 * @private
		 */
		function getEmbeddedFont (fontName:String, bold:Boolean, italic:Boolean) : EmbeddedFont;
		/**
		 * @private
		 */
		private function saveFontContext (flexModuleFactory:IFlexModuleFactory) : void;
		/**
		 *  @private
		 */
		function hasFontContextChanged (flexModuleFactory:IFlexModuleFactory) : Boolean;
	}
}