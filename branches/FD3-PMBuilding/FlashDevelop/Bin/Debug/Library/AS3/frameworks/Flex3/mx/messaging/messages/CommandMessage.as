﻿package mx.messaging.messages
{
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;

	/**
	 *  The CommandMessage class provides a mechanism for sending commands to the
	 */
	public class CommandMessage extends AsyncMessage
	{
		/**
		 *  This operation is used to subscribe to a remote destination.
		 */
		public static const SUBSCRIBE_OPERATION : uint = 0;
		/**
		 *  This operation is used to unsubscribe from a remote destination.
		 */
		public static const UNSUBSCRIBE_OPERATION : uint = 1;
		/**
		 *  This operation is used to poll a remote destination for pending,
		 */
		public static const POLL_OPERATION : uint = 2;
		/**
		 *  This operation is used by a remote destination to sync missed or cached messages 
		 */
		public static const CLIENT_SYNC_OPERATION : uint = 4;
		/**
		 *  This operation is used to test connectivity over the current channel to
		 */
		public static const CLIENT_PING_OPERATION : uint = 5;
		/**
		 *  This operation is used to request a list of failover endpoint URIs
		 */
		public static const CLUSTER_REQUEST_OPERATION : uint = 7;
		/**
		 * This operation is used to send credentials to the endpoint so that
		 */
		public static const LOGIN_OPERATION : uint = 8;
		/**
		 * This operation is used to log the user out of the current channel, and 
		 */
		public static const LOGOUT_OPERATION : uint = 9;
		/**
		 * Endpoints can imply what features they support by reporting the
		 */
		public static const MESSAGING_VERSION : String = "DSMessagingVersion";
		/**
		 * This operation is used to indicate that the client's subscription with a
		 */
		public static const SUBSCRIPTION_INVALIDATE_OPERATION : uint = 10;
		/**
		 * Used by the MultiTopicConsumer to subscribe/unsubscribe for more
		 */
		public static const MULTI_SUBSCRIBE_OPERATION : uint = 11;
		/**
		 *  This operation is used to indicate that a channel has disconnected.
		 */
		public static const DISCONNECT_OPERATION : uint = 12;
		/**
		 *  This operation is used to trigger a ChannelSet to connect.
		 */
		public static const TRIGGER_CONNECT_OPERATION : uint = 13;
		/**
		 *  This is the default operation for new CommandMessage instances.
		 */
		public static const UNKNOWN_OPERATION : uint = 10000;
		/**
		 *  The server message type for authentication commands.
		 */
		public static const AUTHENTICATION_MESSAGE_REF_TYPE : String = "flex.messaging.messages.AuthenticationMessage";
		/**
		 *  Subscribe commands issued by a Consumer pass the Consumer's <code>selector</code>
		 */
		public static const SELECTOR_HEADER : String = "DSSelector";
		/**
		 *  Durable JMS subscriptions are preserved when an unsubscribe message
		 */
		public static const PRESERVE_DURABLE_HEADER : String = "DSPreserveDurable";
		/**
		 * Header to indicate that the Channel needs the configuration from the
		 */
		public static const NEEDS_CONFIG_HEADER : String = "DSNeedsConfig";
		/**
		 * Header used in a MULTI_SUBSCRIBE message to specify an Array of subtopic/selector
		 */
		public static const ADD_SUBSCRIPTIONS : String = "DSAddSub";
		/**
		 * Like the above, but specifies the subtopic/selector array of to remove
		 */
		public static const REMOVE_SUBSCRIPTIONS : String = "DSRemSub";
		/**
		 * The separator string used for separating subtopic and selectors in the 
		 */
		public static const SUBTOPIC_SEPARATOR : String = "_;_";
		/**
		 * Header to drive an idle wait time before the next client poll request.
		 */
		public static const POLL_WAIT_HEADER : String = "DSPollWait";
		/**
		 * Header to suppress poll response processing. If a client has a long-poll 
		 */
		public static const NO_OP_POLL_HEADER : String = "DSNoOpPoll";
		/**
		 * Header to specify which character set encoding was used while encoding
		 */
		public static const CREDENTIALS_CHARSET_HEADER : String = "DSCredentialsCharset";
		private static const OPERATION_FLAG : uint = 1;
		/**
		 *  @private 
		 */
		private static var operationTexts : Object;
		/**
		 *  Provides access to the operation/command for the CommandMessage.
		 */
		public var operation : uint;

		/**
		 *  Constructs an instance of a CommandMessage with an empty body and header
		 */
		public function CommandMessage ();
		/**
		 * @private
		 */
		public function getSmallMessage () : IMessage;
		/**
		 *  @private
		 */
		protected function addDebugAttributes (attributes:Object) : void;
		/**
		 *  Returns a string representation of the message.
		 */
		public function toString () : String;
		/**
		 *  Provides a description of the operation specified.
		 */
		public static function getOperationAsString (op:uint) : String;
		/**
		 * @private
		 */
		public function readExternal (input:IDataInput) : void;
		/**
		 * @private
		 */
		public function writeExternal (output:IDataOutput) : void;
	}
}