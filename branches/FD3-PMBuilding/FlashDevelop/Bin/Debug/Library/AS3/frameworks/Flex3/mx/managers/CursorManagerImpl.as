﻿package mx.managers
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	import flash.events.ContextMenuEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.ui.Mouse;
	import mx.core.ApplicationGlobals;
	import mx.core.EventPriority;
	import mx.core.FlexSprite;
	import mx.core.mx_internal;
	import mx.core.IUIComponent;
	import mx.events.InterManagerRequest;
	import mx.events.SandboxMouseEvent;
	import mx.events.SWFBridgeRequest;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;
	import mx.managers.CursorManager;
	import mx.managers.CursorManagerPriority;
	import mx.managers.ISystemManager;

	/**
	 *  @private
	 */
	public class CursorManagerImpl implements ICursorManager
	{
		/**
		 *  @private
		 */
		private static var instance : ICursorManager;
		/**
		 *  @private
		 */
		private var nextCursorID : int;
		/**
		 *  @private
		 */
		private var cursorList : Array;
		/**
		 *  @private
		 */
		private var busyCursorList : Array;
		/**
		 *  @private
		 */
		private var initialized : Boolean;
		/**
		 *  @private
		 */
		private var cursorHolder : Sprite;
		/**
		 *  @private
		 */
		private var currentCursor : DisplayObject;
		/**
		 *  @private
		 */
		private var listenForContextMenu : Boolean;
		/**
		 *  @private
		 */
		private var overTextField : Boolean;
		/**
		 *  @private
		 */
		private var overLink : Boolean;
		/**
		 *  @private
		 */
		private var showSystemCursor : Boolean;
		/**
		 *  @private
		 */
		private var showCustomCursor : Boolean;
		/**
		 *  @private
		 */
		private var systemManager : ISystemManager;
		/**
		 *  @private
		 */
		private var sandboxRoot : IEventDispatcher;
		/**
		 *  @private
		 */
		private var sourceArray : Array;
		/**
		 *  @private
		 */
		private var _currentCursorID : int;
		/**
		 *  @private
		 */
		private var _currentCursorXOffset : Number;
		/**
		 *  @private
		 */
		private var _currentCursorYOffset : Number;

		/**
		 *  ID of the current custom cursor,
		 */
		public function get currentCursorID () : int;
		/**
		 *  @private
		 */
		public function set currentCursorID (value:int) : void;
		/**
		 *  The x offset of the custom cursor, in pixels,
		 */
		public function get currentCursorXOffset () : Number;
		/**
		 *  @private
		 */
		public function set currentCursorXOffset (value:Number) : void;
		/**
		 *  The y offset of the custom cursor, in pixels,
		 */
		public function get currentCursorYOffset () : Number;
		/**
		 *  @private
		 */
		public function set currentCursorYOffset (value:Number) : void;

		/**
		 *  @private
		 */
		public static function getInstance () : ICursorManager;
		/**
		 *  @private
		 */
		public function CursorManagerImpl (systemManager:ISystemManager = null);
		/**
		 *  Makes the cursor visible.
		 */
		public function showCursor () : void;
		/**
		 *  Makes the cursor invisible.
		 */
		public function hideCursor () : void;
		/**
		 *  Creates a new cursor and sets an optional priority for the cursor.
		 */
		public function setCursor (cursorClass:Class, priority:int = 2, xOffset:Number = 0, yOffset:Number = 0) : int;
		/**
		 *  @private
		 */
		private function priorityCompare (a:CursorQueueItem, b:CursorQueueItem) : int;
		/**
		 *  Removes a cursor from the cursor list.
		 */
		public function removeCursor (cursorID:int) : void;
		/**
		 *  Removes all of the cursors from the cursor list
		 */
		public function removeAllCursors () : void;
		/**
		 *  Displays the busy cursor.
		 */
		public function setBusyCursor () : void;
		/**
		 *  Removes the busy cursor from the cursor list.
		 */
		public function removeBusyCursor () : void;
		/**
		 *  @private
		 */
		private function showCurrentCursor () : void;
		/**
		 *  @private
		 */
		public function registerToUseBusyCursor (source:Object) : void;
		/**
		 *  @private
		 */
		public function unRegisterToUseBusyCursor (source:Object) : void;
		/**
		 *  @private
		 */
		private function contextMenu_menuSelectHandler (event:ContextMenuEvent) : void;
		/**
		 *  @private
		 */
		private function mouseOverHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function findSource (target:Object) : int;
		/**
		 *  @private
		 */
		private function marshalMouseMoveHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function mouseMoveHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function progressHandler (event:ProgressEvent) : void;
		/**
		 *  @private
		 */
		private function completeHandler (event:Event) : void;
		/**
		 *  Marshal cursorManager
		 */
		private function marshalCursorManagerHandler (event:Event) : void;
	}
	/**
	 *  @private
	 */
	internal class CursorQueueItem
	{
		/**
		 *  @private
		 */
		public var cursorID : int;
		/**
		 *  @private
		 */
		public var cursorClass : Class;
		/**
		 *  @private
		 */
		public var priority : int;
		/**
		 *  @private
		 */
		public var systemManager : ISystemManager;
		/**
		 *  @private
		 */
		public var x : Number;
		/**
		 *  @private
		 */
		public var y : Number;

		/**
		 *  Constructor.
		 */
		public function CursorQueueItem ();
	}
}