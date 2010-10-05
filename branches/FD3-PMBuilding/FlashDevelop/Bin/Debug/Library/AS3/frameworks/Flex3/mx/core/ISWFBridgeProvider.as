﻿package mx.core
{
	import flash.events.IEventDispatcher;

	/**
	 *  An implementor of ISWFBridgeProvider provides a bridge
	 */
	public interface ISWFBridgeProvider
	{
		/**
		 *  A bridge to the application that is associated with the implementor of this 
		 */
		public function get swfBridge () : IEventDispatcher;
		/**
		 *  Tests if the child allows its parent to access its display objects or listen
		 */
		public function get childAllowsParent () : Boolean;
		/**
		 *  Tests if the parent allows its child to access its display objects or listen
		 */
		public function get parentAllowsChild () : Boolean;

	}
}