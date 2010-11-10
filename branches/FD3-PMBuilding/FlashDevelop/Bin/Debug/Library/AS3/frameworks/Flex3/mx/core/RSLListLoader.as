﻿package mx.core
{
	import flash.events.IEventDispatcher;
	import flash.events.Event;

	/**
	 *  @private
	 */
	public class RSLListLoader
	{
		/**
		 *  @private
		 */
		private var currentIndex : int;
		/**
		 *  @private
		 */
		private var rslList : Array;
		/**
		 *  @private
		 */
		private var chainedProgressHandler : Function;
		/**
		 *  @private
		 */
		private var chainedCompleteHandler : Function;
		/**
		 *  @private
		 */
		private var chainedIOErrorHandler : Function;
		/**
		 *  @private
		 */
		private var chainedSecurityErrorHandler : Function;
		/**
		 *  @private
		 */
		private var chainedRSLErrorHandler : Function;

		/**
		 *  Constructor.
		 */
		public function RSLListLoader (rslList:Array);
		/**
		 *  Loads the RSLs in this list object.
		 */
		public function load (progressHandler:Function, completeHandler:Function, ioErrorHandler:Function, securityErrorHandler:Function, rslErrorHandler:Function) : void;
		/**
		 *  Increments the current index and loads the next RSL.
		 */
		private function loadNext () : void;
		/**
		 *  Gets an RSL from the list of RSLs.
		 */
		public function getItem (index:int) : RSLItem;
		/**
		 *  Gets the index of the currently loading RSL.
		 */
		public function getIndex () : int;
		/**
		 *  Gets the total number of RSLs in this object.
		 */
		public function getItemCount () : int;
		/**
		 *  Tests if all the RSLs are done loading.
		 */
		public function isDone () : Boolean;
		/**
		 *  @private
		 */
		private function listCompleteHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function listIOErrorHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function listSecurityErrorHandler (event:Event) : void;
	}
}