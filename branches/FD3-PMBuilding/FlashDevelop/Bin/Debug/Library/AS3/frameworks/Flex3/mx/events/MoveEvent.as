﻿package mx.events
{
	import flash.events.Event;

	/**
	 *  Represents event objects that are dispatched when a Flex component moves.
	 */
	public class MoveEvent extends Event
	{
		/**
		 *  The <code>MoveEvent.MOVE</code> constant defines the value of the
		 */
		public static const MOVE : String = "move";
		/**
		 *  The previous <code>x</code> coordinate of the object, in pixels.
		 */
		public var oldX : Number;
		/**
		 *  The previous <code>y</code> coordinate of the object, in pixels.
		 */
		public var oldY : Number;

		/**
		 *  Constructor.
		 */
		public function MoveEvent (type:String, bubbles:Boolean = false, cancelable:Boolean = false, oldX:Number = NaN, oldY:Number = NaN);
		/**
		 *  @private
		 */
		public function clone () : Event;
	}
}