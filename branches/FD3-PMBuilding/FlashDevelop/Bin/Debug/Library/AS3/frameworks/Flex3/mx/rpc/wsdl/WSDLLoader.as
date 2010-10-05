﻿package mx.rpc.wsdl
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.events.SchemaLoadEvent;
	import mx.rpc.events.WSDLLoadEvent;
	import mx.rpc.http.HTTPService;
	import mx.rpc.xml.Schema;
	import mx.rpc.xml.SchemaLoader;
	import mx.rpc.xml.SchemaManager;
	import mx.rpc.xml.XMLLoader;
	import mx.utils.URLUtil;

	[Event(name="fault", type="mx.rpc.events.FaultEvent")] 
	[Event(name="wsdlLoad", type="mx.rpc.events.WSDLLoadEvent")] 

	/**
	 * Manages the loading of a WSDL at runtime, including all imports for
	 */
	public class WSDLLoader extends XMLLoader
	{
		/**
		 *  @private
		 */
		private var resourceManager : IResourceManager;
		private var schemaLoader : SchemaLoader;
		private var topLevelWSDL : WSDL;
		private var topLevelLocation : String;
		private var locationMap : Object;

		public function WSDLLoader (httpService:HTTPService = null);
		/**
		 * Asynchronously loads a WSDL for a given URL, including resolving all
		 */
		public function load (url:String) : void;
		protected function faultHandler (event:FaultEvent) : void;
		protected function resultHandler (event:ResultEvent) : void;
		/**
		 * This handler is triggered when all schema imports and
		 */
		private function schemaLoadHandler (event:SchemaLoadEvent) : void;
		/**
		 * Checks whether a WSDL and all of its Schemas have finished loading.
		 */
		private function checkLoadsOutstanding () : void;
		private function loadWSDL (location:String, parent:WSDL = null, ns:Namespace = null) : AsyncToken;
		/**
		 * WSDL definitions can contain imports to other WSDL definitions.
		 */
		private function wsdlImports (wsdl:WSDL, parentLocation:String) : void;
		private function schemaImports (wsdl:WSDL, parentLocation:String) : void;
	}
}