module

public import CWMixedExtractedTargets
public import CWTargetSymmetry

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The heterogeneous target has an actual transitive fine-part symmetry and
uniform exponential coordinate growth for simultaneous sparse repair. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric HashCounting Extraction
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T K Selected : Type*} [Fintype T] [CommRing K] [Fintype Selected]
variable {Positions : T → Type*} [∀ type, Fintype (Positions type)] {length : T → ℕ}

/-- Independently permute every labelled child pool of every parent type. -/
abbrev TargetGroup (data : ∀ type, SplitRestrictionData (length type)) := ∀ type, (data type).TargetGroup

omit [Fintype T] [CommRing K] [Fintype Selected] in
/-- Projection to the heterogeneous fine parts commutes with the actual product permutation action. -/
theorem targetParts_equivariant (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ) (axis : Shape → ℕ)
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (permutation : TargetGroup data) (entries : TargetAxis data q axis profile) :
    targetParts data q axis profile (permutation • entries) = permutation • targetParts data q axis profile entries := rfl

omit [Fintype T] [CommRing K] [Fintype Selected] in
/-- All global fine parts form one transitive orbit of this product action. -/
theorem targetParts_transitive (data : ∀ type, SplitRestrictionData (length type))
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ) :
    MulAction.IsPretransitive (TargetGroup data) (TargetParts data profile) := by
  letI : ∀ type, MulAction.IsPretransitive (data type).TargetGroup ((data type).TargetParts (profile type)) :=
    fun type => (data type).targetParts_transitive (profile type)
  exact Interface.product_action_transitive

omit [Fintype Selected] in
/-- The global permutation action preserves every coefficient of the actual heterogeneous child target. -/
theorem target_invariant (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ) (permutation : TargetGroup data)
    (x : TargetAxis data q Shape.x (fun type => (data type).fineX))
    (y : TargetAxis data q Shape.y (fun type => (data type).fineY))
    (z : TargetAxis data q Shape.z (fun type => (data type).fineZ)) :
    target (K := K) data q (permutation • x) (permutation • y) (permutation • z) = target (K := K) data q x y z :=
  Interface.heterogeneous_invariant _ (fun type => (data type).target_invariant q) permutation x y z

omit [CommRing K] [Fintype Selected] in
/-- Products of binary exponential bounds have the sum of the exponents. -/
theorem product_binary_bound (size exponent : T → ℕ) (scale : ℕ) (bound : ∀ type, size type ≤ 2^(exponent type*scale)) :
    (∏ type, size type) ≤ 2^((∑ type, exponent type)*scale) := by
  calc
    _ ≤ ∏ type, 2^(exponent type*scale) := Finset.prod_le_prod' (fun type _ => bound type)
    _ = _ := by rw [Finset.prod_pow_eq_pow_sum, Finset.sum_mul]

omit [CommRing K] [Fintype Selected] in
/-- Every global target axis has an explicit binary exponent, uniformly over all fine profiles. -/
theorem target_axis_binary_bound (data : ∀ type, SplitRestrictionData (length type))
    (reference : PrescribedEdges Positions data) (q bits scale : ℕ) (multiplier : T → ℕ) (axis : Shape → ℕ)
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (alphabet : q+2 ≤ 2^bits) (population : ∀ type, Fintype.card (Positions type) ≤ multiplier type*scale) :
    Fintype.card (TargetAxis data q axis profile) ≤ 2^((∑ type, bits*(2*length type*multiplier type))*scale) := by
  rw [Fintype.card_pi]
  apply product_binary_bound _ _ scale
  intro type
  have volume : (∑ child, length type*Fintype.card ((data type).ChildPositions child)) ≤
      (2*length type*multiplier type)*scale := by
    rw [(data type).child_volume (reference type)]
    simpa only [Nat.mul_assoc] using Nat.mul_le_mul_left (2*length type) (population type)
  have bound := exact_axis_binary_bound (Positions := (data type).ChildPositions)
    (fun _ => length type) (fun child => axis child.val) (profile type) alphabet volume
  simpa only [← Nat.card_eq_fintype_card, Nat.mul_assoc] using bound

omit [CommRing K] in
/-- Selected global prescribed edges have the sum of the complete-word coordinate exponents. -/
theorem selected_binary_bound (data : ∀ type, SplitRestrictionData (length type))
    (selected : Selected ↪ PrescribedEdges Positions data) (edgeBits multiplier : T → ℕ) (scale : ℕ)
    (shapes : ∀ type, Fintype.card (ShapeAlphabet (2*length type)) ≤ 2^(edgeBits type))
    (population : ∀ type, Fintype.card (Positions type) ≤ multiplier type*scale) :
    Fintype.card Selected ≤ 2^((∑ type, edgeBits type*multiplier type)*scale) := by
  apply (Fintype.card_le_of_injective _ selected.injective).trans
  rw [Fintype.card_pi]
  apply product_binary_bound _ _ scale
  intro type
  apply ((data type).selected_card_le (Function.Embedding.refl ((data type).PrescribedEdges (P := Positions type)))).trans
  calc
    _ ≤ (2^(edgeBits type))^Fintype.card (Positions type) := Nat.pow_le_pow_left (shapes type) _
    _ = 2^(edgeBits type*Fintype.card (Positions type)) := (pow_mul _ _ _).symm
    _ ≤ _ := Nat.pow_le_pow_right (by decide) (by
      simpa only [Nat.mul_assoc] using Nat.mul_le_mul_left (edgeBits type) (population type))

omit [CommRing K] in
/-- The entire selected heterogeneous target batch has the explicit coordinate-cube bound needed by repair. -/
theorem target_batch_cube_bound [Nonempty Selected] (data : ∀ type, SplitRestrictionData (length type))
    (selected : Selected ↪ PrescribedEdges Positions data) (q bits scale : ℕ) (edgeBits multiplier : T → ℕ)
    (alphabet : q+2 ≤ 2^bits) (shapes : ∀ type, Fintype.card (ShapeAlphabet (2*length type)) ≤ 2^(edgeBits type))
    (population : ∀ type, Fintype.card (Positions type) ≤ multiplier type*scale) :
    Fintype.card ((Selected × TargetAxis data q Shape.x (fun type => (data type).fineX)) ×
      (Selected × TargetAxis data q Shape.y (fun type => (data type).fineY)) ×
      (Selected × TargetAxis data q Shape.z (fun type => (data type).fineZ))) ≤
      2^((3*(∑ type, edgeBits type*multiplier type)+3*(∑ type, bits*(2*length type*multiplier type)))*scale) := by
  let reference := selected (Classical.choice inferInstance)
  have edgeBound := selected_binary_bound data selected edgeBits multiplier scale shapes population
  have bx := Nat.mul_le_mul edgeBound (target_axis_binary_bound data reference q bits scale multiplier Shape.x
    (fun type => (data type).fineX) alphabet population)
  have by_ := Nat.mul_le_mul edgeBound (target_axis_binary_bound data reference q bits scale multiplier Shape.y
    (fun type => (data type).fineY) alphabet population)
  have bz := Nat.mul_le_mul edgeBound (target_axis_binary_bound data reference q bits scale multiplier Shape.z
    (fun type => (data type).fineZ) alphabet population)
  have combined := Nat.mul_le_mul bx (Nat.mul_le_mul by_ bz)
  simp only [Fintype.card_prod]
  convert combined using 1
  simp only [← pow_add]
  congr 1
  ring

end
end MatrixBounds.Tensor.CW.Mixed
