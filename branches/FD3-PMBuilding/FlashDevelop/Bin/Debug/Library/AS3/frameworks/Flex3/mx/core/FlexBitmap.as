﻿package mx.core
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import mx.utils.NameUtil;

	/**
	 *  FlexBitmap is a subclass of the Player's Bitmap class.
	 */
	public class FlexBitmap extends Bitmap
	{
		/**
		 *  Constructor.
		 */
		public function FlexBitmap (bitmapData:BitmapData = null, pixelSnapping:String = "auto", smoothing:Boolean = false);
		/**
		 *  Returns a string indicating the location of this object
		 */
		public function toString () : String;
	}
}