﻿package mx.effects.effectClasses
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import mx.core.mx_internal;

	/**
	 *  The AddChildActionInstance class implements the instance class
	 */
	public class AddChildActionInstance extends ActionEffectInstance
	{
		/**
		 *  The index of the child within the parent.
		 */
		public var index : int;
		/**
		 *  The location where the child component is added.
		 */
		public var relativeTo : DisplayObjectContainer;
		/**
		 *  The position of the child component, relative to relativeTo, where it is added.
		 */
		public var position : String;

		/**
		 *  Constructor.
		 */
		public function AddChildActionInstance (target:Object);
		/**
		 *  @private
		 */
		public function play () : void;
	}
}