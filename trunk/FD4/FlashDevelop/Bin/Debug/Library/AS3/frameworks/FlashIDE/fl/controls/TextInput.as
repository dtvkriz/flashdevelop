﻿package fl.controls
{
	import fl.controls.TextInput;
	import fl.controls.TextArea;
	import fl.core.InvalidationType;
	import fl.core.UIComponent;
	import fl.events.ComponentEvent;
	import fl.managers.IFocusManager;
	import fl.managers.IFocusManagerComponent;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.TextEvent;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.system.IME;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextLineMetrics;
	import flash.ui.Keyboard;

	/**
	 *  Dispatched when user input changes text in the TextInput component.
	 */
	[Event(name="change", type="flash.events.Event")] 
	/**
	 *  Dispatched when the user presses the Enter key.
	 */
	[Event(name="enter", type="fl.events.ComponentEvent")] 
	/**
	 *  Dispatched when the user inputs text.
	 */
	[Event(name="textInput", type="flash.events.TextEvent")] 
	/**
	 * The name of the class to use as a background for the TextInput
	 */
	[Style(name="upSkin", type="Class")] 
	/**
	 * The padding that separates the component border from the text, in pixels.
	 */
	[Style(name="textPadding", type="Number", format="Length")] 
	/**
	 * The name of the class to use as a background for the TextInput
	 */
	[Style(name="disabledSkin", type="Class")] 
	/**
	 * @copy fl.controls.LabelButton#style:embedFonts
	 */
	[Style(name="embedFonts", type="Boolean")] 

	/**
	 * The TextInput component is a single-line text component that
	 */
	public class TextInput extends UIComponent implements IFocusManagerComponent
	{
		/**
		 * A reference to the internal text field of the TextInput component.
		 */
		public var textField : TextField;
		/**
		 * @private (protected)
		 */
		protected var _editable : Boolean;
		/**
		 * @private (protected)
		 */
		protected var background : DisplayObject;
		/**
		 * @private (protected)
		 */
		protected var _html : Boolean;
		/**
		 * @private (protected)
		 */
		protected var _savedHTML : String;
		/**
		 * @private
		 */
		private static var defaultStyles : Object;
		/**
		 *  @private
		 */
		public static var createAccessibilityImplementation : Function;

		/**
		 * Gets or sets a string which contains the text that is currently in 
		 */
		public function get text () : String;
		/**
		 * @private (setter)
		 */
		public function set text (value:String) : void;
		/**
		 * @copy fl.core.UIComponent#enabled
		 */
		public function get enabled () : Boolean;
		/**
		 * @private (setter)
		 */
		public function set enabled (value:Boolean) : void;
		/**
		 * @copy fl.controls.TextArea#imeMode
		 */
		public function get imeMode () : String;
		/**
		 * @private (protected)
		 */
		public function set imeMode (value:String) : void;
		/**
		 * Gets or sets a Boolean value that indicates how a selection is
		 */
		public function get alwaysShowSelection () : Boolean;
		/**
		 * @private (setter)
		 */
		public function set alwaysShowSelection (value:Boolean) : void;
		/**
		 * Gets or sets a Boolean value that indicates whether the text field 
		 */
		public function get editable () : Boolean;
		/**
		 * @private (setter)
		 */
		public function set editable (value:Boolean) : void;
		/**
		 * Gets or sets the position of the thumb of the horizontal scroll bar.
		 */
		public function get horizontalScrollPosition () : int;
		/**
		 * @private (setter)
		 */
		public function set horizontalScrollPosition (value:int) : void;
		/**
		 * Gets a value that describes the furthest position to which the text 
		 */
		public function get maxHorizontalScrollPosition () : int;
		/**
		 * Gets the number of characters in a TextInput component.
		 */
		public function get length () : int;
		/**
		 * Gets or sets the maximum number of characters that a user can enter
		 */
		public function get maxChars () : int;
		/**
		 * @private (setter)
		 */
		public function set maxChars (value:int) : void;
		/**
		 * Gets or sets a Boolean value that indicates whether the current TextInput 
		 */
		public function get displayAsPassword () : Boolean;
		/**
		 * @private (setter)
		 */
		public function set displayAsPassword (value:Boolean) : void;
		/**
		 * Gets or sets the string of characters that the text field accepts from a user. 
		 */
		public function get restrict () : String;
		/**
		 * @private (setter)
		 */
		public function set restrict (value:String) : void;
		/**
		 * Gets the index value of the first selected character in a selection 
		 */
		public function get selectionBeginIndex () : int;
		/**
		 * Gets the index position of the last selected character in a selection 
		 */
		public function get selectionEndIndex () : int;
		/**
		 * Gets or sets a Boolean value that indicates whether extra white space is
		 */
		public function get condenseWhite () : Boolean;
		/**
		 * @private (setter)
		 */
		public function set condenseWhite (value:Boolean) : void;
		/**
		 * Contains the HTML representation of the string that the text field contains.
		 */
		public function get htmlText () : String;
		/**
		 * @private (setter)
		 */
		public function set htmlText (value:String) : void;
		/**
		 * The height of the text, in pixels.
		 */
		public function get textHeight () : Number;
		/**
		 * The width of the text, in pixels.
		 */
		public function get textWidth () : Number;

		/**
		 * @copy fl.core.UIComponent#getStyleDefinition()
		 */
		public static function getStyleDefinition () : Object;
		/**
		 * Creates a new TextInput component instance.
		 */
		public function TextInput ();
		/**
		 * @copy fl.core.UIComponent#drawFocus()
		 */
		public function drawFocus (draw:Boolean) : void;
		/**
		 * Sets the range of a selection made in a text area that has focus.
		 */
		public function setSelection (beginIndex:int, endIndex:int) : void;
		/**
		 * Retrieves information about a specified line of text.
		 */
		public function getLineMetrics (index:int) : TextLineMetrics;
		/**
		 * Appends the specified string after the last character that the TextArea 
		 */
		public function appendText (text:String) : void;
		/**
		 * @private (protected)
		 */
		protected function updateTextFieldType () : void;
		/**
		 * @private (protected)
		 */
		protected function handleKeyDown (event:KeyboardEvent) : void;
		/**
		 * @private (protected)
		 */
		protected function handleChange (event:Event) : void;
		/**
		 * @private (protected)
		 */
		protected function handleTextInput (event:TextEvent) : void;
		/**
		 * @private (protected)
		 */
		protected function setEmbedFont ();
		/**
		 * @private (protected)
		 */
		protected function draw () : void;
		/**
		 * @private (protected)
		 */
		protected function drawBackground () : void;
		/**
		 * @private (protected)
		 */
		protected function drawTextFormat () : void;
		/**
		 * @private (protected)
		 */
		protected function drawLayout () : void;
		/**
		 * @private (protected)
		 */
		protected function configUI () : void;
		/**
		 * @private (protected)
		 */
		public function setFocus () : void;
		/**
		 * @private (protected)
		 */
		protected function isOurFocus (target:DisplayObject) : Boolean;
		/**
		 * @private (protected)
		 */
		protected function focusInHandler (event:FocusEvent) : void;
		/**
		 * @private (protected)
		 */
		protected function focusOutHandler (event:FocusEvent) : void;
	}
}