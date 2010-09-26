﻿package mx.messaging.messages
{
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;

	/**
	 *  An AcknowledgeMessage acknowledges the receipt of a message that 
	 */
	public class AcknowledgeMessage extends AsyncMessage implements ISmallMessage
	{
		/**
		 *  Header name for the error hint header.
		 */
		public static const ERROR_HINT_HEADER : String = "DSErrorHint";

		/**
		 *  Constructs an instance of an AcknowledgeMessage with an empty body and header.
		 */
		public function AcknowledgeMessage ();
		/**
		 * @private
		 */
		public function getSmallMessage () : IMessage;
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