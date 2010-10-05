﻿package mx.messaging.config
{
	import flash.utils.getDefinitionByName;
	import mx.collections.ArrayCollection;
	import mx.core.mx_internal;
	import mx.messaging.Channel;
	import mx.messaging.ChannelSet;
	import mx.messaging.MessageAgent;
	import mx.messaging.config.LoaderConfig;
	import mx.messaging.errors.InvalidChannelError;
	import mx.messaging.errors.InvalidDestinationError;
	import mx.messaging.errors.MessagingError;
	import mx.messaging.messages.IMessage;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;
	import mx.utils.StringUtil;
	import mx.utils.ObjectUtil;

	/**
	 *  This class provides access to the server messaging configuration information.
	 */
	public class ServerConfig
	{
		/**
		 *  @private
		 */
		public static const CLASS_ATTR : String = "type";
		/**
		 *  @private
		 */
		public static const URI_ATTR : String = "uri";
		/**
		 *  @private
		 */
		private static var _resourceManager : IResourceManager;
		/**
		 *  @private
		 */
		public static var serverConfigData : XML;
		/**
		 *  @private
		 */
		private static var _channelSets : Object;
		/**
		 *  @private
		 */
		private static var _clusteredChannels : Object;
		/**
		 *  @private 
		 */
		private static var _unclusteredChannels : Object;
		/**
		 * @private
		 */
		private static var _configFetchedChannels : Object;

		/**
		 *  @private
		 */
		private static function get resourceManager () : IResourceManager;
		/**
		 *  The XML configuration; this value must contain the relevant portions of
		 */
		public static function get xml () : XML;
		/**
		 *  @private
		 */
		public static function set xml (value:XML) : void;

		/**
		 *  This method ensures that the destinations specified contain identical
		 */
		public static function checkChannelConsistency (destinationA:String, destinationB:String) : void;
		/**
		 *  Returns a shared instance of the configured Channel.
		 */
		public static function getChannel (id:String, clustered:Boolean = false) : Channel;
		/**
		 *  Returns a shared ChannelSet for use with the specified destination
		 */
		public static function getChannelSet (destinationId:String) : ChannelSet;
		/**
		 *  Returns the property information for the specified destination
		 */
		public static function getProperties (destinationId:String) : XMLList;
		/**
		 *  This method returns true iff the channelset specified has channels with
		 */
		static function channelSetMatchesDestinationConfig (channelSet:ChannelSet, destination:String) : Boolean;
		/**
		 * @private
		 */
		static function fetchedConfig (endpoint:String) : Boolean;
		/**
		 *  @private
		 */
		static function getChannelIdList (destination:String) : Array;
		/**
		 *  @private 
		 */
		static function needsConfig (channel:Channel) : Boolean;
		/**
		 *  @private
		 */
		static function updateServerConfigData (serverConfig:ConfigMap, endpoint:String = null) : void;
		/**
		 *  Helper method that builds a new Channel instance based on the 
		 */
		private static function createChannel (channelId:String) : Channel;
		/**
		 * Converts the ConfigMap of properties into XML
		 */
		private static function convertToXML (config:ConfigMap, configXML:XML) : void;
		private static function getChannelIds (destinationConfig:XML) : Array;
		/**
		 * @private
		 */
		private static function getDefaultChannelIds () : Array;
		/**
		 *  Returns the destination XML data specific to the destination and message
		 */
		private static function getDestinationConfig (destinationId:String) : XML;
		/**
		 *  Helper method to look up and return a cached ChannelSet (and build and
		 */
		private static function internalGetChannelSet (destinationConfig:XML, destinationId:String) : ChannelSet;
	}
}