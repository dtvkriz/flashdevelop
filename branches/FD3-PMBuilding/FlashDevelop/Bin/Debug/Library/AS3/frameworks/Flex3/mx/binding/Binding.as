﻿package mx.binding
{
	import mx.collections.errors.ItemPendingError;
	import mx.core.mx_internal;
	import flash.utils.Dictionary;

	/**
	 *  @private
	 */
	public class Binding
	{
		/**
		 *  @private
		 */
		local var _isEnabled : Boolean;
		/**
		 *  @private
		 */
		local var isExecuting : Boolean;
		/**
		 *  @private
		 */
		local var isHandlingEvent : Boolean;
		/**
		 *  @private
		 */
		local var disabledRequests : Dictionary;
		/**
		 *  @private
		 */
		private var hasHadValue : Boolean;
		/**
		 *  @private
		 */
		public var uiComponentWatcher : int;
		/**
		 *  @private
		 */
		public var twoWayCounterpart : Binding;
		/**
		 *  @private 
		 */
		private var wrappedFunctionSuccessful : Boolean;
		/**
		 *  All Bindings hang off of a document for now,
		 */
		local var document : Object;
		/**
		 *  The function that will return us the value.
		 */
		local var srcFunc : Function;
		/**
		 *  The function that takes the value and assigns it.
		 */
		local var destFunc : Function;
		/**
		 *  The destination represented as a String.
		 */
		local var destString : String;
		/**
		 * 	@private
		 */
		private var lastValue : Object;

		/**
		 *  @private
		 */
		function get isEnabled () : Boolean;
		/**
		 *  @private
		 */
		function set isEnabled (value:Boolean) : void;

		/**
		 *  Create a Binding object
		 */
		public function Binding (document:Object, srcFunc:Function, destFunc:Function, destString:String);
		/**
		 *  Execute the binding.
		 */
		public function execute (o:Object = null) : void;
		/**
		 * @private 
		 */
		private function registerDisabledExecute (o:Object) : void;
		/**
		 * @private 
		 */
		private function processDisabledRequests () : void;
		/**
		 *  @private
		 */
		protected function wrapFunctionCall (thisArg:Object, wrappedFunction:Function, object:Object = null, ...args) : Object;
		/**
		 *	@private
		 */
		private function nodeSeqEqual (x:XMLList, y:XMLList) : Boolean;
		/**
		 *  @private
		 */
		private function innerExecute () : void;
		/**
		 *  This function is called when one of this binding's watchers
		 */
		public function watcherFired (commitEvent:Boolean, cloneIndex:int) : void;
	}
}