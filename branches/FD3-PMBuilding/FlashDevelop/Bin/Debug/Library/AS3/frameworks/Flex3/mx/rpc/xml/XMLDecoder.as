﻿package mx.rpc.xml
{
	import flash.utils.ByteArray;
	import flash.utils.getQualifiedClassName;
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.utils.DescribeTypeCache;
	import mx.utils.object_proxy;
	import mx.utils.ObjectProxy;
	import mx.utils.URLUtil;
	import mx.utils.XMLUtil;

	/**
	 * Decodes an XML document to an object graph based on XML Schema definitions.
	 */
	public class XMLDecoder extends SchemaProcessor implements IXMLDecoder
	{
		/**
		 * The <code>mx.collections.IList</code> implementation to use when decoding
		 */
		public static var listClass : Class;
		/**
		 * The current, top level XML document to decode.
		 */
		protected var document : XML;
		private var log : ILogger;
		private var _makeObjectsBindable : Boolean;
		private var _recordXSIType : Boolean;
		private var _typeRegistry : SchemaTypeRegistry;

		/**
		 * When makeObjectsBindable is set to true, anonymous Objects and Arrays
		 */
		public function get makeObjectsBindable () : Boolean;
		public function set makeObjectsBindable (value:Boolean) : void;
		/**
		 * When recordXSIType is set to true, if an encoded complexType
		 */
		public function get recordXSIType () : Boolean;
		public function set recordXSIType (value:Boolean) : void;
		/**
		 * Maps XML Schema types by QName to ActionScript Classes in order to 
		 */
		public function get typeRegistry () : SchemaTypeRegistry;
		public function set typeRegistry (value:SchemaTypeRegistry) : void;

		public function XMLDecoder ();
		/**
		 * Decodes an XML document to an ActionScript object.
		 */
		public function decode (xml:*, name:QName = null, type:QName = null, definition:XML = null) : *;
		/**
		 * All content:
		 */
		public function decodeAll (definition:XML, parent:*, name:QName, valueElements:XMLList, context:DecodingContext = null, isRequired:Boolean = true) : Boolean;
		public function decodeAnyType (parent:*, name:QName, valueElements:XMLList) : void;
		/**
		 * Decodes <any> elements from the context of a model group. The valueElements
		 */
		public function decodeAnyElement (definition:XML, parent:*, name:QName, valueElements:XMLList, context:DecodingContext = null, isRequired:Boolean = true) : Boolean;
		/**
		 * Decodes any attributes using the XML schema rules for attribute
		 */
		public function decodeAnyAttribute (definition:XML, parent:*, value:* = undefined, restriction:XML = null) : void;
		/**
		 * An attribute must be based on a simple type and thus will have simple
		 */
		public function decodeAttribute (definition:XML, parent:*, value:* = undefined, restriction:XML = null) : void;
		/**
		 * An <code>attributeGroup</code> definition may include a number of
		 */
		public function decodeAttributeGroup (definition:XML, parent:*, value:* = undefined, restriction:XML = null) : void;
		/**
		 * choice:
		 */
		public function decodeChoice (definition:XML, parent:*, name:QName, valueElements:XMLList, context:DecodingContext = null, isRequired:Boolean = true) : Boolean;
		/**
		 * Derivation by restriction takes an existing type as the base and creates
		 */
		public function decodeComplexContent (definition:XML, parent:*, name:QName, value:*, context:DecodingContext) : void;
		/**
		 * complexContent:
		 */
		public function decodeComplexExtension (definition:XML, parent:*, name:QName, value:*, context:DecodingContext = null) : void;
		/**
		 * complexContent:
		 */
		public function decodeComplexRestriction (restriction:XML, parent:*, name:QName, value:*) : void;
		/**
		 * @private
		 */
		public function decodeComplexType (definition:XML, parent:*, name:QName, value:*, restriction:XML = null, context:DecodingContext = null) : void;
		/**
		 * Used to decode a local element definition. This element may also simply
		 */
		public function decodeGroupElement (definition:XML, parent:*, valueElements:XMLList, context:DecodingContext = null, isRequired:Boolean = true, hasSiblings:Boolean = true) : Boolean;
		/**
		 * Element content:
		 */
		public function decodeElementTopLevel (definition:XML, elementQName:QName, value:*) : *;
		/**
		 * The <code>group</code> element allows partial (or complete) content
		 */
		public function decodeGroupReference (definition:XML, parent:*, name:QName, valueElements:XMLList, context:DecodingContext = null, isRequired:Boolean = true) : Boolean;
		/**
		 * sequence:
		 */
		public function decodeSequence (definition:XML, parent:*, name:QName, valueElements:XMLList, context:DecodingContext = null, isRequired:Boolean = true) : Boolean;
		/**
		 * <code>simpleContent</code> specifies that the content will be simple text
		 */
		public function decodeSimpleContent (definition:XML, parent:*, name:QName, value:*, restriction:XML = null) : void;
		/**
		 * A <code>simpleType</code> may declare a list of space separated
		 */
		public function decodeSimpleList (definition:XML, parent:*, name:QName, value:*, restriction:XML = null) : void;
		/**
		 * simpleType:
		 */
		public function decodeSimpleRestriction (restriction:XML, parent:*, name:QName, value:*) : void;
		/**
		 * <simpleType
		 */
		public function decodeSimpleType (definition:XML, parent:*, name:QName, value:*, restriction:XML = null) : void;
		/**
		 * <union
		 */
		public function decodeSimpleUnion (definition:XML, parent:*, name:QName, value:*, restriction:XML = null) : void;
		/**
		 * @private
		 */
		public function decodeType (type:QName, parent:*, name:QName, value:*, restriction:XML = null) : void;
		/**
		 * This function controls the marshalling of XML values into
		 */
		public function marshallBuiltInType (type:QName, parent:*, name:QName, value:*, restriction:XML = null) : *;
		/**
		 * Resets the decoder to its initial state, including resetting any 
		 */
		public function reset () : void;
		/**
		 * @private
		 */
		public function getAttribute (parent:*, name:*) : *;
		/**
		 * @private
		 */
		public function hasAttribute (parent:*, name:*) : Boolean;
		/**
		 * @private
		 */
		public function setAttribute (parent:*, name:*, value:*) : void;
		/**
		 * @private
		 */
		public function getProperties (value:*) : Array;
		/**
		 * @private
		 */
		public function createContent (type:QName = null) : *;
		/**
		 * @private
		 */
		public function isSimpleValue (value:*) : Boolean;
		/**
		 * If the parent only contains simple content, then that content is
		 */
		public function getSimpleValue (parent:*, name:*) : *;
		/**
		 * @private
		 */
		public function setSimpleValue (parent:*, name:*, value:*, type:Object = null) : void;
		/**
		 * Assuming the parent is XML, the decoder looks for child element(s) with
		 */
		public function getValue (parent:*, name:*, index:Number = -1) : *;
		/**
		 * @private
		 */
		public function hasValue (parent:*, name:*) : Boolean;
		/**
		 * @private
		 */
		public function setValue (parent:*, name:*, value:*, type:Object = null) : void;
		/**
		 * If an array value is required (as when decoding an element
		 */
		public function createIterableValue (type:Object = null) : *;
		/**
		 * Returns the appropriate values from the list of encoded elements in a
		 */
		protected function getApplicableValues (parent:*, valueElements:XMLList, name:QName, context:DecodingContext, maxOccurs:uint) : XMLList;
		/**
		 * Tests whether a given namespace is included in a wildcard definition. If
		 */
		protected function includeNamespace (namespaceURI:String, includedNamespaces:Array = null) : Boolean;
		/**
		 * This method primarily exists to give subclasses a chance to post-process
		 */
		protected function parseValue (name:*, value:XMLList) : *;
		protected function isXSINil (value:*) : Boolean;
		/**
		 * This function determines whether a given value is already iterable
		 */
		protected function promoteValueToArray (value:*, type:Object = null) : *;
		/**
		 * Search for an XSI type attribute on an XML value.
		 */
		protected function getXSIType (value:*) : QName;
		/**
		 * We record the qualified type used for anonymous objects wrapped in
		 */
		protected function setXSIType (value:*, type:QName) : void;
		/**
		 * @private
		 */
		protected function getExistingValue (parent:*, propertyName:String) : *;
		/**
		 * Noop. Method exists to give a chance to subclasses to pre-process the
		 */
		protected function preProcessXML (root:XML) : void;
	}
}