﻿package mx.messaging.events
{
	import flash.events.Event;
	import mx.messaging.messages.IMessage;
	import mx.core.mx_internal;

	/**
	 *  The MessageEvent class is used to propagate messages within the messaging system.
	 */
	public class MessageEvent extends Event
	{
		/**
		 *  The MESSAGE event type; dispatched upon receipt of a message.
		 */
		public static const MESSAGE : String = "message";
		/**
		 *  The RESULT event type; dispatched when an RPC agent receives a result from
		 */
		public static const RESULT : String = "result";
		/**
		 *  The Message associated with this event.
		 */
		public var message : IMessage;

		/**
		 *  @private
		 */
		public function get messageId () : String;

		/**
		 *  Utility method to create a new MessageEvent that doesn't bubble and
		 */
		public static function createEvent (type:String, msg:IMessage) : MessageEvent;
		/**
		 *  Constructs an instance of this event with the specified type and 
		 */
		public function MessageEvent (type:String, bubbles:Boolean = false, cancelable:Boolean = false, message:IMessage = null);
		/**
		 *  Clones the MessageEvent.
		 */
		public function clone () : Event;
		/**
		 *  Returns a string representation of the MessageEvent.
		 */
		public function toString () : String;
	}
}