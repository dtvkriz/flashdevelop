﻿package mx.rpc.mxml
{
	/**
	 *  Implementing this interface means that an RPC service
	 */
	public interface IMXMLSupport
	{
		/**
		 *  The concurrency setting of the RPC operation or HTTPService.
		 */
		public function get concurrency () : String;
		/**
		 *  @private
		 */
		public function set concurrency (value:String) : void;
		/**
		 *  Indicates whether the RPC operation or HTTPService
		 */
		public function get showBusyCursor () : Boolean;
		/**
		 *  @private
		 */
		public function set showBusyCursor (value:Boolean) : void;

	}
}