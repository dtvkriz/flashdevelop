﻿package mx.collections
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import mx.collections.errors.SortError;
	import mx.core.mx_internal;
	import mx.managers.ISystemManager;
	import mx.managers.SystemManager;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;
	import mx.utils.ObjectUtil;

	/**
	 *  Provides the sorting information required to establish a sort on a field
	 */
	public class SortField extends EventDispatcher
	{
		/**
		 *  @private
		 */
		private var resourceManager : IResourceManager;
		/**
		 *  @private
		 */
		private var _caseInsensitive : Boolean;
		/**
		 *  @private
		 */
		private var _compareFunction : Function;
		private var _usingCustomCompareFunction : Boolean;
		/**
		 *  @private
		 */
		private var _descending : Boolean;
		/**
		 *  @private
		 */
		private var _name : String;
		/**
		 *  @private
		 */
		private var _numeric : Object;

		/**
		 *  Specifies whether the sort for this field should be case insensitive.
		 */
		public function get caseInsensitive () : Boolean;
		/**
		 *  @private
		 */
		public function set caseInsensitive (value:Boolean) : void;
		/**
		 *  The function that compares two items during a sort of items for the
		 */
		public function get compareFunction () : Function;
		/**
		 *  @private
		 */
		public function set compareFunction (c:Function) : void;
		/**
		 * True if this SortField uses a custom comparitor function.
		 */
		function get usingCustomCompareFunction () : Boolean;
		/**
		 *  Specifies whether the this field should be sorted in descending
		 */
		public function get descending () : Boolean;
		/**
		 *  @private
		 */
		public function set descending (value:Boolean) : void;
		/**
		 *  The name of the field to be sorted.
		 */
		public function get name () : String;
		/**
		 *  @private
		 */
		public function set name (n:String) : void;
		/**
		 *  Specifies that if the field being sorted contains numeric
		 */
		public function get numeric () : Object;
		/**
		 *  @private
		 */
		public function set numeric (value:Object) : void;

		/**
		 *  Constructor.
		 */
		public function SortField (name:String = null, caseInsensitive:Boolean = false, descending:Boolean = false, numeric:Object = null);
		function internalCompare (a:Object, b:Object) : int;
		/**
		 * Build up the options argument that could be used to Array.sortOn.
		 */
		function getArraySortOnOptions () : int;
		/**
		 *  @private
		 */
		function initCompare (obj:Object) : void;
		/**
		 * Reverse the criteria for this sort field.
		 */
		public function reverse () : void;
		/**
		 *  @private
		 */
		public function toString () : String;
		private function nullCompare (a:Object, b:Object) : int;
		/**
		 * Pull the numbers from the objects and call the implementation.
		 */
		private function numericCompare (a:Object, b:Object) : int;
		/**
		 * Pull the date objects from the values and compare them.
		 */
		private function dateCompare (a:Object, b:Object) : int;
		/**
		 * Pull the strings from the objects and call the implementation.
		 */
		private function stringCompare (a:Object, b:Object) : int;
		/**
		 * Pull the values out fo the XML object, then compare
		 */
		private function xmlCompare (a:Object, b:Object) : int;
	}
}