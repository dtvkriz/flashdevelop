﻿package mx.binding
{
	import flash.events.Event;
	import mx.core.mx_internal;

	/**
	 *  @private
	 */
	public class RepeaterComponentWatcher extends PropertyWatcher
	{
		/**
		 *  @private
		 */
		private var clones : Array;
		/**
		 *  @private
		 */
		private var original : Boolean;

		/**
		 *  @private
		 */
		public function RepeaterComponentWatcher (propertyName:String, events:Object, listeners:Array, propertyGetter:Function = null);
		/**
		 *  @private
		 */
		public function updateChildren () : void;
		/**
		 *  @private
		 */
		protected function shallowClone () : Watcher;
		/**
		 *  @private
		 */
		private function updateClones () : void;
		/**
		 *  Invokes super's notifyListeners() on each of the clones.
		 */
		public function notifyListeners (commitEvent:Boolean) : void;
	}
}