﻿package fl.managers
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.display.SimpleButton;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.InteractiveObject;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.ui.Keyboard;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import fl.controls.Button;
	import fl.controls.TextInput;
	import fl.core.UIComponent;
	import flash.system.Capabilities;
	import flash.utils.*;

	/**
	 *  The FocusManager class manages focus for a set of components that are navigated by mouse 
	 */
	public class FocusManager implements IFocusManager
	{
		/**
		 * @private 
		 */
		private var _form : DisplayObjectContainer;
		/**
		 * @private 
		 */
		private var focusableObjects : Dictionary;
		/**
		 * @private 
		 */
		private var focusableCandidates : Array;
		/**
		 * @private 
		 */
		private var activated : Boolean;
		/**
		 * @private 
		 */
		private var calculateCandidates : Boolean;
		/**
		 * @private 
		 */
		private var lastFocus : InteractiveObject;
		/**
		 * @private 
		 */
		private var _showFocusIndicator : Boolean;
		/**
		 * @private 
		 */
		private var lastAction : String;
		/**
		 * @private 
		 */
		private var defButton : Button;
		/**
		 * @private 
		 */
		private var _defaultButton : Button;
		/**
		 * @private 
		 */
		private var _defaultButtonEnabled : Boolean;

		/**
		 * Gets or sets the current default button.
		 */
		public function get defaultButton () : Button;
		/**
		 *  @private (setter)
		 */
		public function set defaultButton (value:Button) : void;
		/**
		 *  @copy fl.managers.IFocusManager#defaultButtonEnabled
		 */
		public function get defaultButtonEnabled () : Boolean;
		/**
		 *  @private
		 */
		public function set defaultButtonEnabled (value:Boolean) : void;
		/**
		 *  Gets the next unique tab index to use in this tab loop.
		 */
		public function get nextTabIndex () : int;
		/**
		 *  Gets or sets a value that indicates whether a component that has focus should be marked with a visual indicator of focus.
		 */
		public function get showFocusIndicator () : Boolean;
		/**
		 *  @private
		 */
		public function set showFocusIndicator (value:Boolean) : void;
		/**
		 *  @private
		 */
		public function get form () : DisplayObjectContainer;
		/**
		 *  @private
		 */
		public function set form (value:DisplayObjectContainer) : void;

		/**
		 *  Creates a new FocusManager instance.
		 */
		public function FocusManager (container:DisplayObjectContainer);
		/**
		 *  @private
		 */
		private function addedHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function removedHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function addFocusables (o:DisplayObject, skipTopLevel:Boolean = false) : void;
		/**
		 *  @private
		 */
		private function removeFocusables (o:DisplayObject) : void;
		/**
		 *  @private
		 */
		private function isTabVisible (o:DisplayObject) : Boolean;
		/**
		 *  @private
		 */
		private function isValidFocusCandidate (o:DisplayObject, groupName:String) : Boolean;
		/**
		 *  @private
		 */
		private function isEnabledAndVisible (o:DisplayObject) : Boolean;
		/**
		 *  @private
		 */
		private function tabEnabledChangeHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function tabIndexChangeHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function tabChildrenChangeHandler (event:Event) : void;
		/**
		 *  Activates the FocusManager instance.
		 */
		public function activate () : void;
		/**
		 *  Deactivates the FocusManager.
		 */
		public function deactivate () : void;
		/**
		 *  @private
		 */
		private function focusInHandler (event:FocusEvent) : void;
		/**
		 *  @private
		 */
		private function focusOutHandler (event:FocusEvent) : void;
		/**
		 *  @private
		 */
		private function activateHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function deactivateHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function mouseFocusChangeHandler (event:FocusEvent) : void;
		/**
		 *  @private
		 */
		private function keyFocusChangeHandler (event:FocusEvent) : void;
		/**
		 *  @private
		 */
		private function keyDownHandler (event:KeyboardEvent) : void;
		/**
		 *  @private
		 */
		private function mouseDownHandler (event:MouseEvent) : void;
		/**
		 *  @private 
		 */
		public function sendDefaultButtonEvent () : void;
		/**
		 *  @private
		 */
		private function setFocusToNextObject (event:FocusEvent) : void;
		/**
		 *  @private
		 */
		private function hasFocusableObjects () : Boolean;
		/**
		 *  Retrieves the interactive object that would receive focus
		 */
		public function getNextFocusManagerComponent (backward:Boolean = false) : InteractiveObject;
		/**
		 *  @private
		 */
		private function getIndexOfFocusedObject (o:DisplayObject) : int;
		/**
		 *  @private
		 */
		private function getIndexOfNextObject (i:int, shiftKey:Boolean, bSearchAll:Boolean, groupName:String) : int;
		/**
		 *  @private
		 */
		private function sortFocusableObjects () : void;
		/**
		 *  @private
		 */
		private function sortFocusableObjectsTabIndex () : void;
		/**
		 *  @private
		 */
		private function sortByDepth (aa:InteractiveObject, bb:InteractiveObject) : Number;
		/**
		 *  @private
		 */
		private function getChildIndex (parent:DisplayObjectContainer, child:DisplayObject) : int;
		/**
		 *  @private
		 */
		private function sortByTabIndex (a:InteractiveObject, b:InteractiveObject) : int;
		/**
		 *  Gets the interactive object that currently has focus.
		 */
		public function getFocus () : InteractiveObject;
		/**
		 *  Sets focus on an IFocusManagerComponent component. This method does
		 */
		public function setFocus (component:InteractiveObject) : void;
		/**
		 *  Sets the <code>showFocusIndicator</code> value to <code>true</code>
		 */
		public function showFocus () : void;
		/**
		 *  Sets the <code>showFocusIndicator</code> value to <code>false</code>
		 */
		public function hideFocus () : void;
		/**
		 *  Retrieves the interactive object that contains the given object, if any.
		 */
		public function findFocusManagerComponent (component:InteractiveObject) : InteractiveObject;
		/**
		 * @private
		 */
		private function getTopLevelFocusTarget (o:InteractiveObject) : InteractiveObject;
	}
}