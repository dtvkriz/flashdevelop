﻿package mx.rpc.events
{
	import flash.events.Event;

	/**
	 * The XMLLoadEvent class is a base class for events that are dispatched when an RPC service
	 */
	public class XMLLoadEvent extends Event
	{
		/**
		 * The raw XML document.
		 */
		public var xml : XML;
		/**
		 * The location from which the document was loaded.
		 */
		public var location : String;
		/**
		 * The LOAD constant defines the value of the <code>type</code> property of the event object 
		 */
		public static const LOAD : String = "xmlLoad";

		/**
		 * Constructor.
		 */
		public function XMLLoadEvent (type:String, bubbles:Boolean = false, cancelable:Boolean = true, xml:XML = null, location:String = null);
		/**
		 * Returns a copy of this XMLLoadEvent object.
		 */
		public function clone () : Event;
		/**
		 * Returns a String representation of this XMLLoadEvent object.
		 */
		public function toString () : String;
		/**
		 * A helper method to create a new XMLLoadEvent.
		 */
		public static function createEvent (xml:XML = null, location:String = null) : XMLLoadEvent;
	}
}