﻿package mx.events
{
	import flash.display.NativeMenu;
	import flash.display.NativeMenuItem;
	import flash.events.Event;

	/**
	 *  The FlexNativeMenuEvent class represents events that are associated with menu
	 */
	public class FlexNativeMenuEvent extends Event
	{
		/**
		 *  The FlexNativeMenuEvent.ITEM_CLICK event type constant indicates that the
		 */
		public static const ITEM_CLICK : String = "itemClick";
		/**
		 *  The FlexNativeMenuEvent.MENU_SHOW type constant indicates that
		 */
		public static const MENU_SHOW : String = "menuShow";
		/**
		 *  The index of the associated menu item within its parent menu or submenu.
		 */
		public var index : int;
		/**
		 *  The specific item in the dataProvider.
		 */
		public var item : Object;
		/**
		 *  The label text of the associated menu item.
		 */
		public var label : String;
		/**
		 *  The specific NativeMenu instance associated with the event,
		 */
		public var nativeMenu : NativeMenu;
		/**
		 *  The specific NativeMenuItem instance associated with the event,
		 */
		public var nativeMenuItem : NativeMenuItem;

		/**
		 *  Constructor.
		 */
		public function FlexNativeMenuEvent (type:String, bubbles:Boolean = false, cancelable:Boolean = true, nativeMenu:NativeMenu = null, nativeMenuItem:NativeMenuItem = null, item:Object = null, label:String = null, index:int = -1);
		/**
		 *  @private
		 */
		public function clone () : Event;
	}
}