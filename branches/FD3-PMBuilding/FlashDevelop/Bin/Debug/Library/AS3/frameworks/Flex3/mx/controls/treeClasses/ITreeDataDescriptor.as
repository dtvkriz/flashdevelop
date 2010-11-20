﻿package mx.controls.treeClasses
{
	import mx.collections.ICollectionView;

	/**
	 *  Interface providing methods for parsing and adding nodes
	 */
	public interface ITreeDataDescriptor
	{
		/**
		 *  Provides access to a node's children, returning a collection
		 */
		public function getChildren (node:Object, model:Object = null) : ICollectionView;
		/**
		 *  Tests for the existence of children in a non-terminating node.
		 */
		public function hasChildren (node:Object, model:Object = null) : Boolean;
		/**
		 *  Tests a node for termination.
		 */
		public function isBranch (node:Object, model:Object = null) : Boolean;
		/**
		 *  Gets the data from a node.
		 */
		public function getData (node:Object, model:Object = null) : Object;
		/**
		 *  Adds a child node to a node at the specified index.
		 */
		public function addChildAt (parent:Object, newChild:Object, index:int, model:Object = null) : Boolean;
		/**
		 *  Removes a child node to a node at the specified index.
		 */
		public function removeChildAt (parent:Object, child:Object, index:int, model:Object = null) : Boolean;
	}
}