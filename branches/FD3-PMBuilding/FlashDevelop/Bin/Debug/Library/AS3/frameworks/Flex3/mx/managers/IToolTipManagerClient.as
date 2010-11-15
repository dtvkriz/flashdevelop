﻿package mx.managers
{
	import mx.core.IFlexDisplayObject;

	/**
	 *  Components that implement IToolTipManagerClient can have tooltips and must 
	 */
	public interface IToolTipManagerClient extends IFlexDisplayObject
	{
		/**
		 *  The text of this component's tooltip.
		 */
		public function get toolTip () : String;
		/**
		 *  @private
		 */
		public function set toolTip (value:String) : void;

	}
}