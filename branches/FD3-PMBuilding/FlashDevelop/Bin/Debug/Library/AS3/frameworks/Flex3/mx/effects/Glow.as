﻿package mx.effects
{
	import mx.effects.effectClasses.GlowInstance;
	import mx.styles.StyleManager;

	/**
	 *  The Glow effect lets you apply a visual glow effect to a component. 
	 */
	public class Glow extends TweenEffect
	{
		/**
		 *  @private
		 */
		private static var AFFECTED_PROPERTIES : Array;
		/**
		 *  Starting transparency level between 0.0 and 1.0,
		 */
		public var alphaFrom : Number;
		/**
		 *  Ending transparency level between 0.0 and 1.0,
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
		 *  Specifies whether the glow is an inner glow. 
		 */
		public var inner : Boolean;
		/**
		 *  Specifies whether the object has a knockout effect. 
		 */
		public var knockout : Boolean;
		/**
		 *  The strength of the imprint or spread. 
		 */
		public var strength : Number;

		/**
		 *  Constructor.
		 */
		public function Glow (target:Object = null);
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