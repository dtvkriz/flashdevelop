﻿package mx.rpc.soap.types
{
	import mx.collections.IList;
	import mx.rpc.soap.SOAPConstants;
	import mx.rpc.soap.SOAPEncoder;
	import mx.rpc.soap.SOAPDecoder;
	import mx.rpc.wsdl.WSDLConstants;
	import mx.rpc.xml.ContentProxy;
	import mx.rpc.xml.SchemaConstants;
	import mx.rpc.xml.SchemaDatatypes;
	import mx.rpc.xml.SchemaManager;
	import mx.rpc.xml.SchemaMarshaller;
	import mx.rpc.xml.SchemaProcessor;
	import mx.rpc.xml.TypeIterator;
	import mx.rpc.xml.XMLEncoder;
	import mx.rpc.xml.XMLDecoder;
	import mx.utils.object_proxy;
	import mx.utils.StringUtil;
	import mx.utils.ObjectUtil;

	/**
	 * Marshalls SOAP 1.1 encoded Arrays between XML and ActionScript.
	 */
	public class SOAPArrayType implements ICustomSOAPType
	{
		private var _dimensions : Array;
		private var dimensionString : String;
		private var itemName : QName;
		private var processor : SchemaProcessor;
		private var schemaConstants : SchemaConstants;
		private var schemaManager : SchemaManager;
		private var schemaTypeName : String;
		private var schemaType : QName;
		private var soapConstants : SOAPConstants;

		private function get dimensions () : Array;

		public function SOAPArrayType ();
		/**
		 * Encode an ActionScript Array as a SOAP encoded Array in XML.
		 */
		public function encode (encoder:SOAPEncoder, parent:XML, name:QName, value:*, restriction:XML = null) : void;
		/**
		 * Decodes a SOAP encoded array assuming the XML Schema type definiton
		 */
		public function decode (decoder:SOAPDecoder, parent:*, name:*, value:*, restriction:XML = null) : void;
		/**
		 * Recursively called to encode a set of dimensions at a particular level
		 */
		private function encodeArray (parent:XML, dimensions:Array, value:*) : void;
		private function decodeArray (parent:*, dimensions:Array, value:*, makeObjectsBindable:Boolean) : void;
		private function encodeArrayItem (item:XML, value:*) : void;
		private function decodeArrayItem (parent:*, value:*) : void;
		private function encodeDimensionInformation (parent:XML, dimensionString:String) : void;
		private function getSingleElementFromNode (node:XML, ...types:Array) : XML;
		private function determineWSDLArrayType (restriction:XML, wsdlConstants:WSDLConstants) : String;
		/**
		 * Parses the WSDL arrayType to determine the type of the members in a SOAP
		 */
		private function parseWSDLArrayType (wsdlArrayType:String) : void;
		private function parseDimensions (wsdlArrayType:String, dimensionsString:String, currentDimension:Array) : void;
		/**
		 * Attempts to unwrap MXML Array properties that are wrapped in an Object
		 */
		private function unwrapMXMLArray (value:*) : *;
	}
}