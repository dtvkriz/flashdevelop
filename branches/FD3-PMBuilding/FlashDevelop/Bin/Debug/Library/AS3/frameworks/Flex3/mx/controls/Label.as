﻿package mx.controls
{
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.text.StyleSheet;
	import flash.text.TextFormat;
	import flash.text.TextLineMetrics;
	import mx.controls.listClasses.BaseListData;
	import mx.controls.listClasses.IDropInListItemRenderer;
	import mx.controls.listClasses.IListItemRenderer;
	import mx.core.FlexVersion;
	import mx.core.IDataRenderer;
	import mx.core.IFlexModuleFactory;
	import mx.core.IFontContextComponent;
	import mx.core.IUITextField;
	import mx.core.UIComponent;
	import mx.core.UITextField;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.styles.StyleManager;

	/**
	 *  Dispatched when the <code>data</code> property changes.
	 */
	[Event(name="dataChange", type="mx.events.FlexEvent")] 
	/**
	 *  Dispatched when a user clicks a hyperlink in an 
	 */
	[Event(name="link", type="flash.events.TextEvent")] 
	/**
	 *  Number of pixels between the left of the Label and 
	 */
	[Style(name="paddingLeft", type="Number", format="Length", inherit="no")] 
	/**
	 *  Number of pixels between the right of the Label and 
	 */
	[Style(name="paddingRight", type="Number", format="Length", inherit="no")] 
	/**
	 *  Number of pixels between the bottom of the Label and 
	 */
	[Style(name="paddingBottom", type="Number", format="Length", inherit="no")] 
	/**
	 *  Number of pixels between the top of the Label and 
	 */
	[Style(name="paddingTop", type="Number", format="Length", inherit="no")] 

	/**
	 *  The Label control displays a single line of noneditable text.
	 */
	public class Label extends UIComponent implements IDataRenderer
	{
		/**
		 *  @private
		 */
		private var textSet : Boolean;
		/**
		 *  @private
		 */
		private var enabledChanged : Boolean;
		/**
		 *  The internal UITextField that renders the text of this Label.
		 */
		protected var textField : IUITextField;
		/**
		 *  @private
		 */
		private var toolTipSet : Boolean;
		/**
		 *  @private
		 */
		private var _condenseWhite : Boolean;
		/**
		 *  @private
		 */
		private var condenseWhiteChanged : Boolean;
		/**
		 *  @private
		 */
		private var _data : Object;
		/**
		 *  @private
		 */
		private var _htmlText : String;
		/**
		 *  @private
		 */
		local var htmlTextChanged : Boolean;
		/**
		 *  @private
		 */
		private var explicitHTMLText : String;
		/**
		 *  @private
		 */
		private var _listData : BaseListData;
		/**
		 *  @private
		 */
		private var _selectable : Boolean;
		/**
		 *  @private
		 */
		private var selectableChanged : Boolean;
		/**
		 *  @private
		 */
		private var _tabIndex : int;
		/**
		 *  @private
		 */
		private var _text : String;
		/**
		 *  @private
		 */
		local var textChanged : Boolean;
		/**
		 *  @private
		 */
		private var _textHeight : Number;
		/**
		 *  @private
		 */
		private var _textWidth : Number;
		/**
		 *  If this propery is <code>true</code>, and the Label control size is
		 */
		public var truncateToFit : Boolean;

		/**
		 *  @private
		 */
		public function get baselinePosition () : Number;
		/**
		 *  @private
		 */
		public function set enabled (value:Boolean) : void;
		/**
		 *  @private
		 */
		public function set toolTip (value:String) : void;
		/**
		 *  Specifies whether extra white space (spaces, line breaks,
		 */
		public function get condenseWhite () : Boolean;
		/**
		 *  @private
		 */
		public function set condenseWhite (value:Boolean) : void;
		/**
		 *  Lets you pass a value to the component
		 */
		public function get data () : Object;
		/**
		 *  @private
		 */
		public function set data (value:Object) : void;
		/**
		 *  @inheritDoc
		 */
		public function get fontContext () : IFlexModuleFactory;
		/**
		 *  @private
		 */
		public function set fontContext (moduleFactory:IFlexModuleFactory) : void;
		/**
		 *  Specifies the text displayed by the Label control, including HTML markup that
		 */
		public function get htmlText () : String;
		/**
		 *  @private
		 */
		public function set htmlText (value:String) : void;
		/**
		 *  @private
		 */
		private function get isHTML () : Boolean;
		/**
		 *  When a component is used as a drop-in item renderer or drop-in
		 */
		public function get listData () : BaseListData;
		/**
		 *  @private
		 */
		public function set listData (value:BaseListData) : void;
		/**
		 *  Specifies whether the text can be selected. 
		 */
		public function get selectable () : Boolean;
		/**
		 *  @private
		 */
		public function set selectable (value:Boolean) : void;
		/**
		 *  @private
		 */
		function get styleSheet () : StyleSheet;
		/**
		 *  @private
		 */
		function set styleSheet (value:StyleSheet) : void;
		/**
		 *  @private
		 */
		public function get tabIndex () : int;
		/**
		 *  @private
		 */
		public function set tabIndex (value:int) : void;
		/**
		 *  Specifies the plain text displayed by this control.
		 */
		public function get text () : String;
		/**
		 *  @private
		 */
		public function set text (value:String) : void;
		/**
		 *  The height of the text.
		 */
		public function get textHeight () : Number;
		/**
		 *  The width of the text.
		 */
		public function get textWidth () : Number;

		/**
		 *  Constructor.
		 */
		public function Label ();
		/**
		 *  @private
		 */
		protected function createChildren () : void;
		/**
		 *  @private
		 */
		protected function commitProperties () : void;
		/**
		 *  @private
		 */
		protected function measure () : void;
		/**
		 *  @private
		 */
		protected function updateDisplayList (unscaledWidth:Number, unscaledHeight:Number) : void;
		/**
		 *  @private
		 */
		function createTextField (childIndex:int) : void;
		/**
		 *  @private
		 */
		function removeTextField () : void;
		/**
		 *  Returns a TextLineMetrics object with information about the text 
		 */
		public function getLineMetrics (lineIndex:int) : TextLineMetrics;
		/**
		 *  @private
		 */
		private function textFieldChanged (styleChangeOnly:Boolean) : void;
		/**
		 *  @private
		 */
		private function measureTextFieldBounds (s:String) : Rectangle;
		/**
		 *  @private
		 */
		function getTextField () : IUITextField;
		/**
		 *  @private
		 */
		function getMinimumText (t:String) : String;
		/**
		 *  @private
		 */
		private function textField_textFieldStyleChangeHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function textField_textModifiedHandler (event:Event) : void;
	}
}