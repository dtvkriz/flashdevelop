﻿package mx.effects.effectClasses
{
	import mx.core.UIComponentGlobals;
	import mx.core.mx_internal;
	import mx.effects.EffectInstance;
	import mx.effects.Tween;
	import mx.events.TweenEvent;

	/**
	 *
	 */
	public class TweenEffectInstance extends EffectInstance
	{
		/**
		 *  @private
		 */
		local var needToLayout : Boolean;
		/**
		 *  @private.
		 */
		private var _seekTime : Number;
		/**
		 *  The easing function for the animation.
		 */
		public var easingFunction : Function;
		/**
		 *  The Tween object, which determines the animation.
		 */
		public var tween : Tween;

		/**
		 *  @private
		 */
		function set playReversed (value:Boolean) : void;
		/**
		 *  The current position of the effect, in milliseconds. 
		 */
		public function get playheadTime () : Number;

		/**
		 *  Constructor.
		 */
		public function TweenEffectInstance (target:Object);
		/**
		 *  @private
		 */
		public function pause () : void;
		/**
		 *  @private
		 */
		public function stop () : void;
		/**
		 *  @private
		 */
		public function resume () : void;
		/**
		 *  @private
		 */
		public function reverse () : void;
		/**
		 *  Advances the effect to the specified position. 
		 */
		public function seek (playheadTime:Number) : void;
		/**
		 *  Interrupts an effect that is currently playing,
		 */
		public function end () : void;
		/**
		 *  Creates a Tween instance,
		 */
		protected function createTween (listener:Object, startValue:Object, endValue:Object, duration:Number = -1, minFps:Number = -1) : Tween;
		function applyTweenStartValues () : void;
		private function tweenEventHandler (event:TweenEvent) : void;
		/**
		 *  Callback method that is called when the target should be updated
		 */
		public function onTweenUpdate (value:Object) : void;
		/**
		 *  Callback method that is called when the target should be updated
		 */
		public function onTweenEnd (value:Object) : void;
	}
}