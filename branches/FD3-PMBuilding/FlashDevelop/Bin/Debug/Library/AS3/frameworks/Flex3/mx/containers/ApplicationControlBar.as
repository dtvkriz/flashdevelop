﻿package mx.containers
{
	import flash.events.Event;
	import mx.core.Application;
	import mx.core.mx_internal;
	import mx.styles.IStyleClient;

	/**
	 *  Alpha values used for the background fill of the container.
	 */
	[Style(name="fillAlphas", type="Array", arrayType="Number", inherit="no")] 
	/**
	 *  Colors used to tint the background of the container.
	 */
	[Style(name="fillColors", type="Array", arrayType="uint", format="Color", inherit="no")] 

	/**
	 *  The ApplicationControlBar container holds components
	 */
	public class ApplicationControlBar extends ControlBar
	{
		/**
		 *  @private
		 */
		private var dockChanged : Boolean;
		/**
		 *  @private
		 */
		private var _dock : Boolean;

		/**
		 *  If <code>true</code>, specifies that the ApplicationControlBar should be docked to the
		 */
		public function get dock () : Boolean;
		/**
		 *  @private
		 */
		public function set dock (value:Boolean) : void;
		/**
		 *  @private
		 */
		public function set enabled (value:Boolean) : void;

		/**
		 *  Constructor.
		 */
		public function ApplicationControlBar ();
		/**
		 *  @private
		 */
		protected function commitProperties () : void;
		/**
		 *  @private
		 */
		public function resetDock (value:Boolean) : void;
	}
}