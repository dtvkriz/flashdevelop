﻿package mx.rpc.xml
{
	/**
	 * Manages an XML Schema Definition. Schemas can import other schemas.
	 */
	public class Schema
	{
		public var attributeFormDefault : String;
		public var blockDefault : String;
		public var elementFormDefault : String;
		public var finalDefault : String;
		private var importsManager : QualifiedResourceManager;
		private var _namespaces : Object;
		private var _schemaConstants : SchemaConstants;
		private var _schemaDatatypes : SchemaDatatypes;
		private var _targetNamespace : Namespace;
		private var _xml : XML;

		/**
		 * Maps a namespace prefix (as a <code>String</code>) to a
		 */
		public function get namespaces () : Object;
		public function set namespaces (value:Object) : void;
		/**
		 * The targetNamespace of this Schema. A targetNamespace establishes a
		 */
		public function get targetNamespace () : Namespace;
		public function set targetNamespace (tns:Namespace) : void;
		/**
		 * Constants for the particular version of XML Schema that was used
		 */
		public function get schemaConstants () : SchemaConstants;
		/**
		 * Datatype constants for the particular version of XML Schema that was
		 */
		public function get schemaDatatypes () : SchemaDatatypes;
		/**
		 * The raw XML definition of this Schema.
		 */
		public function get xml () : XML;
		public function set xml (value:XML) : void;

		public function Schema (xml:XML = null);
		/**
		 FIXME:
		 */
		public function addImport (targetNamespace:Namespace, schema:Schema) : void;
		public function addInclude (fragment:XMLList) : void;
		public function getNamedDefinition (name:QName, ...componentTypes:Array) : Object;
	}
}