import CWPermutedTerminalAsymptotic
import CWOneLetterProfileLaws

/-! Actual input interfaces for the shared extraction of physically permuted
terminal types. These are the same windowed powers produced by earlier stages. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K T : Type*} [CommRing K] [Fintype T]

/-- The full fine law assigned to an original terminal coordinate. -/
def axisLaw (extreme middle : ℕ) (axis : Fin 3) : (Fin 2 → Fin 3) → ℝ :=
  if axis = 2 then ternaryParentLaw (parameter extreme middle) else binaryParentLaw

/-- The actual X-window center follows the physical coordinate permutation. -/
theorem permuted_center_x (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ)
    (positive : 0 < extreme+middle) :
    (permutedData axes extreme middle).parentCenter (P := Fin (2*(extreme+middle)))
      (permutedData axes extreme middle).fineX = axisLaw extreme middle (axes 0) := by
  rw [SplitRestrictionData.parentCenter_childLaw]
  change (permutedData axes extreme middle).parentLaw (P := Fin (2*(extreme+middle)))
    ((permutedData axes extreme middle).childLaw (fun child => oneLetterProfile (shapeXIndex child)
      (2*(permutedData axes extreme middle).split child))) = _
  rw [one_letter_childLaw, SplitRestrictionData.parentLaw_active _ (permuted_counts_symmetric axes extreme middle)]
  exact permuted_parent_law axes extreme middle positive 0

/-- The actual Y-window center is the corresponding complete binary or ternary law. -/
theorem permuted_center_y (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ)
    (positive : 0 < extreme+middle) :
    (permutedData axes extreme middle).parentCenter (P := Fin (2*(extreme+middle)))
      (permutedData axes extreme middle).fineY = axisLaw extreme middle (axes 1) := by
  rw [SplitRestrictionData.parentCenter_childLaw]
  change (permutedData axes extreme middle).parentLaw (P := Fin (2*(extreme+middle)))
    ((permutedData axes extreme middle).childLaw (fun child => oneLetterProfile (shapeYIndex child)
      (2*(permutedData axes extreme middle).split child))) = _
  rw [one_letter_childLaw, SplitRestrictionData.parentLaw_active _ (permuted_counts_symmetric axes extreme middle)]
  exact permuted_parent_law axes extreme middle positive 1

/-- The actual Z-window center includes the full law, including every zero coordinate. -/
theorem permuted_center_z (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ)
    (positive : 0 < extreme+middle) :
    (permutedData axes extreme middle).parentCenter (P := Fin (2*(extreme+middle)))
      (permutedData axes extreme middle).fineZ = axisLaw extreme middle (axes 2) := by
  rw [SplitRestrictionData.parentCenter_childLaw]
  change (permutedData axes extreme middle).parentLaw (P := Fin (2*(extreme+middle)))
    ((permutedData axes extreme middle).childLaw (fun child => oneLetterProfile (shapeZIndex child)
      (2*(permutedData axes extreme middle).split child))) = _
  rw [one_letter_childLaw, SplitRestrictionData.parentLaw_active _ (permuted_counts_symmetric axes extreme middle)]
  exact permuted_parent_law axes extreme middle positive 2

/-- Each permuted extraction input equals the physical constituent power with its complete fine windows. -/
theorem permuted_parent_interface (axes : Equiv.Perm (Fin 3)) (q extreme middle : ℕ)
    (positive : 0 < extreme+middle) (tolerance : ℝ) :
    (permutedData axes extreme middle).parentInterface (K := K) q
      ((permutedData axes extreme middle).parentWindow (P := Fin (2*(extreme+middle)))
        (permutedData axes extreme middle).fineX tolerance)
      ((permutedData axes extreme middle).parentWindow (P := Fin (2*(extreme+middle)))
        (permutedData axes extreme middle).fineY tolerance)
      ((permutedData axes extreme middle).parentWindow (P := Fin (2*(extreme+middle)))
        (permutedData axes extreme middle).fineZ tolerance) =
      Interface.windowedPower (P := Fin (2*(extreme+middle))) (constituent (K := K) q 2 (parent.permute axes))
        (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
        (axisLaw extreme middle (axes 0)) (axisLaw extreme middle (axes 1))
        (axisLaw extreme middle (axes 2)) tolerance := by
  letI : Nonempty (Fin (2*(extreme+middle))) := ⟨⟨0, by omega⟩⟩
  simp only [SplitRestrictionData.parentWindow, permuted_center_x axes extreme middle positive,
    permuted_center_y axes extreme middle positive, permuted_center_z axes extreme middle positive]
  funext x y z
  simp only [SplitRestrictionData.parentInterface, Interface.windowedPower,
    acceptedTensor, Interface.activeWithin_nonempty]
  rfl

/-- The shared terminal source is the heterogeneous product of these actual physical windows. -/
theorem permutedParentTensor_eq_windowed (axes : T → Equiv.Perm (Fin 3)) (q : ℕ)
    (extreme middle : T → ℕ) (positive : ∀ type, 0 < extreme type+middle type) (tolerance : ℝ) :
    permutedParentTensor (K := K) axes q extreme middle tolerance =
      Interface.heterogeneous (fun type => Interface.windowedPower (P := Fin (2*(extreme type+middle type)))
        (constituent (K := K) q 2 (parent.permute (axes type)))
        (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
        (axisLaw (extreme type) (middle type) (axes type 0))
        (axisLaw (extreme type) (middle type) (axes type 1))
        (axisLaw (extreme type) (middle type) (axes type 2)) tolerance) := by
  funext x y z
  apply Finset.prod_congr rfl
  intro type _
  exact congrFun (congrFun (congrFun
    (permuted_parent_interface (K := K) (axes type) q (extreme type) (middle type) (positive type) tolerance)
    (x type)) (y type)) (z type)

end
end MatrixBounds.Tensor.CW.Terminal
