﻿package fl.motion
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.utils.Dictionary;

	/**
	 * The AnimatorFactory class provides ActionScript-based support to associate one Motion object with multiple
	 */
	public class AnimatorFactory extends AnimatorFactoryBase
	{
		/**
		 * Creates an AnimatorFactory instance you can use to assign the properties of
		 */
		public function AnimatorFactory (motion:MotionBase);
		/**
		 * @private
		 */
		protected function getNewAnimator () : AnimatorBase;
	}
}