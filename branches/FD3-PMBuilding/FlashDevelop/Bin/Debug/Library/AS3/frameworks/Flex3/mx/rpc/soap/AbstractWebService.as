﻿package mx.rpc.soap
{
	import flash.events.Event;
	import mx.core.mx_internal;
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.DirectHTTPChannel;
	import mx.messaging.config.LoaderConfig;
	import mx.rpc.AbstractOperation;
	import mx.rpc.AbstractService;
	import mx.rpc.AsyncRequest;
	import mx.rpc.Fault;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.http.HTTPService;
	import mx.utils.URLUtil;
	import mx.utils.XMLUtil;

	/**
	 * AbstractWebService is an abstract base class for implementations 
	 */
	public class AbstractWebService extends AbstractService
	{
		private var _httpHeaders : Object;
		private var _xmlSpecialCharsFilter : Function;
		/**
		 * @private
		 */
		protected var _endpointURI : String;
		private var _description : String;
		private var endpointOverride : String;
		private var _headers : Array;
		private var _makeObjectsBindable : Boolean;
		/**
		 * @private
		 */
		protected var _port : String;
		private var _rootURL : String;
		/**
		 * @private
		 */
		protected var _service : String;
		private var _useProxy : Boolean;
		/**
		 * @private
		 */
		protected var destinationSet : Boolean;
		/**
		 * @private
		 */
		protected var _ready : Boolean;
		private var _log : ILogger;
		/**
		 * @private
		 */
		private static var _directChannelSet : ChannelSet;
		/**
		 * The default destination to use for HTTP connections when invoking a webservice through a proxy. 
		 */
		public static const DEFAULT_DESTINATION_HTTP : String = "DefaultHTTP";
		/**
		 * The default destination to use for HTTPS connections when invoking a webservice through a proxy. 
		 */
		public static const DEFAULT_DESTINATION_HTTPS : String = "DefaultHTTPS";

		/**
		 * The description of the service for the currently active port.
		 */
		public function get description () : String;
		public function set description (value:String) : void;
		/**
		 * @inheritDoc
		 */
		public function get destination () : String;
		public function set destination (value:String) : void;
		/**
		 * The location of the WebService. Normally, the WSDL document specifies
		 */
		public function get endpointURI () : String;
		public function set endpointURI (value:String) : void;
		/**
		 * Returns the array of SOAPHeaders registered for the WebService.
		 */
		public function get headers () : Array;
		/**
		 * Custom HTTP headers to be sent to the SOAP endpoint. If multiple
		 */
		public function get httpHeaders () : Object;
		public function set httpHeaders (value:Object) : void;
		/**
		 * When this value is true, anonymous objects returned are forced to
		 */
		public function get makeObjectsBindable () : Boolean;
		public function set makeObjectsBindable (value:Boolean) : void;
		/**
		 * Specifies the port within the WSDL document that this WebService should
		 */
		public function get port () : String;
		public function set port (value:String) : void;
		/**
		 * Specifies whether the WebService is ready to make requests.
		 */
		public function get ready () : Boolean;
		/**
		 * The URL that the WebService should use when computing relative URLs. This
		 */
		public function get rootURL () : String;
		public function set rootURL (value:String) : void;
		/**
		 * Specifies the service within the WSDL document that this WebService
		 */
		public function get service () : String;
		public function set service (value:String) : void;
		/**
		 * Specifies whether to use the Flex proxy service. The default value is
		 */
		public function get useProxy () : Boolean;
		public function set useProxy (value:Boolean) : void;
		/**
		 * Custom function to be used to escape XML special characters before
		 */
		public function get xmlSpecialCharsFilter () : Function;
		public function set xmlSpecialCharsFilter (func:Function) : void;

		/**
		 * Creates a new WebService.  The destination, if specified, should match an
		 */
		public function AbstractWebService (destination:String = null, rootURL:String = null);
		/**
		 * Adds a header that will be applied to all operations of this web service.
		 */
		public function addHeader (header:Object) : void;
		/**
		 * Add a header that will be applied to all operations of this WebService.
		 */
		public function addSimpleHeader (qnameLocal:String, qnameNamespace:String, headerName:String, headerValue:String) : void;
		/**
		 * Clears the headers that applied to all operations.
		 */
		public function clearHeaders () : void;
		/**
		 * Returns a header if a match is found based on QName, localName, and URI.
		 */
		public function getHeader (qname:QName, headerName:String = null) : SOAPHeader;
		/**
		 * Removes the header with the given QName from all operations.
		 */
		public function removeHeader (qname:QName, headerName:String = null) : void;
		/**
		 * The username and password to authenticate a user when accessing
		 */
		public function setRemoteCredentials (remoteUsername:String, remotePassword:String, charset:String = null) : void;
		/**
		 * Returns a JSESSIOND found in the URL.  This should be attached
		 */
		static function findJSessionID () : String;
		/**
		 * @private
		 */
		function getDirectChannelSet () : ChannelSet;
		/**
		 * @private
		 */
		protected function unEnqueueCalls (fault:Fault = null) : void;
	}
}