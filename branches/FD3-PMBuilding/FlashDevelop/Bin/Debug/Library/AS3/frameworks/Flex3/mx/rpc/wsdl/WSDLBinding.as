﻿package mx.rpc.wsdl
{
	import mx.rpc.soap.SOAPConstants;

	/**
	 * A binding defines the message format and protocol for messages sent
	 */
	public class WSDLBinding
	{
		private var _name : String;
		private var _portType : WSDLPortType;
		private var _style : String;
		private var _transport : String;

		/**
		 * The unique name of this binding.
		 */
		public function get name () : String;
		/**
		 * The portType for this binding which provides the interface definitions
		 */
		public function get portType () : WSDLPortType;
		public function set portType (value:WSDLPortType) : void;
		/**
		 * Represents a SOAP binding style attribute which is the default for any
		 */
		public function get style () : String;
		public function set style (value:String) : void;
		/**
		 * Represents a SOAP binding transport attribute which indicates the
		 */
		public function get transport () : String;
		public function set transport (value:String) : void;

		/**
		 * Creates a new WSDLBinding. Currently, only SOAP binding is
		 */
		public function WSDLBinding (name:String);
		/**
		 * @private
		 */
		public function toString () : String;
	}
}