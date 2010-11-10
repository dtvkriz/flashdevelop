﻿package mx.core
{
	import flash.accessibility.AccessibilityProperties;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.IBitmapDrawable;
	import flash.display.LoaderInfo;
	import flash.display.Stage;
	import flash.events.IEventDispatcher;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import flash.geom.Transform;

	/**
	 *  The IFlexDisplayObject interface defines the interface for skin elements.
	 */
	public interface IFlexDisplayObject extends IBitmapDrawable
	{
		/**
		 *  The measured height of this object.
		 */
		public function get measuredHeight () : Number;
		/**
		 *  The measured width of this object.
		 */
		public function get measuredWidth () : Number;

		/**
		 *  Moves this object to the specified x and y coordinates.
		 */
		public function move (x:Number, y:Number) : void;
		/**
		 *  Sets the actual size of this object.
		 */
		public function setActualSize (newWidth:Number, newHeight:Number) : void;
	}
}