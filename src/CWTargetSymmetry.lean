module

public import CWExtractedTargets
public import CWInterfaceSize

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The common child target has the exact group action and finite coordinate
growth required by simultaneous sparse repair. These are derived from its
labelled CW factors and the prescribed split counts. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric HashCounting Extraction
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P K Selected : Type*} [Fintype P] [CommRing K] [Fintype Selected] {length : ℕ}

/-- Independently permute positions inside every separately labelled child pool. -/
abbrev TargetGroup (data : SplitRestrictionData length) := ∀ child, Equiv.Perm (data.ChildPositions child)

omit [Fintype P] [CommRing K] [Fintype Selected] in
/-- The actual fine-part projection is equivariant for the independent child-pool permutation action. -/
theorem targetParts_equivariant (data : SplitRestrictionData length) (q : ℕ) (axis : Shape → ℕ)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (permutation : data.TargetGroup) (entries : data.TargetAxis q axis profile) :
    data.targetParts q axis profile (permutation • entries) = permutation • data.targetParts q axis profile entries := rfl

omit [Fintype P] [CommRing K] [Fintype Selected] in
/-- Every feasible fine part lies in a single transitive orbit of the actual target group. -/
theorem targetParts_transitive (data : SplitRestrictionData length)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) :
    MulAction.IsPretransitive data.TargetGroup (data.TargetParts profile) := Interface.product_action_transitive

omit [Fintype P] [Fintype Selected] in
/-- Simultaneous child-pool permutations are automorphisms of the common exact target tensor. -/
theorem target_invariant (data : SplitRestrictionData length) (q : ℕ) (permutation : data.TargetGroup)
    (x : data.TargetAxis q Shape.x data.fineX) (y : data.TargetAxis q Shape.y data.fineY)
    (z : data.TargetAxis q Shape.z data.fineZ) :
    data.target (K := K) q (permutation • x) (permutation • y) (permutation • z) = data.target (K := K) q x y z :=
  Interface.heterogeneous_invariant _
    (fun child => Interface.exact_invariant (constituent (K := K) q length child.val)
      (fun entry => fineWord entry.val) (fun entry => fineWord entry.val) (fun entry => fineWord entry.val)
      (data.fineX child) (data.fineY child) (data.fineZ child)) permutation x y z

omit [CommRing K] [Fintype Selected] in
/-- The total child coordinate length is exactly twice the child length times the parent population. -/
theorem child_volume (data : SplitRestrictionData length) (reference : data.PrescribedEdges (P := P)) :
    (∑ child, length*Fintype.card (data.ChildPositions child)) = 2*length*Fintype.card P := by
  have total := profile_total data.split (data.prescribedWord reference)
  simp only [ChildPositions, Fintype.card_fin]
  calc
    _ = (2*length)*(∑ child, data.split child) := by rw [Finset.mul_sum]; apply Finset.sum_congr rfl; intro child _; ring
    _ = _ := by rw [total]

omit [CommRing K] in
/-- Every selected prescribed family is bounded by the number of all complete child-shape words. -/
theorem selected_card_le (data : SplitRestrictionData length) (selected : Selected ↪ data.PrescribedEdges (P := P)) :
    Fintype.card Selected ≤ (Fintype.card (ShapeAlphabet (2*length)))^Fintype.card P := by
  have selectedBound := Fintype.card_le_of_injective _ selected.injective
  have typedBound := Fintype.card_le_of_injective _ (data.prescribedWord_injective (P := P))
  have allWords := Fintype.card_subtype_le (HasType (P := P) data.split)
  simpa only [Fintype.card_fun] using selectedBound.trans (typedBound.trans allWords)

/-- The whole selected batch has an explicit binary exponential bound on its coordinate cube. -/
theorem target_batch_cube_bound [Nonempty Selected] (data : SplitRestrictionData length)
    (selected : Selected ↪ data.PrescribedEdges (P := P)) (q bits edgeBits multiplier scale : ℕ)
    (alphabet : q+2 ≤ 2^bits) (shapes : Fintype.card (ShapeAlphabet (2*length)) ≤ 2^edgeBits)
    (population : Fintype.card P ≤ multiplier*scale) :
    Fintype.card ((Selected × data.TargetAxis q Shape.x data.fineX) ×
      (Selected × data.TargetAxis q Shape.y data.fineY) × (Selected × data.TargetAxis q Shape.z data.fineZ)) ≤
      2^((3*(edgeBits*multiplier)+3*bits*(2*length*multiplier))*scale) := by
  have edgeBound : Fintype.card Selected ≤ 2^((edgeBits*multiplier)*scale) := by
    apply (data.selected_card_le selected).trans
    calc
      _ ≤ (2^edgeBits)^Fintype.card P := Nat.pow_le_pow_left shapes _
      _ = 2^(edgeBits*Fintype.card P) := (pow_mul _ _ _).symm
      _ ≤ 2^((edgeBits*multiplier)*scale) := by
        apply Nat.pow_le_pow_right (by decide)
        simpa only [Nat.mul_assoc] using Nat.mul_le_mul_left edgeBits population
  have volume : (∑ child, length*Fintype.card (data.ChildPositions child)) ≤ (2*length*multiplier)*scale := by
    rw [data.child_volume (selected (Classical.choice inferInstance))]
    simpa only [Nat.mul_assoc] using Nat.mul_le_mul_left (2*length) population
  have bound := exact_batch_cube_bound (E := Selected) (q := q) (bits := bits) (scale := scale)
    (edgeGrowth := edgeBits*multiplier) (wordGrowth := 2*length*multiplier)
    (Positions := data.ChildPositions) (fun _ => length)
    (fun child => child.val.x) (fun child => child.val.y) (fun child => child.val.z)
    data.fineX data.fineY data.fineZ alphabet edgeBound volume
  simpa only [← Nat.card_eq_fintype_card] using bound

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
