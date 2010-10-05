﻿package mx.messaging
{
	import flash.display.DisplayObject;
	import flash.errors.IllegalOperationError;
	import flash.events.StatusEvent;
	import mx.core.mx_internal;
	import mx.collections.ArrayCollection;
	import mx.collections.ListCollectionView;
	import mx.events.PropertyChangeEvent;
	import mx.messaging.messages.IMessage;
	import mx.rpc.AsyncDispatcher;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.Fault;

	/**
	 *  Dispatched when the status of the message queue changes.
	 */
	[Event(name="status", type="flash.events.StatusEvent")] 
	/**
	 * The result event is dispatched when an asynchronous operation of
	 */
	[Event(name="result", type="mx.rpc.events.ResultEvent")] 
	/**
	 * The fault event is dispatched when an asynchronous operation of
	 */
	[Event(name="fault", type="mx.rpc.events.FaultEvent")] 

	/**
	 * @private
	 */
	public class AbstractMessageStore extends ArrayCollection
	{
		private var _autoSend : Boolean;
		private var _cacheId : String;
		protected var _initialized : Boolean;
		private var _loaded : Boolean;
		private var _producer : AbstractProducer;
		/**
		 *  A header injected into messages that are added to the queue to allow the
		 */
		public static const MESSAGE_STORE_HEADER : String = "DSMessageStore";

		/**
		 *  Indicates whether queued messages are automatically sent upon
		 */
		public function get autoSend () : Boolean;
		public function set autoSend (value:Boolean) : void;
		/**
		 *  Provides access to the cache identifier for this service.
		 */
		public function get cacheID () : String;
		public function set cacheID (value:String) : void;
		/**
		 *  Indicates if the store has been initialized.
		 */
		public function get isInitialized () : Boolean;
		/**
		 *  True if the persistent state for the store has been loaded.
		 */
		public function get loaded () : Boolean;
		/**
		 *  The Producer the queue is assigned to.
		 */
		public function get producer () : AbstractProducer;

		/**
		 *  Constructs an AbstractMessageStore.
		 */
		public function AbstractMessageStore ();
		/**
		 *  Adds the passed message to the queue.
		 */
		public function addItem (item:Object) : void;
		/**
		 *  Clears out the persistent store and the in-memory state for the MessageStore.
		 */
		public function clearCache () : AsyncToken;
		/**
		 *  This method will fill the specified <code>ListCollectionView</code>
		 */
		public function getCacheIDs (view:ListCollectionView) : AsyncToken;
		/**
		 *  Intializes the message store.
		 */
		public function initialize () : AsyncToken;
		/**
		 *  Loads the current persistent messages for the queue after clearing out
		 */
		public function loadCache () : AsyncToken;
		/**
		 *  Releases resources used by this MessageStore.
		 */
		public function release () : AsyncToken;
		/**
		 *  Saves any manual modifations that have been made to messages within the 
		 */
		public function saveCache () : AsyncToken;
		/**
		 *  Invoked by the associated Producer to add a message to the store. 
		 */
		function addMessage (msg:IMessage) : void;
		/**
		 *  Invoked by the associated Producer to remove a message from the store.
		 */
		function removeMessage (msg:IMessage) : void;
		/**
		 *  Sets the producer for this message store.
		 */
		function setProducer (value:AbstractProducer) : void;
		/**
		 *  @private
		 */
		protected function attemptToSendOrConnect () : void;
		/**
		 *  Dispatch a fault event associated with a pending call/token.
		 */
		protected function dispatchFaultEvent (fault:Fault, token:AsyncToken) : void;
		/**
		 *  Dispatch a result event associated with a pending call/token.
		 */
		protected function dispatchResultEvent (event:ResultEvent, token:AsyncToken) : void;
		/**
		 * The decendant class must clear the local disk of any cached data.
		 */
		protected function internalClearCache (token:AsyncToken) : void;
		/**
		 *  The descendant class must retrieve the cache ids from the local store and
		 */
		protected function internalGetCacheIDs (view:ListCollectionView, token:AsyncToken) : void;
		/**
		 *  The descendant class must initialize the local store.
		 */
		protected function internalInitialize (success:Function, failed:Function) : void;
		/**
		 *  The descendant class must load the store with any data found for the
		 */
		protected function internalLoadCache (token:AsyncToken) : void;
		/**
		 *  The descendant class must release any disk/local store resources
		 */
		protected function internalRelease (token:AsyncToken) : void;
		/**
		 *  The descendant class must perform any local storage configuration here.
		 */
		protected function internalSetCacheId (value:String) : void;
		/**
		 *  The descendant class must save the current state of the store to disk.
		 */
		protected function internalSaveCache (token:AsyncToken) : void;
		/**
		 *  @private
		 */
		protected function send (msg:IMessage) : void;
		/**
		 *  @private 
		 */
		protected function sendAll () : void;
		/**
		 *  This method is called by implementations once all data is loaded from
		 */
		protected function setLoaded (value:Boolean) : void;
		private function checkCacheId () : void;
		private function getInitFailedFault (details:String = null) : Fault;
		/**
		 *  @private
		 */
		private function producerPropertyChangeHandler (event:PropertyChangeEvent) : void;
	}
}