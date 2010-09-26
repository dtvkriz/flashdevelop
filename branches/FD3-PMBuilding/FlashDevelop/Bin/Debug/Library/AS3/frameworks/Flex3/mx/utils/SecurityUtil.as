﻿package mx.utils
{
	import flash.events.IEventDispatcher;
	import mx.core.ISWFBridgeProvider;

	/**
	 *  Utilities for working with security-related issues.
	 */
	public class SecurityUtil
	{
		/**
		 *  Tests if there is mutual trust between the parent and child of the specified bridge.
		 */
		public static function hasMutualTrustBetweenParentAndChild (bp:ISWFBridgeProvider) : Boolean;
	}
}