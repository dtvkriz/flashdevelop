﻿package mx.managers
{
	import flash.display.DisplayObject;
	import flash.events.IEventDispatcher;
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	import mx.core.IButton;
	import mx.core.IUIComponent;

	/**
	 *  The IFocusManager interface defines the interface that components must implement  *  to manage the focus on components in response to mouse activity or  *  keyboard activity (Tab key), and to support a default button. * *  @see mx.managers.FocusManager
	 */
	public interface IFocusManager
	{
		/**
		 *  A reference to the original default Button control.     *  Pressing the Enter key while the focus is on any control      *  activates the Button control by dispatching a <code>click</code> event      *  on the Button control, just as if it was clicked with the mouse.     *  The actual default Button control changes if focus is given to another     *  Button control, but switches back to the original if focus is not     *  on a button.     *     *  <p>This property is managed by Flex containers; do not set it directly     *  to specify the default button.</p>     *      *  <p>The <code>defaultButton</code> must be of class     *  <code>mx.controls.Button</code> even though this property     *  is of type <code>IUIComponent</code>.</p>
		 */
		public function get defaultButton () : IButton;
		/**
		 *  @private
		 */
		public function set defaultButton (value:IButton) : void;
		/**
		 *  A flag that indicates whether the FocusManager should     *  check for the Enter key being pressed to activate the default button.     *  TextArea and other components that want to recognize      *  the <code>Enter</code> key     *  set this property to <code>false</code> to disable the Enter     *  key from dispatching a <code>click</code> event on the     *  default button, if it exists.
		 */
		public function get defaultButtonEnabled () : Boolean;
		/**
		 *  @private
		 */
		public function set defaultButtonEnabled (value:Boolean) : void;
		/**
		 *  A single Sprite that is moved from container to container     *  as the focus moves to those containers.     *  The Sprite is used as the parent of the visual indicator     *  that a component has focus.
		 */
		public function get focusPane () : Sprite;
		/**
		 *  @private
		 */
		public function set focusPane (value:Sprite) : void;
		/**
		 *  The next unique tab index to use in this tab loop.
		 */
		public function get nextTabIndex () : int;
		/**
		 *  A flag that indicates whether to display an indicator that     *  a component has focus.     *  If <code>true</code> a component receiving focus     *  draws a visible indicator that it has focus.     *     *  <p>By default, this is <code>false</code> until the user uses     *  the Tab key, then it is set to <code>true</code>.</p>     *     *  <p>In general it is better to use      *  the <code>showFocus()</code> and <code>hideFocus()</code> methods     *  to change this property as those methods also update the     *  visual indicator that a component has focus.</p>
		 */
		public function get showFocusIndicator () : Boolean;
		/**
		 *  @private
		 */
		public function set showFocusIndicator (value:Boolean) : void;

		/**
		 *  Gets the IFocusManagerComponent component that currently has the focus.     *  Calling this method is recommended instead of using the Stage object      *  because it indicates which component has focus.     *  The Stage might return a subcomponent in that component.     *     *  @return IFocusManagerComponent object that has focus.
		 */
		public function getFocus () : IFocusManagerComponent;
		/**
		 *  Sets focus to an IFocusManagerComponent component.  Does not check for     *  the components visibility, enabled state, or any other conditions.     *     *  @param o A component that can receive focus.
		 */
		public function setFocus (o:IFocusManagerComponent) : void;
		/**
		 *  Sets <code>showFocusIndicator</code> to <code>true</code>     *  and draws the visual focus indicator on the focused object, if any.
		 */
		public function showFocus () : void;
		/**
		 *  Sets <code>showFocusIndicator</code> to <code>false</code>     *  and removes the visual focus indicator from the focused object, if any.
		 */
		public function hideFocus () : void;
		/**
		 *  The SystemManager activates and deactivates a FocusManager     *  if more than one IFocusManagerContainer is visible at the same time.     *  If the mouse is clicked in an IFocusManagerContainer with a deactivated     *  FocusManager, the SystemManager will call      *  the <code>activate()</code> method on that FocusManager.     *  The FocusManager that was activated will have its <code>deactivate()</code> method     *  called prior to the activation of another FocusManager.
		 */
		public function activate () : void;
		/**
		 *  The SystemManager activates and deactivates a FocusManager     *  if more than one IFocusManagerContainer is visible at the same time.     *  If the mouse is clicked in an IFocusManagerContainer with a deactivated     *  FocusManager, the SystemManager will call      *  the <code>activate()</code> method on that FocusManager.     *  The FocusManager that was activated will have its <code>deactivate()</code> method     *  called prior to the activation of another FocusManager.
		 */
		public function deactivate () : void;
		/**
		 *  Returns the IFocusManagerComponent that contains the given object, if any.     *  Because the player can set focus to a subcomponent of a Flex component     *  this method determines which IFocusManagerComponent has focus from     *  the component perspective.     *     *  @param o An object that can have player-level focus.     *     *  @return The IFOcusManagerComponent containing <code>o</code> or      *  <code>null</code>
		 */
		public function findFocusManagerComponent (o:InteractiveObject) : IFocusManagerComponent;
		/**
		 *  Returns the IFocusManagerComponent that would receive focus     *  if the user pressed the Tab key to navigate to another component.     *  It will return the same component as the current focused component     *  if there are no other valid components in the application.     *     *  @param backward If <code>true</code>, return the object      *  as if the Shift-Tab keys were pressed.     *     *  @return The component that would receive focus.
		 */
		public function getNextFocusManagerComponent (backward:Boolean = false) : IFocusManagerComponent;
		/**
		 *  Move focus from the current control     *  to the previous or next control in the tab order.     *  The direction of the move is specified     *  with the <code>direction</code> argument.     *      *  @param direction <code>FocusRequestDirection.FORWARD</code> moves to     *  from the control that currently has focus to controls with a higher tab index.     *  If more than one control has the same index, the next control     *  in the flow of the document is visited.     *  <code>FocusRequestDirection.BACKWARD</code> moves to controls with      *  a lower tab index.     *  <code>FocusRequestDirection.TOP</code> move the focus to the control      *  with the lowest tab index. If more than one control has the same index,     *  focus is moved to the first control in the flow of the document.      *  <code>FocusRequestDirection.BOTTOM</code> move the focus to the control      *  with the highest tab index. If more than one control has the same index,     *  focus is moved to the last control in the flow of the document.      *     *  @param fromDisplayObject The starting point from which focus is moved.      *  If an object is provided, this overrides the default behavior      *  where focus is moved from the object that currently has focus.
		 */
		public function moveFocus (direction:String, fromDisplayObject:DisplayObject = null) : void;
		/**
		 *  Adds a SWF bridge to this focus manager.     *      *  Adding the SWF bridge is required to get focus     *  to transfer seamlessly between focus managers in other sandboxes     *  or using different versions of a focus manager.     *      *  @param bridge The bridge to another focus manager.     *  @param owner The display object that owns the bridge.
		 */
		public function addSWFBridge (bridge:IEventDispatcher, owner:DisplayObject) : void;
		/**
		 *  Removes a focus manager.     *  This must be called when a bridge added by calling     *  <code>addSWFBridge</code> is removed.     *      *  @param bridge The bridge to remove.
		 */
		public function removeSWFBridge (bridge:IEventDispatcher) : void;
	}
}
