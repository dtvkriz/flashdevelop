﻿package mx.utils
{
	import flash.display.Graphics;

	/**
	 *  The Graphics class is an all-static class with utility methods
	 */
	public class GraphicsUtil
	{
		/**
		 * Draws a rounded rectangle using the size of a radius to draw the rounded corners. 
		 */
		public static function drawRoundRectComplex (graphics:Graphics, x:Number, y:Number, width:Number, height:Number, topLeftRadius:Number, topRightRadius:Number, bottomLeftRadius:Number, bottomRightRadius:Number) : void;
	}
}