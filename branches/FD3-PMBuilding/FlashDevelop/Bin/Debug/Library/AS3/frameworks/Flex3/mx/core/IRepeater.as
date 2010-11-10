﻿package mx.core
{
	/**
	 *  The IRepeater interface defines the APIs for Repeater
	 */
	public interface IRepeater
	{
		/**
		 *  The container that contains this Repeater,
		 */
		public function get container () : IContainer;
		/**
		 *  The number of times this Repeater should execute.
		 */
		public function get count () : int;
		/**
		 *  @private
		 */
		public function set count (value:int) : void;
		/**
		 *  The index of the item in the <code>dataProvider</code> currently
		 */
		public function get currentIndex () : int;
		/**
		 *  The item in the <code>dataProvider</code> currently being processed
		 */
		public function get currentItem () : Object;
		/**
		 *  The data provider used by this Repeater to create repeated instances
		 */
		public function get dataProvider () : Object;
		/**
		 *  @private
		 */
		public function set dataProvider (value:Object) : void;
		/**
		 *  A Boolean flag indicating whether this Repeater should re-use
		 */
		public function get recycleChildren () : Boolean;
		/**
		 *  @private
		 */
		public function set recycleChildren (value:Boolean) : void;
		/**
		 *  The index into the <code>dataProvider</code> at which this Repeater
		 */
		public function get startingIndex () : int;
		/**
		 *  @private
		 */
		public function set startingIndex (value:int) : void;

		/**
		 *  Initializes a new Repeater object.
		 */
		public function initializeRepeater (container:IContainer, recurse:Boolean) : void;
		/**
		 *  Executes the bindings into all the UIComponents created
		 */
		public function executeChildBindings () : void;
	}
}