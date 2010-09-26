﻿package mx.managers
{
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import mx.core.IToolTip;
	import mx.core.IUIComponent;
	import mx.core.Singleton;
	import mx.core.mx_internal;
	import mx.effects.IAbstractEffect;

	/**
	 *  The ToolTipManager lets you set basic ToolTip and error tip functionality,
	 */
	public class ToolTipManager extends EventDispatcher
	{
		/**
		 *  @private
		 */
		private static var implClassDependency : ToolTipManagerImpl;
		/**
		 *  @private
		 */
		private static var _impl : IToolTipManager2;

		/**
		 *  @private
		 */
		private static function get impl () : IToolTipManager2;
		/**
		 *  The UIComponent that is currently displaying a ToolTip,
		 */
		public static function get currentTarget () : DisplayObject;
		/**
		 *  @private
		 */
		public static function set currentTarget (value:DisplayObject) : void;
		/**
		 *  The ToolTip object that is currently visible,
		 */
		public static function get currentToolTip () : IToolTip;
		/**
		 *  @private
		 */
		public static function set currentToolTip (value:IToolTip) : void;
		/**
		 *  If <code>true</code>, the ToolTipManager will automatically show
		 */
		public static function get enabled () : Boolean;
		/**
		 *  @private
		 */
		public static function set enabled (value:Boolean) : void;
		/**
		 *  The amount of time, in milliseconds, that Flex waits
		 */
		public static function get hideDelay () : Number;
		/**
		 *  @private
		 */
		public static function set hideDelay (value:Number) : void;
		/**
		 *  The effect that plays when a ToolTip is hidden,
		 */
		public static function get hideEffect () : IAbstractEffect;
		/**
		 *  @private
		 */
		public static function set hideEffect (value:IAbstractEffect) : void;
		/**
		 *  The amount of time, in milliseconds, that a user can take
		 */
		public static function get scrubDelay () : Number;
		/**
		 *  @private
		 */
		public static function set scrubDelay (value:Number) : void;
		/**
		 *  The amount of time, in milliseconds, that Flex waits
		 */
		public static function get showDelay () : Number;
		/**
		 *  @private
		 */
		public static function set showDelay (value:Number) : void;
		/**
		 *  The effect that plays when a ToolTip is shown,
		 */
		public static function get showEffect () : IAbstractEffect;
		/**
		 *  @private
		 */
		public static function set showEffect (value:IAbstractEffect) : void;
		/**
		 *  The class to use for creating ToolTips.
		 */
		public static function get toolTipClass () : Class;
		/**
		 *  @private
		 */
		public static function set toolTipClass (value:Class) : void;

		/**
		 *  Registers a target UIComponent or UITextField, and the text
		 */
		static function registerToolTip (target:DisplayObject, oldToolTip:String, newToolTip:String) : void;
		/**
		 *  Registers a target UIComponent, and the text
		 */
		static function registerErrorString (target:DisplayObject, oldErrorString:String, newErrorString:String) : void;
		/**
		 *  @private
		 */
		static function sizeTip (toolTip:IToolTip) : void;
		/**
		 *  Creates an instance of the ToolTip class with the specified text
		 */
		public static function createToolTip (text:String, x:Number, y:Number, errorTipBorderStyle:String = null, context:IUIComponent = null) : IToolTip;
		/**
		 *  Destroys a specified ToolTip that was created by the <code>createToolTip()</code> method.
		 */
		public static function destroyToolTip (toolTip:IToolTip) : void;
	}
}