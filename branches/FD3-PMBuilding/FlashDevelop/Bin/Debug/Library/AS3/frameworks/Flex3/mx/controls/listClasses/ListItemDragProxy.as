﻿package mx.controls.listClasses
{
	import flash.display.DisplayObject;
	import mx.core.mx_internal;
	import mx.core.UIComponent;

	/**
	 *  The default drag proxy used when dragging from a list-based control
	 */
	public class ListItemDragProxy extends UIComponent
	{
		/**
		 *  Constructor.
		 */
		public function ListItemDragProxy ();
		/**
		 *  @private
		 */
		protected function createChildren () : void;
		/**
		 *  @private
		 */
		protected function measure () : void;
	}
}