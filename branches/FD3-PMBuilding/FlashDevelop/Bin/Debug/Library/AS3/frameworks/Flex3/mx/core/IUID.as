﻿package mx.core
{
	/**
	 *  The IUID interface defines the interface for objects that must have 
	 */
	public interface IUID
	{
		/**
		 *  The unique identifier for this object.
		 */
		public function get uid () : String;
		/**
		 *  @private
		 */
		public function set uid (value:String) : void;

	}
}