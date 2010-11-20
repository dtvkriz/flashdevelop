﻿package mx.controls.richTextEditorClasses
{
	import mx.controls.VRule;
	import mx.core.Container;
	import mx.core.EdgeMetrics;
	import mx.core.IUIComponent;

	/**
	 *  Number of pixels between children in the horizontal direction.
	 */
	[Style(name="horizontalGap", type="Number", format="Length", inherit="no")] 
	/**
	 *  Number of pixels between children in the vertical direction.
	 */
	[Style(name="verticalGap", type="Number", format="Length", inherit="no")] 

	/**
	 *  @private
	 */
	public class ToolBar extends Container
	{
		/**
		 *  Constructor.
		 */
		public function ToolBar ();
		/**
		 *  @private
		 */
		protected function measure () : void;
		/**
		 *  @private
		 */
		protected function updateDisplayList (unscaledWidth:Number, unscaledHeight:Number) : void;
	}
}