import SuppliedRootFinePoolBlock000
import SuppliedRootFinePoolBlock008
import SuppliedRootFinePoolBlock016
import SuppliedRootFinePoolBlock024
import SuppliedRootFinePoolBlock032
namespace MatrixBounds.Numeric.SuppliedRootFinePoolCache
set_option maxRecDepth 100000
set_option maxHeartbeats 32000000

/-- Complete original root mixtures and pools, with every source label retained. -/
def table : RootFineFiniteVectorCache SuppliedRootFinePoolSource.numerator 0 36 := ((SuppliedRootFinePoolBlock000.table).append (SuppliedRootFinePoolBlock008.table)).append ((SuppliedRootFinePoolBlock016.table).append ((SuppliedRootFinePoolBlock024.table).append (SuppliedRootFinePoolBlock032.table)))

/-- Fast complete exact integer vector lookup at an original source position. -/
def numerator (row : Fin 36) (orbit : Fin 231) : ℤ := table.lookup row orbit

/-- Every cached integer orbit mass equals its complete original source value. -/
theorem numerator_eq (row : Fin 36) (orbit : Fin 231) :
    numerator row orbit = SuppliedRootFinePoolSource.numerator row orbit := by
  have identity := table.checked row orbit
  simpa only [numerator, Nat.zero_add] using identity

end MatrixBounds.Numeric.SuppliedRootFinePoolCache
