﻿package mx.rpc.remoting.mxml
{
	import flash.events.Event;
	import flash.events.ErrorEvent;
	import mx.core.mx_internal;
	import mx.core.IMXMLObject;
	import mx.messaging.Channel;
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.AMFChannel;
	import mx.messaging.channels.SecureAMFChannel;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;
	import mx.rpc.AbstractOperation;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.mxml.Concurrency;
	import mx.rpc.mxml.IMXMLSupport;
	import mx.rpc.remoting.mxml.Operation;
	import mx.rpc.remoting.RemoteObject;

	/**
	 * The &lt;mx:RemoteObject&gt; tag gives you access to the methods of
	 */
	public dynamic class RemoteObject extends mx.rpc.remoting.RemoteObject implements IMXMLSupport
	{
		/**
		 *  @private
		 */
		private var resourceManager : IResourceManager;
		local var document : Object;
		local var id : String;
		private var _concurrency : String;
		private var _showBusyCursor : Boolean;
		private var _endpoint : String;

		/**
		 * Value that indicates how to handle multiple calls to the same service. The default
		 */
		public function get concurrency () : String;
		/**
		 *  @private
		 */
		public function set concurrency (c:String) : void;
		/**
		 * This property allows the developer to quickly specify an endpoint for a RemoteObject
		 */
		public function get endpoint () : String;
		public function set endpoint (url:String) : void;
		/**
		 * If <code>true</code>, a busy cursor is displayed while a service is executing. The default
		 */
		public function get showBusyCursor () : Boolean;
		public function set showBusyCursor (sbc:Boolean) : void;

		/**
		 * Create a new RemoteObject.
		 */
		public function RemoteObject (destination:String = null);
		/**
		 * If this event is an error or fault, and the event type does not
		 */
		public function dispatchEvent (event:Event) : Boolean;
		/**
		 * Returns an Operation of the given name. If the Operation wasn't
		 */
		public function getOperation (name:String) : AbstractOperation;
		/**
		 * Called automatically by the MXML compiler if the RemoteObject is set up using a tag.  If you create
		 */
		public function initialized (document:Object, id:String) : void;
		/**
		 *@private
		 */
		function initEndpoint () : void;
	}
}