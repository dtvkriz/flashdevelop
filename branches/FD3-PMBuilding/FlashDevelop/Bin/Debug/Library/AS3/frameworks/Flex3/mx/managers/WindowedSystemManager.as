﻿package mx.managers
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Graphics;
	import flash.display.InteractiveObject;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.getClassByAlias;
	import flash.net.registerClassAlias;
	import flash.system.ApplicationDomain;
	import flash.text.Font;
	import flash.text.TextFormat;
	import flash.ui.ContextMenu;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import mx.core.EventPriority;
	import mx.core.FlexSprite;
	import mx.core.ISWFBridgeGroup;
	import mx.core.ISWFBridgeProvider;
	import mx.core.ISWFLoader;
	import mx.core.IChildList;
	import mx.core.IFlexDisplayObject;
	import mx.core.IFlexModule;
	import mx.core.IUIComponent;
	import mx.core.Singleton;
	import mx.core.SWFBridgeGroup;
	import mx.core.Window;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.events.EventListenerRequest;
	import mx.events.InvalidateRequestData;
	import mx.events.InterManagerRequest;
	import mx.events.SandboxMouseEvent;
	import mx.events.SWFBridgeRequest;
	import mx.events.SWFBridgeEvent;
	import mx.managers.systemClasses.RemotePopUp;
	import mx.managers.systemClasses.EventProxy;
	import mx.managers.systemClasses.StageEventProxy;
	import mx.managers.systemClasses.PlaceholderData;
	import mx.styles.ISimpleStyleClient;
	import mx.styles.IStyleClient;
	import mx.utils.EventUtil;
	import mx.utils.NameUtil;
	import mx.utils.ObjectUtil;
	import mx.utils.SecurityUtil;

	/**
	 *  The WindowedSystemManager class manages any non-Application windows in a 
	 */
	public class WindowedSystemManager extends MovieClip implements ISystemManager
	{
		/**
		 *  @private
		 */
		private var forms : Array;
		/**
		 *  @private
		 */
		private var form : Object;
		private var topLevel : Boolean;
		private var initialized : Boolean;
		/**
		 *  @private
		 */
		local var idleCounter : int;
		/**
		 *  @private
		 */
		local var topLevelWindow : IUIComponent;
		/**
		 *  @private
		 */
		private var myWindow : Window;
		/**
		 *  @private
		 */
		private var originalSystemManager : SystemManager;
		/**
		 *  @private
		 */
		private var _topLevelSystemManager : ISystemManager;
		/**
		 *  @private
		 */
		private var isStageRoot : Boolean;
		/**
		 *  @private
		 */
		private var isBootstrapRoot : Boolean;
		/**
		 *  Depth of this object in the containment hierarchy.
		 */
		local var nestLevel : int;
		/**
		 *  @private
		 */
		private var mouseCatcher : Sprite;
		/**
		 *  @private
		 */
		private var bridgeToFocusManager : Dictionary;
		/**
		 *  @private
		 */
		private var _applicationIndex : int;
		/**
		 *  @private
		 */
		private var _cursorChildren : WindowedSystemChildrenList;
		/**
		 *  @private
		 */
		private var _cursorIndex : int;
		/**
		 *  @private
		 */
		private var _document : Object;
		/**
		 *  @private
		 */
		private var _fontList : Object;
		/**
		 *  @private
		 */
		private var _focusPane : Sprite;
		/**
		 *  @private
		 */
		private var _numModalWindows : int;
		/**
		 *  @private
		 */
		private var _popUpChildren : WindowedSystemChildrenList;
		/**
		 *  @private
		 */
		private var _noTopMostIndex : int;
		/**
		 *  @private
		 */
		private var _rawChildren : WindowedSystemRawChildrenList;
		/**
		 * @private
		 */
		private var _swfBridgeGroup : ISWFBridgeGroup;
		/**
		 *  @private
		 */
		private var _screen : Rectangle;
		/**
		 *  @private
		 */
		private var _toolTipChildren : WindowedSystemChildrenList;
		/**
		 *  @private
		 */
		private var _toolTipIndex : int;
		/**
		 *  @private
		 */
		private var _topMostIndex : int;
		/**
		 *  @private
		 */
		private var _width : Number;
		/**
		 *  @private
		 */
		private var _window : Window;
		/**
		 *  @private
		 */
		private var _height : Number;
		private var currentSandboxEvent : Event;
		private var dispatchingToSystemManagers : Boolean;
		/**
		 * @private
		 */
		private var isDispatchingResizeEvent : Boolean;
		/**
		 * @private
		 */
		private var idToPlaceholder : Object;
		private var eventProxy : EventProxy;
		private var weakReferenceProxies : Dictionary;
		private var strongReferenceProxies : Dictionary;
		local var _mouseX : *;
		local var _mouseY : *;

		/**
		 *  @private
		 */
		function get applicationIndex () : int;
		/**
		 *  @private
		 */
		function set applicationIndex (value:int) : void;
		/**
		 *  @inheritDoc
		 */
		public function get cursorChildren () : IChildList;
		/**
		 *  @private
		 */
		function get cursorIndex () : int;
		/**
		 *  @private
		 */
		function set cursorIndex (value:int) : void;
		/**
		 *  @inheritDoc
		 */
		public function get document () : Object;
		/**
		 *  @private
		 */
		public function set document (value:Object) : void;
		/**
		 *  A table of embedded fonts in this application.  The 
		 */
		public function get embeddedFontList () : Object;
		/**
		 *  @copy mx.core.UIComponent#focusPane
		 */
		public function get focusPane () : Sprite;
		/**
		 *  @private
		 */
		public function set focusPane (value:Sprite) : void;
		/**
		 *  @private
		 */
		function get $numChildren () : int;
		/**
		 *  The number of modal windows.  Modal windows don't allow
		 */
		public function get numModalWindows () : int;
		/**
		 *  @private
		 */
		public function set numModalWindows (value:int) : void;
		/**
		 *  @inheritDoc
		 */
		public function get popUpChildren () : IChildList;
		/**
		 *  @private
		 */
		function get noTopMostIndex () : int;
		/**
		 *  @private
		 */
		function set noTopMostIndex (value:int) : void;
		/**
		 *  @inheritDoc
		 */
		public function get rawChildren () : IChildList;
		public function get swfBridgeGroup () : ISWFBridgeGroup;
		public function set swfBridgeGroup (bridgeGroup:ISWFBridgeGroup) : void;
		/**
		 *  @inheritDoc
		 */
		public function get screen () : Rectangle;
		/**
		 *  @inheritDoc
		 */
		public function get toolTipChildren () : IChildList;
		/**
		 *  @private
		 */
		function get toolTipIndex () : int;
		/**
		 *  @private
		 */
		function set toolTipIndex (value:int) : void;
		/**
		 *  Returns the SystemManager responsible for the application window.  This will be
		 */
		public function get topLevelSystemManager () : ISystemManager;
		/**
		 *  @private
		 */
		function get topMostIndex () : int;
		function set topMostIndex (value:int) : void;
		/**
		 *  The width of this object.  For the SystemManager
		 */
		public function get width () : Number;
		function get window () : Window;
		function set window (value:Window) : void;
		/**
		 *  The height of this object.  For the SystemManager
		 */
		public function get height () : Number;
		/**
		 * @inheritdoc
		 */
		public function get swfBridge () : IEventDispatcher;
		/**
		 * @inheritdoc
		 */
		public function get childAllowsParent () : Boolean;
		/**
		 * @inheritdoc
		 */
		public function get parentAllowsChild () : Boolean;
		/**
		 *  The number of non-floating windows.  This is the main application window
		 */
		public function get numChildren () : int;
		/**
		 *  @private
		 */
		public function get mouseX () : Number;
		/**
		 *  @private
		 */
		public function get mouseY () : Number;

		public function WindowedSystemManager (rootObj:IUIComponent);
		/**
		 *  @inheritDoc
		 */
		public function activate (f:IFocusManagerContainer) : void;
		/**
		 * @private
		 */
		private function activateForm (f:Object) : void;
		/**
		 *  @inheritDoc
		 */
		public function deactivate (f:IFocusManagerContainer) : void;
		/**
		 * @private
		 */
		private function deactivateForm (f:Object) : void;
		/**
		 * @private
		 */
		private function findLastActiveForm (f:Object) : Object;
		/**
		 * @private
		 */
		private function canActivatePopUp (f:Object) : Boolean;
		/**
		 * @private
		 */
		private function canActivateLocalComponent (o:Object) : Boolean;
		/**
		 * @private
		 */
		private static function isRemotePopUp (form:Object) : Boolean;
		/**
		 * @private
		 */
		private static function areRemotePopUpsEqual (form1:Object, form2:Object) : Boolean;
		/**
		 * @private
		 */
		private function findRemotePopUp (window:Object, bridge:IEventDispatcher) : RemotePopUp;
		/**
		 * Remote a remote form from the forms array.
		 */
		private function removeRemotePopUp (form:RemotePopUp) : void;
		/**
		 * @private
		 */
		private function activateRemotePopUp (form:Object) : void;
		private function deactivateRemotePopUp (form:Object) : void;
		/**
		 * Test if two forms are equal.
		 */
		private function areFormsEqual (form1:Object, form2:Object) : Boolean;
		/**
		 *  @inheritDoc
		 */
		public function addFocusManager (f:IFocusManagerContainer) : void;
		/**
		 *  @inheritDoc
		 */
		public function removeFocusManager (f:IFocusManagerContainer) : void;
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
		 *  This method is overridden in the autogenerated subclass.
		 */
		public function create (...params) : Object;
		/**
		 *  @private
		 */
		protected function docFrameHandler (event:Event = null) : void;
		/**
		 *  @private
		 */
		protected function initializeTopLevelWindow (event:Event) : void;
		/**
		 *  @private
		 */
		private function addChildAndMouseCatcher () : void;
		/**
		 *  @private
		 */
		public function info () : Object;
		/**
		 *  @private
		 */
		function regenerateStyleCache (recursive:Boolean) : void;
		/**
		 *  @private
		 */
		function notifyStyleChangeInChildren (styleProp:String, recursive:Boolean) : void;
		/**
		 *  @private
		 */
		private function initContextMenu () : void;
		/**
		 * @inheritdoc
		 */
		public function isTopLevelRoot () : Boolean;
		/**
		 * The system manager proxy has only one child that is a focus manager container.
		 */
		function findFocusManagerContainer (smp:SystemManagerProxy) : IFocusManagerContainer;
		/**
		 * @private
		 */
		function addChildBridgeListeners (bridge:IEventDispatcher) : void;
		/**
		 * @private
		 */
		function removeChildBridgeListeners (bridge:IEventDispatcher) : void;
		/**
		 * @private
		 */
		function addParentBridgeListeners () : void;
		/**
		 * @private
		 */
		function removeParentBridgeListeners () : void;
		/**
		 * Add a bridge to talk to the child owned by <code>owner</code>.
		 */
		public function addChildBridge (bridge:IEventDispatcher, owner:DisplayObject) : void;
		/**
		 * Remove a child bridge.
		 */
		public function removeChildBridge (bridge:IEventDispatcher) : void;
		/**
		 * @inheritdoc
		 */
		public function useSWFBridge () : Boolean;
		/**
		 * Go up our parent chain to get the top level system manager.
		 */
		public function getTopLevelRoot () : DisplayObject;
		/**
		 * Go up our parent chain to get the top level system manager in this 
		 */
		public function getSandboxRoot () : DisplayObject;
		/**
		 *  @inheritdoc
		 */
		public function getVisibleApplicationRect (bounds:Rectangle = null) : Rectangle;
		/**
		 *  @inheritdoc
		 */
		public function deployMouseShields (deploy:Boolean) : void;
		/**
		 * @private
		 */
		function dispatchActivatedWindowEvent (window:DisplayObject) : void;
		/**
		 * @private
		 */
		private function dispatchDeactivatedWindowEvent (window:DisplayObject) : void;
		/**
		 * @private
		 */
		private function dispatchActivatedApplicationEvent () : void;
		/**
		 * Adjust the forms array so it is sorted by last active. 
		 */
		private function updateLastActiveForm () : void;
		/**
		 * @private
		 */
		private function addPlaceholderId (id:String, previousId:String, bridge:IEventDispatcher, placeholder:Object) : void;
		private function removePlaceholderId (id:String) : void;
		/**
		 * request the parent to add an event listener.
		 */
		private function addEventListenerToOtherSystemManagers (type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false) : void;
		/**
		 * request the parent to remove an event listener.
		 */
		private function removeEventListenerFromOtherSystemManagers (type:String, listener:Function, useCapture:Boolean = false) : void;
		private function dispatchEventToOtherSystemManagers (event:Event) : void;
		/**
		 *  dispatch the event to all sandboxes except the specified one
		 */
		public function dispatchEventFromSWFBridges (event:Event, skip:IEventDispatcher = null, trackClones:Boolean = false, toOtherSystemManagers:Boolean = false) : void;
		/**
		 * request the parent to add an event listener.
		 */
		private function addEventListenerToSandboxes (type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false, skip:IEventDispatcher = null) : void;
		/**
		 * request the parent to remove an event listener.
		 */
		private function removeEventListenerFromSandboxes (type:String, listener:Function, useCapture:Boolean = false, skip:IEventDispatcher = null) : void;
		/**
		 *   @private
		 */
		private function preProcessModalWindowRequest (request:SWFBridgeRequest, sbRoot:DisplayObject) : Boolean;
		private function otherSystemManagerMouseListener (event:SandboxMouseEvent) : void;
		private function sandboxMouseListener (event:Event) : void;
		private function eventListenerRequestHandler (event:Event) : void;
		/**
		 *  Returns <code>true</code> if the given DisplayObject is the 
		 */
		public function isTopLevelWindow (object:DisplayObject) : Boolean;
		/**
		 *  @inheritDoc
		 */
		public function getDefinitionByName (name:String) : Object;
		/**
		 *  @inheritDoc
		 */
		public function isTopLevel () : Boolean;
		/**
		 *  @inheritDoc
		 */
		public function isFontFaceEmbedded (textFormat:TextFormat) : Boolean;
		/**
		 *  @private
		 */
		private function Stage_resizeHandler (event:Event = null) : void;
		/**
		 *  @private
		 */
		private function mouseDownHandler (event:MouseEvent) : void;
		/**
		 * @private
		 */
		private static function getChildListIndex (childList:IChildList, f:Object) : int;
		/**
		 *  @private
		 */
		private function resizeMouseCatcher () : void;
		/**
		 *  @private
		 */
		public function addEventListener (type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false) : void;
		/**
		 * @private
		 */
		private function hasSWFBridges () : Boolean;
		/**
		 *  @private
		 */
		public function removeEventListener (type:String, listener:Function, useCapture:Boolean = false) : void;
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
		public function getChildAt (index:int) : DisplayObject;
		/**
		 *  @private
		 */
		public function getChildByName (name:String) : DisplayObject;
		/**
		 *  @private
		 */
		public function getChildIndex (child:DisplayObject) : int;
		/**
		 *  @private
		 */
		public function setChildIndex (child:DisplayObject, newIndex:int) : void;
		/**
		 *  @private
		 */
		public function getObjectsUnderPoint (point:Point) : Array;
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
		 *  @private
		 */
		function rawChildren_addChild (child:DisplayObject) : DisplayObject;
		/**
		 *  @private
		 */
		function rawChildren_addChildAt (child:DisplayObject, index:int) : DisplayObject;
		/**
		 *  @private
		 */
		function rawChildren_removeChild (child:DisplayObject) : DisplayObject;
		/**
		 *  @private
		 */
		function rawChildren_removeChildAt (index:int) : DisplayObject;
		/**
		 *  @private
		 */
		function rawChildren_getChildAt (index:int) : DisplayObject;
		/**
		 *  @private
		 */
		function rawChildren_getChildByName (name:String) : DisplayObject;
		/**
		 *  @private
		 */
		function rawChildren_getChildIndex (child:DisplayObject) : int;
		/**
		 *  @private
		 */
		function rawChildren_setChildIndex (child:DisplayObject, newIndex:int) : void;
		/**
		 *  @private
		 */
		function rawChildren_getObjectsUnderPoint (pt:Point) : Array;
		/**
		 *  @private
		 */
		function rawChildren_contains (child:DisplayObject) : Boolean;
		/**
		 * @private
		 */
		private function addPopupRequestHandler (event:Event) : void;
		/**
		 * @private
		 */
		private function removePopupRequestHandler (event:Event) : void;
		/**
		 * @private
		 */
		private function addPlaceholderPopupRequestHandler (event:Event) : void;
		/**
		 * @private
		 */
		private function removePlaceholderPopupRequestHandler (event:Event) : void;
		/**
		 * Forward a form event update the parent chain. 
		 */
		private function forwardFormEvent (event:SWFBridgeEvent) : Boolean;
		/**
		 * Forward an AddPlaceholder request up the parent chain, if needed.
		 */
		private function forwardPlaceholderRequest (request:SWFBridgeRequest, addPlaceholder:Boolean) : Boolean;
		/**
		 * One of the system managers in another sandbox deactivated and sent a message
		 */
		private function deactivateFormSandboxEventHandler (event:Event) : void;
		/**
		 * A form in one of the system managers in another sandbox has been activated. 
		 */
		private function activateFormSandboxEventHandler (event:Event) : void;
		/**
		 * One of the system managers in another sandbox activated and sent a message
		 */
		private function activateApplicationSandboxEventHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function modalWindowRequestHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function getVisibleRectRequestHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function hideMouseCursorRequestHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function showMouseCursorRequestHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function resetMouseCursorRequestHandler (event:Event) : void;
		private function resetMouseCursorTracking (event:Event) : void;
		/**
		 * @private
		 */
		private function setActualSizeRequestHandler (event:Event) : void;
		/**
		 * @private
		 */
		private function getSizeRequestHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function activateRequestHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function deactivateRequestHandler (event:Event) : void;
		/**
		 * Is the child in event.data this system manager or a child of this 
		 */
		private function isBridgeChildHandler (event:Event) : void;
		/**
		 * Can this form be activated. The current test is if the given pop up 
		 */
		private function canActivateHandler (event:Event) : void;
		/**
		 * @private
		 */
		public function isDisplayObjectInABridgedApplication (displayObject:DisplayObject) : Boolean;
		/**
		 * redispatch certian events to other top-level windows
		 */
		private function multiWindowRedispatcher (event:Event) : void;
		/**
		 * Create the requested manager
		 */
		private function initManagerHandler (event:Event) : void;
		/**
		 *  Add child to requested childList
		 */
		public function addChildToSandboxRoot (layer:String, child:DisplayObject) : void;
		/**
		 *  Remove child from requested childList
		 */
		public function removeChildFromSandboxRoot (layer:String, child:DisplayObject) : void;
		/**
		 * perform the requested action from a trusted dispatcher
		 */
		private function systemManagerHandler (event:Event) : void;
		/**
		 * Return the object the player sees as having focus.
		 */
		public function getFocus () : InteractiveObject;
		/**
		 *  @private
		 */
		function cleanup (e:Event) : void;
		/**
		 *  @private
		 */
		function addWindow (win:Window) : void;
	}
}