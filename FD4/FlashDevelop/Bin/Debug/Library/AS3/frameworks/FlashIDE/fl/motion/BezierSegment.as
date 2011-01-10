﻿package fl.motion
{
	import flash.geom.Point;

	/**
	 * A Bezier segment consists of four Point objects that define a single cubic Bezier curve.
	 */
	public class BezierSegment
	{
		/**
		 * The first point of the Bezier curve.
		 */
		public var a : Point;
		/**
		 * The second point of the Bezier curve. 
		 */
		public var b : Point;
		/**
		 * The third point of the Bezier curve. 
		 */
		public var c : Point;
		/**
		 * The fourth point of the Bezier curve.
		 */
		public var d : Point;

		/**
		 * Constructor for BezierSegment instances.
		 */
		function BezierSegment (a:Point, b:Point, c:Point, d:Point);
		/**
		 * Calculates the location of a two-dimensional cubic Bezier curve at a specific time.
		 */
		public function getValue (t:Number) : Point;
		/**
		 * Calculates the value of a one-dimensional cubic Bezier equation at a specific time.
		 */
		public static function getSingleValue (t:Number, a:Number = 0, b:Number = 0, c:Number = 0, d:Number = 0) : Number;
		/**
		 * Finds the <code>y</code> value of a cubic Bezier curve at a given x coordinate.
		 */
		public function getYForX (x:Number, coefficients:Array = null) : Number;
		/**
		 * Calculates the coefficients for a cubic polynomial equation,
		 */
		public static function getCubicCoefficients (a:Number, b:Number, c:Number, d:Number) : Array;
		/**
		 * Finds the real solutions, if they exist, to a cubic polynomial equation of the form: at^3 + bt^2 + ct + d.
		 */
		public static function getCubicRoots (a:Number = 0, b:Number = 0, c:Number = 0, d:Number = 0) : Array;
		/**
		 * Finds the real solutions, if they exist, to a quadratic equation of the form: at^2 + bt + c.
		 */
		public static function getQuadraticRoots (a:Number, b:Number, c:Number) : Array;
	}
}