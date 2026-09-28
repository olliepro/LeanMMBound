import CWRootTargetMaps
import PooledMassEntropy

/-! Root target fine words have one exact global type. Joint position symmetry
therefore gives the root compatibility count directly, without parent windows. -/
namespace MatrixBounds.Empirical

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Forgetting sector labels sums their complete fine profiles to the global exact type. -/
theorem sectorCompatible_global_type {P Child B : Type*} [Fintype P] [Fintype Child] [Fintype B]
    (label : P → Child) (profile : Child → B → ℕ) (word : P → B) (typed : SectorCompatible label profile word) :
    HasType (fun symbol => ∑ child, profile child symbol) word := by
  have joint : HasType (fun pair : Child × B => profile pair.1 pair.2) (fun position => (label position, word position)) := by
    rintro ⟨child, symbol⟩
    rw [count_joint]
    exact typed child symbol
  have projected := hasType_projected (fun pair : Child × B => profile pair.1 pair.2)
    Prod.snd (fun position => (label position, word position)) joint
  have marginal : marginalProfile (fun pair : Child × B => profile pair.1 pair.2) Prod.snd =
      (fun symbol => ∑ child, profile child symbol) := by
    funext symbol
    simp [marginalProfile, Fintype.sum_prod_type]
  rwa [marginal] at projected

end
end MatrixBounds.Empirical

namespace MatrixBounds.Tensor.CW.RootRestrictionData

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P] {length : ℕ}

/-- Global complete fine profile of the root target after forgetting its labelled shape pools. -/
def globalProfile (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) : (Fin length → Fin 3) → ℕ :=
  fun symbol => ∑ child, profile child symbol

/-- Every regrouped root target fine word has this exact global profile. -/
theorem targetFine_hasType (data : RootRestrictionData length) (edge : TypedWord (P := P) data.split)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) (parts : data.TargetParts profile) :
    HasType (globalProfile profile) (data.targetFine edge profile parts) :=
  sectorCompatible_global_type edge.val profile _ (typePlacement_compatible data.split edge profile parts)

/-- A feasible target gives an actual word of the global root fine type. -/
def globalRepresentative (data : RootRestrictionData length) (edge : TypedWord (P := P) data.split)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) (parts : data.TargetParts profile) :
    TypedWord (P := P) (globalProfile profile) :=
  ⟨data.targetFine edge profile parts, data.targetFine_hasType edge profile parts⟩

/-- Position transitivity gives the exact root incidence identity between prescribed shapes and global fine words. -/
theorem fine_incidence_identity (data : RootRestrictionData length) (axis : Shape → ℕ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (reference : TypedWord (P := P) data.split) (fine : TypedWord (P := P) (globalProfile profile)) :
    Nat.card (TypedWord (P := P) (globalProfile profile)) *
      Nat.card {edge : TypedWord (P := P) data.split // compatibleFine axis axisClass profile edge.val fine.val} =
    Nat.card (TypedWord (P := P) data.split) *
      Nat.card {other : TypedWord (P := P) (globalProfile profile) // compatibleFine axis axisClass profile reference.val other.val} := by
  simpa only [← Nat.card_eq_fintype_card] using Selection.invariant_incidence_identity (G := Equiv.Perm P)
    (fun (edge : TypedWord (P := P) data.split) (word : TypedWord (P := P) (globalProfile profile)) =>
      compatibleFine axis axisClass profile edge.val word.val)
    (fun permutation edge word => compatibleFine_reorder axis axisClass profile edge.val word.val permutation) reference fine

/-- Dropping the global type and coarse-agreement conditions bounds the fixed-edge fine count by the pooled sector count. -/
theorem compatible_fine_count_le (data : RootRestrictionData length) (axis : Shape → ℕ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (reference : TypedWord (P := P) data.split) :
    Nat.card {fine : TypedWord (P := P) (globalProfile profile) // compatibleFine axis axisClass profile reference.val fine.val} ≤
      Nat.card {fine : P → Fin length → Fin 3 //
        SectorCompatible (fun position => axisClass (reference.val position)) (pooledProfile profile axisClass) fine} := by
  apply Nat.card_le_card_of_injective
    (fun fine : {fine : TypedWord (P := P) (globalProfile profile) // compatibleFine axis axisClass profile reference.val fine.val} =>
      (⟨fine.val.val, fine.property.2⟩ : {fine : P → Fin length → Fin 3 //
        SectorCompatible (fun position => axisClass (reference.val position)) (pooledProfile profile axisClass) fine}))
  intro left right same
  exact Subtype.ext (Subtype.ext (congrArg
    (fun fine : {fine : P → Fin length → Fin 3 //
      SectorCompatible (fun position => axisClass (reference.val position)) (pooledProfile profile axisClass) fine} => fine.val) same))

/-- The root's actual compatibility degree obeys the finite global-type versus pooled-sector count bound. -/
theorem fine_degree_product_bound (data : RootRestrictionData length) (axis : Shape → ℕ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (reference : TypedWord (P := P) data.split) (fine : TypedWord (P := P) (globalProfile profile)) :
    Nat.card (TypedWord (P := P) (globalProfile profile)) *
      Nat.card {edge : TypedWord (P := P) data.split // compatibleFine axis axisClass profile edge.val fine.val} ≤
    Nat.card (TypedWord (P := P) data.split) *
      Nat.card {word : P → Fin length → Fin 3 //
        SectorCompatible (fun position => axisClass (reference.val position)) (pooledProfile profile axisClass) word} := by
  rw [data.fine_incidence_identity axis axisClass profile reference fine]
  exact Nat.mul_le_mul_left _ (data.compatible_fine_count_le axis axisClass profile reference)

end
end MatrixBounds.Tensor.CW.RootRestrictionData
