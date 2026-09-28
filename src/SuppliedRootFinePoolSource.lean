import SuppliedRootFineParent4Cache
import RootFinePoolVectors

/-! Complete original root mixtures and coordinate pools use independently checked original parent laws. -/
namespace MatrixBounds.Numeric.SuppliedRootFinePoolSource
open scoped BigOperators

/-- Original physical axis of a complete root integer vector. -/
abbrev axis := RootFinePoolVectors.axis
/-- Original coordinate-pool sector of a complete root integer vector. -/
abbrev sector := RootFinePoolVectors.sector
/-- Complete original source integer mixture or coordinate-labelled pool. -/
abbrev numerator := RootFinePoolVectors.numerator SuppliedRootFineParent4Cache.numerator
/-- Exact original complete coefficient total of each root vector. -/
abbrev total := RootFinePoolVectors.total

/-- Every original complete root vector is coordinatewise nonnegative. -/
theorem numerator_nonnegative (row : Fin 36) (orbit : Fin 231) : 0 ≤ numerator row orbit :=
  RootFinePoolVectors.numerator_nonnegative _ SuppliedRootFineParent4Cache.numerator_eq row orbit

/-- Every original complete root vector retains its exact original coefficient total. -/
theorem numerator_normalized (row : Fin 36) : ∑ orbit, numerator row orbit = total row :=
  RootFinePoolVectors.numerator_normalized _ SuppliedRootFineParent4Cache.numerator_eq row

end MatrixBounds.Numeric.SuppliedRootFinePoolSource
