module

public import SuppliedTypedParameters
public import SuppliedTerminalLaws
public import SuppliedChildKinds
public import VerifiedOrbitComplements
public import ShapeAlphabet
public import CWRationalProbabilityTotals

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Actual complete leaf and level-three parent laws built from the original
indexed inputs. No distribution or coordinate-range premise remains in their definitions. -/
namespace MatrixBounds.Numeric.SuppliedLeafLaws

open Tensor.CW Entropy
open scoped BigOperators
noncomputable section

/-- The first zero coordinate in the original source axis order. -/
def zeroAxis (shape : Shape) : Fin 3 :=
  if shape.x = 0 then 0 else if shape.y = 0 then 1 else 2

/-- The first positive coordinate in the original source axis order. -/
def positiveAxis (shape : Shape) : Fin 3 :=
  if 0 < shape.x then 0 else if 0 < shape.y then 1 else 2

/-- Exact supplied zero-leaf masses, including the actual complementary orbit permutation. -/
def zeroMass (node : Fin 945) (child : Fin 12) (strategy : Fin 6) (shape : Shape) (axis : Fin 3) : Fin 6 → ℚ :=
  if axis = zeroAxis shape then fun orbit => if orbit = 0 then 1 else 0
  else if axis = positiveAxis shape then (SuppliedTypedParameters.zero2 node child strategy).rational
  else fun orbit => (SuppliedTypedParameters.zero2 node child strategy).rational (OrbitLevel2.complement orbit)

/-- Every physical coordinate of every supplied zero leaf has a normalized nonnegative orbit law. -/
theorem zeroMass_valid (node : Fin 945) (child : Fin 12) (strategy : Fin 6) (shape : Shape) (axis : Fin 3) :
    (∀ orbit, 0 ≤ (zeroMass node child strategy shape axis orbit : ℝ)) ∧
      ∑ orbit, (zeroMass node child strategy shape axis orbit : ℝ) = 1 := by
  unfold zeroMass
  split_ifs
  · constructor
    · intro orbit
      dsimp
      split_ifs <;> norm_num
    · norm_num [Fin.sum_univ_succ]
  · exact ⟨fun orbit => ((SuppliedTypedParameters.zero2 node child strategy).real_range (by decide) orbit).1,
      (SuppliedTypedParameters.zero2 node child strategy).real_total (by decide)⟩
  · constructor
    · intro orbit
      exact ((SuppliedTypedParameters.zero2 node child strategy).real_range (by decide) _).1
    · exact (Equiv.sum_comp OrbitLevel2.complement
        (fun orbit => ((SuppliedTypedParameters.zero2 node child strategy).rational orbit : ℝ))).trans
        ((SuppliedTypedParameters.zero2 node child strategy).real_total (by decide))

/-- The original complete orbit law at every level-two child shape and physical axis. -/
def mass (node : Fin 945) (strategy : Fin 6) (child : ShapeAlphabet 4) (axis : Fin 3) : Fin 6 → ℚ :=
  match SuppliedChildKinds.kind2 ((shapeColumnEquiv 4).symm child) with
  | Sum.inl zero => zeroMass node zero strategy child.val axis
  | Sum.inr positive => SuppliedTerminalLaws.mass node positive strategy axis

/-- All complete child shapes have actual normalized nonnegative source orbit laws. -/
theorem mass_valid (node : Fin 945) (strategy : Fin 6) (child : ShapeAlphabet 4) (axis : Fin 3) :
    (∀ orbit, 0 ≤ (mass node strategy child axis orbit : ℝ)) ∧
      ∑ orbit, (mass node strategy child axis orbit : ℝ) = 1 := by
  unfold mass
  cases SuppliedChildKinds.kind2 ((shapeColumnEquiv 4).symm child) with
  | inl zero => exact zeroMass_valid node zero strategy child.val axis
  | inr positive => exact SuppliedTerminalLaws.mass_valid node positive strategy axis

/-- The actual complete two-letter fine law obtained by expanding the verified orbit partition. -/
def law (node : Fin 945) (strategy : Fin 6) (child : ShapeAlphabet 4) (axis : Fin 3) : (Fin 2 → Fin 3) → ℝ :=
  OrbitLevel2.orbits.decode (fun orbit => (mass node strategy child axis orbit : ℝ))

/-- Every supplied complete leaf fine-law coordinate lies in the unit interval. -/
theorem law_range (node : Fin 945) (strategy : Fin 6) (child : ShapeAlphabet 4) (axis : Fin 3)
    (word : Fin 2 → Fin 3) : 0 ≤ law node strategy child axis word ∧ law node strategy child axis word ≤ 1 := by
  obtain ⟨nonnegative, normalized⟩ := mass_valid node strategy child axis
  apply OrbitLevel2.orbits.decode_unit_range _ _ word
  intro orbit
  refine ⟨nonnegative orbit, ?_⟩
  rw [← normalized]
  exact Finset.single_le_sum (fun index _ => nonnegative index) (Finset.mem_univ orbit)

/-- The supplied complete fine law is normalized over actual two-letter words. -/
theorem law_total (node : Fin 945) (strategy : Fin 6) (child : ShapeAlphabet 4) (axis : Fin 3) :
    (∑ word, law node strategy child axis word) = 1 := by
  rw [law, OrbitMap.decode_total]
  exact (mass_valid node strategy child axis).2

/-- The actual complete level-three parent law for one original node and strategy. -/
def parent3 (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) : (Fin 4 → Fin 3) → ℝ :=
  (SuppliedTypedParameters.level3Split node strategy).parentLaw (fun child => law node strategy child axis)

/-- Actual independent parent formation preserves every required fine-law coordinate bound. -/
theorem parent3_range (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) (word : Fin 4 → Fin 3) :
    0 ≤ parent3 node strategy axis word ∧ parent3 node strategy axis word ≤ 1 :=
  (SuppliedTypedParameters.level3Split node strategy).parentLaw_range (by decide)
    (fun child => law node strategy child axis) (fun child => law_range node strategy child axis) word

/-- Every actual supplied level-three parent has unit total probability on complete four-letter words. -/
theorem parent3_total (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) :
    (∑ word, parent3 node strategy axis word) = 1 :=
  (SuppliedTypedParameters.level3Split node strategy).parentLaw_total (by decide)
    (fun child => law node strategy child axis) (fun child => law_total node strategy child axis)

/-- The exact original six-strategy mixture for a level-three hierarchy node. -/
def mixed3 (node : Fin 945) (axis : Fin 3) (word : Fin 4 → Fin 3) : ℝ :=
  ∑ strategy, ((SuppliedTypedParameters.strategies node).rational strategy : ℝ)*parent3 node strategy axis word

/-- The supplied strategy mixture satisfies the coordinate bounds required by the next actual extraction stage. -/
theorem mixed3_range (node : Fin 945) (axis : Fin 3) (word : Fin 4 → Fin 3) :
    0 ≤ mixed3 node axis word ∧ mixed3 node axis word ≤ 1 :=
  supplied_mixture_range (SuppliedTypedParameters.strategies node) (by decide)
    (fun strategy => parent3 node strategy axis) (fun strategy => parent3_range node strategy axis) word

/-- The complete original strategy mixture is normalized over actual four-letter words. -/
theorem mixed3_total (node : Fin 945) (axis : Fin 3) :
    (∑ word, mixed3 node axis word) = 1 :=
  supplied_mixture_total (SuppliedTypedParameters.strategies node) (by decide)
    (fun strategy => parent3 node strategy axis) (fun strategy => parent3_total node strategy axis)

end
end MatrixBounds.Numeric.SuppliedLeafLaws
