import SuppliedChildKinds
import ShapeAlphabet

/-! Exact original positive/zero classifications are finite bijections, so all
child tensor factors can be regrouped without loss or duplication. -/
namespace MatrixBounds.Numeric.SuppliedChildKinds

noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 8000000

/-- Original complete level-two columns enumerate each zero or terminal child exactly once. -/
theorem kind2_bijective : Function.Bijective kind2 := by decide +kernel

/-- Original complete level-three columns enumerate each zero or positive child exactly once. -/
theorem kind3_bijective : Function.Bijective kind3 := by decide +kernel

/-- Original complete level-four columns enumerate each zero or positive child exactly once. -/
theorem kind4_bijective : Function.Bijective kind4 := by decide +kernel

/-- Reindex actual level-two child shapes into their original zero and terminal labels. -/
def child2Equiv : ShapeAlphabet 4 ≃ Fin 12 ⊕ Fin 3 :=
  (shapeColumnEquiv 4).symm.trans (Equiv.ofBijective kind2 kind2_bijective)

/-- Reindex actual level-three child shapes into their original zero and positive labels. -/
def child3Equiv : ShapeAlphabet 8 ≃ Fin 24 ⊕ Fin 21 :=
  (shapeColumnEquiv 8).symm.trans (Equiv.ofBijective kind3 kind3_bijective)

/-- Reindex actual root-child shapes into their original zero and positive labels. -/
def child4Equiv : ShapeAlphabet 16 ≃ Fin 48 ⊕ Fin 105 :=
  (shapeColumnEquiv 16).symm.trans (Equiv.ofBijective kind4 kind4_bijective)

end
end MatrixBounds.Numeric.SuppliedChildKinds
