﻿package mx.core
{
	import flash.display.DisplayObject;
	import flash.utils.Dictionary;
	import flash.events.IEventDispatcher;
	import mx.managers.ISystemManager;

	/**
	 *  A SWFBridgeGroup represents all of the sandbox bridges that an 
	 */
	public class SWFBridgeGroup implements ISWFBridgeGroup
	{
		/**
		 *  @private
		 */
		private var _groupOwner : ISystemManager;
		/**
		 *  @private
		 */
		private var _childBridges : Dictionary;
		/**
		 *  @private
		 */
		private var _parentBridge : IEventDispatcher;

		/**
		 *  Allows communication with the parent
		 */
		public function get parentBridge () : IEventDispatcher;
		/**
		 *  @private
		 */
		public function set parentBridge (bridge:IEventDispatcher) : void;

		/**
		 *  Constructor.
		 */
		public function SWFBridgeGroup (owner:ISystemManager);
		/**
		 *  @inheritDoc
		 */
		public function addChildBridge (bridge:IEventDispatcher, bridgeProvider:ISWFBridgeProvider) : void;
		/**
		 *  @inheritDoc
		 */
		public function removeChildBridge (bridge:IEventDispatcher) : void;
		/**
		 *  @inheritDoc
		 */
		public function getChildBridgeProvider (bridge:IEventDispatcher) : ISWFBridgeProvider;
		/**
		 *  @inheritDoc
		 */
		public function getChildBridges () : Array;
		/**
		 *  @inheritDoc
		 */
		public function containsBridge (bridge:IEventDispatcher) : Boolean;
	}
}