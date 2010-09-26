﻿package mx.effects.effectClasses
{
	import flash.events.Event;
	import mx.containers.Panel;
	import mx.core.Application;
	import mx.core.Container;
	import mx.core.IUIComponent;
	import mx.core.ScrollPolicy;
	import mx.core.mx_internal;
	import mx.effects.EffectManager;
	import mx.events.EffectEvent;
	import mx.events.ResizeEvent;
	import mx.styles.IStyleClient;

	/**
	 *  The ResizeInstance class implements the instance class
	 */
	public class ResizeInstance extends TweenEffectInstance
	{
		/**
		 *  @private
		 */
		private var restoreVisibleArray : Array;
		/**
		 *  @private
		 */
		private var restoreAutoLayoutArray : Array;
		/**
		 *  @private
		 */
		private var numHideEffectsPlaying : Number;
		/**
		 *  @private
		 */
		private var origPercentHeight : Number;
		/**
		 *  @private
		 */
		private var origPercentWidth : Number;
		/**
		 *  @private
		 */
		private var origExplicitHeight : Number;
		/**
		 *  @private
		 */
		private var origExplicitWidth : Number;
		/**
		 *  @private
		 */
		private var heightSet : Boolean;
		/**
		 *  @private
		 */
		private var widthSet : Boolean;
		/**
		 *  @private
		 */
		private var explicitWidthSet : Boolean;
		/**
		 *  @private
		 */
		private var explicitHeightSet : Boolean;
		/**
		 *  @private
		 */
		private var origVerticalScrollPolicy : String;
		/**
		 *  @private
		 */
		private var origHorizontalScrollPolicy : String;
		/**
		 *  @private
		 */
		private var parentOrigVerticalScrollPolicy : String;
		/**
		 *  @private
		 */
		private var parentOrigHorizontalScrollPolicy : String;
		/**
		 *  @private 
		 */
		private var left : *;
		/**
		 *  @private 
		 */
		private var right : *;
		/**
		 *  @private 
		 */
		private var top : *;
		/**
		 *  @private 
		 */
		private var bottom : *;
		/**
		 *  @private
		 */
		private var _heightBy : Number;
		/**
		 *  Initial height. If omitted, Flex uses the current size.
		 */
		public var heightFrom : Number;
		/**
		 *  @private
		 */
		private var _heightTo : Number;
		/**
		 *  An Array of Panels.
		 */
		public var hideChildrenTargets : Array;
		/**
		 *  @private
		 */
		private var _widthBy : Number;
		/**
		 *  Initial width. If omitted, Flex uses the current size.
		 */
		public var widthFrom : Number;
		/**
		 *  @private
		 */
		private var _widthTo : Number;

		/**
		 *  Number of pixels by which to modify the height of the component.
		 */
		public function get heightBy () : Number;
		/**
		 *  @private
		 */
		public function set heightBy (value:Number) : void;
		/**
		 *  Final height, in pixels.
		 */
		public function get heightTo () : Number;
		/**
		 *  @private
		 */
		public function set heightTo (value:Number) : void;
		/**
		 *  Number of pixels by which to modify the width of the component.
		 */
		public function get widthBy () : Number;
		/**
		 *  @private
		 */
		public function set widthBy (value:Number) : void;
		/**
		 *  Final width, in pixels.
		 */
		public function get widthTo () : Number;
		/**
		 *  @private
		 */
		public function set widthTo (value:Number) : void;

		/**
		 *  Constructor.
		 */
		public function ResizeInstance (target:Object);
		/**
		 *  @private
		 */
		public function initEffect (event:Event) : void;
		/**
		 *  @private
		 */
		public function play () : void;
		/**
		 *  @private
		 */
		public function onTweenUpdate (value:Object) : void;
		/**
		 *  @private
		 */
		public function onTweenEnd (value:Object) : void;
		/**
		 *  @private
		 */
		public function end () : void;
		/**
		 *  @private
		 */
		private function startResizeTween () : void;
		/**
		 *  @private
		 */
		private function hidePanelChildren () : Boolean;
		/**
		 *  @private
		 */
		private function makePanelChildrenInvisible (panel:Container, panelIndex:Number) : void;
		/**
		 * Method is used to explicitely determine widthTo and heightTo, taking into 
		 */
		private function calculateExplicitDimensionChanges () : void;
		/**
		 *  @private
		 */
		private function restorePanelChildren () : void;
		/**
		 *  @private
		 */
		function eventHandler (event:Event) : void;
	}
}