﻿package mx.controls
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import mx.controls.listClasses.BaseListData;
	import mx.controls.listClasses.IDropInListItemRenderer;
	import mx.controls.listClasses.IListItemRenderer;
	import mx.core.IDataRenderer;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;

	/**
	 *  Dispatched when the <code>data</code> property changes.
	 */
	[Event(name="dataChange", type="mx.events.FlexEvent")] 

	/**
	 *  The Image control lets you import JPEG, PNG, GIF, and SWF files 
	 */
	public class Image extends SWFLoader implements IDataRenderer
	{
		/**
		 *  @private
		 */
		private var makeContentVisible : Boolean;
		/**
		 *  @private
		 */
		private var sourceSet : Boolean;
		/**
		 *  @private
		 */
		private var settingBrokenImage : Boolean;
		/**
		 *  @private
		 */
		private var _data : Object;
		/**
		 *  @private
		 */
		private var _listData : BaseListData;

		/**
		 *  @private
		 */
		public function set source (value:Object) : void;
		/**
		 *  The <code>data</code> property lets you pass a value to the component
		 */
		public function get data () : Object;
		/**
		 *  @private
		 */
		public function set data (value:Object) : void;
		/**
		 *  When a component is used as a drop-in item renderer or drop-in
		 */
		public function get listData () : BaseListData;
		/**
		 *  @private
		 */
		public function set listData (value:BaseListData) : void;

		/**
		 *  Constructor.
		 */
		public function Image ();
		/**
		 *  @private
		 */
		public function invalidateSize () : void;
		/**
		 *  @private
		 */
		protected function updateDisplayList (unscaledWidth:Number, unscaledHeight:Number) : void;
		/**
		 *  @private
		 */
		function contentLoaderInfo_completeEventHandler (event:Event) : void;
	}
}