﻿package mx.skins
{
	import mx.core.EdgeMetrics;
	import mx.core.IBorder;

	/**
	 *  The Border class is an abstract base class for various classes that
	 */
	public class Border extends ProgrammaticSkin implements IBorder
	{
		/**
		 *  The thickness of the border edges.
		 */
		public function get borderMetrics () : EdgeMetrics;

		/**
		 *  Constructor.
		 */
		public function Border ();
	}
}