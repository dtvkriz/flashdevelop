﻿package mx.messaging.messages
{
	import mx.messaging.messages.MessagePerformanceInfo;

	/**
	 * The MessagePerformanceUtils utility class is used to retrieve various metrics about
	 */
	public class MessagePerformanceUtils
	{
		/**
		 * @private 
		 */
		public var mpii : MessagePerformanceInfo;
		/**
		 * @private 
		 */
		public var mpio : MessagePerformanceInfo;
		/**
		 * @private 
		 */
		public var mpip : MessagePerformanceInfo;
		/**
		 * @private 
		 */
		public static const MPI_HEADER_IN : String = "DSMPII";
		/**
		 * @private 
		 */
		public static const MPI_HEADER_OUT : String = "DSMPIO";
		/**
		 * @private 
		 */
		public static const MPI_HEADER_PUSH : String = "DSMPIP";

		/**
		 * Time between this client sending a message and receiving a response
		 */
		public function get totalTime () : Number;
		/**
		 * Time between server receiving the client message and either the time
		 */
		public function get serverProcessingTime () : Number;
		/**
		 * Time between server receiving the client message and the server beginning to push
		 */
		public function get serverPrePushTime () : Number;
		/**
		 * Time spent in the adapter associated with the destination for this message before
		 */
		public function get serverAdapterTime () : Number;
		/**
		 * Time spent in a module invoked from the adapter associated with the destination for this message 
		 */
		public function get serverAdapterExternalTime () : Number;
		/**
		 * @return Time that the message waited on the server after it was ready to be pushed to the client
		 */
		public function get serverPollDelay () : Number;
		/**
		 * Server processing time spent outside of the adapter associated with the destination of this message
		 */
		public function get serverNonAdapterTime () : Number;
		/**
		 * The network round trip time for a client message and the server response to it,
		 */
		public function get networkRTT () : Number;
		/**
		 * Timestamp in milliseconds since epoch of when the server sent a response message back
		 */
		public function get serverSendTime () : Number;
		/**
		 * Timestamp in milliseconds since epoch of when the client received response message from
		 */
		public function get clientReceiveTime () : Number;
		/**
		 * The size of the original client message as measured during deserialization by the server
		 */
		public function get messageSize () : int;
		/**
		 * The size of the response message sent to the client by the server as measured during serialization
		 */
		public function get responseMessageSize () : int;
		/**
		 * Returns true if message was pushed to the client and is not a response to a message that
		 */
		public function get pushedMessageFlag () : Boolean;
		/**
		 * Only populated in the case of a pushed message, this is the time between the push causing client
		 */
		public function get totalPushTime () : Number;
		/**
		 * Only populated in the case of a pushed message, this is the network time between
		 */
		public function get pushOneWayTime () : Number;
		/**
		 * Only populated in the case of a pushed message, timestamp in milliseconds since epoch of 
		 */
		public function get originatingMessageSentTime () : Number;
		/**
		 * Only populated in the case of a pushed message, size in Bytes of the message that originally
		 */
		public function get originatingMessageSize () : Number;
		/**
		 * @private
		 */
		private function get pushedOverheadTime () : Number;

		/**
		 * Constructor
		 */
		public function MessagePerformanceUtils (message:Object);
		/**
		 * Method returns a summary of all information available in MPI.  A suggested use of this
		 */
		public function prettyPrint () : String;
	}
}