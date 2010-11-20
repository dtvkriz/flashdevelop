﻿package mx.controls
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.ui.Keyboard;
	import flash.utils.clearInterval;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	import flash.xml.XMLNode;
	import mx.collections.ArrayCollection;
	import mx.collections.CursorBookmark;
	import mx.collections.ICollectionView;
	import mx.collections.XMLListCollection;
	import mx.controls.listClasses.BaseListData;
	import mx.controls.listClasses.IListItemRenderer;
	import mx.controls.menuClasses.IMenuBarItemRenderer;
	import mx.controls.menuClasses.IMenuDataDescriptor;
	import mx.controls.menuClasses.IMenuItemRenderer;
	import mx.controls.menuClasses.MenuItemRenderer;
	import mx.controls.menuClasses.MenuListData;
	import mx.controls.treeClasses.DefaultDataDescriptor;
	import mx.core.Application;
	import mx.core.ClassFactory;
	import mx.core.EdgeMetrics;
	import mx.core.EventPriority;
	import mx.core.ScrollPolicy;
	import mx.core.UIComponent;
	import mx.core.UIComponentGlobals;
	import mx.core.mx_internal;
	import mx.effects.Tween;
	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;
	import mx.events.FlexEvent;
	import mx.events.FlexMouseEvent;
	import mx.events.InterManagerRequest;
	import mx.events.ListEvent;
	import mx.events.SandboxMouseEvent;
	import mx.events.MenuEvent;
	import mx.managers.IFocusManagerContainer;
	import mx.managers.ISystemManager;
	import mx.managers.PopUpManager;

	/**
	 *  Dispatched when selection changes as a result
	 */
	[Event(name="change", type="mx.events.MenuEvent")] 
	/**
	 *  Dispatched when a menu item is selected. 
	 */
	[Event(name="itemClick", type="mx.events.MenuEvent")] 
	/**
	 *  Dispatched when a menu or submenu is dismissed.
	 */
	[Event(name="menuHide", type="mx.events.MenuEvent")] 
	/**
	 *  Dispatched when a menu or submenu opens. 
	 */
	[Event(name="menuShow", type="mx.events.MenuEvent")] 
	/**
	 *  Dispatched when a user rolls the mouse out of a menu item.
	 */
	[Event(name="itemRollOut", type="mx.events.MenuEvent")] 
	/**
	 *  Dispatched when a user rolls the mouse over a menu item.
	 */
	[Event(name="itemRollOver", type="mx.events.MenuEvent")] 
	/**
	 *  The colors used for menu or submenu menu items in an alternating pattern. 
	 */
	[Style(name="alternatingItemColors", type="Array", arrayType="uint", format="Color", inherit="yes")] 
	/**
	 *  Number of pixels between children (icons and label) in the horizontal direction.
	 */
	[Style(name="horizontalGap", type="Number", format="Length", inherit="no")] 
	/**
	 *  The gap to the left of the label in a menu item.  If the icons (custom 
	 */
	[Style(name="leftIconGap", type="Number", format="Length", inherit="no")] 
	/**
	 *  The gap to the right of the label in a menu item.  If the branch icon 
	 */
	[Style(name="rightIconGap", type="Number", format="Length", inherit="no")] 
	/**
	 *  The duration of the menu or submenu opening transition, in milliseconds.
	 */
	[Style(name="openDuration", type="Number", format="Time", inherit="no")] 
	/**
	 *  The color of the menu item background when a user rolls the mouse over it. 
	 */
	[Style(name="rollOverColor", type="uint", format="Color", inherit="yes")] 
	/**
	 *  The color of the menu item background when a menu item is selected.
	 */
	[Style(name="selectionColor", type="uint", format="Color", inherit="yes")] 
	/**
	 *  The reference to an <code>easingFunction</code> equation which is used to 
	 */
	[Style(name="selectionEasingFunction", type="Function", inherit="no")] 
	/**
	 *  The offset of the first line of text from the left side of the menu or 
	 */
	[Style(name="textIndent", type="Number", format="Length", inherit="yes")] 
	/**
	 *  The color of the menu item text when a user rolls the mouse over the 
	 */
	[Style(name="textRollOverColor", type="uint", format="Color", inherit="yes")] 
	/**
	 *  The color of the menu item text when the menu item is selected.
	 */
	[Style(name="textSelectedColor", type="uint", format="Color", inherit="yes")] 
	/**
	 *  The icon for all enabled menu items that have submenus. 
	 */
	[Style(name="branchIcon", type="Class", inherit="no")] 
	/**
	 *  The icon for all disabled menu items that have submenus. 
	 */
	[Style(name="branchDisabledIcon", type="Class", inherit="no")] 
	/**
	 *  The icon for all enabled menu items whose type identifier is a check box. 
	 */
	[Style(name="checkIcon", type="Class", inherit="no")] 
	/**
	 *  The icon for all dsiabled menu items whose type identifier is a check box. 
	 */
	[Style(name="checkDisabledIcon", type="Class", inherit="no")] 
	/**
	 *  The icon for all enabled menu items whose type identifier is a radio 
	 */
	[Style(name="radioIcon", type="Class", inherit="no")] 
	/**
	 *  The icon for all disabled menu items whose type identifier is a radio 
	 */
	[Style(name="radioDisabledIcon", type="Class", inherit="no")] 
	/**
	 *  The skin for all menu items which are identified as separators. 
	 */
	[Style(name="separatorSkin", type="Class", inherit="no")] 

	/**
	 *  The Menu control creates a pop-up menu of individually selectable choices,
	 */
	public class Menu extends List implements IFocusManagerContainer
	{
		/**
		 *  @private
		 */
		static var createAccessibilityImplementation : Function;
		/**
		 *  @private
		 */
		private var hiddenItem : IListItemRenderer;
		/**
		 *  @private
		 */
		private var maxMeasuredIconWidth : Number;
		/**
		 *  @private
		 */
		private var maxMeasuredTypeIconWidth : Number;
		/**
		 *  @private
		 */
		private var maxMeasuredBranchIconWidth : Number;
		/**
		 *  @private
		 */
		private var useTwoColumns : Boolean;
		/**
		 *  @private
		 */
		local var sourceMenuBar : MenuBar;
		/**
		 *  @private
		 */
		local var sourceMenuBarItem : IMenuBarItemRenderer;
		/**
		 *  @private
		 */
		local var parentDisplayObject : DisplayObject;
		private var anchorRow : IListItemRenderer;
		private var subMenu : Menu;
		local var popupTween : Tween;
		local var supposedToLoseFocus : Boolean;
		/**
		 *  @private
		 */
		local var openSubMenuTimer : int;
		/**
		 *  @private
		 */
		local var closeTimer : int;
		/**
		 *  @private
		 */
		local var _rootModel : ICollectionView;
		/**
		 *  @private
		 */
		local var _parentMenu : Menu;
		/**
		 *  @private
		 */
		local var _dataDescriptor : IMenuDataDescriptor;
		/**
		 *  @private
		 */
		local var dataProviderChanged : Boolean;
		/**
		 *  @private
		 */
		local var _showRoot : Boolean;
		/**
		 *  @private
		 */
		local var showRootChanged : Boolean;
		/**
		 *  @private
		 */
		local var _hasRoot : Boolean;

		/**
		 *  The parent menu in a hierarchical chain of menus, where the current 
		 */
		public function get parentMenu () : Menu;
		/**
		 *  @private
		 */
		public function set parentMenu (value:Menu) : void;
		/**
		 *  The object that accesses and manipulates data in the data provider. 
		 */
		public function get dataDescriptor () : IMenuDataDescriptor;
		/**
		 *  @private
		 */
		public function set dataDescriptor (value:IMenuDataDescriptor) : void;
		/**
		 *  @private
		 */
		public function set dataProvider (value:Object) : void;
		/**
		 *  @private
		 */
		public function get dataProvider () : Object;
		/**
		 *  A Boolean flag that specifies whether to display the data provider's 
		 */
		public function get showRoot () : Boolean;
		/**
		 *  @private
		 */
		public function set showRoot (value:Boolean) : void;
		/**
		 *  A flag that indicates that the current data provider has a root node; for example, 
		 */
		public function get hasRoot () : Boolean;
		/**
		 *  @private
		 */
		public function get horizontalScrollPolicy () : String;
		/**
		 *  @private
		 */
		public function set horizontalScrollPolicy (value:String) : void;
		/**
		 *  @private
		 */
		public function get verticalScrollPolicy () : String;
		/**
		 *  @private
		 */
		public function set verticalScrollPolicy (value:String) : void;
		/**
		 *  For autotesting, get the current set of submenus
		 */
		function get subMenus () : Array;

		/**
		 *  Creates and returns an instance of the Menu class. The Menu control's 
		 */
		public static function createMenu (parent:DisplayObjectContainer, mdp:Object, showRoot:Boolean = true) : Menu;
		/**
		 *  Sets the dataProvider of an existing Menu control and places the Menu 
		 */
		public static function popUpMenu (menu:Menu, parent:DisplayObjectContainer, mdp:Object) : void;
		/**
		 *  Constructor.
		 */
		public function Menu ();
		/**
		 *  @private
		 */
		private function parentHideHandler (event:FlexEvent) : void;
		/**
		 *  @private
		 */
		private function parentRowHeightHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function parentIconFieldHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function parentIconFunctionHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function parentLabelFieldHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function parentLabelFunctionHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function parentItemRendererHandler (event:Event) : void;
		/**
		 *  @private
		 */
		protected function initializeAccessibility () : void;
		/**
		 *  @private
		 */
		protected function commitProperties () : void;
		/**
		 *  Calculates the preferred width and height of the Menu based on the
		 */
		protected function measure () : void;
		/**
		 *  @private
		 */
		public function measureWidthOfItems (index:int = -1, count:int = 0) : Number;
		/**
		 *  @private
		 */
		protected function updateDisplayList (unscaledWidth:Number, unscaledHeight:Number) : void;
		/**
		 *  @private
		 */
		public function styleChanged (styleProp:String) : void;
		/**
		 *  @private
		 */
		protected function drawItem (item:IListItemRenderer, selected:Boolean = false, highlighted:Boolean = false, caret:Boolean = false, transition:Boolean = false) : void;
		/**
		 *  @private
		 */
		protected function configureScrollBars () : void;
		function clearHighlight (item:IListItemRenderer) : void;
		/**
		 *  @private
		 */
		protected function mouseEventToItemRenderer (event:MouseEvent) : IListItemRenderer;
		/**
		 *  @private
		 */
		public function setFocus () : void;
		/**
		 *  @private
		 */
		protected function focusOutHandler (event:FocusEvent) : void;
		/**
		 *  @private
		 */
		public function dispatchEvent (event:Event) : Boolean;
		/**
		 *  Toggles the menu item. The menu item type identifier must be a
		 */
		protected function setMenuItemToggled (item:Object, toggle:Boolean) : void;
		/**
		 *  Creates a new MenuListData instance and populates the fields based on
		 */
		protected function makeListData (data:Object, uid:String, rowNum:int) : BaseListData;
		/**
		 *  Shows the Menu control. If the Menu control is not visible, this method 
		 */
		public function show (xShow:Object = null, yShow:Object = null) : void;
		/**
		 *  @private
		 */
		function onTweenUpdate (value:Object) : void;
		/**
		 *  @private
		 */
		function onTweenEnd (value:Object) : void;
		/**
		 *  Hides the Menu control and any of its submenus if the Menu control is
		 */
		public function hide () : void;
		/**
		 *  @private
		 */
		protected function collectionChangeHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function mouseDownOutsideHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private static function menuHideHandler (event:MenuEvent) : void;
		/**
		 *  @private
		 */
		protected function mouseUpHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		protected function mouseDownHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		protected function mouseOutHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		protected function mouseOverHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		protected function mouseClickHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		protected function keyDownHandler (event:KeyboardEvent) : void;
		/**
		 *  @private
		 */
		private function moveSelBy (oldIndex:Number, incr:Number) : void;
		/**
		 *  @private
		 */
		function openSubMenu (row:IListItemRenderer) : void;
		/**
		 *  @private
		 */
		private function closeSubMenu (menu:Menu) : void;
		function deleteDependentSubMenus () : void;
		function hideAllMenus () : void;
		private function isMouseOverMenu (event:MouseEvent) : Boolean;
		private function isMouseOverMenuBarItem (event:MouseEvent) : Boolean;
		/**
		 * From any menu, walks up the parent menu chain and finds the root menu.
		 */
		function getRootMenu () : Menu;
		/**
		 * Given a row, find the row's index in the Menu.
		 */
		private function getRowIndex (row:IListItemRenderer) : int;
	}
}