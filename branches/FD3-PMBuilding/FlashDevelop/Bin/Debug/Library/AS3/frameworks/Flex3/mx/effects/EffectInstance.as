﻿package mx.effects
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getTimer;
	import mx.core.UIComponent;
	import mx.core.mx_internal;
	import mx.effects.effectClasses.PropertyChanges;
	import mx.events.EffectEvent;
	import mx.events.FlexEvent;

	/**
	 *  The EffectInstance class represents an instance of an effect
	 */
	public class EffectInstance extends EventDispatcher implements IEffectInstance
	{
		/**
		 *  @private
		 */
		local var delayTimer : Timer;
		/**
		 *  @private
		 */
		private var delayStartTime : Number;
		/**
		 *  @private
		 */
		private var delayElapsedTime : Number;
		/**
		 *  @private
		 */
		local var durationExplicitlySet : Boolean;
		/**
		 *  @private
		 */
		local var hideOnEffectEnd : Boolean;
		/**
		 *  @private
		 */
		local var parentCompositeEffectInstance : EffectInstance;
		/**
		 *  @private
		 */
		private var playCount : int;
		/**
		 *  @private
		 */
		local var stopRepeat : Boolean;
		/**
		 *  @private
		 */
		private var _duration : Number;
		/**
		 *  @private
		 */
		private var _effect : IEffect;
		/**
		 *  @private
		 */
		private var _effectTargetHost : IEffectTargetHost;
		/**
		 *  @private
		 */
		private var _hideFocusRing : Boolean;
		/**
		 *  @private
		 */
		private var _playReversed : Boolean;
		/**
		 *  @private
		 */
		private var _propertyChanges : PropertyChanges;
		/**
		 *  @private
		 */
		private var _repeatCount : int;
		/**
		 *  @private
		 */
		private var _repeatDelay : int;
		/**
		 *  @private
		 */
		private var _startDelay : int;
		/**
		 *  @private
		 */
		private var _suspendBackgroundProcessing : Boolean;
		/**
		 *  @private
		 */
		private var _target : Object;
		/**
		 *  @private
		 */
		private var _triggerEvent : Event;

		/**
		 *  @private
		 */
		function get actualDuration () : Number;
		/**
		 *  @copy mx.effects.IEffectInstance#className
		 */
		public function get className () : String;
		/**
		 *  @copy mx.effects.IEffectInstance#duration
		 */
		public function get duration () : Number;
		/**
		 *  @private
		 */
		public function set duration (value:Number) : void;
		/**
		 *  @copy mx.effects.IEffectInstance#effect
		 */
		public function get effect () : IEffect;
		/**
		 *  @private
		 */
		public function set effect (value:IEffect) : void;
		/**
		 *  @copy mx.effects.IEffectInstance#effectTargetHost
		 */
		public function get effectTargetHost () : IEffectTargetHost;
		/**
		 *  @private
		 */
		public function set effectTargetHost (value:IEffectTargetHost) : void;
		/**
		 *  @copy mx.effects.IEffectInstance#hideFocusRing
		 */
		public function get hideFocusRing () : Boolean;
		/**
		 *  @private
		 */
		public function set hideFocusRing (value:Boolean) : void;
		/**
		 *  @copy mx.effects.IEffectInstance#playheadTime
		 */
		public function get playheadTime () : Number;
		/**
		 *  @private
		 */
		function get playReversed () : Boolean;
		/**
		 *  @private
		 */
		function set playReversed (value:Boolean) : void;
		/**
		 *  @copy mx.effects.IEffectInstance#propertyChanges
		 */
		public function get propertyChanges () : PropertyChanges;
		/**
		 *  @private
		 */
		public function set propertyChanges (value:PropertyChanges) : void;
		/**
		 *  @copy mx.effects.IEffectInstance#repeatCount
		 */
		public function get repeatCount () : int;
		/**
		 *  @private
		 */
		public function set repeatCount (value:int) : void;
		/**
		 *  @copy mx.effects.IEffectInstance#repeatDelay
		 */
		public function get repeatDelay () : int;
		/**
		 *  @private
		 */
		public function set repeatDelay (value:int) : void;
		/**
		 *  @copy mx.effects.IEffectInstance#startDelay
		 */
		public function get startDelay () : int;
		/**
		 *  @private
		 */
		public function set startDelay (value:int) : void;
		/**
		 *  @copy mx.effects.IEffectInstance#suspendBackgroundProcessing
		 */
		public function get suspendBackgroundProcessing () : Boolean;
		/**
		 *  @private
		 */
		public function set suspendBackgroundProcessing (value:Boolean) : void;
		/**
		 *  @copy mx.effects.IEffectInstance#target
		 */
		public function get target () : Object;
		/**
		 *  @private
		 */
		public function set target (value:Object) : void;
		/**
		 *  @copy mx.effects.IEffectInstance#triggerEvent
		 */
		public function get triggerEvent () : Event;
		/**
		 *  @private
		 */
		public function set triggerEvent (value:Event) : void;

		/**
		 *  Constructor.
		 */
		public function EffectInstance (target:Object);
		/**
		 *  @copy mx.effects.IEffectInstance#initEffect()
		 */
		public function initEffect (event:Event) : void;
		/**
		 *  @copy mx.effects.IEffectInstance#startEffect()
		 */
		public function startEffect () : void;
		/**
		 *  @copy mx.effects.IEffectInstance#play()
		 */
		public function play () : void;
		/**
		 *  @copy mx.effects.IEffectInstance#pause()
		 */
		public function pause () : void;
		/**
		 *  @copy mx.effects.IEffectInstance#stop()
		 */
		public function stop () : void;
		/**
		 *  @copy mx.effects.IEffectInstance#resume()
		 */
		public function resume () : void;
		/**
		 *  @copy mx.effects.IEffectInstance#reverse()
		 */
		public function reverse () : void;
		/**
		 *  @copy mx.effects.IEffectInstance#end()
		 */
		public function end () : void;
		/**
		 *  @copy mx.effects.IEffectInstance#finishEffect()
		 */
		public function finishEffect () : void;
		/**
		 *  @copy mx.effects.IEffectInstance#finishRepeat()
		 */
		public function finishRepeat () : void;
		/**
		 *  @private
		 */
		function playWithNoDuration () : void;
		/**
		 *  @private
		 */
		function eventHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function delayTimerHandler (event:TimerEvent) : void;
	}
}