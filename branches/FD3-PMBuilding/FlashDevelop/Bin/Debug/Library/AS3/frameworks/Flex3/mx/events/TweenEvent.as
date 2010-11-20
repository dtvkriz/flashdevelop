﻿package mx.events
{
	import flash.events.Event;

	/**
	 *  Represents event objects that are specific to Flex tween effects. 
	 */
	public class TweenEvent extends Event
	{
		/**
		 *  The <code>TweenEvent.TWEEN_END</code> constant defines the value of the 
		 */
		public static const TWEEN_END : String = "tweenEnd";
		/**
		 *  The <code>TweenEvent.TWEEN_START</code> constant defines the value of the 
		 */
		public static const TWEEN_START : String = "tweenStart";
		/**
		 *  The <code>TweenEvent.TWEEN_UPDATE</code> constant defines the value of the 
		 */
		public static const TWEEN_UPDATE : String = "tweenUpdate";
		/**
		 *  For a <code>tweenStart</code> or <code>tweenUpdate</code> event, the value passed to the 
		 */
		public var value : Object;

		/**
		 *  Constructor.
		 */
		public function TweenEvent (type:String, bubbles:Boolean = false, cancelable:Boolean = false, value:Object = null);
		/**
		 *  @private
		 */
		public function clone () : Event;
	}
}