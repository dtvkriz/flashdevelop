﻿package mx.core
{
	/**
	 *  The IProgrammaticSkin interface defines the interface that skin classes must implement 
	 */
	public interface IProgrammaticSkin
	{
		/**
		 *  @copy mx.skins.ProgrammaticSkin#validateNow()
		 */
		public function validateNow () : void;
		/**
		 *  @copy mx.skins.ProgrammaticSkin#validateDisplayList()
		 */
		public function validateDisplayList () : void;
	}
}