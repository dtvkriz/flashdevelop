﻿package mx.effects.effectClasses
{
	import flash.events.Event;
	import flash.filters.GlowFilter;
	import mx.core.Application;
	import mx.core.mx_internal;
	import mx.styles.StyleManager;

	/**
	 *  The GlowInstance class implements the instance class
	 */
	public class GlowInstance extends TweenEffectInstance
	{
		/**
		 *  Starting transparency level.
		 */
		public var alphaFrom : Number;
		/**
		 *  Ending transparency level.
		 */
		public var alphaTo : Number;
		/**
		 *  The starting amount of horizontal blur.
		 */
		public var blurXFrom : Number;
		/**
		 *  The ending amount of horizontal blur.
		 */
		public var blurXTo : Number;
		/**
		 *  The starting amount of vertical blur.
		 */
		public var blurYFrom : Number;
		/**
		 *  The ending amount of vertical blur.
		 */
		public var blurYTo : Number;
		/**
		 *  The color of the glow.
		 */
		public var color : uint;
		/**
		 *  The inner flag of the glow.
		 */
		public var inner : Boolean;
		/**
		 *  The knockout flag of the glow.
		 */
		public var knockout : Boolean;
		/**
		 *  The strength of the glow.
		 */
		public var strength : Number;

		/**
		 *  Constructor.
		 */
		public function GlowInstance (target:Object);
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
		private function setGlowFilter (color:uint, alpha:Number, blurX:Number, blurY:Number) : void;
	}
}