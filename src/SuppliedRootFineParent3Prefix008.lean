import SuppliedRootFineParent3Block000
import SuppliedRootFineParent3Block001
import SuppliedRootFineParent3Block002
import SuppliedRootFineParent3Block003
import SuppliedRootFineParent3Block004
import SuppliedRootFineParent3Block005
import SuppliedRootFineParent3Block006
import SuppliedRootFineParent3Block007
import RootFinePartialParent3Cache
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Prefix008
/-- The complete independently checked original parent3 nodes0 through7. -/
def table : RootFineParent3CacheTable 0 8 :=
  (((SuppliedRootFineParent3Block000.table).append (SuppliedRootFineParent3Block001.table)).append ((SuppliedRootFineParent3Block002.table).append (SuppliedRootFineParent3Block003.table))).append (((SuppliedRootFineParent3Block004.table).append (SuppliedRootFineParent3Block005.table)).append ((SuppliedRootFineParent3Block006.table).append (SuppliedRootFineParent3Block007.table)))
/-- Use the checked prefix immediately while retaining the actual source formula at every other node. -/
def numerator (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  RootFinePartialParent3Cache.numerator table node strategy axis orbit
/-- The partial cache agrees with the complete original integer hierarchy at every source coordinate. -/
theorem numerator_eq (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    numerator node strategy axis orbit = SuppliedRootFineParent3Integers.numerator node strategy axis orbit :=
  RootFinePartialParent3Cache.numerator_eq table node strategy axis orbit
end MatrixBounds.Numeric.SuppliedRootFineParent3Prefix008
