﻿package fl.motion
{
	import flash.filters.*;
	import flash.geom.ColorTransform;
	import flash.utils.*;

	/**
	 * The Motion class stores a keyframe animation sequence that can be applied to a visual object.
	 */
	public class Motion extends MotionBase
	{
		/**
		 * An object that stores information about the context in which the motion was created,
		 */
		public var source : Source;
		/**
		 * @private
		 */
		private var _keyframesCompact : Array;
		/**
		 *  @private
		 */
		private static var typeCache : Object;

		/**
		 * A compact array of keyframes, where each index is occupied by a keyframe. 
		 */
		public function get keyframesCompact () : Array;
		/**
		 * @private (setter)
		 */
		public function set keyframesCompact (compactArray:Array) : void;

		/**
		 * Constructor for Motion instances.
		 */
		function Motion (xml:XML = null);
		/**
		 * Retrieves an interpolated ColorTransform object at a specific time index in the Motion instance.
		 */
		public function getColorTransform (index:int) : ColorTransform;
		/**
		 * Retrieves an interpolated array of filters at a specific time index in the Motion instance.
		 */
		public function getFilters (index:Number) : Array;
		/**
		 * @private
		 */
		protected function findTweenedValue (index:Number, tweenableName:String, curKeyframeBase:KeyframeBase, timeFromKeyframe:Number, begin:Number) : Number;
		/**
		 * @private
		 */
		private function parseXML (xml:XML) : Motion;
		/**
		 * A method needed to create a Motion instance from a string of XML.
		 */
		public static function fromXMLString (xmlString:String) : Motion;
		/**
		 * Blends filters smoothly from one array of filter objects to another.
		 */
		public static function interpolateFilters (fromFilters:Array, toFilters:Array, progress:Number) : Array;
		/**
		 * Blends filters smoothly from one filter object to another.
		 */
		public static function interpolateFilter (fromFilter:BitmapFilter, toFilter:BitmapFilter, progress:Number) : BitmapFilter;
		/**
		 * @private
		 */
		private static function getTypeInfo (o:*) : XML;
		/**
		 * @private
		 */
		protected function getNewKeyframe (xml:XML = null) : KeyframeBase;
	}
}