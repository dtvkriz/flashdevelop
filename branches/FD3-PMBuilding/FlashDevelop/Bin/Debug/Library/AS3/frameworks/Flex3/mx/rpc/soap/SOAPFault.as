﻿package mx.rpc.soap
{
	import flash.xml.XMLNode;
	import mx.rpc.Fault;

	/**
	 * A subclass of mx.rpc.Fault that provides SOAP specific information from
	 */
	public class SOAPFault extends Fault
	{
		/**
		 * The raw XML of this SOAP Fault.
		 */
		public var element : XML;
		/**
		 * A SOAP Fault may provide information about who caused the fault through
		 */
		public var faultactor : String;
		/**
		 * The faultcode property is similar to faultCode but exists to both
		 */
		public var faultcode : QName;

		/**
		 * The detail property is the same as faultDetail but exists
		 */
		public function get detail () : String;
		public function set detail (value:String) : void;
		/**
		 * The faultstring property is the same as faultString but exists
		 */
		public function get faultstring () : String;
		public function set faultstring (value:String) : void;

		/**
		 * Constructs a new SOAPFault.
		 */
		public function SOAPFault (faultCode:QName, faultString:String, detail:String = null, element:XML = null, faultactor:String = null);
		/**
		 * Returns the String "SOAPFault" plus the faultCode, faultString, and
		 */
		public function toString () : String;
	}
}