﻿package mx.controls.treeClasses
{
	import mx.controls.listClasses.BaseListData;
	import mx.controls.listClasses.ListBase;

	/**
	 *  The TreeListData class defines the data type of the <code>listData</code> property 
	 */
	public class TreeListData extends BaseListData
	{
		/**
		 *  The level of the item in the tree. The top level is 1.
		 */
		public var depth : int;
		/**
		 *  A Class representing the disclosure icon for the item in the Tree control.
		 */
		public var disclosureIcon : Class;
		/**
		 *  Contains <code>true</code> if the node has children.
		 */
		public var hasChildren : Boolean;
		/**
		 *  A Class representing the icon for the item in the Tree control.
		 */
		public var icon : Class;
		/**
		 *  The default indentation for this row of the Tree control.
		 */
		public var indent : int;
		/**
		 *  The data for this item in the Tree control.
		 */
		public var item : Object;
		/**
		 *  Contains <code>true</code> if the node is open.
		 */
		public var open : Boolean;

		/**
		 *  Constructor.
		 */
		public function TreeListData (text:String, uid:String, owner:ListBase, rowIndex:int = 0, columnIndex:int = 0);
	}
}