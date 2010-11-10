﻿package mx.rpc.soap
{
	/**
	 * A context for the result of an SOAP based Remote Procedure Call.
	 */
	public class SOAPResult
	{
		public var headers : Array;
		public var isFault : Boolean;
		public var result : *;

		public function SOAPResult ();
	}
}