﻿package mx.rpc.soap
{
	import mx.rpc.wsdl.WSDLOperation;
	import mx.rpc.xml.IXMLDecoder;
	import mx.rpc.xml.SchemaConstants;

	/**
	 * Decodes the SOAP response for a particular operation.
	 */
	public interface ISOAPDecoder extends IXMLDecoder
	{
		/**
		 * Determines whether or not a single or empty return value for an output
		 */
		public function get forcePartArrays () : Boolean;
		public function set forcePartArrays (value:Boolean) : void;
		/**
		 * Determines whether the decoder should ignore whitespace when processing
		 */
		public function get ignoreWhitespace () : Boolean;
		public function set ignoreWhitespace (value:Boolean) : void;
		/**
		 * Determines how the SOAP-encoded XML result is decoded. A value of
		 */
		public function get resultFormat () : String;
		public function set resultFormat (value:String) : void;
		/**
		 * Determines how the SOAP-encoded headers are decoded. A value of
		 */
		public function get headerFormat () : String;
		public function set headerFormat (value:String) : void;
		/**
		 * Determines the type of the default result object for calls to web services
		 */
		public function get multiplePartsFormat () : String;
		public function set multiplePartsFormat (value:String) : void;
		/**
		 * A WSDLOperation defines the SOAP binding styles and specifies how to
		 */
		public function get wsdlOperation () : WSDLOperation;
		public function set wsdlOperation (value:WSDLOperation) : void;

		/**
		 * Decodes a SOAP response into a result and headers.
		 */
		public function decodeResponse (response:*) : SOAPResult;
	}
}