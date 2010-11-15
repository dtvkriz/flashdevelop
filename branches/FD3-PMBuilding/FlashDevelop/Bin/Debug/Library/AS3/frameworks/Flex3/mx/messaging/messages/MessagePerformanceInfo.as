﻿package mx.messaging.messages
{
	/**
	 * @private
	 */
	public class MessagePerformanceInfo
	{
		/**
		 * Size of message in Bytes (message types depends on what header this MPI is in)
		 */
		public var messageSize : int;
		/**
		 * Millisecond timestamp of when this message was sent
		 */
		public var sendTime : Number;
		/**
		 * Millisecond timestamp of when this message was received
		 */
		public var receiveTime : Number;
		/**
		 * Amount of time in milliseconds that this message was being processed on the server
		 */
		public var overheadTime : Number;
		/**
		 * "OUT" when this message originated on the server
		 */
		private var _infoType : String;
		/**
		 * True if this is info for a message that was pushed from server to client
		 */
		public var pushedFlag : Boolean;
		/**
		 * Millisecond timestamp of when the server became ready to push this message out 
		 */
		public var serverPrePushTime : Number;
		/**
		 * Millisecond timestamp of when the server called into the adapter associated with the
		 */
		public var serverPreAdapterTime : Number;
		/**
		 * Millisecond timestamp of when server processing returned from the adapater associated 
		 */
		public var serverPostAdapterTime : Number;
		/**
		 * Millisecond timestamp of when the adapter associated with the destination of this message
		 */
		public var serverPreAdapterExternalTime : Number;
		/**
		 * Millisecond timestamp of when processing came back to the adapter associated with the destination 
		 */
		public var serverPostAdapterExternalTime : Number;
		/**
		 * Flag is true when record-message-times is enabled for the communication channel
		 */
		public var recordMessageTimes : Boolean;
		/**
		 * Flag is true when record-message-sizes is enabled for the communication channel
		 */
		public var recordMessageSizes : Boolean;

		/**
		 *  Sets the info type of this message (IN or OUT).  Used to mark the MPI with the 
		 */
		public function set infoType (type:String) : void;
		/**
		 *  Get the info type of this message (IN or OUT).
		 */
		public function get infoType () : String;

		public function MessagePerformanceInfo ();
	}
}