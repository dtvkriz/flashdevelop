﻿package mx.effects.easing
{
	/**
	 *  The Linear class defines easing functions to implement 
	 */
	public class Linear
	{
		/**
		 *  The <code>easeNone()</code> method defines a constant motion, 
		 */
		public static function easeNone (t:Number, b:Number, c:Number, d:Number) : Number;
		/**
		 *  The <code>easeIn()</code> method starts motion from zero velocity, 
		 */
		public static function easeIn (t:Number, b:Number, c:Number, d:Number) : Number;
		/**
		 *  The <code>easeOut()</code> method starts motion fast, 
		 */
		public static function easeOut (t:Number, b:Number, c:Number, d:Number) : Number;
		/**
		 *  The <code>easeInOut()</code> method combines the motion 
		 */
		public static function easeInOut (t:Number, b:Number, c:Number, d:Number) : Number;
	}
}