﻿package mx.collections
{
	/**
	 *  Encapsulates the positional aspects of a cursor in an 
	 */
	public class CursorBookmark
	{
		private static var _first : CursorBookmark;
		private static var _last : CursorBookmark;
		private static var _current : CursorBookmark;
		private var _value : Object;

		/**
		 *  A bookmark for the first item in an <code>ICollectionView</code>.
		 */
		public static function get FIRST () : CursorBookmark;
		/**
		 *  A bookmark for the last item in an <code>ICollectionView</code>.
		 */
		public static function get LAST () : CursorBookmark;
		/**
		 *  A bookmark representing the current item for the <code>IViewCursor</code> in
		 */
		public static function get CURRENT () : CursorBookmark;
		/**
		 *  The underlying marker representation of the bookmark.
		 */
		public function get value () : Object;

		/**
		 *  Creates a new instance of a bookmark with the specified value.
		 */
		public function CursorBookmark (value:Object);
		/**
		 *  Gets the approximate index of the item represented by this bookmark
		 */
		public function getViewIndex () : int;
	}
}