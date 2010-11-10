﻿package mx.effects
{
	import mx.effects.effectClasses.DissolveInstance;
	import mx.graphics.RoundedRectangle;
	import mx.styles.StyleManager;

	/**
	 *  Animate the component from transparent to opaque,
	 */
	public class Dissolve extends TweenEffect
	{
		/**
		 *  @private
		 */
		private static var AFFECTED_PROPERTIES : Array;
		/**
		 *  Initial transparency level between 0.0 and 1.0, 
		 */
		public var alphaFrom : Number;
		/**
		 *  Final transparency level between 0.0 and 1.0, 
		 */
		public var alphaTo : Number;
		/**
		 *  Hex value that represents the color of the floating rectangle 
		 */
		public var color : uint;
		/**
		 *  Flag indicating whether the floating rectangle is removed automatically
		 */
		local var persistAfterEnd : Boolean;
		/**
		 *  The area of the target to play the effect upon.
		 */
		public var targetArea : RoundedRectangle;

		/**
		 *  Constructor.
		 */
		public function Dissolve (target:Object = null);
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