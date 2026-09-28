import CWRationalOrientedParents
import CWRoleWindowRegions
import SixfoldComposition

/-! One actual rational extraction can be routed through all six physical
regions and restored to full original child windows, preserving every label. -/
namespace MatrixBounds.Tensor.CW.Mixed

universe v
open Empirical Numeric Interface
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K T : Type} [CommRing K] [Fintype T] {length : T → ℕ} {denominator : ℕ}

/-- The six source copies with every allocated original parent window kept separate. -/
def sixfoldParent (splits : ∀ type, RationalSplit (length type) denominator) (weight : T → ℕ) (size q : ℕ)
    (law : ∀ type, Fin 3 → ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
    (tolerance : T → ℝ) :=
  heterogeneous (fun source : AxisOrder => heterogeneous (fun type : T =>
    orientedSourceWindow (K := K) (Positions := fun label => Fin (weight label*size))
      q (fun label => length label+length label) (fun label => (splits label).parent)
      (fun label axis => (splits label).parentLaw (law label axis)) tolerance source type))

/-- All actual original children in six source copies, retaining their parent and complete population labels. -/
def sixfoldChildren (splits : ∀ type, RationalSplit (length type) denominator) (weight : T → ℕ) (size q : ℕ)
    (law : ∀ type, Fin 3 → ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
    (tolerance : T → ℝ) :=
  heterogeneous (fun source : AxisOrder => heterogeneous (fun index : ChildIndex length =>
    orientedSourceWindow (K := K)
      (Positions := fun label : ChildIndex length => Fin ((splits label.1).childWeight (weight label.1) label.2*size))
      q (fun label => length label.1) (fun label => label.2.val)
      (fun label axis => law label.1 axis label.2) (fun label => tolerance label.1) source index))

/-- Actual shared extraction in the physical roles composes with the sixfold source and child interfaces.
The resulting tensors retain every old source label and every new independent copy label. -/
theorem sixfold_role_extraction (splits : ∀ type, RationalSplit (length type) denominator)
    (role : T → AxisOrder) (weight : T → ℕ) (size q : ℕ)
    (law : ∀ type, Fin 3 → ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
    (wide delta : T → ℝ) (copies cost : ℕ)
    (extraction : ContextReduction.{v}
      (rationalParent (K := K) (fun type => (splits type).permute (role type).permutation) weight size q
        (roleLaw role law 0) (roleLaw role law 1) (roleLaw role law 2) wide)
      (directSum (fun _ : Fin copies => rationalChildren (K := K)
        (fun type => (splits type).permute (role type).permutation) weight size q
        (roleLaw role law 0) (roleLaw role law 1) (roleLaw role law 2) delta)) cost) :
    ContextReduction.{v} (sixfoldParent (K := K) splits weight size q law wide)
      (directSum (fun _ : Fin (copies^6) => sixfoldChildren (K := K) splits weight size q law delta)) (cost^6) := by
  rw [roleParent_eq] at extraction
  have before := (sixfoldRegionRestriction (K := K) (Positions := fun label => Fin (weight label*size))
    q (fun label => length label+length label) (fun label => (splits label).parent)
    (fun label axis => (splits label).parentLaw (law label axis)) wide role).context
  have restoreChildren := (roleChildrenRestriction (K := K) splits role weight size q law delta).context.sixfold
  have restoreSources := (sixfoldRegionInverseRestriction (K := K)
    (Positions := fun label : ChildIndex length => Fin ((splits label.1).childWeight (weight label.1) label.2*size))
    q (fun label => length label.1) (fun label => label.2.val)
    (fun label axis => law label.1 axis label.2) (fun label => delta label.1) (fun label => role label.1)).context
  have combined := before.trans (extraction.sixfold_extraction.trans ((restoreChildren.trans restoreSources).batch))
  simpa only [one_pow, one_mul, mul_one] using combined

end
end MatrixBounds.Tensor.CW.Mixed
