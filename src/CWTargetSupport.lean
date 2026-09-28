import CWTargetMaps
import CWTypedInterfaces

/-! Supported fine profiles ensure that every formal target part is realized
by physical CW coordinates and has its prescribed coarse label. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric HashCounting
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P : Type*} [Fintype P] {length : ℕ}

/-- Every supported fine part lifts to a physical target axis when the middle alphabet is nonempty. -/
theorem targetParts_surjective (data : SplitRestrictionData length) {q : ℕ} (positive : 0 < q)
    (axis : Shape → ℕ) (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (support : ∀ child block, fineTotal block ≠ axis child.val → profile child block = 0) :
    Function.Surjective (data.targetParts q axis profile) := by
  intro parts
  choose entries same using fun child => exact_part_surjective positive (profile child) (support child) (parts child)
  exact ⟨entries, funext same⟩

/-- Supported labelled target parts pass the actual full compatibility test of their prescribed edge. -/
theorem targetParts_compatible (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P)) (axis : Shape → ℕ)
    (additive : ∀ left right, axis (addShape left right) = axis left + axis right)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (support : ∀ child block, fineTotal block ≠ axis child.val → profile child block = 0)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length)) (parts : data.TargetParts profile) :
    compatibleFine length data.parent data.balanced axisClass (pooledProfile profile axisClass)
      (fun child => axis child.val) (data.word edge.val)
      ((data.targetPairing symmetric edge).parentFineWord length (fun child => (parts child).val)) := by
  obtain ⟨entries, rfl⟩ := data.targetParts_surjective (q := 1) (by omega) axis profile support parts
  rw [← data.targetAxis_fine symmetric edge 1 axis additive profile entries]
  exact data.targetAxis_compatible symmetric edge 1 axis additive profile axisClass entries

/-- In particular, each supported target part has the reference edge's required coarse word. -/
theorem targetParts_coarse (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P)) (axis : Shape → ℕ)
    (additive : ∀ left right, axis (addShape left right) = axis left + axis right)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (support : ∀ child block, fineTotal block ≠ axis child.val → profile child block = 0)
    (parts : data.TargetParts profile) :
    coarseAgreement (fun child => axis child.val)
      (fun word => fineTotal (fun i => word (Fin.castAdd length i))) (data.word edge.val)
      ((data.targetPairing symmetric edge).parentFineWord length (fun child => (parts child).val)) :=
  (data.targetParts_compatible symmetric edge axis additive profile support yClass parts).1

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
