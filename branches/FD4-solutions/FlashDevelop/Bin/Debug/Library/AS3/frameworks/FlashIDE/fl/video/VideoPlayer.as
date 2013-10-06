﻿package fl.video
{
	import flash.events.*;
	import flash.geom.Rectangle;
	import flash.media.*;
	import flash.net.*;
	import flash.utils.*;

	/**
	 * Dispatched by the VideoPlayer instance when it closes the NetConnection  
	 */
	[Event("close", type="fl.video.VideoEvent")] 
	/**
	 * Dispatched when playing completes because the player reached the end of the FLV file. 
	 */
	[Event("complete", type="fl.video.VideoEvent")] 
	/**
	 * Dispatched when a cue point is reached. The event object has an 
	 */
	[Event("cuePoint", type="fl.video.MetadataEvent")] 
	/**
	 * Dispatched the first time the FLV file's metadata is reached.
	 */
	[Event("metadataReceived", type="fl.video.MetadataEvent")] 
	/**
	 * Dispatched while the FLV file is playing at the frequency specified by the 
	 */
	[Event("playheadUpdate", type="fl.video.VideoEvent")] 
	/**
	 * Indicates progress made in number of bytes downloaded. Dispatched at the frequency 
	 */
	[Event("progress", type="fl.video.VideoProgressEvent")] 
	/**
	 * Event dispatched when an FLV file is loaded and ready to display. It starts the first 
	 */
	[Event("ready", type="fl.video.VideoEvent")] 
	/**
	 * Dispatched when the video player is resized or laid out. Here are two layout scenarios:<br/>
	 */
	[Event("layout", type="fl.video.LayoutEvent")] 
	/**
	 * Dispatched when the playhead is moved to the start of the video player because the 
	 */
	[Event("autoRewound", type="fl.video.VideoEvent")] 
	/**
	 * Dispatched when the playback state changes. When an <code>autoRewind</code> call is 
	 */
	[Event("stateChange", type="fl.video.VideoEvent")] 

	/**
	 * The VideoPlayer class lets you create a video player with a slightly smaller SWF file
	 */
	public class VideoPlayer extends Video
	{
		/**
		 * @private
		 */
		static var BUFFER_EMPTY : String;
		/**
		 * @private
		 */
		static var BUFFER_FULL : String;
		/**
		 * @private
		 */
		static var BUFFER_FLUSH : String;
		/**
		 * @private
		 */
		protected var _state : String;
		/**
		 * @private
		 */
		local var _cachedState : String;
		/**
		 * @private
		 */
		local var _bufferState : String;
		/**
		 * @private
		 */
		local var _sawPlayStop : Boolean;
		/**
		 * @private
		 */
		local var _cachedPlayheadTime : Number;
		/**
		 * @private
		 */
		protected var _metadata : Object;
		/**
		 * @private
		 */
		protected var _registrationX : Number;
		/**
		 * @private
		 */
		protected var _registrationY : Number;
		/**
		 * @private
		 */
		protected var _registrationWidth : Number;
		/**
		 * @private
		 */
		protected var _registrationHeight : Number;
		/**
		 * @private
		 */
		local var _startingPlay : Boolean;
		/**
		 * @private
		 */
		local var _lastSeekTime : Number;
		/**
		 * @private
		 */
		local var _invalidSeekTime : Boolean;
		/**
		 * @private
		 */
		local var _invalidSeekRecovery : Boolean;
		/**
		 * @private
		 */
		local var _readyDispatched : Boolean;
		/**
		 * @private
		 */
		local var _autoResizeDone : Boolean;
		/**
		 * @private
		 */
		local var _lastUpdateTime : Number;
		/**
		 * @private
		 */
		local var lastUpdateTimeStuckCount : Number;
		/**
		 * @private
		 */
		local var _sawSeekNotify : Boolean;
		/**
		 * @private
		 */
		protected var _ncMgr : INCManager;
		/**
		 * To make all VideoPlayer objects use your 
		 */
		public static var iNCManagerClass : Object;
		/**
		 * Registers a custom class for the NetStream's client property. 
		 */
		public static var netStreamClientClass : Object;
		/**
		 * @private
		 */
		protected var _ns : NetStream;
		/**
		 * @private
		 */
		local var _currentPos : Number;
		/**
		 * @private
		 */
		local var _atEnd : Boolean;
		/**
		 * @private
		 */
		local var _atEndCheckPlayhead : Number;
		/**
		 * @private
		 */
		protected var _streamLength : Number;
		/**
		 * @private
		 */
		protected var _align : String;
		/**
		 * @private
		 */
		protected var _scaleMode : String;
		/**
		 * @private 
		 */
		protected var _autoPlay : Boolean;
		/**
		 * @private
		 */
		protected var _autoRewind : Boolean;
		/**
		 * @private
		 */
		protected var _contentPath : String;
		/**
		 * @private
		 */
		protected var _bufferTime : Number;
		/**
		 * @private
		 */
		protected var _isLive : Boolean;
		/**
		 * @private
		 */
		protected var _volume : Number;
		/**
		 * @private
		 */
		protected var _soundTransform : SoundTransform;
		/**
		 * @private
		 */
		protected var __visible : Boolean;
		/**
		 * @private
		 */
		local var _hiddenForResize : Boolean;
		/**
		 * @private
		 */
		local var _hiddenForResizeMetadataDelay : Number;
		/**
		 * @private
		 */
		local var _resizeImmediatelyOnMetadata : Boolean;
		/**
		 * @private
		 */
		local var _hiddenRewindPlayheadTime : Number;
		/**
		 * @private
		 */
		protected var _videoWidth : int;
		/**
		 * @private
		 */
		protected var _videoHeight : int;
		/**
		 * @private
		 */
		local var _prevVideoWidth : int;
		/**
		 * @private
		 */
		local var _prevVideoHeight : int;
		/**
		 * @private
		 */
		local var oldBounds : Rectangle;
		/**
		 * @private
		 */
		local var oldRegistrationBounds : Rectangle;
		/**
		 * @private
		 */
		local var _updateTimeTimer : Timer;
		/**
		 * @private
		 */
		local var _updateProgressTimer : Timer;
		/**
		 * @private
		 */
		local var _idleTimeoutTimer : Timer;
		/**
		 * @private
		 */
		local var _autoResizeTimer : Timer;
		/**
		 * @private
		 */
		local var _rtmpDoStopAtEndTimer : Timer;
		/**
		 * @private
		 */
		local var _rtmpDoSeekTimer : Timer;
		/**
		 * @private
		 */
		local var _httpDoSeekTimer : Timer;
		/**
		 * @private
		 */
		local var _httpDoSeekCount : Number;
		/**
		 * @private
		 */
		local var _finishAutoResizeTimer : Timer;
		/**
		 * @private
		 */
		local var _delayedBufferingTimer : Timer;
		/**
		 * for progressive download auto start bandwidth detection
		 */
		local var waitingForEnough : Boolean;
		/**
		 * for progressive download auto start bandwidth detection
		 */
		local var baselineProgressTime : Number;
		/**
		 * for progressive download auto start bandwidth detection
		 */
		local var startProgressTime : Number;
		/**
		 * for progressive download auto start bandwidth detection
		 */
		local var totalDownloadTime : Number;
		/**
		 * for progressive download auto start bandwidth detection
		 */
		local var totalProgressTime : Number;
		/**
		 * @private
		 */
		public static const DEFAULT_UPDATE_TIME_INTERVAL : Number = 250;
		/**
		 * @private
		 */
		public static const DEFAULT_UPDATE_PROGRESS_INTERVAL : Number = 250;
		/**
		 * @private
		 */
		public static const DEFAULT_IDLE_TIMEOUT_INTERVAL : Number = 300000;
		/**
		 * @private
		 */
		static const AUTO_RESIZE_INTERVAL : Number = 100;
		/**
		 * @private
		 */
		static const DEFAULT_AUTO_RESIZE_PLAYHEAD_TIMEOUT : Number = .5;
		/**
		 * @private
		 */
		local var autoResizePlayheadTimeout : Number;
		/**
		 * @private
		 */
		static const DEFAULT_AUTO_RESIZE_METADATA_DELAY_MAX : Number = 5;
		/**
		 * @private
		 */
		local var autoResizeMetadataDelayMax : Number;
		/**
		 * @private
		 */
		static const FINISH_AUTO_RESIZE_INTERVAL : Number = 250;
		/**
		 * @private
		 */
		static const RTMP_DO_STOP_AT_END_INTERVAL : Number = 500;
		/**
		 * @private
		 */
		static const RTMP_DO_SEEK_INTERVAL : Number = 100;
		/**
		 * @private
		 */
		static const HTTP_DO_SEEK_INTERVAL : Number = 250;
		/**
		 * @private
		 */
		static const DEFAULT_HTTP_DO_SEEK_MAX_COUNT : Number = 4;
		/**
		 * @private
		 */
		local var httpDoSeekMaxCount : Number;
		/**
		 * @private
		 */
		static const HTTP_DELAYED_BUFFERING_INTERVAL : Number = 100;
		/**
		 * @private
		 */
		static const DEFAULT_LAST_UPDATE_TIME_STUCK_COUNT_MAX : int = 10;
		/**
		 * @private
		 */
		local var lastUpdateTimeStuckCountMax : int;
		/**
		 * @private
		 */
		local var _cmdQueue : Array;

		/**
		 * A number that is the horizontal scale. 
		 */
		public function set scaleX (xs:Number) : void;
		/**
		 * A number that is the vertical scale. 
		 */
		public function set scaleY (ys:Number) : void;
		/**
		 * A number that specifies the horizontal position (in pixels) of the video player.
		 */
		public function set x (x:Number) : void;
		/**
		 * A number that specifies the vertical position (in pixels) of the video player.
		 */
		public function set y (y:Number) : void;
		/**
		 * A number that specifies the width of the VideoPlayer instance on the Stage.
		 */
		public function set width (w:Number) : void;
		/**
		 * A number that specifies the height of the VideoPlayer instance (in pixels). 
		 */
		public function set height (h:Number) : void;
		/**
		 * The x coordinate used to align the video content when 
		 */
		public function get registrationX () : Number;
		/**
		 * @private (setter)
		 */
		public function set registrationX (x:Number) : void;
		/**
		 * The y coordinate used to align the video content when 
		 */
		public function get registrationY () : Number;
		/**
		 * @private (setter)
		 */
		public function set registrationY (y:Number) : void;
		/**
		 * The width used to align the video content when autoresizing.
		 */
		public function get registrationWidth () : Number;
		/**
		 * @private (setter)
		 */
		public function set registrationWidth (w:Number) : void;
		/**
		 * The height used to align the video content when autoresizing.
		 */
		public function get registrationHeight () : Number;
		/**
		 * @private (setter)
		 */
		public function set registrationHeight (h:Number) : void;
		/**
		 * The source width of the loaded FLV file. This property returns
		 */
		public function get videoWidth () : int;
		/**
		 * The source width of the loaded FLV file. This property returns
		 */
		public function get videoHeight () : int;
		/**
		 * A Boolean value that, if <code>true</code>, makes the VideoPlayer instance visible. 
		 */
		public function get visible () : Boolean;
		/**
		 * @private (setter)
		 */
		public function set visible (v:Boolean) : void;
		/**
		 * Specifies how the video is displayed relative to the
		 */
		public function get align () : String;
		/**
		 * @private (setter)
		 */
		public function set align (s:String) : void;
		/**
		 * Specifies how the video resizes after loading.  If set to
		 */
		public function get scaleMode () : String;
		/**
		 * @private (setter)
		 */
		public function set scaleMode (s:String) : void;
		/**
		 * A Boolean value that, if <code>true</code>, causes the FLV file to rewind to 
		 */
		public function get autoRewind () : Boolean;
		/**
		 * @private (setter)
		 */
		public function set autoRewind (flag:Boolean) : void;
		/**
		 * A number that is the current playhead time or position, measured in seconds, 
		 */
		public function get playheadTime () : Number;
		/**
		 * @private (setter)
		 */
		public function set playheadTime (position:Number) : void;
		/**
		 * A string that specifies the URL of the FLV file to stream and how to stream it.
		 */
		public function get source () : String;
		/**
		 * A number in the range of 0 to 1 that indicates the volume control setting. 
		 */
		public function get volume () : Number;
		/**
		 * @private (setter)
		 */
		public function set volume (aVol:Number) : void;
		/**
		 * Provides direct access to the
		 */
		public function get soundTransform () : SoundTransform;
		/**
		 * @private (setter)
		 */
		public function set soundTransform (st:SoundTransform) : void;
		/**
		 * A Boolean value that is <code>true</code> if the FLV file is streaming from Flash Media Server (FMS) using RTMP. 
		 */
		public function get isRTMP () : Boolean;
		/**
		 * A Boolean value that is <code>true</code> if the video stream is live. This property 
		 */
		public function get isLive () : Boolean;
		/**
		 * A string that specifies the state of the component. This property is set by the 
		 */
		public function get state () : String;
		/**
		 * A Boolean value that is <code>true</code> if the state is responsive. If the state is 
		 */
		public function get stateResponsive () : Boolean;
		/**
		 * A number that indicates the extent of downloading, in number of bytes, for an 
		 */
		public function get bytesLoaded () : uint;
		/**
		 * A number that specifies the total number of bytes downloaded for an HTTP download.  
		 */
		public function get bytesTotal () : uint;
		/**
		 * A number that is the total playing time for the video in seconds.
		 */
		public function get totalTime () : Number;
		/**
		 * A number that specifies the number of seconds to buffer in memory before 
		 */
		public function get bufferTime () : Number;
		/**
		 * @private (setter)
		 */
		public function set bufferTime (aTime:Number) : void;
		/**
		 * The amount of time, in milliseconds, before Flash terminates an idle connection 
		 */
		public function get idleTimeout () : Number;
		/**
		 * @private (setter)
		 */
		public function set idleTimeout (aTime:Number) : void;
		/**
		 * A number that is the amount of time, in milliseconds, between each 
		 */
		public function get playheadUpdateInterval () : Number;
		/**
		 * @private (setter)
		 */
		public function set playheadUpdateInterval (aTime:Number) : void;
		/**
		 * A number that is the amount of time, in milliseconds, between each 
		 */
		public function get progressInterval () : Number;
		/**
		 * @private (setter)
		 */
		public function set progressInterval (aTime:Number) : void;
		/**
		 * An INCManager object that provides access to an instance of the class implementing 
		 */
		public function get ncMgr () : INCManager;
		/**
		 * Allows direct access to the NetConnection instance created by the video player.  
		 */
		public function get netConnection () : NetConnection;
		/**
		 * Allows direct access to the NetStream instance created by the video player.
		 */
		public function get netStream () : NetStream;
		/**
		 * * An object that is a metadata information packet that is received from a call to 
		 */
		public function get metadata () : Object;

		/**
		 * Creates a VideoPlayer object with a specified width and height.
		 */
		public function VideoPlayer (width:int = 320, height:int = 240);
		/**
		 * Sets the <code>width</code> and <code>height</code> properties simultaneously.  
		 */
		public function setSize (width:Number, height:Number) : void;
		/**
		 * Sets the <code>scaleX</code> and <code>scaleY</code> properties simultaneously.  
		 */
		public function setScale (scaleX:Number, scaleY:Number) : void;
		/**
		 * Causes the video to play. Can be called while the video is
		 */
		public function play (url:String = null, totalTime:Number = NaN, isLive:Boolean = false) : void;
		/**
		 * Plays the FLV file when enough of it has downloaded. If the FLV file has downloaded 
		 */
		public function playWhenEnoughDownloaded () : void;
		/**
		 * Similar to the <code>play()</code> method, but causes the FLV file 
		 */
		public function load (url:String, totalTime:Number = NaN, isLive:Boolean = false) : void;
		/**
		 * Does loading work for play and load.
		 */
		function _load (url:String, totalTime:Number, isLive:Boolean) : void;
		/**
		 * Pauses video playback.  If video is paused or stopped, has
		 */
		public function pause () : void;
		/**
		 * Stops video playback.  If <code>autoRewind</code> is set to
		 */
		public function stop () : void;
		/**
		 * Seeks to a given time in the file, specified in seconds, with a precision of three
		 */
		public function seek (time:Number) : void;
		/**
		 * Forces the video stream and Flash Media Server connection to close. This
		 */
		public function close () : void;
		/**
		 * Called on interval determined by
		 */
		function doUpdateTime (e:TimerEvent = null) : void;
		/**
		 * Called at interval determined by
		 */
		function doUpdateProgress (e:TimerEvent) : void;
		/**
		 * @private
		 */
		function checkEnoughDownloaded (curBytesLoaded:uint, curBytesTotal:uint) : void;
		/**
		 * @private
		 */
		function checkReadyForPlay (curBytesLoaded:uint, curBytesTotal:uint) : void;
		/**
		 * <code>NetStatusEvent.NET_STATUS</code> event listener
		 */
		function rtmpNetStatus (e:NetStatusEvent) : void;
		/**
		 * <code>NetStatusEvent.NET_STATUS</code> event listener
		 */
		function httpNetStatus (e:NetStatusEvent) : void;
		/**
		 * Called by INCManager after the connection is complete or failed after a call to the
		 */
		public function ncConnected () : void;
		/**
		 * Called by INCManager after the reconnection is complete or has failed after a call to
		 */
		public function ncReconnected () : void;
		/**
		 * handles NetStream.onMetaData callback
		 */
		function onMetaData (info:Object) : void;
		/**
		 * handles NetStream.onCuePoint callback
		 */
		function onCuePoint (info:Object) : void;
		/**
		 * sets state, dispatches event, execs queued commands.  Always try to call
		 */
		function setState (s:String, execQueued:Boolean = true) : void;
		/**
		 * Sets state to _cachedState if the _cachedState is VideoState.PLAYING,
		 */
		function setStateFromCachedState (execQueued:Boolean = true) : void;
		/**
		 * creates our implementatino of the <code>INCManager</code>.
		 */
		function createINCManager () : void;
		/**
		 * creates an instance of the class specified by the
		 */
		function createNetStreamClient () : Object;
		/**
		 * <p>ONLY CALL THIS WITH RTMP STREAMING</p>
		 */
		function rtmpDoStopAtEnd (e:TimerEvent = null) : void;
		/**
		 * <p>ONLY CALL THIS WITH RTMP STREAMING</p>
		 */
		function rtmpDoSeek (e:TimerEvent) : void;
		/**
		 * <p>ONLY CALL THIS WITH HTTP PROGRESSIVE DOWNLOAD</p>
		 */
		function httpDoStopAtEnd () : void;
		/**
		 * <p>ONLY CALL THIS WITH HTTP PROGRESSIVE DOWNLOAD</p>
		 */
		function httpDoSeek (e:TimerEvent) : void;
		/**
		 * <p>Wrapper for <code>NetStream.close()</code>.  Never call
		 */
		function closeNS (updateCurrentPos:Boolean = false) : void;
		/**
		 * <p>We do a brief timer before entering VideoState.BUFFERING state to avoid
		 */
		function doDelayedBuffering (e:TimerEvent) : void;
		/**
		 * Wrapper for <code>NetStream.pause()</code>.  Never call
		 */
		function _pause (doPause:Boolean) : void;
		/**
		 * Wrapper for <code>NetStream.play()</code>.  Never call
		 */
		function _play (startTime:int = 0, endTime:int = -1) : void;
		/**
		 * Wrapper for <code>NetStream.seek()</code>.  Never call
		 */
		function _seek (time:Number) : void;
		/**
		 * Gets whether connected to a stream.  If not, then calls to APIs
		 */
		function isXnOK () : Boolean;
		/**
		 * Kicks off autoresize process
		 */
		function startAutoResize () : void;
		/**
		 * <p>Does the actual work of resetting the width and height.</p>
		 */
		function doAutoResize (e:TimerEvent = null) : void;
		/**
		 * <p>Makes video visible, turns on sound and starts
		 */
		function finishAutoResize (e:TimerEvent = null) : void;
		/**
		 * <p>Creates <code>NetStream</code> and does some basic
		 */
		function _createStream () : void;
		/**
		 * Does initialization after first connecting to the server
		 */
		function _setUpStream () : void;
		/**
		 * <p>ONLY CALL THIS WITH RTMP STREAMING</p>
		 */
		function doIdleTimeout (e:TimerEvent) : void;
		/**
		 * Dumps all queued commands without executing them
		 */
		function flushQueuedCmds () : void;
		/**
		 * Executes as many queued commands as possible, obviously
		 */
		function execQueuedCmds () : void;
		/**
		 * @private
		 */
		function queueCmd (type:Number, url:String = null, isLive:Boolean = false, time:Number = NaN) : void;
	}
}