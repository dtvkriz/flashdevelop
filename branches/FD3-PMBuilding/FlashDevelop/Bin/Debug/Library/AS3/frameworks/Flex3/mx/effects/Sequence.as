﻿package mx.effects
{
	import mx.effects.effectClasses.SequenceInstance;

	/**
	 *  The Sequence effect plays multiple child effects one after the other, 
	 */
	public class Sequence extends CompositeEffect
	{
		/**
		 *  Constructor.
		 */
		public function Sequence (target:Object = null);
		/**
		 *  @private
		 */
		protected function initInstance (instance:IEffectInstance) : void;
	}
}