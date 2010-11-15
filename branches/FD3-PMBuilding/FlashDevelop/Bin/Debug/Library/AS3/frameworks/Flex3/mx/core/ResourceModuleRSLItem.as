﻿package mx.core
{
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import mx.events.ResourceEvent;
	import mx.events.RSLEvent;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;

	/**
	 *	@private
	 */
	public class ResourceModuleRSLItem extends RSLItem
	{
		/**
		 *  @private
		 */
		public function ResourceModuleRSLItem (url:String);
		/**
		 * 
		 */
		public function load (progressHandler:Function, completeHandler:Function, ioErrorHandler:Function, securityErrorHandler:Function, rslErrorHandler:Function) : void;
		/**
		 *  @private
		 */
		private function resourceErrorHandler (event:ResourceEvent) : void;
	}
}