﻿package mx.core
{
	/**
	 *  The IConstraintClient interface defines the interface for components that
	 */
	public interface IConstraintClient
	{
		/**
		 *  Returns the specified constraint value.
		 */
		public function getConstraintValue (constraintName:String) : *;
		/**
		 *  Sets the specified constraint value.
		 */
		public function setConstraintValue (constraintName:String, value:*) : void;
	}
}