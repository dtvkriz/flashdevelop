﻿package mx.core
{
	/**
	 *  A UIComponentDescriptor instance encapsulates the information that you
	 */
	public class UIComponentDescriptor extends ComponentDescriptor
	{
		/**
		 *  An Array containing the effects for the component, as specified in MXML.
		 */
		public var effects : Array;
		/**
		 *  @private
		 */
		local var instanceIndices : Array;
		/**
		 *  @private
		 */
		local var repeaterIndices : Array;
		/**
		 *  @private
		 */
		local var repeaters : Array;
		/**
		 *  A Function that constructs an Object containing name/value pairs
		 */
		public var stylesFactory : Function;

		/**
		 *  Constructor.
		 */
		public function UIComponentDescriptor (descriptorProperties:Object);
		/**
		 *  @private
		 */
		public function toString () : String;
	}
}