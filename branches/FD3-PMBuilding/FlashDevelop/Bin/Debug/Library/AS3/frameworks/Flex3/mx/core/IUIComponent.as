﻿package mx.core
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import mx.managers.ISystemManager;

	/**
	 *  The IUIComponent interface defines the basic set of APIs
	 */
	public interface IUIComponent extends IFlexDisplayObject
	{
		/**
		 *  The y-coordinate of the baseline
		 */
		public function get baselinePosition () : Number;
		/**
		 *  A reference to the document object associated with this component. 
		 */
		public function get document () : Object;
		/**
		 *  @private
		 */
		public function set document (value:Object) : void;
		/**
		 *  Whether the component can accept user interaction. After setting the <code>enabled</code>
		 */
		public function get enabled () : Boolean;
		/**
		 *  @private
		 */
		public function set enabled (value:Boolean) : void;
		/**
		 *  The explicitly specified height for the component, 
		 */
		public function get explicitHeight () : Number;
		/**
		 *  @private
		 */
		public function set explicitHeight (value:Number) : void;
		/**
		 *  Number that specifies the maximum height of the component, 
		 */
		public function get explicitMaxHeight () : Number;
		/**
		 *  Number that specifies the maximum width of the component, 
		 */
		public function get explicitMaxWidth () : Number;
		/**
		 *  Number that specifies the minimum height of the component, 
		 */
		public function get explicitMinHeight () : Number;
		/**
		 *  Number that specifies the minimum width of the component, 
		 */
		public function get explicitMinWidth () : Number;
		/**
		 *  The explicitly specified width for the component, 
		 */
		public function get explicitWidth () : Number;
		/**
		 *  @private
		 */
		public function set explicitWidth (value:Number) : void;
		/**
		 *  A single Sprite object that is shared among components
		 */
		public function get focusPane () : Sprite;
		/**
		 *  @private
		 */
		public function set focusPane (value:Sprite) : void;
		/**
		 *  @copy mx.core.UIComponent#includeInLayout
		 */
		public function get includeInLayout () : Boolean;
		/**
		 *  @private
		 */
		public function set includeInLayout (value:Boolean) : void;
		/**
		 *  @copy mx.core.UIComponent#isPopUp
		 */
		public function get isPopUp () : Boolean;
		/**
		 *  @private
		 */
		public function set isPopUp (value:Boolean) : void;
		/**
		 *  Number that specifies the maximum height of the component, 
		 */
		public function get maxHeight () : Number;
		/**
		 *  Number that specifies the maximum width of the component, 
		 */
		public function get maxWidth () : Number;
		/**
		 *  @copy mx.core.UIComponent#measuredMinHeight
		 */
		public function get measuredMinHeight () : Number;
		/**
		 *  @private
		 */
		public function set measuredMinHeight (value:Number) : void;
		/**
		 *  @copy mx.core.UIComponent#measuredMinWidth
		 */
		public function get measuredMinWidth () : Number;
		/**
		 *  @private
		 */
		public function set measuredMinWidth (value:Number) : void;
		/**
		 *  Number that specifies the minimum height of the component, 
		 */
		public function get minHeight () : Number;
		/**
		 *  Number that specifies the minimum width of the component, 
		 */
		public function get minWidth () : Number;
		/**
		 *  Typically the parent container of this component. 
		 */
		public function get owner () : DisplayObjectContainer;
		/**
		 *  @private
		 */
		public function set owner (value:DisplayObjectContainer) : void;
		/**
		 *  Number that specifies the height of a component as a 
		 */
		public function get percentHeight () : Number;
		/**
		 *  @private
		 */
		public function set percentHeight (value:Number) : void;
		/**
		 *  Number that specifies the width of a component as a 
		 */
		public function get percentWidth () : Number;
		/**
		 *  @private
		 */
		public function set percentWidth (value:Number) : void;
		/**
		 *  A reference to the SystemManager object for this component.
		 */
		public function get systemManager () : ISystemManager;
		/**
		 *  @private
		 */
		public function set systemManager (value:ISystemManager) : void;
		/**
		 *  Used by EffectManager.
		 */
		public function get tweeningProperties () : Array;
		/**
		 *  @private
		 */
		public function set tweeningProperties (value:Array) : void;

		/**
		 *  Initialize the object.
		 */
		public function initialize () : void;
		/**
		 *  @copy mx.core.UIComponent#parentChanged()
		 */
		public function parentChanged (p:DisplayObjectContainer) : void;
		/**
		 *  @copy mx.core.UIComponent#getExplicitOrMeasuredWidth()
		 */
		public function getExplicitOrMeasuredWidth () : Number;
		/**
		 *  @copy mx.core.UIComponent#getExplicitOrMeasuredHeight()
		 */
		public function getExplicitOrMeasuredHeight () : Number;
		/**
		 *  @copy mx.core.UIComponent#setVisible()
		 */
		public function setVisible (value:Boolean, noEvent:Boolean = false) : void;
		/**
		 *  @copy mx.core.UIComponent#owns()
		 */
		public function owns (displayObject:DisplayObject) : Boolean;
	}
}