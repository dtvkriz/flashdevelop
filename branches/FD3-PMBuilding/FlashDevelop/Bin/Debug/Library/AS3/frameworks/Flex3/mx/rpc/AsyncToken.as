﻿package mx.rpc
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import mx.core.mx_internal;
	import mx.events.PropertyChangeEvent;
	import mx.messaging.messages.IMessage;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	/**
	 *  Dispatched when a property of the channel set changes.
	 */
	[Event(name="propertyChange", type="mx.events.PropertyChangeEvent")] 

	/**
	 *  This class provides a place to set additional or token-level data for 
	 */
	public dynamic class AsyncToken extends EventDispatcher
	{
		private var _message : IMessage;
		/**
		 *  @private
		 */
		private var _responders : Array;
		private var _result : Object;

		/**
		 *  Provides access to the associated message.
		 */
		public function get message () : IMessage;
		/**
		 * An array of IResponder handlers that will be called when
		 */
		public function get responders () : Array;
		/**
		 * The result that was returned by the associated RPC call.
		 */
		public function get result () : Object;

		/**
		 * Constructs an instance of the token with the specified message.
		 */
		public function AsyncToken (message:IMessage);
		/**
		 *  @private
		 */
		function setMessage (message:IMessage) : void;
		/**
		 *  <code>addResponder</code> adds a responder to an Array of responders. 
		 */
		public function addResponder (responder:IResponder) : void;
		/**
		 * Determines if this token has at least one <code>mx.rpc.IResponder</code> registered.
		 */
		public function hasResponder () : Boolean;
		/**
		 * @private
		 */
		function applyFault (event:FaultEvent) : void;
		/**
		 * @private
		 */
		function applyResult (event:ResultEvent) : void;
		/**
		 * @private
		 */
		function setResult (newResult:Object) : void;
	}
}