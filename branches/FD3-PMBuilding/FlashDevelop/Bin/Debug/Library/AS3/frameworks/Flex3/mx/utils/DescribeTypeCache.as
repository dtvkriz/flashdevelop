﻿package mx.utils
{
	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import mx.binding.BindabilityInfo;

	/**
	 *  DescribeTypeCache is a convenience class that is used to 
	 */
	public class DescribeTypeCache
	{
		/**
		 *  @private
		 */
		private static var typeCache : Object;
		/**
		 *  @private
		 */
		private static var cacheHandlers : Object;

		/**
		 *  Calls <code>flash.utils.describeType()</code> for the first time and caches
		 */
		public static function describeType (o:*) : DescribeTypeCacheRecord;
		/**
		 *  registerCacheHandler lets you add function handler for specific strings.
		 */
		public static function registerCacheHandler (valueName:String, handler:Function) : void;
		/**
		 *  @private
		 */
		static function extractValue (valueName:String, record:DescribeTypeCacheRecord) : *;
		/**
		 *  @private
		 */
		private static function bindabilityInfoHandler (record:DescribeTypeCacheRecord) : *;
	}
}