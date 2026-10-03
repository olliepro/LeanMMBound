module

public import CWRootFineTypes
public import CWRootFineCollisions

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Finite degree bounds for the root's actual coarse and fine collision
events. Fine maxima only range over the proved global exact fine profile. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

open Empirical Numeric HashCounting
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P] {length prime : ℕ}
variable [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- Maximum complete root graph degree above any coarse X vertex. -/
def coarseDegree (data : RootRestrictionData length) : ℕ :=
  Finset.univ.sup (fun reference : data.Edges (P := P) => Nat.card {other : data.Edges (P := P) //
    marginalX splitXIndex splitYIndex splitZIndex (data.coarse 0) (data.coarse 1) (data.coarse 2) other =
      marginalX splitXIndex splitYIndex splitZIndex (data.coarse 0) (data.coarse 1) (data.coarse 2) reference})

/-- Maximum prescribed root compatibility degree at its fixed complete fine profile. -/
def fineDegree (data : RootRestrictionData length) (axis : Shape → ℕ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) : ℕ :=
  Finset.univ.sup (fun fine : TypedWord (P := P) (globalProfile profile) =>
    Nat.card {edge : TypedWord (P := P) data.split // compatibleFine axis axisClass profile edge.val fine.val})

/-- The degree of every actual global fine word is bounded by this finite maximum. -/
theorem degree_le_fineDegree (data : RootRestrictionData length) (axis : Shape → ℕ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (fine : TypedWord (P := P) (globalProfile profile)) :
    Nat.card {edge : TypedWord (P := P) data.split // compatibleFine axis axisClass profile edge.val fine.val} ≤
      data.fineDegree (P := P) axis axisClass profile :=
  Finset.le_sup (f := fun fine : TypedWord (P := P) (globalProfile profile) =>
    Nat.card {edge : TypedWord (P := P) data.split // compatibleFine axis axisClass profile edge.val fine.val}) (Finset.mem_univ fine)

/-- The actual coarse collision probability uses the maximum complete root graph degree. -/
theorem uniform_coarse_collision_count (data : RootRestrictionData length) (reference : data.PrescribedEdges (P := P))
    (large : 2*length < prime) (bucket : ZMod prime) :
    Nat.card {seed : WordBucket reference.val.val bucket // data.coarseCollision seed.val reference.val} * prime ≤
      data.coarseDegree (P := P)*Nat.card (WordBucket reference.val.val bucket) := by
  apply (data.actual_coarse_collision_count reference.val large bucket).trans
  apply Nat.mul_le_mul_right
  exact Finset.le_sup (f := fun reference : data.Edges (P := P) => Nat.card {other : data.Edges (P := P) //
    marginalX splitXIndex splitYIndex splitZIndex (data.coarse 0) (data.coarse 1) (data.coarse 2) other =
      marginalX splitXIndex splitYIndex splitZIndex (data.coarse 0) (data.coarse 1) (data.coarse 2) reference})
    (Finset.mem_univ reference.val)

/-- Every exact Y target part has collision probability bounded by the maximum root fine degree over the same global type. -/
theorem uniform_y_collision_count (data : RootRestrictionData length) (reference : data.PrescribedEdges (P := P))
    (support : ∀ child block, fineTotal block ≠ child.val.y → data.fineY child block = 0)
    (parts : data.TargetParts data.fineY) (large : 2*length < prime) (bucket : ZMod prime) :
    Nat.card {seed : WordBucket reference.val.val bucket // data.targetHoles seed.val reference Shape.y yClass data.fineY parts} * prime ≤
      data.fineDegree (P := P) Shape.y yClass data.fineY*Nat.card (WordBucket reference.val.val bucket) := by
  have bound := data.actual_y_collision_count reference
    (data.targetFine (data.prescribedWordEquiv reference) data.fineY parts)
    (data.targetParts_compatible (data.prescribedWordEquiv reference) Shape.y data.fineY support parts yClass).1 large bucket
  exact bound.trans (Nat.mul_le_mul_right _ (data.degree_le_fineDegree Shape.y yClass data.fineY
    (data.globalRepresentative (data.prescribedWordEquiv reference) data.fineY parts)))

/-- The Z collision bound uses the same seed and its corresponding actual fixed-type maximum. -/
theorem uniform_z_collision_count (data : RootRestrictionData length) (reference : data.PrescribedEdges (P := P))
    (support : ∀ child block, fineTotal block ≠ child.val.z → data.fineZ child block = 0)
    (parts : data.TargetParts data.fineZ) (large : 2*length < prime) (bucket : ZMod prime) :
    Nat.card {seed : WordBucket reference.val.val bucket // data.targetHoles seed.val reference Shape.z zClass data.fineZ parts} * prime ≤
      data.fineDegree (P := P) Shape.z zClass data.fineZ*Nat.card (WordBucket reference.val.val bucket) := by
  have bound := data.actual_z_collision_count reference
    (data.targetFine (data.prescribedWordEquiv reference) data.fineZ parts)
    (data.targetParts_compatible (data.prescribedWordEquiv reference) Shape.z data.fineZ support parts zClass).1 large bucket
  exact bound.trans (Nat.mul_le_mul_right _ (data.degree_le_fineDegree Shape.z zClass data.fineZ
    (data.globalRepresentative (data.prescribedWordEquiv reference) data.fineZ parts)))

end
end MatrixBounds.Tensor.CW.RootRestrictionData
