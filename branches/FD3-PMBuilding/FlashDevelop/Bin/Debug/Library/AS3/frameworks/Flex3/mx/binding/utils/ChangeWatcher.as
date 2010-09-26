﻿package mx.binding.utils
{
	import flash.events.IEventDispatcher;
	import flash.events.Event;
	import mx.core.EventPriority;
	import mx.binding.BindabilityInfo;
	import mx.events.PropertyChangeEvent;
	import mx.utils.DescribeTypeCache;

	/**
	 *  The ChangeWatcher class defines utility methods
	 */
	public class ChangeWatcher
	{
		/**
		 *  Host object.
		 */
		private var host : Object;
		/**
		 *  Name of watched property.
		 */
		private var name : String;
		/**
		 *  Optional user-supplied getter function.
		 */
		private var getter : Function;
		/**
		 *  User-supplied event handler function.
		 */
		private var handler : Function;
		/**
		 *  True iff watching only committing events.
		 */
		private var commitOnly : Boolean;
		/**
		 *  If watching a chain, this is a watcher on the next property
		 */
		private var next : ChangeWatcher;
		/**
		 *  Object { <event-name>: <is-committing>, ... } for current host[name].
		 */
		private var events : Object;

		/**
		 *  Creates and starts a ChangeWatcher instance.
		 */
		public static function watch (host:Object, chain:Object, handler:Function, commitOnly:Boolean = false) : ChangeWatcher;
		/**
		 *  Lets you determine if the host exposes a data-binding event
		 */
		public static function canWatch (host:Object, name:String, commitOnly:Boolean = false) : Boolean;
		/**
		 *  Returns all the binding events for all bindable properties
		 */
		public static function getEvents (host:Object, name:String, commitOnly:Boolean = false) : Object;
		/**
		 *  Lets you determine if an Object has any properties.
		 */
		private static function isEmpty (obj:Object) : Boolean;
		/**
		 *  Constructor.
		 */
		public function ChangeWatcher (access:Object, handler:Function, commitOnly:Boolean = false, next:ChangeWatcher = null);
		/**
		 *  Detaches this ChangeWatcher instance, and its handler function,
		 */
		public function unwatch () : void;
		/**
		 *  Retrieves the current value of the watched property or property chain,
		 */
		public function getValue () : Object;
		/**
		 *  Sets the handler function.
		 */
		public function setHandler (handler:Function) : void;
		/**
		 *  Returns <code>true</code> if each watcher in the chain is attached
		 */
		public function isWatching () : Boolean;
		/**
		 *  Resets this ChangeWatcher instance to use a new host object.
		 */
		public function reset (newHost:Object) : void;
		/**
		 *  @private
		 */
		private function getHostPropertyValue () : Object;
		/**
		 *  @private
		 */
		private function wrapHandler (event:Event) : void;
	}
}