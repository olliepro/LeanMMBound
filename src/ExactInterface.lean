import EmpiricalTypes
import TensorSymmetry

/-! Exact empirical interfaces for tensor powers with arbitrary variable parts.
A part may contain several variables: symmetry acts on positions, not on the
individual symbols inside a part. -/
namespace MatrixBounds.Interface

open Tensor Empirical
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P X B : Type*} [Fintype P]

/-- Variables of a tensor power restricted by the empirical type of their part labels. -/
def Variable (part : X → B) (profile : B → ℕ) :=
  {word : P → X // HasType profile (fun p => part (word p))}

/-- The exact part-word containing a variable of the interface. -/
def partWord (part : X → B) (profile : B → ℕ) (entry : Variable (P := P) part profile) :
    TypedWord (P := P) profile := ⟨fun p => part (entry.val p), entry.property⟩

/-- Permuting factor positions preserves the interface's part-type restriction. -/
instance variableAction (part : X → B) (profile : B → ℕ) :
    MulAction (Equiv.Perm P) (Variable (P := P) part profile) where
  smul permutation entry := ⟨reorder permutation entry.val, fun symbol =>
    (count_reorder permutation (fun p => part (entry.val p)) symbol).trans
      (entry.property symbol)⟩
  one_smul entry := by apply Subtype.ext; rfl
  mul_smul left right entry := by apply Subtype.ext; rfl

omit [Fintype P] in
/-- The variable-to-part map commutes with position permutations. -/
theorem partWord_equivariant (part : X → B) (profile : B → ℕ)
    (permutation : Equiv.Perm P) (entry : Variable (P := P) part profile) :
    partWord part profile (permutation • entry) = permutation • partWord part profile entry := rfl

/-- The variables form a finite set whenever the underlying alphabet is finite. -/
instance variableFintype [Fintype X] (part : X → B) (profile : B → ℕ) :
    Fintype (Variable (P := P) part profile) := inferInstanceAs (Fintype {word : P → X //
      HasType profile (fun p => part (word p))})

variable {K Y Z BY BZ : Type*} [CommSemiring K]

/-- An exact interface is a tensor power whose axis variables satisfy fixed part profiles. -/
def exact (source : Coeff K X Y Z)
    (partX : X → B) (partY : Y → BY) (partZ : Z → BZ)
    (profileX : B → ℕ) (profileY : BY → ℕ) (profileZ : BZ → ℕ) :
    Coeff K (Variable (P := P) partX profileX) (Variable (P := P) partY profileY)
      (Variable (P := P) partZ profileZ) :=
  fun x y z => ∏ p, source (x.val p) (y.val p) (z.val p)

/-- Simultaneous permutations of factor positions are automorphisms of an exact interface. -/
theorem exact_invariant (source : Coeff K X Y Z)
    (partX : X → B) (partY : Y → BY) (partZ : Z → BZ)
    (profileX : B → ℕ) (profileY : BY → ℕ) (profileZ : BZ → ℕ)
    (permutation : Equiv.Perm P)
    (x : Variable (P := P) partX profileX) (y : Variable (P := P) partY profileY)
    (z : Variable (P := P) partZ profileZ) :
    exact source partX partY partZ profileX profileY profileZ
      (permutation • x) (permutation • y) (permutation • z) =
    exact source partX partY partZ profileX profileY profileZ x y z := by
  exact Equiv.prod_comp permutation.symm (fun p => source (x.val p) (y.val p) (z.val p))

open MatrixBounds.Symmetry RepairRates Tensor.Repair

/-- Exact empirical interfaces satisfy the symmetry hypotheses needed for sparse-hole repair.
Only feasibility of each profile, its hole count, and the explicit size bound remain inputs. -/
theorem exact_sparse_repair [Fintype X] [Fintype Y] [Fintype Z]
    [Fintype B] [Fintype BY] [Fintype BZ] [DecidableEq P]
    (source : Coeff K X Y Z)
    (partX : X → B) (partY : Y → BY) (partZ : Z → BZ)
    (profileX : B → ℕ) (profileY : BY → ℕ) (profileZ : BZ → ℕ)
    [Nonempty (TypedWord (P := P) profileX)]
    [Nonempty (TypedWord (P := P) profileY)]
    [Nonempty (TypedWord (P := P) profileZ)]
    (holesX : TypedWord (P := P) profileX → Prop)
    (holesY : TypedWord (P := P) profileY → Prop)
    (holesZ : TypedWord (P := P) profileZ → Prop)
    (growth k rank : ℕ) (large : 2 ≤ k)
    (smallX : Nat.card {b // holesX b} * scale k ^ 2 ≤ Fintype.card (TypedWord (P := P) profileX))
    (smallY : Nat.card {b // holesY b} * scale k ^ 2 ≤ Fintype.card (TypedWord (P := P) profileY))
    (smallZ : Nat.card {b // holesZ b} * scale k ^ 2 ≤ Fintype.card (TypedWord (P := P) profileZ))
    (size : Fintype.card (Variable (P := P) partX profileX ×
      Variable (P := P) partY profileY × Variable (P := P) partZ profileZ) ≤
      2 ^ (growth * scale k))
    (budget : RankLE (broken (exact source partX partY partZ profileX profileY profileZ)
      (keepPart holesX (partWord partX profileX))
      (keepPart holesY (partWord partY profileY))
      (keepPart holesZ (partWord partZ profileZ)) (1 : Equiv.Perm P)) rank) :
    RankLE (exact (P := P) source partX partY partZ profileX profileY profileZ)
      (2 ^ (3 * coverLength growth k) * rank) := by
  classical
  exact Tensor.Symmetry.symmetric_repair_rank
    (exact source partX partY partZ profileX profileY profileZ)
    (partWord partX profileX) (partWord partY profileY) (partWord partZ profileZ)
    (partWord_equivariant partX profileX) (partWord_equivariant partY profileY)
    (partWord_equivariant partZ profileZ)
    (exact_invariant source partX partY partZ profileX profileY profileZ)
    holesX holesY holesZ growth k rank large smallX smallY smallZ size budget

end
end MatrixBounds.Interface
