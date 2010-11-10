﻿package mx.managers
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.system.ApplicationDomain;
	import mx.core.DragSource;
	import mx.core.IFlexDisplayObject;
	import mx.core.IUIComponent;
	import mx.core.UIComponentGlobals;
	import mx.core.mx_internal;
	import mx.effects.EffectInstance;
	import mx.effects.Move;
	import mx.effects.Zoom;
	import mx.events.DragEvent;
	import mx.events.InterManagerRequest;
	import mx.events.InterDragManagerEvent;
	import mx.managers.ISystemManager;
	import mx.managers.dragClasses.DragProxy;
	import mx.managers.SystemManager;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;

	/**
	 *  @private
	 */
	public class DragManagerImpl implements IDragManager
	{
		/**
		 *  @private
		 */
		private static var sm : ISystemManager;
		/**
		 *  @private
		 */
		private static var instance : IDragManager;
		/**
		 *  @private
		 */
		private var sandboxRoot : IEventDispatcher;
		/**
		 *  @private
		 */
		private var dragInitiator : IUIComponent;
		/**
		 *  @private
		 */
		public var dragProxy : DragProxy;
		/**
		 *  @private
		 */
		private var bDoingDrag : Boolean;
		/**
		 *  @private
		 */
		private var mouseIsDown : Boolean;

		/**
		 *  Read-only property that returns <code>true</code>
		 */
		public function get isDragging () : Boolean;

		/**
		 *  @private
		 */
		public static function getInstance () : IDragManager;
		/**
		 *  @private
		 */
		public function DragManagerImpl ();
		/**
		 *  Initiates a drag and drop operation.
		 */
		public function doDrag (dragInitiator:IUIComponent, dragSource:DragSource, mouseEvent:MouseEvent, dragImage:IFlexDisplayObject = null, xOffset:Number = 0, yOffset:Number = 0, imageAlpha:Number = 0.5, allowMove:Boolean = true) : void;
		/**
		 *  Call this method from your <code>dragEnter</code> event handler if you accept
		 */
		public function acceptDragDrop (target:IUIComponent) : void;
		/**
		 *  Sets the feedback indicator for the drag and drop operation.
		 */
		public function showFeedback (feedback:String) : void;
		/**
		 *  Returns the current drag and drop feedback.
		 */
		public function getFeedback () : String;
		/**
		 *  @private
		 */
		public function endDrag () : void;
		/**
		 *  @private
		 */
		private function sm_mouseDownHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function sm_mouseUpHandler (event:MouseEvent) : void;
		/**
		 *  Marshal dispatchEvents
		 */
		private function marshalDispatchEventHandler (event:Event) : void;
		/**
		 *  Marshal dragManager
		 */
		private function marshalDragManagerHandler (event:Event) : void;
	}
}