﻿package mx.core
{
	/**
	 *  The IInvalidating interface defines the interface for components
	 */
	public interface IInvalidating
	{
		/**
		 *  Calling this method results in a call to the component's
		 */
		public function invalidateProperties () : void;
		/**
		 *  Calling this method results in a call to the component's
		 */
		public function invalidateSize () : void;
		/**
		 *  Calling this method results in a call to the component's
		 */
		public function invalidateDisplayList () : void;
		/**
		 *  Validates and updates the properties and layout of this object
		 */
		public function validateNow () : void;
	}
}