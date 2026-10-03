module

public import SuppliedHigherOrbitMass
public import CertifiedRootParameters
public import CWRootRationalExtraction

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Actual unrestricted-root extraction with all supplied distributions,
physical axes, Gibbs positivity, and fine-law range conditions instantiated. -/
namespace MatrixBounds.Numeric.SuppliedRootStage

universe v
open Tensor Tensor.CW Entropy Empirical RepairRates
open scoped BigOperators
noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 8000000

/-- The source verifier orders its root physical roles as X, Z, Y. -/
def axes : Equiv.Perm (Fin 3) := Equiv.swap 1 2

/-- Original root-child law expressed in the verifier's actual physical root roles. -/
def law (axis : Fin 3) (child : ShapeAlphabet 16) : (Fin 8 → Fin 3) → ℝ :=
  SuppliedHigherLaws.root4 ((shapeAlphabetPermutation axes 16).symm child) (axes axis)

/-- Exact rational root-child masses in the same physical order as the checked root numerators. -/
def mass (axis : Fin 3) (child : ShapeAlphabet 16) : Fin 231 → ℚ :=
  SuppliedHigherOrbitMass.root4 ((shapeAlphabetPermutation axes 16).symm child) (axes axis)

/-- The rational physical root masses represent exactly the actual complete root-child laws. -/
theorem law_decode (axis : Fin 3) (child : ShapeAlphabet 16) :
    law axis child = OrbitLevel4.orbits.decode (fun orbit => (mass axis child orbit : ℝ)) :=
  SuppliedHigherOrbitMass.root4_decode _ _

/-- Every complete physical root-child fine-law coordinate is bounded. -/
theorem law_range (axis : Fin 3) (child : ShapeAlphabet 16) (word : Fin 8 → Fin 3) :
    0 ≤ law axis child word ∧ law axis child word ≤ 1 := SuppliedHigherLaws.root4_range _ _ _

/-- Every complete physical root-child fine law has unit probability mass. -/
theorem law_total (axis : Fin 3) (child : ShapeAlphabet 16) :
    (∑ word, law axis child word) = 1 := SuppliedHigherLaws.root4_total _ _

/-- The original exact Gibbs potential in the same root physical-axis order. -/
def potential (axis : Fin 3) (coordinate : Fin 17) : ℝ :=
  ((SuppliedTypedParameters.potentialRoot (axes axis)).rational coordinate : ℝ)

/-- All concrete root Gibbs potentials are strictly positive. -/
theorem potential_positive (axis : Fin 3) (coordinate : Fin 17) : 0 < potential axis coordinate :=
  (SuppliedTypedParameters.potentialRoot (axes axis)).rational_positive coordinate

/-- Exact root retention for the actual source law and its checked positive Gibbs potentials. -/
def retention : ℝ :=
  RootRestrictionData.rationalRetention (length := 8) CertifiedRoot.numerator 17592186044416
    (potential 0) (potential 1) (potential 2) (law 1) (law 2)

/-- The concrete root shape alphabet meets the eight-bit extraction encoding bound. -/
theorem shape_card_bound : Fintype.card (ShapeAlphabet 16) ≤ 2^8 := by
  rw [Fintype.card_congr (shapeColumnEquiv 16).symm, Fintype.card_fin]
  decide

/-- Supplied root data yield an actual contextual tensor extraction for all sufficiently large divisible scales.
Only the arbitrary positive asymptotic losses and the scalar coefficient ring are parameters. -/
theorem eventual_extraction {K : Type*} [CommRing K]
    {degreeError copyError costError : ℝ}
    (degreePositive : 0 < degreeError) (copyPositive : 0 < copyError) (costPositive : 0 < costError) :
    ∃ threshold : ℕ, ∃ delta > 0, ∀ k : ℕ, threshold ≤ k → 17592186044416 ∣ scale k →
      ∃ copies overhead : ℕ,
        Real.exp ((retention-degreeError-copyError)*scale k) ≤ copies ∧
        (overhead : ℝ) ≤ Real.exp (costError*scale k) ∧
        ContextReduction.{v} (rootPower (K := K) (P := Fin (scale k)) 5 8)
          (directSum (fun _ : Fin copies =>
            (CertifiedRoot.data (scale k)).approximateTarget (K := K) 5 (law 0) (law 1) (law 2) delta)) overhead :=
  RootRestrictionData.eventual_rational_extraction.{v} 8 5 3 8 16 17592186044416
    (by decide) shape_card_bound (by decide) (by decide)
    CertifiedRoot.numerator CertifiedRoot.numerator_total (by decide)
    (potential 0) (potential 1) (potential 2)
    (potential_positive 0) (potential_positive 1) (potential_positive 2)
    (law 0) (law 1) (law 2) (law_range 1) (law_range 2)
    degreePositive copyPositive costPositive

end
end MatrixBounds.Numeric.SuppliedRootStage
