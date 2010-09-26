﻿package mx.controls
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.media.Camera;
	import mx.controls.videoClasses.VideoPlayer;
	import mx.core.EdgeMetrics;
	import mx.core.IFlexDisplayObject;
	import mx.core.IRectangularBorder;
	import mx.core.IUIComponent;
	import mx.core.UIComponent;
	import mx.core.mx_internal;
	import mx.events.CuePointEvent;
	import mx.events.FlexEvent;
	import mx.events.MetadataEvent;
	import mx.events.VideoEvent;
	import mx.styles.ISimpleStyleClient;
	import mx.utils.LoaderUtil;

	/**
	 *  Dispatched when the NetConnection object is closed, whether by timing
	 */
	[Event(name="close", type="mx.events.VideoEvent")] 
	/**
	 *  Dispatched when the playhead reaches the end of the FLV file.
	 */
	[Event(name="complete", type="mx.events.VideoEvent")] 
	/**
	 *  Dispatched when the value of a cue point's <code>time</code> property
	 */
	[Event(name="cuePoint", type="mx.events.CuePointEvent")] 
	/**
	 *  Dispatched the first time metadata in the FLV file is reached.
	 */
	[Event(name="metadataReceived", type="mx.events.MetadataEvent")] 
	/**
	 *  Dispatched continuosly while the video is playing.
	 */
	[Event(name="playheadUpdate", type="mx.events.VideoEvent")] 
	/**
	 *  Dispatched continuously until the FLV file has downloaded completely.
	 */
	[Event(name="progress", type="flash.events.ProgressEvent")] 
	/**
	 *  Dispatched when the FLV file is loaded and ready to play.
	 */
	[Event(name="ready", type="mx.events.VideoEvent")] 
	/**
	 *  Dispatched when the control autorewinds.
	 */
	[Event(name="rewind", type="mx.events.VideoEvent")] 
	/**
	 *  Dispatched when the state of the control changes.
	 */
	[Event(name="stateChange", type="mx.events.VideoEvent")] 

	/**
	 *  The VideoDisplay control lets you play an FLV file in a Flex application. 
	 */
	public class VideoDisplay extends UIComponent
	{
		/**
		 *  @private
		 */
		local var videoPlayer : VideoPlayer;
		/**
		 *  @private
		 */
		private var _cuePointManager : Object;
		/**
		 *  @private
		 */
		private var sourceChanged : Boolean;
		/**
		 *  @private
		 */
		private var closeCalled : Boolean;
		/**
		 *  @private
		 */
		private var makeVideoVisibleOnLayout : Boolean;
		/**
		 *  @private
		 */
		private static const DEFAULT_WIDTH : Number = 10;
		/**
		 *  @private
		 */
		private static const DEFAULT_HEIGHT : Number = 10;
		/**
		 *  The border object for the control.
		 */
		protected var border : IFlexDisplayObject;
		/**
		 *  @private
		 */
		private var asCuePointIndexResetPending : Boolean;
		/**
		 *  @private
		 */
		private var creationCompleted : Boolean;
		private var _autoBandWidthDetection : Boolean;
		/**
		 *  @private
		 */
		private var _autoRewind : Boolean;
		/**
		 *  @private
		 */
		private var _bufferTime : Number;
		/**
		 *  @private
		 */
		private var _autoPlay : Boolean;
		/**
		 *  @private
		 */
		private var _cuePointManagerClass : Class;
		/**
		 *  @private
		 */
		private var _cuePoints : Array;
		/**
		 *  @private
		 */
		private var _idleTimeout : int;
		/**
		 *  @private
		 */
		private var _live : Boolean;
		/**
		 *  @private
		 */
		private var _maintainAspectRatio : Boolean;
		/**
		 *  @private
		 */
		private var _ncManagerClass : Class;
		/**
		 *  @private
		 */
		private var _playheadTime : Number;
		/**
		 *  @private
		 */
		private var _playheadUpdateInterval : int;
		/**
		 *  @private
		 */
		private var _progressInterval : int;
		/**
		 *  @private
		 */
		private var _totalTime : Number;
		/**
		 *  @private
		 */
		private var _source : String;
		/**
		 *  @private
		 */
		private var _volume : Number;

		/**
		 *  Specifies whether the VideoDisplay control should use the built-in
		 */
		public function get autoBandWidthDetection () : Boolean;
		/**
		 *  @private
		 */
		public function set autoBandWidthDetection (value:Boolean) : void;
		/**
		 *  Specifies whether the FLV file should be rewound to the first frame
		 */
		public function get autoRewind () : Boolean;
		/**
		 *  @private
		 */
		public function set autoRewind (value:Boolean) : void;
		/**
		 *  Returns an EdgeMetrics object that has four properties:
		 */
		public function get borderMetrics () : EdgeMetrics;
		/**
		 *  Number of seconds of video to buffer in memory before starting to play
		 */
		public function get bufferTime () : Number;
		/**
		 *  @private
		 */
		public function set bufferTime (value:Number) : void;
		/**
		 *  Specifies whether the video should start playing immediately when the
		 */
		public function get autoPlay () : Boolean;
		/**
		 *  @private
		 */
		public function set autoPlay (value:Boolean) : void;
		/**
		 *  Number of bytes already loaded that are available for playing.
		 */
		public function get bytesLoaded () : int;
		/**
		 *  Total number of bytes to load.
		 */
		public function get bytesTotal () : int;
		/**
		 *  The instance of the CuePointManager class associated with 
		 */
		public function get cuePointManager () : Object;
		/**
		 *  Cue point manager to use.
		 */
		public function get cuePointManagerClass () : Class;
		/**
		 *  @private
		 */
		public function set cuePointManagerClass (value:Class) : void;
		/**
		 *  The Array of cue points associated with the control.
		 */
		public function get cuePoints () : Array;
		/**
		 *  @private
		 */
		public function set cuePoints (value:Array) : void;
		/**
		 *  Specifies the amount of time, in milliseconds, that the connection is
		 */
		public function get idleTimeout () : int;
		/**
		 *  @private
		 */
		public function set idleTimeout (value:int) : void;
		/**
		 *  Specifies whether the control is streaming a live feed.
		 */
		public function get live () : Boolean;
		/**
		 *  @private
		 */
		public function set live (value:Boolean) : void;
		/**
		 *  Specifies whether the control should maintain the original aspect ratio
		 */
		public function get maintainAspectRatio () : Boolean;
		/**
		 *  @private
		 */
		public function set maintainAspectRatio (value:Boolean) : void;
		/**
		 * An object that contains a metadata information packet that is received from a call to 
		 */
		public function get metadata () : Object;
		/**
		 *  @private    
		 */
		private function get ncManagerClass () : Class;
		/**
		 *  @private
		 */
		private function set ncManagerClass (value:Class) : void;
		/**
		 *  Playhead position, measured in seconds, since the video starting
		 */
		public function get playheadTime () : Number;
		/**
		 *  @private
		 */
		public function set playheadTime (value:Number) : void;
		/**
		 *  Specifies the amount of time, in milliseconds,
		 */
		public function get playheadUpdateInterval () : int;
		/**
		 *  @private
		 */
		public function set playheadUpdateInterval (value:int) : void;
		/**
		 *  If <code>true</code>, the media is currently playing.
		 */
		public function get playing () : Boolean;
		/**
		 *  Specifies the amount of time, in milliseconds,
		 */
		public function get progressInterval () : int;
		/**
		 *  @private
		 */
		public function set progressInterval (value:int) : void;
		/**
		 *  The current state of the VideoDisplay control. 
		 */
		public function get state () : String;
		/**
		 *  Specifies whether the VideoDisplay control is in a responsive state, 
		 */
		public function get stateResponsive () : Boolean;
		/**
		 *  Total length of the media, in seconds.
		 */
		public function get totalTime () : Number;
		/**
		 *  @private
		 */
		public function set totalTime (value:Number) : void;
		/**
		 *  Relative path and filename of the FLV file to stream.
		 */
		public function get source () : String;
		/**
		 *  @private
		 */
		public function set source (value:String) : void;
		/**
		 *  Height of the loaded FLV file.
		 */
		public function get videoHeight () : int;
		/**
		 *  Width of the loaded FLV file.
		 */
		public function get videoWidth () : int;
		/**
		 *  The volume level, specified as an value between 0 and 1.
		 */
		public function get volume () : Number;
		/**
		 *  @private
		 */
		public function set volume (value:Number) : void;

		/**
		 *  Constructor.
		 */
		public function VideoDisplay ();
		/**
		 *  @private
		 */
		protected function createChildren () : void;
		/**
		 *  @private
		 */
		protected function measure () : void;
		/**
		 *  @private
		 */
		protected function updateDisplayList (unscaledWidth:Number, unscaledHeight:Number) : void;
		/**
		 *  Specifies whether to play a video stream from a camera. 
		 */
		public function attachCamera (camera:Camera) : void;
		/**
		 *  Forces the close of an input stream and connection to Flash Media
		 */
		public function close () : void;
		/**
		 *  Loads the media file without playing it.
		 */
		public function load () : void;
		/**
		 *  Pauses playback without moving the playhead. 
		 */
		public function pause () : void;
		/**
		 *  Plays the media file.
		 */
		public function play () : void;
		/**
		 *  Stops playback.
		 */
		public function stop () : void;
		/**
		 *  Responds to size changes by setting the positions and sizes of
		 */
		protected function layoutChrome (unscaledWidth:Number, unscaledHeight:Number) : void;
		/**
		 *  Creates the border for this component.
		 */
		protected function createBorder () : void;
		private function getActualURL (url:String) : String;
		/**
		 *  Returns TRUE if a border is needed for this component based
		 */
		private function isBorderNeeded () : Boolean;
		/**
		 *  @private
		 */
		private function createVideoPlayer () : void;
		/**
		 *  @private
		 */
		private function autoPlaying () : void;
		/**
		 *  @private
		 */
		private function resizeVideo () : void;
		/**
		 *  @private
		 */
		private function setCuePoints (cuePoints:Array) : void;
		/**
		 *  @private
		 */
		private function creationCompleteHandler (event:FlexEvent) : void;
		/**
		 *  @private
		 */
		private function videoPlayer_playheadUpdateHandler (event:VideoEvent) : void;
		/**
		 *  @private
		 */
		private function videoPlayer_completeHandler (event:VideoEvent) : void;
		/**
		 *  @private
		 */
		private function videoPlayer_cuePointHandler (event:MetadataEvent) : void;
		/**
		 *  @private
		 */
		private function videoPlayer_metadataHandler (event:MetadataEvent) : void;
		/**
		 *  @private
		 */
		private function videoPlayer_progressHandler (event:ProgressEvent) : void;
		/**
		 *  @private
		 */
		private function videoPlayer_readyHandler (event:VideoEvent) : void;
		/**
		 *  @private
		 */
		private function videoPlayer_rewindHandler (event:VideoEvent) : void;
		/**
		 *  @private
		 */
		private function videoPlayer_stateChangeHandler (event:VideoEvent) : void;
	}
}