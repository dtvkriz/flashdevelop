﻿package mx.core
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.InteractiveObject;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventPhase;
	import flash.events.FocusEvent;
	import flash.events.IEventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.system.ApplicationDomain;
	import flash.text.TextLineMetrics;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getQualifiedSuperclassName;
	import mx.automation.IAutomationObject;
	import mx.binding.BindingManager;
	import mx.controls.IFlexContextMenu;
	import mx.effects.EffectManager;
	import mx.effects.IEffect;
	import mx.effects.IEffectInstance;
	import mx.events.ChildExistenceChangedEvent;
	import mx.events.DragEvent;
	import mx.events.DynamicEvent;
	import mx.events.EffectEvent;
	import mx.events.FlexEvent;
	import mx.events.MoveEvent;
	import mx.events.PropertyChangeEvent;
	import mx.events.ResizeEvent;
	import mx.events.StateChangeEvent;
	import mx.events.ToolTipEvent;
	import mx.events.ValidationResultEvent;
	import mx.graphics.RoundedRectangle;
	import mx.managers.CursorManager;
	import mx.managers.ICursorManager;
	import mx.managers.IFocusManager;
	import mx.managers.IFocusManagerComponent;
	import mx.managers.IFocusManagerContainer;
	import mx.managers.ILayoutManagerClient;
	import mx.managers.ISystemManager;
	import mx.managers.IToolTipManagerClient;
	import mx.managers.SystemManager;
	import mx.managers.SystemManagerGlobals;
	import mx.managers.SystemManagerProxy;
	import mx.managers.ToolTipManager;
	import mx.modules.ModuleManager;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;
	import mx.states.State;
	import mx.states.Transition;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.ISimpleStyleClient;
	import mx.styles.IStyleClient;
	import mx.styles.StyleManager;
	import mx.styles.StyleProtoChain;
	import mx.utils.ColorUtil;
	import mx.utils.GraphicsUtil;
	import mx.utils.StringUtil;
	import mx.validators.IValidatorListener;
	import mx.validators.ValidationResult;
	import flash.system.Security;

	/**
	 *  Dispatched when the component is added to a container as a content child
	 */
	[Event(name="add", type="mx.events.FlexEvent")] 
	/**
	 *  Dispatched when the component has finished its construction,
	 */
	[Event(name="creationComplete", type="mx.events.FlexEvent")] 
	/**
	 *  Dispatched when an object has had its <code>commitProperties()</code>, 
	 */
	[Event(name="updateComplete", type="mx.events.FlexEvent")] 
	/**
	 *  Dispatched when an object's state changes from visible to invisible.
	 */
	[Event(name="hide", type="mx.events.FlexEvent")] 
	/**
	 *  Dispatched when the component has finished its construction
	 */
	[Event(name="initialize", type="mx.events.FlexEvent")] 
	/**
	 *  Dispatched when the object has moved.
	 */
	[Event(name="move", type="mx.events.MoveEvent")] 
	/**
	 *  Dispatched at the beginning of the component initialization sequence. 
	 */
	[Event(name="preinitialize", type="mx.events.FlexEvent")] 
	/**
	 *  Dispatched when the component is removed from a container as a content child
	 */
	[Event(name="remove", type="mx.events.FlexEvent")] 
	/**
	 *  Dispatched when the component is resized.
	 */
	[Event(name="resize", type="mx.events.ResizeEvent")] 
	/**
	 *  Dispatched when an object's state changes from invisible to visible.
	 */
	[Event(name="show", type="mx.events.FlexEvent")] 
	/**
	 *  Dispatched from a component opened using the PopUpManager 
	 */
	[Event(name="mouseDownOutside", type="mx.events.FlexMouseEvent")] 
	/**
	 *  Dispatched from a component opened using the PopUpManager 
	 */
	[Event(name="mouseWheelOutside", type="mx.events.FlexMouseEvent")] 
	/**
	 *  Dispatched when values are changed programmatically
	 */
	[Event(name="valueCommit", type="mx.events.FlexEvent")] 
	/**
	 *  Dispatched when a component is monitored by a Validator
	 */
	[Event(name="invalid", type="mx.events.FlexEvent")] 
	/**
	 *  Dispatched when a component is monitored by a Validator
	 */
	[Event(name="valid", type="mx.events.FlexEvent")] 
	/**
	 *  Dispatched by a component when the user moves the mouse over the component
	 */
	[Event(name="dragEnter", type="mx.events.DragEvent")] 
	/**
	 *  Dispatched by a component when the user moves the mouse while over the component
	 */
	[Event(name="dragOver", type="mx.events.DragEvent")] 
	/**
	 *  Dispatched by the component when the user drags outside the component,
	 */
	[Event(name="dragExit", type="mx.events.DragEvent")] 
	/**
	 *  Dispatched by the drop target when the user releases the mouse over it.
	 */
	[Event(name="dragDrop", type="mx.events.DragEvent")] 
	/**
	 *  Dispatched by the drag initiator (the component that is the source
	 */
	[Event(name="dragComplete", type="mx.events.DragEvent")] 
	/**
	 *  Dispatched by the drag initiator when starting a drag operation.
	 */
	[Event(name="dragStart", type="mx.events.DragEvent")] 
	/**
	 *  Dispatched just before an effect starts.
	 */
	[Event(name="effectStart", type="mx.events.EffectEvent")] 
	/**
	 *  Dispatched after an effect ends.
	 */
	[Event(name="effectEnd", type="mx.events.EffectEvent")] 
	/**
	 *  Dispatched after the <code>currentState</code> property changes,
	 */
	[Event(name="currentStateChanging", type="mx.events.StateChangeEvent")] 
	/**
	 *  Dispatched after the view state has changed.
	 */
	[Event(name="currentStateChange", type="mx.events.StateChangeEvent")] 
	/**
	 *  Dispatched after the component has returned to the root view state.
	 */
	[Event(name="enterState", type="mx.events.FlexEvent")] 
	/**
	 *  Dispatched before the component exits from the root view state.
	 */
	[Event(name="exitState", type="mx.events.FlexEvent")] 
	/**
	 *  Dispatched by the component when it is time to create a ToolTip.
	 */
	[Event(name="toolTipCreate", type="mx.events.ToolTipEvent")] 
	/**
	 *  Dispatched by the component when its ToolTip has been hidden
	 */
	[Event(name="toolTipEnd", type="mx.events.ToolTipEvent")] 
	/**
	 *  Dispatched by the component when its ToolTip is about to be hidden.
	 */
	[Event(name="toolTipHide", type="mx.events.ToolTipEvent")] 
	/**
	 *  Dispatched by the component when its ToolTip is about to be shown.
	 */
	[Event(name="toolTipShow", type="mx.events.ToolTipEvent")] 
	/**
	 *  Dispatched by the component when its ToolTip has been shown.
	 */
	[Event(name="toolTipShown", type="mx.events.ToolTipEvent")] 
	/**
	 *  Dispatched by a component whose <code>toolTip</code> property is set,
	 */
	[Event(name="toolTipStart", type="mx.events.ToolTipEvent")] 
	/**
	 *  Color of the component highlight when validation fails. 
	 */
	[Style(name="errorColor", type="uint", format="Color", inherit="yes")] 
	/**
	 *  Blend mode used by the focus rectangle.
	 */
	[Style(name="focusBlendMode", type="String", inherit="no")] 
	/**
	 *  Skin used to draw the focus rectangle.
	 */
	[Style(name="focusSkin", type="Class", inherit="no")] 
	/**
	 *  Thickness, in pixels, of the focus rectangle outline.
	 */
	[Style(name="focusThickness", type="Number", format="Length", inherit="no")] 
	/**
	 *  Theme color of a component. This property controls the appearance of highlights,
	 */
	[Style(name="themeColor", type="uint", format="Color", inherit="yes")] 

	/**
	 *  The UIComponent class is the base class for all visual components,
	 */
	public class UIComponent extends FlexSprite implements IAutomationObject
	{
		/**
		 *  The default value for the <code>measuredWidth</code> property.
		 */
		public static const DEFAULT_MEASURED_WIDTH : Number = 160;
		/**
		 *  The default value for the <code>measuredMinWidth</code> property.
		 */
		public static const DEFAULT_MEASURED_MIN_WIDTH : Number = 40;
		/**
		 *  The default value for the <code>measuredHeight</code> property.
		 */
		public static const DEFAULT_MEASURED_HEIGHT : Number = 22;
		/**
		 *  The default value for the <code>measuredMinHeight</code> property.
		 */
		public static const DEFAULT_MEASURED_MIN_HEIGHT : Number = 22;
		/**
		 *  The default value for the <code>maxWidth</code> property.
		 */
		public static const DEFAULT_MAX_WIDTH : Number = 10000;
		/**
		 *  The default value for the <code>maxHeight</code> property.
		 */
		public static const DEFAULT_MAX_HEIGHT : Number = 10000;
		/**
		 *  @private
		 */
		static var STYLE_UNINITIALIZED : Object;
		/**
		 *  @private
		 */
		static var createAccessibilityImplementation : Function;
		/**
		 *  @private
		 */
		private static var _embeddedFontRegistry : IEmbeddedFontRegistry;
		/**
		 *  @private
		 */
		private var listeningForRender : Boolean;
		/**
		 *  @private
		 */
		private var methodQueue : Array;
		/**
		 *  @private
		 */
		private var hasFocusRect : Boolean;
		/**
		 *  @private
		 */
		private var _initialized : Boolean;
		/**
		 *  @private
		 */
		private var _processedDescriptors : Boolean;
		/**
		 *  @private
		 */
		private var _updateCompletePendingFlag : Boolean;
		/**
		 *  @private
		 */
		local var invalidatePropertiesFlag : Boolean;
		/**
		 *  @private
		 */
		local var invalidateSizeFlag : Boolean;
		/**
		 *  @private
		 */
		local var invalidateDisplayListFlag : Boolean;
		/**
		 *  @private
		 */
		private var oldX : Number;
		/**
		 *  @private
		 */
		private var oldY : Number;
		/**
		 *  @private
		 */
		private var oldWidth : Number;
		/**
		 *  @private
		 */
		private var oldHeight : Number;
		/**
		 *  @private
		 */
		private var oldMinWidth : Number;
		/**
		 *  @private
		 */
		private var oldMinHeight : Number;
		/**
		 *  @private
		 */
		private var oldExplicitWidth : Number;
		/**
		 *  @private
		 */
		private var oldExplicitHeight : Number;
		/**
		 *  @private
		 */
		private var oldScaleX : Number;
		/**
		 *  @private
		 */
		private var oldScaleY : Number;
		/**
		 *  @private
		 */
		private var hasFontContextBeenSaved : Boolean;
		/**
		 *  @private
		 */
		private var oldEmbeddedFontContext : IFlexModuleFactory;
		/**
		 * @private
		 */
		private var cachedEmbeddedFont : EmbeddedFont;
		/**
		 *  @private
		 */
		private var cachedTextFormat : UITextFormat;
		/**
		 *  @private
		 */
		local var overlay : UIComponent;
		/**
		 *  @private
		 */
		local var overlayColor : uint;
		/**
		 *  @private
		 */
		local var overlayReferenceCount : int;
		/**
		 *  @private
		 */
		local var saveBorderColor : Boolean;
		/**
		 *  @private
		 */
		local var origBorderColor : Number;
		/**
		 *  @private
		 */
		local var automaticRadioButtonGroups : Object;
		/**
		 *  @private
		 */
		private var _owner : DisplayObjectContainer;
		/**
		 *  @private
		 */
		local var _parent : DisplayObjectContainer;
		/**
		 *  @private
		 */
		local var _width : Number;
		/**
		 *  @private
		 */
		local var _height : Number;
		/**
		 *  @private
		 */
		private var _scaleX : Number;
		/**
		 *  @private
		 */
		private var _scaleY : Number;
		/**
		 *  @private
		 */
		private var _visible : Boolean;
		/**
		 *  @private
		 */
		private var _enabled : Boolean;
		/**
		 *  @private
		 */
		private var _filters : Array;
		/**
		 *  @private
		 */
		private var _tweeningProperties : Array;
		/**
		 *  @private
		 */
		private var _focusManager : IFocusManager;
		/**
		 *  @private
		 */
		private var _resourceManager : IResourceManager;
		/**
		 *  @private
		 */
		private var _systemManager : ISystemManager;
		/**
		 *  @private
		 */
		private var _systemManagerDirty : Boolean;
		/**
		 *  @private
		 */
		private var _nestLevel : int;
		/**
		 *  @private
		 */
		local var _descriptor : UIComponentDescriptor;
		/**
		 *  @private
		 */
		local var _document : Object;
		/**
		 *  @private
		 */
		local var _documentDescriptor : UIComponentDescriptor;
		/**
		 *  @private
		 */
		private var _id : String;
		/**
		 *  @private
		 */
		private var _moduleFactory : IFlexModuleFactory;
		/**
		 *  @private
		 */
		private var _inheritingStyles : Object;
		/**
		 *  @private
		 */
		private var _nonInheritingStyles : Object;
		/**
		 *  @private
		 */
		private var _styleDeclaration : CSSStyleDeclaration;
		/**
		 *  @private
		 */
		private var _cachePolicy : String;
		/**
		 *  @private
		 */
		private var cacheAsBitmapCount : int;
		/**
		 *  @private
		 */
		private var _focusPane : Sprite;
		/**
		 *  @private
		 */
		private var _focusEnabled : Boolean;
		/**
		 *  @private
		 */
		private var _mouseFocusEnabled : Boolean;
		/**
		 *  @private
		 */
		private var _measuredMinWidth : Number;
		/**
		 *  @private
		 */
		private var _measuredMinHeight : Number;
		/**
		 *  @private
		 */
		private var _measuredWidth : Number;
		/**
		 *  @private
		 */
		private var _measuredHeight : Number;
		/**
		 *  @private
		 */
		private var _percentWidth : Number;
		/**
		 *  @private
		 */
		private var _percentHeight : Number;
		/**
		 *  @private
		 */
		local var _explicitMinWidth : Number;
		/**
		 *  @private
		 */
		local var _explicitMinHeight : Number;
		/**
		 *  @private
		 */
		local var _explicitMaxWidth : Number;
		/**
		 *  @private
		 */
		local var _explicitMaxHeight : Number;
		/**
		 *  @private
		 */
		private var _explicitWidth : Number;
		/**
		 *  @private
		 */
		private var _explicitHeight : Number;
		/**
		 *  @private
		 */
		private var _includeInLayout : Boolean;
		/**
		 *  @private
		 */
		private var _instanceIndices : Array;
		/**
		 *  @private
		 */
		private var _repeaters : Array;
		/**
		 *  @private
		 */
		private var _repeaterIndices : Array;
		/**
		 *  @private
		 */
		private var _currentState : String;
		/**
		 *  @private
		 */
		private var requestedCurrentState : String;
		/**
		 *  @private
		 */
		private var playStateTransition : Boolean;
		/**
		 *  @private
		 */
		private var _currentStateChanged : Boolean;
		/**
		 *  The view states that are defined for this component.
		 */
		public var states : Array;
		/**
		 *  @private
		 */
		private var _currentTransitionEffect : IEffect;
		/**
		 *  An Array of Transition objects, where each Transition object defines a
		 */
		public var transitions : Array;
		/**
		 *  @private
		 */
		private var _flexContextMenu : IFlexContextMenu;
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
		private var _uid : String;
		/**
		 *  @private
		 */
		private var _isPopUp : Boolean;
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
		private var _showInAutomationHierarchy : Boolean;
		/**
		 *  @private
		 */
		local var _errorString : String;
		/**
		 *  @private
		 */
		private var errorStringChanged : Boolean;
		/**
		 *  @private
		 */
		private var _validationSubField : String;
		/**
		 *  @private
		 */
		private var lastUnscaledWidth : Number;
		/**
		 *  @private
		 */
		private var lastUnscaledHeight : Number;
		/**
		 *  @private
		 */
		local var _effectsStarted : Array;
		/**
		 *  @private
		 */
		local var _affectedProperties : Object;
		/**
		 *  Contains <code>true</code> if an effect is currently playing on the component.
		 */
		private var _isEffectStarted : Boolean;
		private var preventDrawFocus : Boolean;
		private var _endingEffectInstances : Array;
		static var dispatchEventHook : Function;
		private static var fakeMouseX : QName;
		private static var fakeMouseY : QName;

		/**
		 *  @private
		 */
		private static function get embeddedFontRegistry () : IEmbeddedFontRegistry;
		/**
		 *  A flag that determines if an object has been through all three phases
		 */
		public function get initialized () : Boolean;
		/**
		 *  @private
		 */
		public function set initialized (value:Boolean) : void;
		/**
		 *  Set to <code>true</code> after immediate or deferred child creation, 
		 */
		public function get processedDescriptors () : Boolean;
		/**
		 *  @private
		 */
		public function set processedDescriptors (value:Boolean) : void;
		/**
		 *  A flag that determines if an object has been through all three phases
		 */
		public function get updateCompletePendingFlag () : Boolean;
		/**
		 *  @private
		 */
		public function set updateCompletePendingFlag (value:Boolean) : void;
		/**
		 *  The owner of this UIComponent. By default, it is the parent of this UIComponent.
		 */
		public function get owner () : DisplayObjectContainer;
		public function set owner (value:DisplayObjectContainer) : void;
		/**
		 *  The parent container or component for this component.
		 */
		public function get parent () : DisplayObjectContainer;
		/**
		 *  Number that specifies the component's horizontal position,
		 */
		public function get x () : Number;
		/**
		 *  @private
		 */
		public function set x (value:Number) : void;
		/**
		 *  Number that specifies the component's vertical position,
		 */
		public function get y () : Number;
		/**
		 *  @private
		 */
		public function set y (value:Number) : void;
		/**
		 *  Number that specifies the width of the component, in pixels,
		 */
		public function get width () : Number;
		/**
		 *  @private
		 */
		public function set width (value:Number) : void;
		/**
		 *  Number that specifies the height of the component, in pixels,
		 */
		public function get height () : Number;
		/**
		 *  @private
		 */
		public function set height (value:Number) : void;
		/**
		 *  Number that specifies the horizontal scaling factor.
		 */
		public function get scaleX () : Number;
		/**
		 *  @private
		 */
		public function set scaleX (value:Number) : void;
		/**
		 *  Number that specifies the vertical scaling factor.
		 */
		public function get scaleY () : Number;
		/**
		 *  @private
		 */
		public function set scaleY (value:Number) : void;
		/**
		 *  Controls the visibility of this UIComponent. If <code>true</code>, 
		 */
		public function get visible () : Boolean;
		/**
		 *  @private
		 */
		public function set visible (value:Boolean) : void;
		/**
		 *  @private
		 */
		public function set alpha (value:Number) : void;
		/**
		 *  Specifies whether the UIComponent object receives <code>doubleClick</code> events. 
		 */
		public function get doubleClickEnabled () : Boolean;
		/**
		 *  @private
		 */
		public function set doubleClickEnabled (value:Boolean) : void;
		/**
		 *  @copy mx.core.IUIComponent#enabled
		 */
		public function get enabled () : Boolean;
		/**
		 *  @private
		 */
		public function set enabled (value:Boolean) : void;
		/**
		 *  @private
		 */
		public function set cacheAsBitmap (value:Boolean) : void;
		/**
		 *  @private
		 */
		public function get filters () : Array;
		/**
		 *  @private
		 */
		public function set filters (value:Array) : void;
		/**
		 *  @private
		 */
		function get $parent () : DisplayObjectContainer;
		/**
		 *  @private
		 */
		function get $x () : Number;
		/**
		 *  @private
		 */
		function set $x (value:Number) : void;
		/**
		 *  @private
		 */
		function get $y () : Number;
		/**
		 *  @private
		 */
		function set $y (value:Number) : void;
		/**
		 *  @private
		 */
		function get $width () : Number;
		/**
		 *  @private
		 */
		function set $width (value:Number) : void;
		/**
		 *  @private
		 */
		function get $height () : Number;
		/**
		 *  @private
		 */
		function set $height (value:Number) : void;
		/**
		 *  @private
		 */
		function get $visible () : Boolean;
		/**
		 *  @private
		 */
		function set $visible (value:Boolean) : void;
		/**
		 *  Returns the <i>x</i> position of the mouse, in the content coordinate system.
		 */
		public function get contentMouseX () : Number;
		/**
		 *  Returns the <i>y</i> position of the mouse, in the content coordinate system.
		 */
		public function get contentMouseY () : Number;
		/**
		 *  Array of properties that are currently being tweened on this object.
		 */
		public function get tweeningProperties () : Array;
		/**
		 *  @private
		 */
		public function set tweeningProperties (value:Array) : void;
		/**
		 *  Gets the CursorManager that controls the cursor for this component
		 */
		public function get cursorManager () : ICursorManager;
		/**
		 *  Gets the FocusManager that controls focus for this component
		 */
		public function get focusManager () : IFocusManager;
		/**
		 *  @private
		 */
		public function set focusManager (value:IFocusManager) : void;
		/**
		 *  A reference to the object which manages
		 */
		protected function get resourceManager () : IResourceManager;
		/**
		 *  Returns the SystemManager object used by this component.
		 */
		public function get systemManager () : ISystemManager;
		/**
		 *  @private
		 */
		public function set systemManager (value:ISystemManager) : void;
		/**
		 *  Depth of this object in the containment hierarchy.
		 */
		public function get nestLevel () : int;
		/**
		 *  @private
		 */
		public function set nestLevel (value:int) : void;
		/**
		 *  Reference to the UIComponentDescriptor, if any, that was used
		 */
		public function get descriptor () : UIComponentDescriptor;
		/**
		 *  @private
		 */
		public function set descriptor (value:UIComponentDescriptor) : void;
		/**
		 *  A reference to the document object associated with this UIComponent.
		 */
		public function get document () : Object;
		/**
		 *  A reference to the document object associated with this UIComponent.
		 */
		public function set document (value:Object) : void;
		/**
		 *  @private
		 */
		function get documentDescriptor () : UIComponentDescriptor;
		/**
		 *  ID of the component. This value becomes the instance name of the object
		 */
		public function get id () : String;
		/**
		 *  @private
		 */
		public function set id (value:String) : void;
		/**
		 *  Determines whether this UIComponent instance is a document object,
		 */
		public function get isDocument () : Boolean;
		/**
		 *  Note:
		 */
		public function get parentApplication () : Object;
		/**
		 *  A reference to the parent document object for this UIComponent.
		 */
		public function get parentDocument () : Object;
		/**
		 *  Returns an object that contains the size and position of the base
		 */
		public function get screen () : Rectangle;
		/**
		 *  The moduleFactory that is used to create TextFields in the correct SWF context. This is necessary so that
		 */
		public function get moduleFactory () : IFlexModuleFactory;
		/**
		 *  @private
		 */
		public function set moduleFactory (factory:IFlexModuleFactory) : void;
		/**
		 *  The beginning of this component's chain of inheriting styles.
		 */
		public function get inheritingStyles () : Object;
		/**
		 *  @private
		 */
		public function set inheritingStyles (value:Object) : void;
		/**
		 *  The beginning of this component's chain of non-inheriting styles.
		 */
		public function get nonInheritingStyles () : Object;
		/**
		 *  @private
		 */
		public function set nonInheritingStyles (value:Object) : void;
		/**
		 *  Storage for the inline inheriting styles on this object.
		 */
		public function get styleDeclaration () : CSSStyleDeclaration;
		/**
		 *  @private
		 */
		public function set styleDeclaration (value:CSSStyleDeclaration) : void;
		/**
		 *  Specifies the bitmap caching policy for this object.
		 */
		public function get cachePolicy () : String;
		/**
		 *  @private
		 */
		public function set cachePolicy (value:String) : void;
		/**
		 *  Used by Flex to suggest bitmap caching for the object.
		 */
		public function set cacheHeuristic (value:Boolean) : void;
		/**
		 *  The focus pane associated with this object.
		 */
		public function get focusPane () : Sprite;
		/**
		 *  @private
		 */
		public function set focusPane (value:Sprite) : void;
		/**
		 *  Indicates whether the component can receive focus when tabbed to.
		 */
		public function get focusEnabled () : Boolean;
		/**
		 *  @private
		 */
		public function set focusEnabled (value:Boolean) : void;
		/**
		 *  Whether you can receive focus when clicked on.
		 */
		public function get mouseFocusEnabled () : Boolean;
		/**
		 *  @private
		 */
		public function set mouseFocusEnabled (value:Boolean) : void;
		/**
		 *  The default minimum width of the component, in pixels.
		 */
		public function get measuredMinWidth () : Number;
		/**
		 *  @private
		 */
		public function set measuredMinWidth (value:Number) : void;
		/**
		 *  The default minimum height of the component, in pixels.
		 */
		public function get measuredMinHeight () : Number;
		/**
		 *  @private
		 */
		public function set measuredMinHeight (value:Number) : void;
		/**
		 *  The default width of the component, in pixels.
		 */
		public function get measuredWidth () : Number;
		/**
		 *  @private
		 */
		public function set measuredWidth (value:Number) : void;
		/**
		 *  The default height of the component, in pixels.
		 */
		public function get measuredHeight () : Number;
		/**
		 *  @private
		 */
		public function set measuredHeight (value:Number) : void;
		/**
		 *  Number that specifies the width of a component as a percentage
		 */
		public function get percentWidth () : Number;
		/**
		 *  @private
		 */
		public function set percentWidth (value:Number) : void;
		/**
		 *  Number that specifies the height of a component as a percentage
		 */
		public function get percentHeight () : Number;
		/**
		 *  @private
		 */
		public function set percentHeight (value:Number) : void;
		/**
		 *  The minimum recommended width of the component to be considered
		 */
		public function get minWidth () : Number;
		/**
		 *  @private
		 */
		public function set minWidth (value:Number) : void;
		/**
		 *  The minimum recommended height of the component to be considered
		 */
		public function get minHeight () : Number;
		/**
		 *  @private
		 */
		public function set minHeight (value:Number) : void;
		/**
		 *  The maximum recommended width of the component to be considered
		 */
		public function get maxWidth () : Number;
		/**
		 *  @private
		 */
		public function set maxWidth (value:Number) : void;
		/**
		 *  The maximum recommended height of the component to be considered
		 */
		public function get maxHeight () : Number;
		/**
		 *  @private
		 */
		public function set maxHeight (value:Number) : void;
		/**
		 *  The minimum recommended width of the component to be considered
		 */
		public function get explicitMinWidth () : Number;
		/**
		 *  @private
		 */
		public function set explicitMinWidth (value:Number) : void;
		/**
		 *  The minimum recommended height of the component to be considered
		 */
		public function get explicitMinHeight () : Number;
		/**
		 *  @private
		 */
		public function set explicitMinHeight (value:Number) : void;
		/**
		 *  The maximum recommended width of the component to be considered
		 */
		public function get explicitMaxWidth () : Number;
		/**
		 *  @private
		 */
		public function set explicitMaxWidth (value:Number) : void;
		/**
		 *  The maximum recommended height of the component to be considered
		 */
		public function get explicitMaxHeight () : Number;
		/**
		 *  @private
		 */
		public function set explicitMaxHeight (value:Number) : void;
		/**
		 *  Number that specifies the explicit width of the component,
		 */
		public function get explicitWidth () : Number;
		/**
		 *  @private
		 */
		public function set explicitWidth (value:Number) : void;
		/**
		 *  Number that specifies the explicit height of the component,
		 */
		public function get explicitHeight () : Number;
		/**
		 *  @private
		 */
		public function set explicitHeight (value:Number) : void;
		/**
		 *  Specifies whether this component is included in the layout of the
		 */
		public function get includeInLayout () : Boolean;
		/**
		 *  @private
		 */
		public function set includeInLayout (value:Boolean) : void;
		/**
		 *  The index of a repeated component. 
		 */
		public function get instanceIndex () : int;
		/**
		 *  An Array containing the indices required to reference
		 */
		public function get instanceIndices () : Array;
		/**
		 *  @private
		 */
		public function set instanceIndices (value:Array) : void;
		/**
		 *  A reference to the Repeater object
		 */
		public function get repeater () : IRepeater;
		/**
		 *  An Array containing references to the Repeater objects
		 */
		public function get repeaters () : Array;
		/**
		 *  @private
		 */
		public function set repeaters (value:Array) : void;
		/**
		 *  The index of the item in the data provider
		 */
		public function get repeaterIndex () : int;
		/**
		 *  An Array containing the indices of the items in the data provider
		 */
		public function get repeaterIndices () : Array;
		/**
		 *  @private
		 */
		public function set repeaterIndices (value:Array) : void;
		/**
		 *  The current view state of the component.
		 */
		public function get currentState () : String;
		/**
		 *  @private
		 */
		public function set currentState (value:String) : void;
		/**
		 *  The y-coordinate of the baseline
		 */
		public function get baselinePosition () : Number;
		/**
		 *  The name of this instance's class, such as <code>"Button"</code>.
		 */
		public function get className () : String;
		/**
		 *  The list of effects that are currently playing on the component,
		 */
		public function get activeEffects () : Array;
		/**
		 *  The context menu for this UIComponent. 
		 */
		public function get flexContextMenu () : IFlexContextMenu;
		/**
		 *  @private
		 */
		public function set flexContextMenu (value:IFlexContextMenu) : void;
		/**
		 *  The class style used by this component. This can be a String, CSSStyleDeclaration
		 */
		public function get styleName () : Object;
		/**
		 *  @private
		 */
		public function set styleName (value:Object) : void;
		/**
		 *  Text to display in the ToolTip.
		 */
		public function get toolTip () : String;
		/**
		 *  @private
		 */
		public function set toolTip (value:String) : void;
		/**
		 *  A unique identifier for the object. 
		 */
		public function get uid () : String;
		/**
		 *  @private
		 */
		public function set uid (uid:String) : void;
		/**
		 *  @private
		 */
		private function get indexedID () : String;
		/**
		 *  Set to <code>true</code> by the PopUpManager to indicate
		 */
		public function get isPopUp () : Boolean;
		public function set isPopUp (value:Boolean) : void;
		/**
		 *  The delegate object that handles the automation-related functionality.
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
		 *  @private
		 */
		public function set automationName (value:String) : void;
		/**
		 *  @copy mx.automation.IAutomationObject#automationValue
		 */
		public function get automationValue () : Array;
		/**
		 *  @inheritDoc
		 */
		public function get showInAutomationHierarchy () : Boolean;
		/**
		 *  @private
		 */
		public function set showInAutomationHierarchy (value:Boolean) : void;
		/**
		 *  The text that will be displayed by a component's error tip when a
		 */
		public function get errorString () : String;
		/**
		 *  @private
		 */
		public function set errorString (value:String) : void;
		/**
		 *  Used by a validator to associate a subfield with this component.
		 */
		public function get validationSubField () : String;
		/**
		 *  @private
		 */
		public function set validationSubField (value:String) : void;
		/**
		 *  A convenience method for determining the unscaled width
		 */
		protected function get unscaledWidth () : Number;
		/**
		 *  A convenience method for determining the unscaled height
		 */
		protected function get unscaledHeight () : Number;
		function get isEffectStarted () : Boolean;
		function set isEffectStarted (value:Boolean) : void;
		/**
		 *  @inheritDoc
		 */
		public function get numAutomationChildren () : int;
		/**
		 *  @inheritDoc
		 */
		public function get automationTabularData () : Object;
		/**
		 *  @private
		 */
		public function get mouseX () : Number;
		/**
		 *  @private
		 */
		public function get mouseY () : Number;

		/**
		 *  Blocks the background processing of methods
		 */
		public static function suspendBackgroundProcessing () : void;
		/**
		 *  Resumes the background processing of methods
		 */
		public static function resumeBackgroundProcessing () : void;
		/**
		 *  Constructor.
		 */
		public function UIComponent ();
		/**
		 *  Called when the <code>visible</code> property changes.
		 */
		public function setVisible (value:Boolean, noEvent:Boolean = false) : void;
		/**
		 *  @private
		 */
		function getNonNullSystemManager () : ISystemManager;
		/**
		 *  @private
		 */
		private function setBorderColorForErrorString () : void;
		/**
		 *  @private
		 */
		public function addChild (child:DisplayObject) : DisplayObject;
		/**
		 *  @private
		 */
		public function addChildAt (child:DisplayObject, index:int) : DisplayObject;
		/**
		 *  @private
		 */
		public function removeChild (child:DisplayObject) : DisplayObject;
		/**
		 *  @private
		 */
		public function removeChildAt (index:int) : DisplayObject;
		/**
		 *  @private
		 */
		public function setChildIndex (child:DisplayObject, newIndex:int) : void;
		/**
		 *  @private
		 */
		public function stopDrag () : void;
		/**
		 *  @private
		 */
		function $addChild (child:DisplayObject) : DisplayObject;
		/**
		 *  @private
		 */
		function $addChildAt (child:DisplayObject, index:int) : DisplayObject;
		/**
		 *  @private
		 */
		function $removeChild (child:DisplayObject) : DisplayObject;
		/**
		 *  @private
		 */
		function $removeChildAt (index:int) : DisplayObject;
		/**
		 *  @private
		 */
		function updateCallbacks () : void;
		/**
		 *  Called by Flex when a UIComponent object is added to or removed from a parent.
		 */
		public function parentChanged (p:DisplayObjectContainer) : void;
		/**
		 *  @private
		 */
		function addingChild (child:DisplayObject) : void;
		/**
		 *  @private
		 */
		function childAdded (child:DisplayObject) : void;
		/**
		 *  @private
		 */
		function removingChild (child:DisplayObject) : void;
		/**
		 *  @private
		 */
		function childRemoved (child:DisplayObject) : void;
		/**
		 *  Initializes the internal structure of this component.
		 */
		public function initialize () : void;
		/**
		 *  Finalizes the initialization of this component.
		 */
		protected function initializationComplete () : void;
		/**
		 *  Initializes this component's accessibility code.
		 */
		protected function initializeAccessibility () : void;
		/**
		 *  Initializes various properties which keep track of repeated instances
		 */
		public function initializeRepeaterArrays (parent:IRepeaterClient) : void;
		/**
		 *  Create child objects of the component.
		 */
		protected function createChildren () : void;
		/**
		 *  Performs any final processing after child objects are created.
		 */
		protected function childrenCreated () : void;
		/**
		 *  Marks a component so that its <code>commitProperties()</code>
		 */
		public function invalidateProperties () : void;
		/**
		 *  Marks a component so that its <code>measure()</code>
		 */
		public function invalidateSize () : void;
		/**
		 *  Marks a component so that its <code>updateDisplayList()</code>
		 */
		public function invalidateDisplayList () : void;
		private function isOnDisplayList () : Boolean;
		/**
		 *  Flex calls the <code>stylesInitialized()</code> method when
		 */
		public function stylesInitialized () : void;
		/**
		 *  Detects changes to style properties. When any style property is set,
		 */
		public function styleChanged (styleProp:String) : void;
		/**
		 *  Validate and update the properties and layout of this object
		 */
		public function validateNow () : void;
		/**
		 *  @private
		 */
		function validateBaselinePosition () : Boolean;
		/**
		 *  Queues a function to be called later.
		 */
		public function callLater (method:Function, args:Array = null) : void;
		/**
		 *  @private
		 */
		function cancelAllCallLaters () : void;
		/**
		 *  Used by layout logic to validate the properties of a component
		 */
		public function validateProperties () : void;
		/**
		 *  Processes the properties set on the component.
		 */
		protected function commitProperties () : void;
		/**
		 *  @inheritDoc
		 */
		public function validateSize (recursive:Boolean = false) : void;
		/**
		 *  @private
		 */
		private function measureSizes () : Boolean;
		/**
		 *  Calculates the default size, and optionally the default minimum size,
		 */
		protected function measure () : void;
		/**
		 *  @private
		 */
		function adjustSizesForScaleChanges () : void;
		/**
		 *  A convenience method for determining whether to use the
		 */
		public function getExplicitOrMeasuredWidth () : Number;
		/**
		 *  A convenience method for determining whether to use the
		 */
		public function getExplicitOrMeasuredHeight () : Number;
		/**
		 *  A convenience method for setting the unscaledWidth of a 
		 */
		function setUnscaledWidth (value:Number) : void;
		/**
		 *  A convenience method for setting the unscaledHeight of a 
		 */
		function setUnscaledHeight (value:Number) : void;
		/**
		 *  Measures the specified text, assuming that it is displayed
		 */
		public function measureText (text:String) : TextLineMetrics;
		/**
		 *  Measures the specified HTML text, which may contain HTML tags such
		 */
		public function measureHTMLText (htmlText:String) : TextLineMetrics;
		/**
		 *  @inheritDoc
		 */
		public function validateDisplayList () : void;
		/**
		 *  Draws the object and/or sizes and positions its children.
		 */
		protected function updateDisplayList (unscaledWidth:Number, unscaledHeight:Number) : void;
		/**
		 *  Returns a layout constraint value, which is the same as 
		 */
		public function getConstraintValue (constraintName:String) : *;
		/**
		 *  Sets a layout constraint value, which is the same as 
		 */
		public function setConstraintValue (constraintName:String, value:*) : void;
		/**
		 *  Returns a box Matrix which can be passed to the 
		 */
		public function horizontalGradientMatrix (x:Number, y:Number, width:Number, height:Number) : Matrix;
		/**
		 *  Returns a box Matrix which can be passed to <code>drawRoundRect()</code>
		 */
		public function verticalGradientMatrix (x:Number, y:Number, width:Number, height:Number) : Matrix;
		/**
		 *  @copy mx.skins.ProgrammaticSkin#drawRoundRect()
		 */
		public function drawRoundRect (x:Number, y:Number, w:Number, h:Number, r:Object = null, c:Object = null, alpha:Object = null, rot:Object = null, gradient:String = null, ratios:Array = null, hole:Object = null) : void;
		/**
		 *  Moves the component to a specified position within its parent.
		 */
		public function move (x:Number, y:Number) : void;
		/**
		 *  Sizes the object.
		 */
		public function setActualSize (w:Number, h:Number) : void;
		/**
		 *  Converts a <code>Point</code> object from content coordinates to global coordinates.
		 */
		public function contentToGlobal (point:Point) : Point;
		/**
		 *  Converts a <code>Point</code> object from global to content coordinates.
		 */
		public function globalToContent (point:Point) : Point;
		/**
		 *  Converts a <code>Point</code> object from content to local coordinates.
		 */
		public function contentToLocal (point:Point) : Point;
		/**
		 *  Converts a <code>Point</code> object from local to content coordinates.
		 */
		public function localToContent (point:Point) : Point;
		/**
		 *  Gets the object that currently has focus.
		 */
		public function getFocus () : InteractiveObject;
		/**
		 *  Sets the focus to this component.
		 */
		public function setFocus () : void;
		/**
		 *  @private
		 */
		function getFocusObject () : DisplayObject;
		/**
		 *  Shows or hides the focus indicator around this component.
		 */
		public function drawFocus (isFocused:Boolean) : void;
		/**
		 *  Adjust the focus rectangle.
		 */
		protected function adjustFocusRect (obj:DisplayObject = null) : void;
		/**
		 *  @private
		 */
		private function dispatchMoveEvent () : void;
		/**
		 *  @private
		 */
		private function dispatchResizeEvent () : void;
		/**
		 *  Set the current state. 
		 */
		public function setCurrentState (stateName:String, playTransition:Boolean = true) : void;
		/**
		 *  @private
		 */
		private function isBaseState (stateName:String) : Boolean;
		/**
		 *  @private
		 */
		private function commitCurrentState () : void;
		/**
		 *  @private
		 */
		private function transition_effectEndHandler (event:EffectEvent) : void;
		/**
		 *  @private
		 */
		private function getState (stateName:String) : State;
		/**
		 *  @private
		 */
		private function findCommonBaseState (state1:String, state2:String) : String;
		/**
		 *  @private
		 */
		private function getBaseStates (state:State) : Array;
		/**
		 *  @private
		 */
		private function removeState (stateName:String, lastState:String) : void;
		/**
		 *  @private
		 */
		private function applyState (stateName:String, lastState:String) : void;
		/**
		 *  @private
		 */
		private function initializeState (stateName:String) : void;
		/**
		 *  @private
		 */
		private function getTransition (oldState:String, newState:String) : IEffect;
		/**
		 *  @private
		 */
		function initProtoChain () : void;
		/**
		 *  Finds the type selectors for this UIComponent instance.
		 */
		public function getClassStyleDeclarations () : Array;
		/**
		 *  Builds or rebuilds the CSS style cache for this component
		 */
		public function regenerateStyleCache (recursive:Boolean) : void;
		/**
		 *  Gets a style property that has been set anywhere in this
		 */
		public function getStyle (styleProp:String) : *;
		/**
		 *  Sets a style property on this component instance.
		 */
		public function setStyle (styleProp:String, newValue:*) : void;
		/**
		 *  Deletes a style property from this component instance.
		 */
		public function clearStyle (styleProp:String) : void;
		/**
		 *  Propagates style changes to the children.
		 */
		public function notifyStyleChangeInChildren (styleProp:String, recursive:Boolean) : void;
		/**
		 *  @private
		 */
		function initThemeColor () : Boolean;
		/**
		 *  @private
		 */
		function setThemeColor (value:Object) : void;
		/**
		 *  Returns a UITextFormat object corresponding to the text styles
		 */
		public function determineTextFormatFromStyles () : UITextFormat;
		/**
		 *  Executes the data bindings into this UIComponent object.
		 */
		public function executeBindings (recurse:Boolean = false) : void;
		/**
		 *  For each effect event, registers the EffectManager
		 */
		public function registerEffects (effects:Array) : void;
		/**
		 *  @private
		 */
		function addOverlay (color:uint, targetArea:RoundedRectangle = null) : void;
		/**
		 *  This is an internal method used by the Flex framework
		 */
		protected function attachOverlay () : void;
		/**
		 *  @private
		 */
		function fillOverlay (overlay:UIComponent, color:uint, targetArea:RoundedRectangle = null) : void;
		/**
		 *  @private  
		 */
		function removeOverlay () : void;
		/**
		 *  @private
		 */
		private function overlay_resizeHandler (event:Event) : void;
		/**
		 *  Called by the effect instance when it starts playing on the component.
		 */
		public function effectStarted (effectInst:IEffectInstance) : void;
		/**
		 *  Called by the effect instance when it stops playing on the component.
		 */
		public function effectFinished (effectInst:IEffectInstance) : void;
		/**
		 *  Ends all currently playing effects on the component.
		 */
		public function endEffectsStarted () : void;
		/**
		 *  @private
		 */
		private function updateCompleteHandler (event:FlexEvent) : void;
		/**
		 *  @private
		 */
		private function processEffectFinished (effectInsts:Array) : void;
		/**
		 *  @private
		 */
		function getEffectsForProperty (propertyName:String) : Array;
		/**
		 *  @inheritDoc
		 */
		public function createReferenceOnParentDocument (parentDocument:IFlexDisplayObject) : void;
		/**
		 *  @inheritDoc
		 */
		public function deleteReferenceOnParentDocument (parentDocument:IFlexDisplayObject) : void;
		/**
		 *  Returns the item in the <code>dataProvider</code> that was used
		 */
		public function getRepeaterItem (whichRepeater:int = -1) : Object;
		/**
		 *  This method is called when a UIComponent is constructed,
		 */
		protected function resourcesChanged () : void;
		/**
		 *  Prepares an IFlexDisplayObject for printing. 
		 */
		public function prepareToPrint (target:IFlexDisplayObject) : Object;
		/**
		 *  Called after printing is complete. 
		 */
		public function finishPrint (obj:Object, target:IFlexDisplayObject) : void;
		/**
		 *  @private
		 */
		private function callLaterDispatcher (event:Event) : void;
		/**
		 *  @private
		 */
		private function callLaterDispatcher2 (event:Event) : void;
		/**
		 *  @private
		 */
		private function creationCompleteHandler (event:FlexEvent) : void;
		/**
		 *  The event handler called for a <code>keyDown</code> event.
		 */
		protected function keyDownHandler (event:KeyboardEvent) : void;
		/**
		 *  The event handler called for a <code>keyUp</code> event.
		 */
		protected function keyUpHandler (event:KeyboardEvent) : void;
		/**
		 *  Typically overridden by components containing UITextField objects,
		 */
		protected function isOurFocus (target:DisplayObject) : Boolean;
		/**
		 *  The event handler called when a UIComponent object gets focus.
		 */
		protected function focusInHandler (event:FocusEvent) : void;
		/**
		 *  The event handler called when a UIComponent object loses focus.
		 */
		protected function focusOutHandler (event:FocusEvent) : void;
		/**
		 *  @private
		 */
		private function addedHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function removedHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function setFocusLater (event:Event = null) : void;
		/**
		 *  @private
		 */
		private function focusObj_scrollHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function focusObj_moveHandler (event:MoveEvent) : void;
		/**
		 *  @private
		 */
		private function focusObj_resizeHandler (event:ResizeEvent) : void;
		/**
		 *  @private
		 */
		private function focusObj_removedHandler (event:Event) : void;
		/**
		 *  Handles both the <code>valid</code> and <code>invalid</code> events from a
		 */
		public function validationResultHandler (event:ValidationResultEvent) : void;
		/**
		 *  @private
		 */
		private function resourceManager_changeHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function filterChangeHandler (event:Event) : void;
		/**
		 *  Returns <code>true</code> if the chain of <code>owner</code> properties 
		 */
		public function owns (child:DisplayObject) : Boolean;
		/**
		 * @private
		 */
		function getEmbeddedFont (fontName:String, bold:Boolean, italic:Boolean) : EmbeddedFont;
		/**
		 *  @private
		 */
		function getFontContext (fontName:String, bold:Boolean, italic:Boolean) : IFlexModuleFactory;
		/**
		 *  Creates a new object using a context
		 */
		protected function createInFontContext (classObj:Class) : Object;
		/**
		 *  Creates the object using a given moduleFactory.
		 */
		protected function createInModuleContext (moduleFactory:IFlexModuleFactory, className:String) : Object;
		/**
		 *  @private
		 */
		public function hasFontContextChanged () : Boolean;
		/**
		 *  @inheritDoc
		 */
		public function createAutomationIDPart (child:IAutomationObject) : Object;
		/**
		 *  @inheritDoc
		 */
		public function resolveAutomationIDPart (criteria:Object) : Array;
		/**
		 *  @inheritDoc
		 */
		public function getAutomationChildAt (index:int) : IAutomationObject;
		/**
		 *  @inheritDoc
		 */
		public function replayAutomatableEvent (event:Event) : Boolean;
		/**
		 *  @private
		 */
		public function getVisibleRect (targetParent:DisplayObject = null) : Rectangle;
		/**
		 *  Dispatches an event into the event flow. 
		 */
		public function dispatchEvent (event:Event) : Boolean;
	}
	/**
	 *  @private
	 */
	internal class MethodQueueElement
	{
		/**
		 *  A reference to the method to be called.
		 */
		public var method : Function;
		/**
		 *  The arguments to be passed to the method.
		 */
		public var args : Array;

		/**
		 *  Constructor.
		 */
		public function MethodQueueElement (method:Function, args:Array = null);
	}
}