﻿package mx.core
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextLineMetrics;
	import flash.utils.getQualifiedClassName;
	import mx.automation.IAutomationObject;
	import mx.core.FlexVersion;
	import mx.managers.ISystemManager;
	import mx.managers.IToolTipManagerClient;
	import mx.managers.SystemManager;
	import mx.managers.ToolTipManager;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;
	import mx.styles.ISimpleStyleClient;
	import mx.styles.IStyleClient;
	import mx.styles.StyleManager;
	import mx.styles.StyleProtoChain;
	import mx.utils.StringUtil;

	/**
	 *  The UITextField class defines the component used by many Flex
	 */
	public class UITextField extends FlexTextField implements IAutomationObject
	{
		/**
		 *  @private
		 */
		static const TEXT_WIDTH_PADDING : int = 5;
		/**
		 *  @private
		 */
		static const TEXT_HEIGHT_PADDING : int = 4;
		/**
		 *  @private
		 */
		private static var truncationIndicatorResource : String;
		/**
		 *  @private
		 */
		static var debuggingBorders : Boolean;
		/**
		 *  @private
		 */
		private static var _embeddedFontRegistry : IEmbeddedFontRegistry;
		/**
		 *  @private
		 */
		private var cachedTextFormat : TextFormat;
		/**
		 * @private
		 */
		private var cachedEmbeddedFont : EmbeddedFont;
		/**
		 *  @private
		 */
		private var invalidateDisplayListFlag : Boolean;
		/**
		 *  @private
		 */
		local var styleChangedFlag : Boolean;
		/**
		 *  @private
		 */
		private var explicitHTMLText : String;
		/**
		 *  @private
		 */
		local var explicitColor : uint;
		/**
		 *  @private
		 */
		private var resourceManager : IResourceManager;
		/**
		 *  @private
		 */
		private var untruncatedText : String;
		/**
		 *  @private
		 */
		local var _parent : DisplayObjectContainer;
		/**
		 *  @private
		 */
		private var _automationDelegate : IAutomationObject;
		/**
		 *  @private
		 */
		private var _automationName : String;
		/**
		 *  @private
		 */
		private var _document : Object;
		/**
		 *  @private
		 */
		private var _enabled : Boolean;
		/**
		 *  @private
		 */
		private var _explicitHeight : Number;
		/**
		 *  @private
		 */
		private var _explicitWidth : Number;
		/**
		 *  @private
		 */
		private var _ignorePadding : Boolean;
		/**
		 *  @private
		 */
		private var _imeMode : String;
		/**
		 *  @private
		 */
		private var _includeInLayout : Boolean;
		/**
		 *  @private
		 */
		private var _inheritingStyles : Object;
		/**
		 *  @private
		 */
		private var _initialized : Boolean;
		/**
		 *  @private
		 */
		private var _moduleFactory : IFlexModuleFactory;
		/**
		 *  @private
		 */
		private var _nestLevel : int;
		/**
		 *  @private
		 */
		private var _nonInheritingStyles : Object;
		/**
		 *  @private
		 */
		private var _processedDescriptors : Boolean;
		/**
		 *  @private
		 */
		private var _styleName : Object;
		/**
		 *  @private
		 */
		local var _toolTip : String;
		/**
		 *  @private
		 */
		private var _updateCompletePendingFlag : Boolean;
		/**
		 *  @private
		 */
		private var _owner : DisplayObjectContainer;

		/**
		 *  @private
		 */
		private static function get embeddedFontRegistry () : IEmbeddedFontRegistry;
		/**
		 *  @private
		 */
		public function set htmlText (value:String) : void;
		/**
		 *  The parent container or component for this component.
		 */
		public function get parent () : DisplayObjectContainer;
		/**
		 *  @private
		 */
		public function set text (value:String) : void;
		/**
		 *  The delegate object which is handling the automation related functionality.
		 */
		public function get automationDelegate () : Object;
		/**
		 *  @private
		 */
		public function set automationDelegate (value:Object) : void;
		/**
		 *  @inheritDoc
		 */
		public function get automationName () : String;
		/**
		 * @private
		 */
		public function set automationName (value:String) : void;
		/**
		 *  @inheritDoc
		 */
		public function get automationValue () : Array;
		/**
		 *  The y-coordinate of the baseline of the first line of text.
		 */
		public function get baselinePosition () : Number;
		/**
		 *  The name of this instance's class, such as
		 */
		public function get className () : String;
		/**
		 *  A reference to the document object associated with this UITextField object. 
		 */
		public function get document () : Object;
		/**
		 *  @private
		 */
		public function set document (value:Object) : void;
		/**
		 *  A Boolean value that indicates whether the component is enabled. 
		 */
		public function get enabled () : Boolean;
		/**
		 *  @private
		 */
		public function set enabled (value:Boolean) : void;
		/**
		 *  @copy mx.core.UIComponent#explicitHeight
		 */
		public function get explicitHeight () : Number;
		/**
		 *  @private
		 */
		public function set explicitHeight (value:Number) : void;
		/**
		 *  Number that specifies the maximum height of the component, 
		 */
		public function get explicitMaxHeight () : Number;
		/**
		 *  Number that specifies the maximum width of the component, 
		 */
		public function get explicitMaxWidth () : Number;
		/**
		 *  @copy mx.core.UIComponent#explicitMinHeight
		 */
		public function get explicitMinHeight () : Number;
		/**
		 *  @copy mx.core.UIComponent#explicitMinWidth
		 */
		public function get explicitMinWidth () : Number;
		/**
		 *  @copy mx.core.UIComponent#explicitWidth
		 */
		public function get explicitWidth () : Number;
		/**
		 *  @private
		 */
		public function set explicitWidth (value:Number) : void;
		/**
		 *  @inheritDoc
		 */
		public function get focusPane () : Sprite;
		/**
		 *  @private
		 */
		public function set focusPane (value:Sprite) : void;
		/**
		 *  If <code>true</code>, the <code>paddingLeft</code> and
		 */
		public function get ignorePadding () : Boolean;
		/**
		 *  @private
		 */
		public function set ignorePadding (value:Boolean) : void;
		/**
		 *  Specifies the IME (input method editor) mode.
		 */
		public function get imeMode () : String;
		/**
		 *  @private
		 */
		public function set imeMode (value:String) : void;
		/**
		 *  @copy mx.core.UIComponent#includeInLayout
		 */
		public function get includeInLayout () : Boolean;
		/**
		 *  @private
		 */
		public function set includeInLayout (value:Boolean) : void;
		/**
		 *  The beginning of this UITextField's chain of inheriting styles.
		 */
		public function get inheritingStyles () : Object;
		/**
		 *  @private
		 */
		public function set inheritingStyles (value:Object) : void;
		/**
		 *  A flag that determines if an object has been through all three phases
		 */
		public function get initialized () : Boolean;
		/**
		 *  @private
		 */
		public function set initialized (value:Boolean) : void;
		/**
		 *  @private
		 */
		private function get isHTML () : Boolean;
		/**
		 *  @copy mx.core.UIComponent#isPopUp
		 */
		public function get isPopUp () : Boolean;
		/**
		 *  @private
		 */
		public function set isPopUp (value:Boolean) : void;
		/**
		 *  @copy mx.core.UIComponent#maxHeight
		 */
		public function get maxHeight () : Number;
		/**
		 *  @copy mx.core.UIComponent#maxWidth
		 */
		public function get maxWidth () : Number;
		/**
		 *  @copy mx.core.UIComponent#measuredHeight
		 */
		public function get measuredHeight () : Number;
		/**
		 *  @copy mx.core.UIComponent#measuredMinHeight
		 */
		public function get measuredMinHeight () : Number;
		/**
		 *  @private
		 */
		public function set measuredMinHeight (value:Number) : void;
		/**
		 *  @copy mx.core.UIComponent#measuredMinWidth
		 */
		public function get measuredMinWidth () : Number;
		/**
		 *  @private
		 */
		public function set measuredMinWidth (value:Number) : void;
		/**
		 *  @copy mx.core.UIComponent#measuredWidth
		 */
		public function get measuredWidth () : Number;
		/**
		 *  @copy mx.core.UIComponent#minHeight
		 */
		public function get minHeight () : Number;
		/**
		 *  @copy mx.core.UIComponent#minWidth
		 */
		public function get minWidth () : Number;
		/**
		 *  The moduleFactory that is used to create TextFields in the correct SWF context. This is necessary so that
		 */
		public function get moduleFactory () : IFlexModuleFactory;
		/**
		 *  @private
		 */
		public function set moduleFactory (factory:IFlexModuleFactory) : void;
		/**
		 *  @copy mx.core.UIComponent#nestLevel
		 */
		public function get nestLevel () : int;
		/**
		 *  @private
		 */
		public function set nestLevel (value:int) : void;
		/**
		 *  The beginning of this UITextField's chain of non-inheriting styles.
		 */
		public function get nonInheritingStyles () : Object;
		/**
		 *  @private
		 */
		public function set nonInheritingStyles (value:Object) : void;
		/**
		 *  @copy mx.core.UIComponent#percentHeight
		 */
		public function get percentHeight () : Number;
		/**
		 *  @private
		 */
		public function set percentHeight (value:Number) : void;
		/**
		 *  @copy mx.core.UIComponent#percentWidth
		 */
		public function get percentWidth () : Number;
		/**
		 *  @private
		 */
		public function set percentWidth (value:Number) : void;
		/**
		 *  Set to <code>true</code> after the <code>createChildren()</code>
		 */
		public function get processedDescriptors () : Boolean;
		/**
		 *  @private
		 */
		public function set processedDescriptors (value:Boolean) : void;
		/**
		 *  @copy mx.core.UIComponent#styleName
		 */
		public function get styleName () : Object;
		/**
		 *  @private
		 */
		public function set styleName (value:Object) : void;
		/**
		 *  @copy mx.core.UIComponent#systemManager
		 */
		public function get systemManager () : ISystemManager;
		/**
		 *  @private
		 */
		public function set systemManager (value:ISystemManager) : void;
		/**
		 *  Unlike textHeight, this returns a non-zero value
		 */
		public function get nonZeroTextHeight () : Number;
		/**
		 *  @copy mx.core.UIComponent#toolTip
		 */
		public function get toolTip () : String;
		/**
		 *  @private
		 */
		public function set toolTip (value:String) : void;
		/**
		 *  @copy mx.core.UIComponent#tweeningProperties
		 */
		public function get tweeningProperties () : Array;
		/**
		 *  @private
		 */
		public function set tweeningProperties (value:Array) : void;
		/**
		 *  A flag that determines if an object has been through all three phases
		 */
		public function get updateCompletePendingFlag () : Boolean;
		/**
		 *  @private
		 */
		public function set updateCompletePendingFlag (value:Boolean) : void;
		/**
		 *  By default, set to the parent container of this object. 
		 */
		public function get owner () : DisplayObjectContainer;
		public function set owner (value:DisplayObjectContainer) : void;
		/**
		 *  @private
		 */
		public function get numAutomationChildren () : int;
		/**
		 *  @private
		 */
		public function get showInAutomationHierarchy () : Boolean;
		/**
		 *  @private
		 */
		public function set showInAutomationHierarchy (value:Boolean) : void;
		/**
		 *  @private
		 */
		public function get automationTabularData () : Object;

		/**
		 *  Constructor.
		 */
		public function UITextField ();
		/**
		 *  @private
		 */
		public function setTextFormat (format:TextFormat, beginIndex:int = -1, endIndex:int = -1) : void;
		/**
		 *  @private
		 */
		public function insertXMLText (beginIndex:int, endIndex:int, richText:String, pasting:Boolean = false) : void;
		/**
		 *  @private
		 */
		public function replaceText (beginIndex:int, endIndex:int, newText:String) : void;
		/**
		 *  Initializes this component.
		 */
		public function initialize () : void;
		/**
		 *  @copy mx.core.UIComponent#getExplicitOrMeasuredWidth()
		 */
		public function getExplicitOrMeasuredWidth () : Number;
		/**
		 *  @copy mx.core.UIComponent#getExplicitOrMeasuredHeight()
		 */
		public function getExplicitOrMeasuredHeight () : Number;
		/**
		 *  Sets the <code>visible</code> property of this UITextField object.
		 */
		public function setVisible (visible:Boolean, noEvent:Boolean = false) : void;
		/**
		 *  @copy mx.core.UIComponent#setFocus()
		 */
		public function setFocus () : void;
		/**
		 *  Returns a UITextFormat object that contains formatting information for this component. 
		 */
		public function getUITextFormat () : UITextFormat;
		/**
		 *  @copy mx.core.UIComponent#move()
		 */
		public function move (x:Number, y:Number) : void;
		/**
		 *  @copy mx.core.UIComponent#setActualSize()
		 */
		public function setActualSize (w:Number, h:Number) : void;
		/**
		 *  @copy mx.core.UIComponent#getStyle()
		 */
		public function getStyle (styleProp:String) : *;
		/**
		 *  Does nothing.
		 */
		public function setStyle (styleProp:String, value:*) : void;
		/**
		 *  This function is called when a UITextField object is assigned
		 */
		public function parentChanged (p:DisplayObjectContainer) : void;
		/**
		 *  @copy mx.core.UIComponent#styleChanged()
		 */
		public function styleChanged (styleProp:String) : void;
		/**
		 *  @copy mx.core.UIComponent#validateNow()
		 */
		public function validateNow () : void;
		/**
		 *  Returns the TextFormat object that represents 
		 */
		public function getTextStyles () : TextFormat;
		/**
		 *  Sets the font color of the text.
		 */
		public function setColor (color:uint) : void;
		/**
		 *  @copy mx.core.UIComponent#invalidateSize()
		 */
		public function invalidateSize () : void;
		/**
		 *  @copy mx.core.UIComponent#invalidateDisplayList()
		 */
		public function invalidateDisplayList () : void;
		/**
		 *  @copy mx.core.UIComponent#invalidateProperties()
		 */
		public function invalidateProperties () : void;
		/**
		 *  Truncate text to make it fit horizontally in the area defined for the control, 
		 */
		public function truncateToFit (truncationIndicator:String = null) : Boolean;
		/**
		 *  @private
		 */
		private function changeHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function textFieldStyleChangeHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function resourceManager_changeHandler (event:Event) : void;
		/**
		 *  Returns <code>true</code> if the child is parented or owned by this object.
		 */
		public function owns (child:DisplayObject) : Boolean;
		private function creatingSystemManager () : ISystemManager;
		/**
		 * @private
		 */
		private function getEmbeddedFont (fontName:String, bold:Boolean, italic:Boolean) : EmbeddedFont;
		/**
		 *  @inheritDoc
		 */
		public function replayAutomatableEvent (event:Event) : Boolean;
		/**
		 *  @private
		 */
		public function createAutomationIDPart (child:IAutomationObject) : Object;
		/**
		 *  @private
		 */
		public function resolveAutomationIDPart (criteria:Object) : Array;
		/**
		 *  @private
		 */
		public function getAutomationChildAt (index:int) : IAutomationObject;
	}
}