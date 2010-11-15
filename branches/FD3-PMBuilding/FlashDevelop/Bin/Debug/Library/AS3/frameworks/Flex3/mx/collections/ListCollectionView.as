﻿package mx.collections
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	import flash.utils.getQualifiedClassName;
	import mx.collections.errors.CollectionViewError;
	import mx.collections.errors.CursorError;
	import mx.collections.errors.ItemPendingError;
	import mx.collections.errors.SortError;
	import mx.core.IMXMLObject;
	import mx.core.mx_internal;
	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.managers.ISystemManager;
	import mx.managers.SystemManager;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;
	import mx.utils.ObjectUtil;
	import flash.events.EventDispatcher;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import mx.events.*;
	import mx.collections.*;
	import mx.collections.errors.*;
	import mx.core.mx_internal;
	import mx.managers.*;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;

	/**
	 *  Dispatched when the ICollectionView has been updated in some way.
	 */
	[Event(name="collectionChange", type="mx.events.CollectionEvent")] 
	/**
	 *  Dispatched whenever the cursor position is updated.
	 */
	[Event(name="cursorUpdate", type="mx.events.FlexEvent")] 

	/**
	 * The ListCollectionView class adds the properties and methods of the
	 */
	public class ListCollectionView extends Proxy implements ICollectionView
	{
		/**
		 *  @private
		 */
		private var eventDispatcher : EventDispatcher;
		/**
		 *  @private
		 */
		private var revision : int;
		/**
		 *  @private
		 */
		private var autoUpdateCounter : int;
		/**
		 *  @private
		 */
		private var pendingUpdates : Array;
		/**
		 *  @private
		 */
		local var dispatchResetEvent : Boolean;
		/**
		 *  @private
		 */
		private var resourceManager : IResourceManager;
		/**
		 *  When the view is sorted or filtered the <code>localIndex</code> property
		 */
		protected var localIndex : Array;
		/**
		 *  @private
		 */
		private var _list : IList;
		/**
		 *  @private
		 */
		private var _filterFunction : Function;
		/**
		 *  @private
		 */
		private var _sort : Sort;

		/**
		 *  @inheritDoc
		 */
		public function get length () : int;
		/**
		 *  The IList that this collection view wraps.
		 */
		public function get list () : IList;
		/**
		 *  @private
		 */
		public function set list (value:IList) : void;
		/**
		 *  @inheritDoc
		 */
		public function get filterFunction () : Function;
		/**
		 *  @private
		 */
		public function set filterFunction (f:Function) : void;
		/**
		 *  @inheritDoc
		 */
		public function get sort () : Sort;
		/**
		 *  @private
		 */
		public function set sort (s:Sort) : void;

		/**
		 *  The ListCollectionView constructor.
		 */
		public function ListCollectionView (list:IList = null);
		/**
		 *  Called automatically by the MXML compiler when the ListCollectionView
		 */
		public function initialized (document:Object, id:String) : void;
		/**
		 *  @inheritDoc
		 */
		public function contains (item:Object) : Boolean;
		/**
		 *  @inheritDoc
		 */
		public function disableAutoUpdate () : void;
		/**
		 *  @inheritDoc
		 */
		public function enableAutoUpdate () : void;
		/**
		 *  @inheritDoc
		 */
		public function createCursor () : IViewCursor;
		/**
		 *  @inheritDoc
		 */
		public function itemUpdated (item:Object, property:Object = null, oldValue:Object = null, newValue:Object = null) : void;
		/**
		 * @inheritDoc
		 */
		public function refresh () : Boolean;
		/**
		 * @inheritDoc
		 */
		public function getItemAt (index:int, prefetch:int = 0) : Object;
		/**
		 * @inheritDoc
		 */
		public function setItemAt (item:Object, index:int) : Object;
		/**
		 * @inheritDoc
		 */
		public function addItem (item:Object) : void;
		/**
		 * @inheritDoc
		 */
		public function addItemAt (item:Object, index:int) : void;
		/**
		 * @inheritDoc
		 */
		public function getItemIndex (item:Object) : int;
		/**
		 * @private
		 */
		private function getFilteredItemIndex (item:Object) : int;
		/**
		 * @inheritDoc
		 */
		public function removeItemAt (index:int) : Object;
		/**
		 * Remove all items from the list.
		 */
		public function removeAll () : void;
		/**
		 * @inheritDoc
		 */
		public function toArray () : Array;
		/**
		 *  Prints the contents of this view to a string and returns it.
		 */
		public function toString () : String;
		/**
		 *  @private
		 */
		flash_proxy function getProperty (name:*) : *;
		/**
		 *  @private
		 */
		flash_proxy function setProperty (name:*, value:*) : void;
		/**
		 *  @private
		 */
		flash_proxy function hasProperty (name:*) : Boolean;
		/**
		 *  @private
		 */
		flash_proxy function nextNameIndex (index:int) : int;
		/**
		 *  @private
		 */
		flash_proxy function nextName (index:int) : String;
		/**
		 *  @private
		 */
		flash_proxy function nextValue (index:int) : *;
		/**
		 *  @private
		 */
		flash_proxy function callProperty (name:*, ...rest) : *;
		/**
		 *  @inheritDoc
		 */
		public function addEventListener (type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false) : void;
		/**
		 *  @inheritDoc
		 */
		public function removeEventListener (type:String, listener:Function, useCapture:Boolean = false) : void;
		/**
		 *  @inheritDoc
		 */
		public function dispatchEvent (event:Event) : Boolean;
		/**
		 *  @inheritDoc
		 */
		public function hasEventListener (type:String) : Boolean;
		/**
		 *  @inheritDoc
		 */
		public function willTrigger (type:String) : Boolean;
		/**
		 *  Take the item and insert it into the view.  If we don't have a sort
		 */
		private function addItemsToView (items:Array, sourceLocation:int, dispatch:Boolean = true) : int;
		/**
		 *  Find the item specified using the Sort find mode constants.
		 */
		function findItem (values:Object, mode:String, insertIndex:Boolean = false) : int;
		/**
		 *  Create a bookmark for this view.  This method is called by
		 */
		function getBookmark (index:int) : ListCollectionViewBookmark;
		/**
		 *  Given a bookmark find the location for the value.  If the
		 */
		function getBookmarkIndex (bookmark:CursorBookmark) : int;
		/**
		 * The view is a listener of CollectionEvents on its underlying IList
		 */
		private function listChangeHandler (event:CollectionEvent) : void;
		/**
		 * Given a set of PropertyChangeEvents go through and update the view.
		 */
		private function handlePropertyChangeEvents (events:Array) : void;
		/**
		 * When enableAutoUpdates pushes autoUpdateCounter back down to 0
		 */
		private function handlePendingUpdates () : void;
		private function internalRefresh (dispatch:Boolean) : Boolean;
		/**
		 * Remove the old value from the view and replace it with the value
		 */
		private function moveItemInView (item:Object, dispatch:Boolean = true, updateEventItems:Array = null) : void;
		/**
		 * Copy all of the data from the source list into the local index.
		 */
		private function populateLocalIndex () : void;
		/**
		 *  Take the item and remove it from the view.  If we don't have a sort
		 */
		private function removeItemsFromView (items:Array, sourceLocation:int, dispatch:Boolean = true) : void;
		/**
		 * Items is an array of PropertyChangeEvents so replace the oldValues with the new
		 */
		private function replaceItemsInView (items:Array, location:int, dispatch:Boolean = true) : void;
		/**
		 *  @private
		 */
		function reset () : void;
	}
	/**
	 *  @private
	 */
	internal class ListCollectionViewCursor extends EventDispatcher implements IViewCursor
	{
		/**
		 *  @private
		 */
		private static const BEFORE_FIRST_INDEX : int = -1;
		/**
		 *  @private
		 */
		private static const AFTER_LAST_INDEX : int = -2;
		/**
		 *  @private
		 */
		private var _view : ListCollectionView;
		/**
		 *  @private
		 */
		private var currentIndex : int;
		/**
		 *  @private
		 */
		private var currentValue : Object;
		/**
		 *  @private
		 */
		private var invalid : Boolean;
		/**
		 *  @private
		 */
		private var resourceManager : IResourceManager;

		/**
		 *  Get a reference to the view that this cursor is associated with.
		 */
		public function get view () : ICollectionView;
		/**
		 *  Provides access the object at the current location referenced by
		 */
		public function get current () : Object;
		/**
		 *  Provides access to the bookmark of the item returned by the
		 */
		public function get bookmark () : CursorBookmark;
		/**
		 * true if the current is sitting before the first item in the view.
		 */
		public function get beforeFirst () : Boolean;
		/**
		 * true if the cursor is sitting after the last item in the view.
		 */
		public function get afterLast () : Boolean;

		/**
		 *  Constructor.
		 */
		public function ListCollectionViewCursor (view:ListCollectionView);
		/**
		 *  Finds the item with the specified properties within the
		 */
		public function findAny (values:Object) : Boolean;
		/**
		 *  Finds the first item with the specified properties
		 */
		public function findFirst (values:Object) : Boolean;
		/**
		 *  Finds the last item with the specified properties
		 */
		public function findLast (values:Object) : Boolean;
		/**
		 * Insert the specified item before the cursor's current position.
		 */
		public function insert (item:Object) : void;
		/**
		 *  Moves the cursor to the next item within the collection. On success
		 */
		public function moveNext () : Boolean;
		/**
		 *  Moves the cursor to the previous item within the collection. On success
		 */
		public function movePrevious () : Boolean;
		/**
		 * Remove the current item and return it.  If the cursor is
		 */
		public function remove () : Object;
		/**
		 *  Moves the cursor to a location at an offset from the specified
		 */
		public function seek (bookmark:CursorBookmark, offset:int = 0, prefetch:int = 0) : void;
		private function checkValid () : void;
		private function collectionEventHandler (event:CollectionEvent) : void;
		/**
		 *  @private
		 */
		private function setCurrent (value:Object, dispatch:Boolean = true) : void;
	}
	/**
	 *  @private
	 */
	internal class ListCollectionViewBookmark extends CursorBookmark
	{
		local var index : int;
		local var view : ListCollectionView;
		local var viewRevision : int;

		/**
		 *  @private
		 */
		public function ListCollectionViewBookmark (value:Object, view:ListCollectionView, viewRevision:int, index:int);
		/**
		 * Get the approximate index of the item represented by this bookmark
		 */
		public function getViewIndex () : int;
	}
}