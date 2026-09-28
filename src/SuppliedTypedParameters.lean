import SuppliedParameterRows
import SuppliedParameterChecks
import TypedParameterRows

/-! Concrete finite-alphabet parameters for the actual extraction theorems.
All normalization, support, symmetry, positivity, and width premises are discharged. -/
namespace MatrixBounds.Numeric.SuppliedTypedParameters

open Tensor.CW ParameterIndexMetadata SuppliedParameterChecks
noncomputable section

/-- The original root distribution on all 153 coarse length-eight shapes. -/
def rootDistribution : TypedProbabilityRow 153 17592186044416 where
  row := SuppliedParameters.rootAlpha.val
  accepted := SuppliedParameters.rootAlpha.property
  width_eq := dyadic_width ParameterIndexData.DyadicRootAlpha.table DyadicRootAlpha_metadata 0

/-- The original normalized six-strategy law at every level-three node. -/
def strategies (node : Fin 945) : TypedProbabilityRow 6 17592186044416 where
  row := (SuppliedParameters.strategies node).val
  accepted := (SuppliedParameters.strategies node).property
  width_eq := dyadic_width ParameterIndexData.DyadicA3.table DyadicA3_metadata node

/-- The original normalized six-role allocation at a level-three node and strategy. -/
def allocation3 (node : Fin 945) (strategy : Fin 6) : TypedProbabilityRow 6 17592186044416 where
  row := (SuppliedParameters.allocation3 node strategy).val
  accepted := (SuppliedParameters.allocation3 node strategy).property
  width_eq := dyadic_width ParameterIndexData.DyadicAlloc3.table DyadicAlloc3_metadata (SuppliedParameters.flat2 node strategy)

/-- The original normalized six-role allocation at every level-four node. -/
def allocation4 (node : Fin 105) : TypedProbabilityRow 6 17592186044416 where
  row := (SuppliedParameters.allocation4 node).val
  accepted := (SuppliedParameters.allocation4 node).property
  width_eq := dyadic_width ParameterIndexData.DyadicAlloc4.table DyadicAlloc4_metadata node

/-- Either original normalized terminal role-distribution row on three physical roles. -/
def terminalRoles (row : Fin 2) : TypedProbabilityRow 3 17592186044416 where
  row := (SuppliedParameters.terminalRoles row).val
  accepted := (SuppliedParameters.terminalRoles row).property
  width_eq := dyadic_width ParameterIndexData.DyadicTerminalroles.table DyadicTerminalroles_metadata row

/-- The exact original terminal role allocation, retaining the four exceptional policy choices. -/
def terminalRoleDistribution (node : Fin 945) (child : Fin 3) (strategy : Fin 6) :
    TypedProbabilityRow 3 17592186044416 :=
  terminalRoles (SuppliedShapeIndices.terminalPolicy (SuppliedParameters.flat2 (SuppliedParameters.flat2 node child) strategy))

/-- Complete supplied two-letter zero-coordinate law on all six actual fine-word orbits. -/
def zero2 (node : Fin 945) (child : Fin 12) (strategy : Fin 6) : TypedProbabilityRow 6 17592186044416 where
  row := (SuppliedParameters.zero2 node child strategy).val
  accepted := (SuppliedParameters.zero2 node child strategy).property
  width_eq := dyadic_width ParameterIndexData.DyadicLeafzero.table DyadicLeafzero_metadata
    (SuppliedParameters.flat2 (SuppliedParameters.flat2 node child) strategy)

/-- Complete supplied four-letter zero-coordinate law on all 21 actual fine-word orbits. -/
def zero3 (node : Fin 840) : TypedProbabilityRow 21 17592186044416 where
  row := (SuppliedParameters.zero3 node).val
  accepted := (SuppliedParameters.zero3 node).property
  width_eq := dyadic_width ParameterIndexData.DyadicZero3.table DyadicZero3_metadata node

/-- Complete supplied eight-letter zero-coordinate law on all 231 actual fine-word orbits. -/
def zero4 (child : Fin 48) : TypedProbabilityRow 231 17592186044416 where
  row := (SuppliedParameters.zero4 child).val
  accepted := (SuppliedParameters.zero4 child).property
  width_eq := dyadic_width ParameterIndexData.DyadicZero4.table DyadicZero4_metadata child

/-- An actual supported symmetric level-three extraction split at every supplied node and strategy. -/
def level3Split (node : Fin 945) (strategy : Fin 6) : RationalSplit 2 17592186044416 :=
  RationalSplit.ofChecked (SuppliedParameters.alpha3 node strategy).val
    (SuppliedParameters.alpha3 node strategy).property
    (split_total ParameterIndexData.SplitAlpha3.table SplitAlpha3_metadata (SuppliedParameters.flat2 node strategy))

/-- An actual supported symmetric level-four extraction split at every supplied positive root child. -/
def level4Split (node : Fin 105) : RationalSplit 4 17592186044416 :=
  RationalSplit.ofChecked (SuppliedParameters.alpha4 node).val
    (SuppliedParameters.alpha4 node).property
    (split_total ParameterIndexData.SplitAlpha4.table SplitAlpha4_metadata node)

/-- Strictly positive original Gibbs potentials on all five child coordinates at level three. -/
def potential3 (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) : TypedGibbsRow 5 where
  row := (SuppliedParameters.potential3 node strategy axis).val
  accepted := (SuppliedParameters.potential3 node strategy axis).property
  width_eq := gibbs_width ParameterIndexData.GibbsU3.table GibbsU3_metadata
    (SuppliedParameters.flat2 (SuppliedParameters.flat2 node strategy) axis)

/-- Strictly positive original Gibbs potentials on all nine child coordinates at level four. -/
def potential4 (node : Fin 105) (axis : Fin 3) : TypedGibbsRow 9 where
  row := (SuppliedParameters.potential4 node axis).val
  accepted := (SuppliedParameters.potential4 node axis).property
  width_eq := gibbs_width ParameterIndexData.GibbsU4.table GibbsU4_metadata (SuppliedParameters.flat2 node axis)

/-- Strictly positive original Gibbs potentials on all seventeen root coordinates. -/
def potentialRoot (axis : Fin 3) : TypedGibbsRow 17 where
  row := (SuppliedParameters.potentialRoot axis).val
  accepted := (SuppliedParameters.potentialRoot axis).property
  width_eq := gibbs_width ParameterIndexData.GibbsUR.table GibbsUR_metadata axis

/-- Every indexed level-three split supplies an actual graph reference at every divisible population. -/
theorem level3Split_reference (node : Fin 945) (strategy : Fin 6) {size : ℕ}
    (divisible : 17592186044416 ∣ size) :
    Nonempty (((level3Split node strategy).data size).PrescribedEdges (P := Fin size)) :=
  (level3Split node strategy).reference divisible

/-- Every indexed level-four split supplies an actual graph reference at every divisible population. -/
theorem level4Split_reference (node : Fin 105) {size : ℕ} (divisible : 17592186044416 ∣ size) :
    Nonempty (((level4Split node).data size).PrescribedEdges (P := Fin size)) :=
  (level4Split node).reference divisible

end
end MatrixBounds.Numeric.SuppliedTypedParameters
