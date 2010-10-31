﻿package fl.video
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Rectangle;
	import flash.media.*;
	import flash.net.*;
	import flash.utils.*;

	/**
	 * Dispatched when the video player is resized or laid out automatically. A video player is 
	 */
	[Event("autoLayout", type="fl.video.AutoLayoutEvent")] 
	/**
	 * Dispatched when the playhead is moved to the start of the video player because the 
	 */
	[Event("autoRewound", type="fl.video.VideoEvent")] 
	/**
	 * Dispatched when the FLVPlayback instance enters the buffering state. 
	 */
	[Event("bufferingStateEntered", type="fl.video.VideoEvent")] 
	/**
	 * Dispatched when the event object closes the NetConnection, 
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
	 * Dispatched when the location of the playhead moves forward by a call to
	 */
	[Event("fastForward", type="fl.video.VideoEvent")] 
	/**
	 * Dispatched the first time the FLV file's metadata is reached.
	 */
	[Event("metadataReceived", type="fl.video.MetadataEvent")] 
	/**
	 * Dispatched when the player enters the paused state. This happens when you call 
	 */
	[Event("pausedStateEntered", type="fl.video.VideoEvent")] 
	/**
	 * Dispatched when the playing state is entered. This may not occur immediately 
	 */
	[Event("playingStateEntered", type="fl.video.VideoEvent")] 
	/**
	 * Dispatched while the FLV file is playing at the frequency specified by the 
	 */
	[Event("playheadUpdate", type="fl.video.VideoEvent")] 
	/**
	 * Indicates progress made in number of bytes downloaded. Dispatched at the frequency 
	 */
	[Event("progress", type="fl.video.VideoProgressEvent")] 
	/**
	 * Dispatched when an FLV file is loaded and ready to display. It starts the first 
	 */
	[Event("ready", type="fl.video.VideoEvent")] 
	/**
	 * Dispatched when the video player is resized or laid out. Here are two layout scenarios:<br/>
	 */
	[Event("layout", type="fl.video.LayoutEvent")] 
	/**
	 * Dispatched when the location of the playhead moves backward by
	 */
	[Event("rewind", type="fl.video.VideoEvent")] 
	/**
	 * Dispatched when the user stops scrubbing the FLV file with the seek bar. 
	 */
	[Event("scrubFinish", type="fl.video.VideoEvent")] 
	/**
	 * Dispatched when the user begins scrubbing the FLV file with the seek bar. 
	 */
	[Event("scrubStart", type="fl.video.VideoEvent")] 
	/**
	 * Dispatched when the location of the playhead is changed by a call to
	 */
	[Event("seeked", type="fl.video.VideoEvent")] 
	/**
	 * Dispatched when an error occurs loading a skin SWF file.  	 
	 */
	[Event("skinError", type="fl.video.SkinErrorEvent")] 
	/**
	 * Dispatched when a skin SWF file is loaded. The component 
	 */
	[Event("skinLoaded", type="fl.video.VideoEvent")] 
	/**
	 * Dispatched when the playback state changes. When an <code>autoRewind</code> call is 
	 */
	[Event("stateChange", type="fl.video.VideoEvent")] 
	/**
	 * Dispatched when entering the stopped state.
	 */
	[Event("stoppedStateEntered", type="fl.video.VideoEvent")] 
	/**
	 * Dispatched when sound changes by the user either moving the handle of the 
	 */
	[Event("soundUpdate", type="fl.video.SoundEvent")] 

	/**
	 * FLVPlayback extends the Sprite class and wraps a VideoPlayer object. 
	 */
	public class FLVPlayback extends Sprite
	{
		/**
		 * bounding box movie clip inside of component on stage
		 */
		public var boundingBox_mc : DisplayObject;
		private var preview_mc : MovieClip;
		private var previewImage_mc : Loader;
		private var previewImageUrl : String;
		private var isLivePreview : Boolean;
		private var livePreviewWidth : Number;
		private var livePreviewHeight : Number;
		private var _componentInspectorSetting : Boolean;
		/**
		 * @private
		 */
		local var videoPlayers : Array;
		/**
		 * @private
		 */
		local var videoPlayerStates : Array;
		/**
		 * @private
		 */
		local var videoPlayerStateDict : Dictionary;
		private var _activeVP : uint;
		private var _visibleVP : uint;
		private var _topVP : uint;
		/**
		 * @private
		 */
		local var uiMgr : UIManager;
		/**
		 * @private
		 */
		local var cuePointMgrs : Array;
		/**
		 * @private
		 */
		local var _firstStreamReady : Boolean;
		/**
		 * @private
		 */
		local var _firstStreamShown : Boolean;
		/**
		 * @private
		 */
		local var resizingNow : Boolean;
		/**
		 * @private
		 */
		local var skinShowTimer : Timer;
		/**
		 * @private
		 */
		static const DEFAULT_SKIN_SHOW_TIMER_INTERVAL : Number = 2000;
		/**
		 * @private
		 */
		static const skinShowTimerInterval : Number = DEFAULT_SKIN_SHOW_TIMER_INTERVAL;
		private var _align : String;
		private var _autoRewind : Boolean;
		private var _bufferTime : Number;
		private var _idleTimeout : Number;
		private var _aspectRatio : Boolean;
		private var _playheadUpdateInterval : Number;
		private var _progressInterval : Number;
		private var _origWidth : Number;
		private var _origHeight : Number;
		private var _scaleMode : String;
		private var _seekToPrevOffset : Number;
		private var _soundTransform : SoundTransform;
		private var _volume : Number;
		private var __forceNCMgr : NCManager;
		/**
		 * @private
		 */
		public static const SEEK_TO_PREV_OFFSET_DEFAULT : Number = 1;

		/**
		 * A number that specifies the current <code>playheadTime</code> as a percentage of the 
		 */
		public function get playheadPercentage () : Number;
		/**
		 * @private (setter)
		 */
		public function set playheadPercentage (percent:Number) : void;
		/**
		 * Only for live preview. Reads in a PNG file for the preview.
		 */
		public function set preview (filename:String) : void;
		/**
		 * This flag is set by code automatically generated by the
		 */
		public function set componentInspectorSetting (b:Boolean) : void;
		/**
		 * A number that specifies which video player instance is affected by other application
		 */
		public function get activeVideoPlayerIndex () : uint;
		/**
		 * @private (setter)
		 */
		public function set activeVideoPlayerIndex (index:uint) : void;
		/**
		 * Specifies the video layout when the <code>scaleMode</code> property  is set to
		 */
		public function get align () : String;
		/**
		 * @private (setter)
		 */
		public function set align (s:String) : void;
		/**
		 * A Boolean value that, if set to <code>true</code>, causes the FLV file to start
		 */
		public function get autoPlay () : Boolean;
		/**
		 * @private (setter)
		 */
		public function set autoPlay (flag:Boolean) : void;
		/**
		 * A Boolean value that, if <code>true</code>, causes the FLV file to rewind to Frame 1 when 
		 */
		public function get autoRewind () : Boolean;
		/**
		 * @private (setter)
		 */
		public function set autoRewind (flag:Boolean) : void;
		/**
		 * A number that specifies the bits per second at which to transfer the FLV file.
		 */
		public function get bitrate () : Number;
		/**
		 * @private (setter)
		 */
		public function set bitrate (b:Number) : void;
		/**
		 * A Boolean value that is <code>true</code> if the video is in a buffering state. 
		 */
		public function get buffering () : Boolean;
		/**
		 * Buffering bar control. This control is displayed when the FLV file is in 
		 */
		public function get bufferingBar () : Sprite;
		/**
		 * @private (setter)
		 */
		public function set bufferingBar (s:Sprite) : void;
		/**
		 * If set to <code>true</code>, hides the SeekBar control and disables the 
		 */
		public function get bufferingBarHidesAndDisablesOthers () : Boolean;
		/**
		 * @private (setter)
		 */
		public function set bufferingBarHidesAndDisablesOthers (b:Boolean) : void;
		/**
		 * BackButton playback control. Clicking calls the 
		 */
		public function get backButton () : Sprite;
		/**
		 * @private (setter)
		 */
		public function set backButton (s:Sprite) : void;
		/**
		 * A number that specifies the number of seconds to buffer in memory before 
		 */
		public function get bufferTime () : Number;
		/**
		 * @private (setter)
		 */
		public function set bufferTime (aTime:Number) : void;
		/**
		 * A number that indicates the extent of downloading, in number of bytes, for an 
		 */
		public function get bytesLoaded () : uint;
		/**
		 * A number that specifies the total number of bytes downloaded for an HTTP download.  
		 */
		public function get bytesTotal () : uint;
		/**
		 * A string that specifies the URL of the FLV file to stream and how to stream it.
		 */
		public function get source () : String;
		/**
		 * @private (setter)
		 */
		public function set source (url:String) : void;
		/**
		 * An array that describes ActionScript cue points and disabled embedded 
		 */
		public function set cuePoints (cuePointsArray:Array) : void;
		/**
		 * Forward button control. Clicking calls the
		 */
		public function get forwardButton () : Sprite;
		/**
		 * @private (setter)
		 */
		public function set forwardButton (s:Sprite) : void;
		/**
		 * Background color used when in full-screen takeover
		 */
		public function get fullScreenBackgroundColor () : uint;
		/**
		 * @private (setter)
		 */
		public function set fullScreenBackgroundColor (c:uint) : void;
		/**
		 * FullScreen button control.
		 */
		public function get fullScreenButton () : Sprite;
		/**
		 * @private (setter)
		 */
		public function set fullScreenButton (s:Sprite) : void;
		/**
		 * Specifies the delay time in milliseconds to hide the skin. 
		 */
		public function get fullScreenSkinDelay () : int;
		/**
		 * @private (setter)
		 */
		public function set fullScreenSkinDelay (i:int) : void;
		/**
		 * When the stage enters full-screen mode, the
		 */
		public function get fullScreenTakeOver () : Boolean;
		/**
		 * @private (setter)
		 */
		public function set fullScreenTakeOver (v:Boolean) : void;
		/**
		 * A number that specifies the height of the FLVPlayback instance. 
		 */
		public function get height () : Number;
		/**
		 * @private (setter)
		 */
		public function set height (h:Number) : void;
		/**
		 * The amount of time, in milliseconds, before Flash terminates an idle connection 
		 */
		public function get idleTimeout () : Number;
		/**
		 * @private (setter)
		 */
		public function set idleTimeout (aTime:Number) : void;
		/**
		 * A Boolean value that is <code>true</code> if the FLV file is streaming from 
		 */
		public function get isRTMP () : Boolean;
		/**
		 * A Boolean value that is <code>true</code> if the video stream is live. This property 
		 */
		public function get isLive () : Boolean;
		/**
		 * @private (setter)
		 */
		public function set isLive (flag:Boolean) : void;
		/**
		 * An object that is a metadata information packet that is received from a call to 
		 */
		public function get metadata () : Object;
		/**
		 * A Boolean value that is <code>true</code> if a metadata packet has been 
		 */
		public function get metadataLoaded () : Boolean;
		/**
		 * Mute button control.
		 */
		public function get muteButton () : Sprite;
		/**
		 * @private (setter)
		 */
		public function set muteButton (s:Sprite) : void;
		/**
		 * An INCManager object that provides access to an instance of the class implementing 
		 */
		public function get ncMgr () : INCManager;
		/**
		 * Pause button control.
		 */
		public function get pauseButton () : Sprite;
		/**
		 * @private (setter)
		 */
		public function set pauseButton (s:Sprite) : void;
		/**
		 * A Boolean value that is <code>true</code> if the FLV file is in a paused state.
		 */
		public function get paused () : Boolean;
		/**
		 * Play button control.
		 */
		public function get playButton () : Sprite;
		/**
		 * @private (setter)
		 */
		public function set playButton (s:Sprite) : void;
		/**
		 * A number that is the current playhead time or position, measured in seconds, 
		 */
		public function get playheadTime () : Number;
		/**
		 * @private (setter)
		 */
		public function set playheadTime (position:Number) : void;
		/**
		 * A number that is the amount of time, in milliseconds, between each 
		 */
		public function get playheadUpdateInterval () : Number;
		/**
		 * @private (setter)
		 */
		public function set playheadUpdateInterval (aTime:Number) : void;
		/**
		 * A Boolean value that is <code>true</code> if the FLV file is in the playing state. 
		 */
		public function get playing () : Boolean;
		/**
		 * Play/pause button control.
		 */
		public function get playPauseButton () : Sprite;
		/**
		 * @private (setter)
		 */
		public function set playPauseButton (s:Sprite) : void;
		/**
		 * A number that specifies the height of the source FLV file. This information 
		 */
		public function get preferredHeight () : int;
		/**
		 * Gives the width of the source FLV file. This information is not valid immediately 
		 */
		public function get preferredWidth () : int;
		/**
		 * A number that is the amount of time, in milliseconds, between each <code>progress</code> 
		 */
		public function get progressInterval () : Number;
		/**
		 * @private (setter)
		 */
		public function set progressInterval (aTime:Number) : void;
		/**
		 * @copy fl.video.VideoPlayer#registrationX
		 */
		public function get registrationX () : Number;
		/**
		 * @private (setter)
		 */
		public function set registrationX (x:Number) : void;
		/**
		 * @copy fl.video.VideoPlayer#registrationY
		 */
		public function get registrationY () : Number;
		/**
		 * @private (setter)
		 */
		public function set registrationY (y:Number) : void;
		/**
		 * @copy fl.video.VideoPlayer#registrationWidth
		 */
		public function get registrationWidth () : Number;
		/**
		 * @private (setter)
		 */
		public function set registrationWidth (w:Number) : void;
		/**
		 * @copy fl.video.VideoPlayer#registrationHeight
		 */
		public function get registrationHeight () : Number;
		/**
		 * @private (setter)
		 */
		public function set registrationHeight (h:Number) : void;
		/**
		 * Specifies how the video will resize after loading.  If set to
		 */
		public function get scaleMode () : String;
		/**
		 * @private (setter)
		 */
		public function set scaleMode (s:String) : void;
		/**
		 * A number that is the horizontal scale. The standard scale is 1.
		 */
		public function get scaleX () : Number;
		/**
		 * @private (setter)
		 */
		public function set scaleX (xs:Number) : void;
		/**
		 * A number that is the vertical scale. The standard scale is 1.
		 */
		public function get scaleY () : Number;
		/**
		 * @private (setter)
		 */
		public function set scaleY (ys:Number) : void;
		/**
		 * A Boolean value that is <code>true</code> if the user is scrubbing with the SeekBar 
		 */
		public function get scrubbing () : Boolean;
		/**
		 * The SeekBar control.
		 */
		public function get seekBar () : Sprite;
		/**
		 * @private (setter)
		 */
		public function set seekBar (s:Sprite) : void;
		/**
		 * A number that specifies, in milliseconds, how often to check the SeekBar handle 
		 */
		public function get seekBarInterval () : Number;
		/**
		 * @private (setter)
		 */
		public function set seekBarInterval (s:Number) : void;
		/**
		 * A number that specifies how far a user can move the SeekBar handle before an 
		 */
		public function get seekBarScrubTolerance () : Number;
		/**
		 * @private (setter)
		 */
		public function set seekBarScrubTolerance (s:Number) : void;
		/**
		 * The number of seconds that the <code>seekToPrevNavCuePoint()</code> method uses 
		 */
		public function get seekToPrevOffset () : Number;
		/**
		 * @private (setter)
		 */
		public function set seekToPrevOffset (s:Number) : void;
		/**
		 * A string that specifies the URL to a skin SWF file. This string could contain a 
		 */
		public function get skin () : String;
		/**
		 * @private (setter)
		 */
		public function set skin (s:String) : void;
		/**
		 * A Boolean value that, if <code>true</code>, hides the component skin when the mouse 
		 */
		public function get skinAutoHide () : Boolean;
		/**
		 * @private (setter)
		 */
		public function set skinAutoHide (b:Boolean) : void;
		/**
		 * The alpha for the background of the skin. The <code>skinBackgroundAlpha</code>
		 */
		public function get skinBackgroundAlpha () : Number;
		/**
		 * @private (setter)
		 */
		public function set skinBackgroundAlpha (a:Number) : void;
		/**
		 * The color for the background of the skin (0xRRGGBB).  The <code>skinBackgroundColor</code>
		 */
		public function get skinBackgroundColor () : uint;
		/**
		 * @private (setter)
		 */
		public function set skinBackgroundColor (c:uint) : void;
		/**
		 * The amount of time in milliseconds that it takes for the skin to fade in or fade out when 
		 */
		public function get skinFadeTime () : int;
		/**
		 * @private (setter)
		 */
		public function set skinFadeTime (i:int) : void;
		/**
		 * This property specifies the largest multiple that FLVPlayback will use to scale up
		 */
		public function get skinScaleMaximum () : Number;
		/**
		 * @private (setter)
		 */
		public function set skinScaleMaximum (value:Number) : void;
		/**
		 * Provides direct access to the
		 */
		public function get soundTransform () : SoundTransform;
		/**
		 * @private
		 */
		public function set soundTransform (st:SoundTransform) : void;
		/**
		 * A string that specifies the state of the component. This property is set by the 
		 */
		public function get state () : String;
		/**
		 * A Boolean value that is <code>true</code> if the state is responsive. If the state is 
		 */
		public function get stateResponsive () : Boolean;
		/**
		 * The Stop button control.
		 */
		public function get stopButton () : Sprite;
		public function set stopButton (s:Sprite) : void;
		/**
		 * A Boolean value that is <code>true</code> if the state of the FLVPlayback instance is stopped. 
		 */
		public function get stopped () : Boolean;
		/**
		 * A number that is the total playing time for the video in seconds.
		 */
		public function get totalTime () : Number;
		/**
		 * @private (setter)
		 */
		public function set totalTime (aTime:Number) : void;
		/**
		 * A number that you can use to manage multiple FLV file streams. 
		 */
		public function get visibleVideoPlayerIndex () : uint;
		/**
		 * @private (setter)
		 */
		public function set visibleVideoPlayerIndex (i:uint) : void;
		/**
		 * A number in the range of 0 to 1 that indicates the volume control setting. 
		 */
		public function get volume () : Number;
		/**
		 * @private (setter)
		 */
		public function set volume (aVol:Number) : void;
		/**
		 * The volume bar control.
		 */
		public function get volumeBar () : Sprite;
		/**
		 * @private (setter)
		 */
		public function set volumeBar (s:Sprite) : void;
		/**
		 * A number that specifies, in milliseconds, how often 
		 */
		public function get volumeBarInterval () : Number;
		/**
		 * @private (setter)
		 */
		public function set volumeBarInterval (s:Number) : void;
		/**
		 * A number that specifies how far a user can move the volume bar handle before 
		 */
		public function get volumeBarScrubTolerance () : Number;
		/**
		 * @private (setter)
		 */
		public function set volumeBarScrubTolerance (s:Number) : void;
		/**
		 * A number that specifies the width of the FLVPlayback instance on the Stage. 
		 */
		public function get width () : Number;
		/**
		 * @private (setter)
		 */
		public function set width (w:Number) : void;
		/**
		 * @copy fl.video.VideoPlayer#x
		 */
		public function get x () : Number;
		/**
		 * @private (setter)
		 */
		public function set x (x:Number) : void;
		/**
		 * @copy fl.video.VideoPlayer#y
		 */
		public function get y () : Number;
		/**
		 * @private (setter)
		 */
		public function set y (y:Number) : void;
		/**
		 * Returns the next available tabIndex value after the FLVPlayback controls. The value is set after the <code>assignTabIndexes</code> method is called.
		 */
		public function get endTabIndex () : int;
		/**
		 * Returns the first tabIndex value for the FLVPlayback controls. The value is set after the <code>assignTabIndexes</code> method is called.
		 */
		public function get startTabIndex () : int;

		/**
		 * Creates a new FLVPlayback instance. After creating the FLVPlayback 
		 */
		public function FLVPlayback ();
		/**
		 * Sets width and height simultaneously. Because setting either one, 
		 */
		public function setSize (width:Number, height:Number) : void;
		/**
		 * Sets the <code>scaleX</code> and <code>scaleY</code> properties simultaneously. 
		 */
		public function setScale (scaleX:Number, scaleY:Number) : void;
		/**
		 * handles events
		 */
		function handleAutoLayoutEvent (e:AutoLayoutEvent) : void;
		/**
		 * handles events
		 */
		function handleMetadataEvent (e:MetadataEvent) : void;
		/**
		 * handles events
		 */
		function handleVideoProgressEvent (e:VideoProgressEvent) : void;
		/**
		 * handles events
		 */
		function handleVideoEvent (e:VideoEvent) : void;
		/**
		 * Begins loading the FLV file and provides a shortcut for setting the 
		 */
		public function load (source:String, totalTime:Number = NaN, isLive:Boolean = false) : void;
		/**
		 * Plays the video stream. With no parameters, the method simply takes the FLV 
		 */
		public function play (source:String = null, totalTime:Number = NaN, isLive:Boolean = false) : void;
		/**
		 * Plays the FLV file when enough of it has downloaded. If the FLV file has 
		 */
		public function playWhenEnoughDownloaded () : void;
		/**
		 * Pauses playing the video stream. 
		 */
		public function pause () : void;
		/**
		 * Stops the video from playing. 
		 */
		public function stop () : void;
		/**
		 * Seeks to a given time in the file, specified in seconds, 
		 */
		public function seek (time:Number) : void;
		/**
		 * Seeks to a given time in the file, specified in seconds, with a precision up to 
		 */
		public function seekSeconds (time:Number) : void;
		/**
		 * Seeks to a percentage of the file and places the playhead there. 
		 */
		public function seekPercent (percent:Number) : void;
		/**
		 * Seeks to a navigation cue point that matches the specified time, name, or 
		 */
		public function seekToNavCuePoint (timeNameOrCuePoint:*) : void;
		/**
		 * Seeks to the next navigation cue point, based on the current value of the 
		 */
		public function seekToNextNavCuePoint (time:Number = NaN) : void;
		/**
		 * Seeks to the previous navigation cue point, based on the current 
		 */
		public function seekToPrevNavCuePoint (time:Number = NaN) : void;
		/**
		 * Adds an ActionScript cue point and has the same effect as adding an ActionScript 
		 */
		public function addASCuePoint (timeOrCuePoint:*, name:String = null, parameters:Object = null) : Object;
		/**
		 * Removes an ActionScript cue point from the currently loaded FLV file. 
		 */
		public function removeASCuePoint (timeNameOrCuePoint:*) : Object;
		/**
		 * Finds the cue point of the type specified by the <code>type</code> parameter and 
		 */
		public function findCuePoint (timeNameOrCuePoint:*, type:String = CuePointType.ALL) : Object;
		/**
		 * Finds a cue point of the specified type that matches or is 
		 */
		public function findNearestCuePoint (timeNameOrCuePoint:*, type:String = CuePointType.ALL) : Object;
		/**
		 * Finds the next cue point in <code>my_cuePoint.array</code> that has the same name as 
		 */
		public function findNextCuePointWithName (cuePoint:Object) : Object;
		/**
		 * Enables or disables one or more FLV file cue points. Disabled cue points 
		 */
		public function setFLVCuePointEnabled (enabled:Boolean, timeNameOrCuePoint:*) : Number;
		/**
		 * Returns <code>false</code> if the FLV file embedded cue point is disabled. 
		 */
		public function isFLVCuePointEnabled (timeNameOrCuePoint:*) : Boolean;
		/**
		 * Brings a video player to the front of the stack of video players. 
		 */
		public function bringVideoPlayerToFront (index:uint) : void;
		/**
		 * Gets the video player specified by the <code>index</code> parameter. 
		 */
		public function getVideoPlayer (index:Number) : VideoPlayer;
		/**
		 * Closes NetStream and deletes the video player specified by the <code>index</code>
		 */
		public function closeVideoPlayer (index:uint) : void;
		/**
		 * Sets the FLVPlayback video player to full screen. Calling this method has 
		 */
		public function enterFullScreenDisplayState () : void;
		/**
		 * Creates and configures VideoPlayer movie clip.
		 */
		function createVideoPlayer (index:Number) : void;
		/**
		 * Creates live preview placeholder.
		 */
		private function createLivePreviewMovieClip () : void;
		/**
		 * Handles load of live preview image
		 */
		private function onCompletePreview (e:Event) : void;
		/**
		 * Called on <code>onEnterFrame</code> to initiate loading the new
		 */
		private function doContentPathConnect (eventOrIndex:*) : void;
		/**
		 * @private
		 */
		function showFirstStream () : void;
		/**
		 * Called by UIManager when SeekBar scrubbing starts
		 */
		function _scrubStart () : void;
		/**
		 * Called by UIManager when seekbar scrubbing finishes
		 */
		function _scrubFinish () : void;
		/**
		 * Called by UIManager when skin errors
		 */
		function skinError (message:String) : void;
		/**
		 * Called by UIManager when skin loads
		 */
		function skinLoaded () : void;
		/**
		 * @private
		 */
		function showSkinNow (e:TimerEvent) : void;
		/**
		 * @private
		 */
		function queueCmd (vpState:VideoPlayerState, type:Number, time:Number = NaN) : void;
		/**
		 * Assigns a tabIndex value to each of the FLVPlayback controls by sorting 
		 */
		public function assignTabIndexes (startTabIndex:int) : int;
	}
}