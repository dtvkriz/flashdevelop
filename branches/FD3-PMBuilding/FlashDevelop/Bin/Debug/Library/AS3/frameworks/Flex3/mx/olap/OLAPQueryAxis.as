/**********************************************************/
/*** Generated using Asapire [brainy 2008-Mar-07 11:06] ***/
/**********************************************************/
package mx.olap {
	public class OLAPQueryAxis implements IOLAPQueryAxis {
		/**
		 * The type of axis, as
		 *  OLAPQuery.COLUMN AXIS for a column axis,
		 *  OLAPQuery.ROW_AXIS for a row axis,
		 *  and OLAPQuery.SLICER_AXIS for a slicer axis.
		 */
		public var axisOrdinal:int;
		/**
		 * All the sets of the query axis, as an Array of IOLAPSet instances.
		 *  This Array includes sets added by the addMember()
		 *  and addTuple() methods.
		 */
		public function get sets():Array;
		/**
		 * All the tuples added to the query axis, as an Array of IOLAPTuple instances.
		 *  This Array includes tuples added by the addMember()
		 *  and addSet() methods.
		 */
		public function get tuples():Array;
		/**
		 * Constructor
		 *
		 * @param ordinal           <int> The type of axis.
		 *                            Use OLAPQuery.COLUMN AXIS for a column axis,
		 *                            OLAPQuery.ROW_AXIS for a row axis,
		 *                            and OLAPQuery.SLICER_AXIS for a slicer axis.
		 */
		public function OLAPQueryAxis(ordinal:int);
		/**
		 * Adds a single member to the query axis.
		 *  The member is automatically converted to an IOLPASet instance.
		 *  This method is useful when adding a member to a slicer axis.
		 *
		 * @param s                 <IOLAPMember> The member to add to the query.
		 */
		public function addMember(s:IOLAPMember):void;
		/**
		 * Adds a set to the query axis.
		 *  The set define the members and tuples that provide the information for the query axis.
		 *
		 * @param s                 <IOLAPSet> The set to add to the query.
		 */
		public function addSet(s:IOLAPSet):void;
		/**
		 * Adds a tuple to the query axis.
		 *  The tuple is automatically converted to an IOLPASet instance.
		 *
		 * @param t                 <IOLAPTuple> The tuple to add to the query.
		 */
		public function addTuple(t:IOLAPTuple):void;
		/**
		 * Clears all the sets, tuples and members from this axis.
		 */
		public function clear():void;
	}
}