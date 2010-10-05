﻿package mx.core
{
	/**
	 *  ComponentDescriptor is the base class for the UIComponentDescriptor class,
	 */
	public class ComponentDescriptor
	{
		/**
		 *  A reference to the document Object in which the component
		 */
		public var document : Object;
		/**
		 *  An Object containing name/value pairs for the component's
		 */
		public var events : Object;
		/**
		 *  The identifier for the component, as specified in MXML. 
		 */
		public var id : String;
		/**
		 *  @private
		 */
		private var _properties : Object;
		/**
		 *  A Function that returns an Object containing name/value pairs
		 */
		public var propertiesFactory : Function;
		/**
		 *  The Class of the component, as specified in MXML.
		 */
		public var type : Class;

		/**
		 *  An Object containing name/value pairs for the component's properties,
		 */
		public function get properties () : Object;

		/**
		 *  Constructor.
		 */
		public function ComponentDescriptor (descriptorProperties:Object);
		/**
		 *  Invalidates the cached <code>properties</code> property.
		 */
		public function invalidateProperties () : void;
		/**
		 *  Returns the string "ComponentDescriptor_" plus the value of the  
		 */
		public function toString () : String;
	}
}