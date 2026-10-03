module

public import SuppliedTerminalLaws
public import CWTerminalRateScaling
public import PhysicalRoles

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Original terminal labels and integer counts at every common scale retain
the supplied complete parent laws, physical roles, and exact population weights. -/
namespace MatrixBounds.Numeric.SuppliedTerminalScaling

open Tensor Tensor.CW Tensor.CW.Terminal Entropy
noncomputable section

/-- One original terminal parameter label retains its node, positive child, and strategy positions. -/
structure Source where
  node : Fin 945
  child : Fin 3
  strategy : Fin 6
  deriving DecidableEq, Fintype

/-- Original exact extreme split count at a source terminal label. -/
def extreme (source : Source) : ℕ := SuppliedTerminalLaws.extreme source.node source.child source.strategy

/-- Original exact middle split count at a source terminal label. -/
def middle (source : Source) : ℕ := SuppliedTerminalLaws.middle source.node source.child source.strategy

/-- Both actual original split counts are strictly positive. -/
theorem positive (source : Source) : 0 < extreme source ∧ 0 < middle source :=
  SuppliedTerminalLaws.counts_positive source.node source.child source.strategy

/-- Every original source terminal has precisely the common dyadic population. -/
theorem population (source : Source) : 2*(extreme source+middle source) = 17592186044416 :=
  SuppliedParameters.terminalCounts_population source.node source.child source.strategy

/-- Repeating the source terminal yields exactly the specified integer population coefficient. -/
theorem repeated_population (source : Source) (repetitions : ℕ) :
    2*(repetitions*extreme source+repetitions*middle source) = 17592186044416*repetitions := by
  rw [population_scale, population, Nat.mul_comm]

/-- Every positive repetition preserves the exact original rational terminal parameter. -/
theorem repeated_parameter (source : Source) (repetitions : ℕ) (repeatedPositive : 0 < repetitions) :
    parameter (repetitions*extreme source) (repetitions*middle source) =
      (SuppliedTerminalLaws.mu source.node source.child source.strategy : ℝ) := by
  rw [parameter_scale _ _ _ repeatedPositive]
  exact SuppliedTerminalLaws.parameter_exact source.node source.child source.strategy

/-- Physical terminal roles compose the original positive-child orientation with the selected extraction role. -/
def axes (source : Source) (role : AxisOrder) : Equiv.Perm (Fin 3) :=
  SuppliedTerminalLaws.childAxes source.child*role.permutation

/-- Complete original terminal laws remain exactly the genuine integer extraction parent centers in every physical role and scale. -/
theorem repeated_parent_law (source : Source) (role : AxisOrder) (repetitions : ℕ)
    (repeatedPositive : 0 < repetitions) (axis : Fin 3) :
    (permutedData (axes source role) (repetitions*extreme source) (repetitions*middle source)).parentLaw
      (P := Fin (2*(repetitions*extreme source+repetitions*middle source)))
      (fun child => oneLetterLaw (shapeCoordinate child axis)) =
      OrbitLevel2.orbits.decode (fun orbit =>
        (SuppliedTerminalLaws.mass source.node source.child source.strategy (role.permutation axis) orbit : ℝ)) := by
  have sumPositive : 0 < repetitions*extreme source+repetitions*middle source :=
    Nat.add_pos_left (Nat.mul_pos repeatedPositive (positive source).1) _
  rw [permuted_parent_orbits _ _ _ sumPositive, repeated_parameter source repetitions repeatedPositive,
    SuppliedTerminalLaws.mass_cast]
  rfl

end
end MatrixBounds.Numeric.SuppliedTerminalScaling
