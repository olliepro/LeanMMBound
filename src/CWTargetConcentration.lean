import CWTargetOwnership
import RepairedTargets

/-! The actual common target's parent holes satisfy the same explicit integer
bound for every prescribed edge. The mixture center is independent of which
coarse split word realizes its fixed split profile. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric HashCounting Extraction Sampling
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P : Type*} [Fintype P] {length : ℕ}

/-- The parent fine distribution obtained by independently concatenating the prescribed child-pool laws. -/
def parentCenter (data : SplitRestrictionData length)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (word : Fin (length+length) → Fin 3) : ℝ :=
  ∑ child, ((data.split child : ℝ)/Fintype.card P) *
    (((profile child (leftHalf word) : ℝ)/(2*data.split child)) *
      ((profile (complementEquiv data.parent (2*length) data.balanced child) (rightHalf word) : ℝ)/
        (2*data.split (complementEquiv data.parent (2*length) data.balanced child))))

/-- Every prescribed pairing has exactly the same independent-concatenation center. -/
theorem parentCenter_eq (data : SplitRestrictionData length) (edge : data.PrescribedEdges (P := P))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) :
    complementaryParentCenter (Positions := data.ChildPositions) length
      (complementEquiv data.parent (2*length) data.balanced) (data.word edge.val) profile =
        data.parentCenter (P := P) profile := by
  funext word
  exact complementaryParentCenter_eq length (complementEquiv data.parent (2*length) data.balanced)
    data.split (data.prescribedWord edge) profile word

/-- One constant bounds the integer parent-hole count for every prescribed edge and every feasible child profile. -/
theorem parentHole_bound [Nonempty P] (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P)) (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (representative : data.TargetParts profile) {tolerance : ℝ} (positive : 0 < tolerance)
    (scale multiplier : ℕ) (population : scale ≤ multiplier*Fintype.card P) :
    Nat.card {parts // data.parentHole symmetric edge profile (Within (data.parentCenter (P := P) profile) tolerance) parts} * scale ≤
      ⌈((Fintype.card (Fin (length+length) → Fin 3) : ℝ)*13*Fintype.card (ShapeAlphabet (2*length)))*multiplier/tolerance^2⌉₊ *
        Fintype.card (data.TargetParts profile) := by
  have bound := complementary_parent_repair_bound length
    (complementEquiv data.parent (2*length) data.balanced) data.split symmetric (data.prescribedWord edge)
    profile representative positive scale multiplier population
  simp only [prescribedWord] at bound
  rw [data.parentCenter_eq edge profile] at bound
  simpa only [← Nat.card_eq_fintype_card] using bound

/-- Enlarging the accepted parent window can only decrease its actual target-hole count. -/
theorem parentHole_mono (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P)) (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (narrow wide : (P → Fin (length+length) → Fin 3) → Prop)
    (includes : ∀ fine, narrow fine → wide fine) :
    Nat.card {parts // data.parentHole symmetric edge profile wide parts} ≤
      Nat.card {parts // data.parentHole symmetric edge profile narrow parts} := by
  simp only [Nat.card_eq_fintype_card]
  apply Fintype.card_subtype_mono
  intro parts outside inside
  exact outside (includes _ inside)

/-- Adding the selected inverse-scale collision holes costs only one more unit in the repair constant. -/
theorem targetHoles_bound {prime : ℕ} [Fact prime.Prime]
    (data : SplitRestrictionData length) (symmetric : data.Symmetric) (seed : Seed (ZMod prime) P)
    (edge : data.PrescribedEdges (P := P)) (axis : Shape → ℕ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (accept : (P → Fin (length+length) → Fin 3) → Prop) (scale constant : ℕ)
    (parentBound : Nat.card {parts // data.parentHole symmetric edge profile accept parts}*scale ≤
      constant*Fintype.card (data.TargetParts profile))
    (collisionBound : Nat.card {parts : data.TargetParts profile //
      data.fineCollision seed axis axisClass profile edge.val
        ((data.targetPairing symmetric edge).parentFineWord length (fun child => (parts child).val))}*scale ≤
      Fintype.card (data.TargetParts profile)) :
    Nat.card {parts // data.targetHoles symmetric seed edge axis axisClass profile accept parts}*scale ≤
      (constant+1)*Fintype.card (data.TargetParts profile) :=
  Selection.union_holes_bound _ _ scale constant parentBound collisionBound

/-- Collision bounds are needed only for parts inside the parent window; outside parts are already parent holes. -/
theorem targetHoles_windowed_bound {prime : ℕ} [Fact prime.Prime]
    (data : SplitRestrictionData length) (symmetric : data.Symmetric) (seed : Seed (ZMod prime) P)
    (edge : data.PrescribedEdges (P := P)) (axis : Shape → ℕ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (accept : (P → Fin (length+length) → Fin 3) → Prop) (scale constant : ℕ)
    (parentBound : Nat.card {parts // data.parentHole symmetric edge profile accept parts}*scale ≤
      constant*Fintype.card (data.TargetParts profile))
    (collisionBound : Nat.card {parts : data.TargetParts profile //
      ¬data.parentHole symmetric edge profile accept parts ∧ data.fineCollision seed axis axisClass profile edge.val
        ((data.targetPairing symmetric edge).parentFineWord length (fun child => (parts child).val))}*scale ≤
      Fintype.card (data.TargetParts profile)) :
    Nat.card {parts // data.targetHoles symmetric seed edge axis axisClass profile accept parts}*scale ≤
      (constant+1)*Fintype.card (data.TargetParts profile) := by
  have bound := Selection.union_holes_bound _ _ scale constant parentBound collisionBound
  have same : Nat.card {parts // data.targetHoles symmetric seed edge axis axisClass profile accept parts} =
      Nat.card {parts : data.TargetParts profile // data.parentHole symmetric edge profile accept parts ∨
        (¬data.parentHole symmetric edge profile accept parts ∧ data.fineCollision seed axis axisClass profile edge.val
          ((data.targetPairing symmetric edge).parentFineWord length (fun child => (parts child).val)))} := by
    apply Nat.card_congr (Equiv.subtypeEquivRight ?_)
    intro parts
    unfold targetHoles
    tauto
  rwa [same]

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
