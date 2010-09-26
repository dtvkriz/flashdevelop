﻿package mx.managers
{
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import mx.core.ApplicationGlobals;
	import mx.core.IFlexDisplayObject;
	import mx.core.mx_internal;
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	import mx.managers.layoutClasses.PriorityQueue;

	/**
	 *  The LayoutManager is the engine behind
	 */
	public class LayoutManager extends EventDispatcher implements ILayoutManager
	{
		/**
		 *  @private
		 */
		private static var instance : LayoutManager;
		/**
		 *  @private
		 */
		private var updateCompleteQueue : PriorityQueue;
		/**
		 *  @private
		 */
		private var invalidatePropertiesQueue : PriorityQueue;
		/**
		 *  @private
		 */
		private var invalidatePropertiesFlag : Boolean;
		private var invalidateClientPropertiesFlag : Boolean;
		/**
		 *  @private
		 */
		private var invalidateSizeQueue : PriorityQueue;
		/**
		 *  @private
		 */
		private var invalidateSizeFlag : Boolean;
		private var invalidateClientSizeFlag : Boolean;
		/**
		 *  @private
		 */
		private var invalidateDisplayListQueue : PriorityQueue;
		/**
		 *  @private
		 */
		private var invalidateDisplayListFlag : Boolean;
		/**
		 *  @private
		 */
		private var callLaterObject : UIComponent;
		/**
		 *  @private
		 */
		private var callLaterPending : Boolean;
		/**
		 *  @private
		 */
		private var originalFrameRate : Number;
		/**
		 *  @private
		 */
		private var targetLevel : int;
		/**
		 *  @private
		 */
		private var _usePhasedInstantiation : Boolean;

		/**
		 *  A flag that indicates whether the LayoutManager allows screen updates
		 */
		public function get usePhasedInstantiation () : Boolean;
		/**
		 *  @private
		 */
		public function set usePhasedInstantiation (value:Boolean) : void;

		/**
		 *  Returns the sole instance of this singleton class,
		 */
		public static function getInstance () : LayoutManager;
		/**
		 *  Constructor.
		 */
		public function LayoutManager ();
		/**
		 *  Adds an object to the list of components that want their 
		 */
		public function invalidateProperties (obj:ILayoutManagerClient) : void;
		/**
		 *  Adds an object to the list of components that want their 
		 */
		public function invalidateSize (obj:ILayoutManagerClient) : void;
		/**
		 *  Called when a component changes in some way that its layout and/or visuals
		 */
		public function invalidateDisplayList (obj:ILayoutManagerClient) : void;
		/**
		 *  Validates all components whose properties have changed and have called
		 */
		private function validateProperties () : void;
		/**
		 *  Validates all components whose properties have changed and have called
		 */
		private function validateSize () : void;
		/**
		 *  Validates all components whose properties have changed and have called
		 */
		private function validateDisplayList () : void;
		/**
		 *  @private
		 */
		private function doPhasedInstantiation () : void;
		/**
		 *  When properties are changed, components generally do not apply those changes immediately.
		 */
		public function validateNow () : void;
		/**
		 *  When properties are changed, components generally do not apply those changes immediately.
		 */
		public function validateClient (target:ILayoutManagerClient, skipDisplayList:Boolean = false) : void;
		/**
		 *  Returns <code>true</code> if there are components that need validating;
		 */
		public function isInvalid () : Boolean;
		/**
		 *  @private
		 */
		private function waitAFrame () : void;
	}
}