﻿package mx.core
{
	import flash.display.MovieClip;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.TimerEvent;
	import flash.system.ApplicationDomain;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.Timer;
	import flash.utils.getDefinitionByName;
	import mx.core.RSLItem;
	import mx.core.RSLListLoader;
	import mx.events.ModuleEvent;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;

	/**
	 *  @private
	 */
	public class FlexModuleFactory extends MovieClip implements IFlexModuleFactory
	{
		/**
		 *  @private
		 */
		private static const INIT_STATE : int = 0;
		/**
		 *  @private
		 */
		private static const RSL_START_LOAD_STATE : int = 1;
		/**
		 *  @private
		 */
		private static const APP_LOAD_STATE : int = 2;
		/**
		 *  @private
		 */
		private static const APP_START_STATE : int = 3;
		/**
		 *  @private
		 */
		private static const APP_RUNNING_STATE : int = 4;
		/**
		 *  @private
		 */
		private static const ERROR_STATE : int = 5;
		/**
		 *  @private
		 */
		private static const RSL_LOADING_STATE : int = 6;
		/**
		 *  @private
		 */
		private var rslListLoader : RSLListLoader;
		/**
		 *  @private
		 */
		private var mixinList : Array;
		/**
		 *  @private
		 */
		private var state : int;
		/**
		 *  @private
		 */
		private var appReady : Boolean;
		/**
		 *  @private
		 */
		private var appLoaded : Boolean;
		/**
		 *  @private
		 */
		private var timer : Timer;
		/**
		 *  @private
		 */
		private var nextFrameTimer : Timer;
		/**
		 *  @private
		 */
		private var errorMessage : String;

		/**
		 *  @private
		 */
		public function FlexModuleFactory ();
		/**
		 *  @private
		 */
		public function create (...params) : Object;
		/**
		 *  @private
		 */
		public function info () : Object;
		/**
		 *  @inheritDoc
		 */
		public function getDefinitionByName (name:String) : Object;
		/**
		 *  @private
		 */
		private function update () : void;
		/**
		 *  @private
		 */
		public function autorun () : Boolean;
		/**
		 *  @private
		 */
		private function displayError (msg:String) : void;
		/**
		 *  @private
		 */
		private function docFrameHandler (event:Event = null) : void;
		/**
		 *  @private
		 */
		private function installCompiledResourceBundles () : void;
		/**
		 *  @private
		 */
		private function deferredNextFrame () : void;
		/**
		 *  @private
		 */
		private function extraFrameHandler (event:Event = null) : void;
		/**
		 *  @private
		 */
		private function rslCompleteHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function rslErrorHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function moduleCompleteHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function timerHandler (event:TimerEvent) : void;
		/**
		 *  @private
		 */
		private function nextFrameTimerHandler (event:TimerEvent) : void;
	}
}