module

public import SuppliedZeroLaws
public import PhysicalRoles
public import VerifiedZeroOrbitLaws
public import SuppliedLeafLaws

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact physical orientation of the supplied zero-coordinate laws. The
canonical axis order keeps the selected nonzero row and its complementary row. -/
namespace MatrixBounds.Numeric

open Tensor Tensor.CW Entropy
noncomputable section

/-- Move the selected positive axis to X and the selected zero axis to Z. -/
def zeroCanonicalOrder (zero positive : Fin 3) : AxisOrder :=
  if zero = 0 then if positive = 1 then .yzx else .zyx
  else if zero = 1 then if positive = 0 then .xzy else .zxy
  else if positive = 0 then .xyz else .yxz

/-- Canonical zero orientation selects the original positive axis, remaining axis, and zero axis exactly. -/
theorem zeroCanonicalOrder_axes : ∀ zero positive : Fin 3, zero ≠ positive →
    (zeroCanonicalOrder zero positive).permutation 0 = positive ∧
    (zeroCanonicalOrder zero positive).permutation 2 = zero ∧
    (zeroCanonicalOrder zero positive).permutation 1 ≠ zero ∧
    (zeroCanonicalOrder zero positive).permutation 1 ≠ positive := by decide

/-- The source's first-zero and first-positive axis selectors always select different positions. -/
theorem source_zero_positive_distinct (shape : Shape) :
    SuppliedLeafLaws.zeroAxis shape ≠ SuppliedLeafLaws.positiveAxis shape := by
  unfold SuppliedLeafLaws.zeroAxis SuppliedLeafLaws.positiveAxis
  split_ifs <;> simp_all

namespace TypedProbabilityRow

/-- The selected zero-axis mass is the exact singleton zero-orbit law. -/
theorem orientedOrbitMass_zero {orbits denominator : ℕ} (source : TypedProbabilityRow orbits denominator)
    (zeroOrbit : Fin orbits) (complement : Equiv.Perm (Fin orbits)) (zero positive : Fin 3) :
    source.orientedOrbitMass zeroOrbit complement zero positive zero =
      fun orbit => if orbit = zeroOrbit then 1 else 0 := by
  simp [orientedOrbitMass]

/-- The selected positive-axis mass is exactly the original supplied row. -/
theorem orientedOrbitMass_positive {orbits denominator : ℕ} (source : TypedProbabilityRow orbits denominator)
    (zeroOrbit : Fin orbits) (complement : Equiv.Perm (Fin orbits)) (zero positive : Fin 3)
    (different : zero ≠ positive) :
    source.orientedOrbitMass zeroOrbit complement zero positive positive = source.rational := by
  simp [orientedOrbitMass, Ne.symm different]

/-- The remaining physical axis uses exactly the supplied complement permutation. -/
theorem orientedOrbitMass_remaining {orbits denominator : ℕ} (source : TypedProbabilityRow orbits denominator)
    (zeroOrbit : Fin orbits) (complement : Equiv.Perm (Fin orbits)) (zero positive axis : Fin 3)
    (notZero : axis ≠ zero) (notPositive : axis ≠ positive) :
    source.orientedOrbitMass zeroOrbit complement zero positive axis = fun orbit => source.rational (complement orbit) := by
  simp only [orientedOrbitMass, if_neg notZero, if_neg notPositive]

/-- Canonical physical X is the exact expansion of the original supplied probability row. -/
theorem canonicalLaw_x {Word : Type*} [Fintype Word] {orbits denominator : ℕ}
    (source : TypedProbabilityRow orbits denominator) (partition : OrbitMap Word (Fin orbits))
    (zeroOrbit : Fin orbits) (complement : Equiv.Perm (Fin orbits)) (zero positive : Fin 3)
    (different : zero ≠ positive) :
    source.orientedLaw partition zeroOrbit complement zero positive ((zeroCanonicalOrder zero positive).permutation 0) =
      partition.decode (fun orbit => (source.rational orbit : ℝ)) := by
  rw [(zeroCanonicalOrder_axes zero positive different).1]
  unfold orientedLaw
  rw [source.orientedOrbitMass_positive zeroOrbit complement zero positive different]

/-- Canonical physical Y is the exact expansion of the complementary supplied probability row. -/
theorem canonicalLaw_y {Word : Type*} [Fintype Word] {orbits denominator : ℕ}
    (source : TypedProbabilityRow orbits denominator) (partition : OrbitMap Word (Fin orbits))
    (zeroOrbit : Fin orbits) (complement : Equiv.Perm (Fin orbits)) (zero positive : Fin 3)
    (different : zero ≠ positive) :
    source.orientedLaw partition zeroOrbit complement zero positive ((zeroCanonicalOrder zero positive).permutation 1) =
      partition.decode (fun orbit => (source.rational (complement orbit) : ℝ)) := by
  unfold orientedLaw
  rw [source.orientedOrbitMass_remaining zeroOrbit complement zero positive _
    (zeroCanonicalOrder_axes zero positive different).2.2.1 (zeroCanonicalOrder_axes zero positive different).2.2.2]

/-- Canonical physical Z is the exact singleton zero-orbit law before complete-word expansion. -/
theorem canonicalLaw_z {Word : Type*} [Fintype Word] {orbits denominator : ℕ}
    (source : TypedProbabilityRow orbits denominator) (partition : OrbitMap Word (Fin orbits))
    (zeroOrbit : Fin orbits) (complement : Equiv.Perm (Fin orbits)) (zero positive : Fin 3)
    (different : zero ≠ positive) :
    source.orientedLaw partition zeroOrbit complement zero positive ((zeroCanonicalOrder zero positive).permutation 2) =
      partition.decode (fun orbit => if orbit = zeroOrbit then 1 else 0) := by
  rw [(zeroCanonicalOrder_axes zero positive different).2.1]
  unfold orientedLaw
  rw [source.orientedOrbitMass_zero zeroOrbit complement zero positive]
  congr 1
  funext orbit
  by_cases same : orbit = zeroOrbit <;> simp [same]

end TypedProbabilityRow
end
end MatrixBounds.Numeric
