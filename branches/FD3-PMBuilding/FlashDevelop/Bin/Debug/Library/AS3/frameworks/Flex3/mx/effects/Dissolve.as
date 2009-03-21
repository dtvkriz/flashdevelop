﻿package mx.effects
{
	import mx.effects.effectClasses.DissolveInstance;
	import mx.graphics.RoundedRectangle;
	import mx.styles.StyleManager;

	/**
	 *  Animate the component from transparent to opaque, *  or from opaque to transparent.  *  When the Dissolve effect is played, it does the following: *   *  <ol> *    <li>When the effect begins, it creates an opaque rectangle. *    The rectangle floats above the target component, *    its color matches the <code>Dissolve.color</code> property, *    and its <code>alpha</code> property is initially set to  *    (1.0 - <code>Dissolve.alphaFrom</code>).</li> *    <li>As the effect plays, the <code>alpha</code> property *    of the rectangle animates from (1.0 - <code>alphaFrom</code>) *    to (1.0 - <code>alphaTo</code>). *    As the rectangle becomes more and more opaque, *    the content underneath it gradually disappears.</li> *    <li>When the effect finishes, the rectangle is destroyed.</li> *  </ol> *   *  <p>When the target object is a Container, the Dissolve effect *  applies to the content area inside the container. *  The content area is the region where the container's *  background color is visible.</p> * *  <p><b>Note</b>: To use the Dissolve effect with the *  <code>creationCompleteEffect</code> trigger of a DataGrid control, *  you must define the data provider of the control inline  *  using a child tag of the DataGrid control, or using data binding.  *  This issue is a result of the data provider not being set until the  *  <code>creationComplete</code> event is dispatched. *  Therefore, when the effect starts playing, Flex has not completed *  the sizing of the DataGrid control. </p> *   *  @mxml * *  <p>The <code>&lt;mx:Dissolve&gt;</code> tag *  inherits the tag attributes of its superclass, *  and adds the following tag attributes:</p> *   *  <pre> *  &lt;mx:Dissolve *    id="ID" *    alphaFrom="val" *    alphaTo="val" *    color="val" *  /&gt; *  </pre> * *  @see mx.effects.effectClasses.DissolveInstance *  @see mx.effects.Tween *  @see mx.effects.TweenEffect * *  @includeExample examples/DissolveEffectExample.mxml
	 */
	public class Dissolve extends TweenEffect
	{
		/**
		 *  @private
		 */
		private static var AFFECTED_PROPERTIES : Array;
		/**
		 *  Initial transparency level between 0.0 and 1.0, 	 *  where 0.0 means transparent and 1.0 means fully opaque. 	 *	 *  <p>If the effect causes the target component to disappear, the default 	 *  value is the current value of the target's <code>alpha</code> property.	 *  If the effect causes the target component to appear, the default 	 *  value is 0.0.</p>
		 */
		public var alphaFrom : Number;
		/**
		 *  Final transparency level between 0.0 and 1.0, 	 *  where 0.0 means transparent and 1.0 means fully opaque. 	 *	 *  <p>If the effect causes the target component to disappear, the default 	 *  value is 0.0.	 *  If the effect causes the target component to appear, the default 	 *  value is the current value of the target's <code>alpha</code> property.</p>
		 */
		public var alphaTo : Number;
		/**
		 *  Hex value that represents the color of the floating rectangle 	 *  that the effect displays over the target object. 	 *	 *  The default value is the color specified by the target component's	 *  <code>backgroundColor</code> style property, or 0xFFFFFF, if 	 *  <code>backgroundColor</code> is not set.
		 */
		public var color : uint;
		/**
		 *  Flag indicating whether the floating rectangle is removed automatically	 *  when the effect finishes. If false, it is removed.	 *	 *  @default true
		 */
		local var persistAfterEnd : Boolean;
		/**
		 *  The area of the target to play the effect upon.	 *  The dissolve overlay is drawn using this property's dimensions.	 *  UIComponents create an overlay over the entire component.	 *  Containers create an overlay over their content area,	 *  but not their chrome. 	 *	 *  @default null
		 */
		public var targetArea : RoundedRectangle;

		/**
		 *  Constructor.	 *	 *  @param target The Object to animate with this effect.
		 */
		public function Dissolve (target:Object = null);
		/**
		 *  @private
		 */
		public function getAffectedProperties () : Array;
		/**
		 *  @private
		 */
		protected function initInstance (instance:IEffectInstance) : void;
	}
}
