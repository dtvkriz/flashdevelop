﻿package mx.events
{
	import flash.events.Event;

	/**
	 *  The DropdownEvent class represents the event object passed to 
	 */
	public class DropdownEvent extends Event
	{
		/**
		 *  The <code>DropdownEvent.CLOSE</code> constant defines the value of the 
		 */
		public static const CLOSE : String = "close";
		/**
		 *  The <code>DropdownEvent.OPEN</code> constant defines the value of the 
		 */
		public static const OPEN : String = "open";
		/**
		 *  If the control is opened or closed in response to a user action, 
		 */
		public var triggerEvent : Event;

		/**
		 *  Constructor.
		 */
		public function DropdownEvent (type:String, bubbles:Boolean = false, cancelable:Boolean = false, triggerEvent:Event = null);
		/**
		 *  @private
		 */
		public function clone () : Event;
	}
}