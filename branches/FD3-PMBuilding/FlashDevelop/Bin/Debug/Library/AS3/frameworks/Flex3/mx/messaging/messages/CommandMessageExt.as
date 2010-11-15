﻿package mx.messaging.messages
{
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;

	/**
	 * A special serialization wrapper for CommandMessage. This wrapper is used to
	 */
	public class CommandMessageExt extends CommandMessage implements IExternalizable
	{
		private var _message : CommandMessage;

		/**
		 *  The unique id for the message.
		 */
		public function get messageId () : String;

		public function CommandMessageExt (message:CommandMessage = null);
		public function writeExternal (output:IDataOutput) : void;
	}
}