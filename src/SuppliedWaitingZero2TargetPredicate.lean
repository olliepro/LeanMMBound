import SuppliedWaitingZero2TargetTables

/-! The balanced support predicate uses a separately proved exact twelve-shape
coarse target table and is equivalent to the original source-index statement. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetPredicate
open SuppliedWaitingZero2TargetTables
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Original complete shape of one supplied zero-child column. -/
def shape (child : Fin 12) : Shape :=
  SuppliedShapeIndices.shapeAt 4 ((SuppliedShapeIndices.childColumns 4 false)[child.val]?.getD 0)

/-- Exact source coarse coordinate along its first positive physical axis. -/
def sourceTarget (child : Fin 12) : ℕ :=
  Shape.coordinates (shape child) (SuppliedLeafLaws.positiveAxis (shape child))

/-- Small exact target table avoids recomputing source shape enumeration in each finite check. -/
def target : Fin 12 → ℕ := ![4,1,2,3,4,1,1,2,2,3,3,4]

/-- All twelve fast target values equal their original source coarse coordinate. -/
theorem target_correct : ∀ child : Fin 12, target child = sourceTarget child := by decide +kernel

/-- Exact leaf support-code match, using proved balanced lookups only. -/
def valid (index : Fin ((945*12)*6)) : Prop :=
  (targets.get (references.get index)).val = target index.divNat.modNat+1

/-- A balanced lookup certificate is precisely the original source support-code binding. -/
theorem original_valid (index : Fin ((945*12)*6)) (checked : valid index) :
    (SuppliedZeroRegistry.table.get (ParameterIndexData.DyadicLeafzero.table.get index)).val =
      sourceTarget index.divNat.modNat+1 := by
  unfold valid at checked
  rw [references_get, targets_get, target_correct] at checked
  exact checked

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetPredicate
