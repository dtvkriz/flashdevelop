﻿package mx.rpc.remoting
{
	import mx.core.mx_internal;
	import mx.rpc.AbstractOperation;
	import mx.rpc.AbstractService;

	/**
	 * The RemoteObject class gives you access to classes on a remote application server.
	 */
	public dynamic class RemoteObject extends AbstractService
	{
		/**
		 *  @private
		 */
		private var _source : String;
		/**
		 *  @private
		 */
		private var _makeObjectsBindable : Boolean;

		/**
		 * When this value is true, anonymous objects returned are forced to bindable objects.
		 */
		public function get makeObjectsBindable () : Boolean;
		public function set makeObjectsBindable (b:Boolean) : void;
		/**
		 * Lets you specify a source value on the client; not supported for destinations that use the JavaAdapter. This allows you to provide more than one source
		 */
		public function get source () : String;
		public function set source (s:String) : void;

		/**
		 * Creates a new RemoteObject.
		 */
		public function RemoteObject (destination:String = null);
		/**
		 * Returns an Operation of the given name. If the Operation wasn't
		 */
		public function getOperation (name:String) : AbstractOperation;
		/**
		 * If a remote object is managed by an external service, such a ColdFusion Component (CFC),
		 */
		public function setRemoteCredentials (remoteUsername:String, remotePassword:String, charset:String = null) : void;
		/**
		 * Represents an instance of RemoteObject as a String, describing
		 */
		public function toString () : String;
	}
}