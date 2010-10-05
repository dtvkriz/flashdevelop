﻿package mx.events
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 *  An event that is sent between applications through the sharedEvents
	 */
	public class SWFBridgeRequest extends Event
	{
		/**
		 *  Requests that a child application's pop up be activated.  
		 */
		public static const ACTIVATE_POP_UP_REQUEST : String = "activatePopUpRequest";
		/**
		 *  Tests if a given pop up can be activated.
		 */
		public static const CAN_ACTIVATE_POP_UP_REQUEST : String = "canActivateRequestPopUpRequest";
		/**
		 *  Requests that a child application's pop up be deactivated.
		 */
		public static const DEACTIVATE_POP_UP_REQUEST : String = "deactivatePopUpRequest";
		/**
		 *  Requests that the parent SystemManager calculate the visible portion
		 */
		public static const GET_VISIBLE_RECT_REQUEST : String = "getVisibleRectRequest";
		/**
		 *  Tests if a given DisplayObject is a child of a SWF
		 */
		public static const IS_BRIDGE_CHILD_REQUEST : String = "isBridgeChildRequest";
		/**
		 *  Requests that the loader of the current application invalidate its 
		 */
		public static const INVALIDATE_REQUEST : String = "invalidateRequest";
		/**
		 *  Requests that the mouse cursor should be hidden
		 */
		public static const HIDE_MOUSE_CURSOR_REQUEST : String = "hideMouseCursorRequest";
		/**
		 *  Asks the top-level root if the mouse cursor should be hidden given its
		 */
		public static const SHOW_MOUSE_CURSOR_REQUEST : String = "showMouseCursorRequest";
		/**
		 *  Requests that the show/hide mouse cursor logic be reset for a new mouse
		 */
		public static const RESET_MOUSE_CURSOR_REQUEST : String = "resetMouseCursorRequest";
		/**
		 *  Sent from the top-level focus manager to a subordinate focus managers
		 */
		public static const ACTIVATE_FOCUS_REQUEST : String = "activateFocusRequest";
		/**
		 *  Sent from the top-level focus manager to a subordinate focus managers
		 */
		public static const DEACTIVATE_FOCUS_REQUEST : String = "deactivateFocusRequest";
		/**
		 *  Request to move control over focus to another FocusManager.and have
		 */
		public static const MOVE_FOCUS_REQUEST : String = "moveFocusRequest";
		/**
		 *  Creates a modal window.
		 */
		public static const CREATE_MODAL_WINDOW_REQUEST : String = "createModalWindowRequest";
		/**
		 *  Shows a modal window.
		 */
		public static const SHOW_MODAL_WINDOW_REQUEST : String = "showModalWindowRequest";
		/**
		 *  Hides a modal window.
		 */
		public static const HIDE_MODAL_WINDOW_REQUEST : String = "hideModalWindowRequest";
		/**
		 *  Adds a popup on the targeted application.
		 */
		public static const ADD_POP_UP_REQUEST : String = "addPopUpRequest";
		/**
		 *  Removes a popup from the sandboxRoot's SystemManager.
		 */
		public static const REMOVE_POP_UP_REQUEST : String = "removePopUpRequest";
		/**
		 *  Adds a placeholder for a pop up window hosted by a child SystemManager.
		 */
		public static const ADD_POP_UP_PLACE_HOLDER_REQUEST : String = "addPopUpPlaceHolderRequest";
		/**
		 *  Removes a placeholder.
		 */
		public static const REMOVE_POP_UP_PLACE_HOLDER_REQUEST : String = "removePopUpPlaceHolderRequest";
		/**
		 *  Gets the size of the child SystemManager.
		 */
		public static const GET_SIZE_REQUEST : String = "getSizeRequest";
		/**
		 *  Sets the size of the <code>child.systemManager</code>.
		 */
		public static const SET_ACTUAL_SIZE_REQUEST : String = "setActualSizeRequest";
		/**
		 *  Set the value of the showFocusIndicator property in every application's
		 */
		public static const SET_SHOW_FOCUS_INDICATOR_REQUEST : String = "setShowFocusIndicatorRequest";
		/**
		 *  Data related to the event. For information on how this object is used, see each event type.
		 */
		public var data : Object;
		/**
		 *  The bridge that sent the message.
		 */
		public var requestor : IEventDispatcher;

		/**
		 *  Marshals a SWFBridgeRequest from a remote ApplicationDomain into the current
		 */
		public static function marshal (event:Event) : SWFBridgeRequest;
		/**
		 *  Constructor.
		 */
		public function SWFBridgeRequest (type:String, bubbles:Boolean = false, cancelable:Boolean = false, requestor:IEventDispatcher = null, data:Object = null);
		/**
		 *  @private
		 */
		public function clone () : Event;
	}
}