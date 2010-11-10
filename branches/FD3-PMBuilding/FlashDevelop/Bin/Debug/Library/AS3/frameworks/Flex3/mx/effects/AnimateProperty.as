﻿package mx.effects
{
	import mx.effects.effectClasses.AnimatePropertyInstance;

	/**
	 *  The AnimateProperty effect animates a property or style of a component. 
	 */
	public class AnimateProperty extends TweenEffect
	{
		/**
		 *  The ending value for the effect.
		 */
		public var toValue : Number;
		/**
		 *  If <code>true</code>, the property attribute is a style and you set
		 */
		public var isStyle : Boolean;
		/**
		 *  The name of the property on the target to animate.
		 */
		public var property : String;
		/**
		 *  If <code>true</code>, round off the interpolated tweened value
		 */
		public var roundValue : Boolean;
		/**
		 *  The starting value of the property for the effect.
		 */
		public var fromValue : Number;

		/**
		 *  @private
		 */
		public function get relevantStyles () : Array;

		/**
		 *  Constructor.
		 */
		public function AnimateProperty (target:Object = null);
		/**
		 *  @private
		 */
		public function getAffectedProperties () : Array;
		/**
		 *  @private
		 */
		protected function initInstance (instance:IEffectInstance) : void;
	}
}