import IndexedCertificateRows
import ParameterIndexData
import CertifiedTerminalParameters
import CertifiedRootParameters
import SuppliedShapeIndices
import Mathlib.Logic.Equiv.Fin.Basic

/-! Original array coordinates select the previously checked exact rows.
All shapes and role coordinates retain the source file's row-major order. -/
namespace MatrixBounds.Numeric.SuppliedParameters

open Tensor.CW
set_option maxRecDepth 100000
set_option maxHeartbeats 8000000

/-- Flatten two original array coordinates, with the final coordinate varying fastest. -/
def flat2 {first second : ℕ} (left : Fin first) (right : Fin second) : Fin (first*second) :=
  finProdFinEquiv (left, right)

/-- The flattened position has exactly the conventional row-major integer formula. -/
theorem flat2_val {first second : ℕ} (left : Fin first) (right : Fin second) :
    (flat2 left right).val = left.val*second+right.val := by
  change right.val+second*left.val = left.val*second+right.val
  ac_rfl

/-- Read the supplied root shape distribution and retain its independent row certificate. -/
def rootAlpha := IndexedCertificateRows.dyadic (ParameterIndexData.DyadicRootAlpha.table.get 0)

/-- The source-indexed root is exactly the row already used by the proved root extraction. -/
theorem rootAlpha_eq : rootAlpha.val = CertifiedRoot.row := by decide +kernel

/-- Strategy probabilities at a level-three parent node. -/
def strategies (node : Fin 945) :=
  IndexedCertificateRows.dyadic (ParameterIndexData.DyadicA3.table.get node)

/-- The original level-three contextual split for a node and one of its six strategies. -/
def alpha3 (node : Fin 945) (strategy : Fin 6) :=
  IndexedCertificateRows.split (ParameterIndexData.SplitAlpha3.table.get (flat2 node strategy))

/-- The original level-four contextual split for one of the 105 positive root children. -/
def alpha4 (node : Fin 105) :=
  IndexedCertificateRows.split (ParameterIndexData.SplitAlpha4.table.get node)

/-- Level-three physical role allocation, retaining both source node and strategy. -/
def allocation3 (node : Fin 945) (strategy : Fin 6) :=
  IndexedCertificateRows.dyadic (ParameterIndexData.DyadicAlloc3.table.get (flat2 node strategy))

/-- Level-four physical role allocation for each positive root child. -/
def allocation4 (node : Fin 105) :=
  IndexedCertificateRows.dyadic (ParameterIndexData.DyadicAlloc4.table.get node)

/-- The two supplied terminal role-distribution rows. -/
def terminalRoles (row : Fin 2) :=
  IndexedCertificateRows.dyadic (ParameterIndexData.DyadicTerminalroles.table.get row)

/-- Complete level-two zero-coordinate orbit masses, indexed by node, zero child, and strategy. -/
def zero2 (node : Fin 945) (child : Fin 12) (strategy : Fin 6) :=
  IndexedCertificateRows.dyadic (ParameterIndexData.DyadicLeafzero.table.get (flat2 (flat2 node child) strategy))

/-- Complete level-three zero-coordinate orbit masses in the original zero-node order. -/
def zero3 (node : Fin 840) :=
  IndexedCertificateRows.dyadic (ParameterIndexData.DyadicZero3.table.get node)

/-- Complete level-four zero-coordinate orbit masses in the original zero-child order. -/
def zero4 (child : Fin 48) :=
  IndexedCertificateRows.dyadic (ParameterIndexData.DyadicZero4.table.get child)

/-- Strictly positive level-three Gibbs potentials at a node, strategy, and physical axis. -/
def potential3 (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) :=
  IndexedCertificateRows.gibbs (ParameterIndexData.GibbsU3.table.get (flat2 (flat2 node strategy) axis))

/-- Strictly positive level-four Gibbs potentials at a node and physical axis. -/
def potential4 (node : Fin 105) (axis : Fin 3) :=
  IndexedCertificateRows.gibbs (ParameterIndexData.GibbsU4.table.get (flat2 node axis))

/-- Strictly positive root Gibbs potentials for the three physical axes. -/
def potentialRoot (axis : Fin 3) :=
  IndexedCertificateRows.gibbs (ParameterIndexData.GibbsUR.table.get axis)

/-- The original selected terminal role distribution, including all four exceptional policy entries. -/
def terminalRoleDistribution (node : Fin 945) (child : Fin 3) (strategy : Fin 6) :=
  terminalRoles (SuppliedShapeIndices.terminalPolicy (flat2 (flat2 node child) strategy))

/-- The original terminal parameter numerator, with node, positive child, and strategy coordinates. -/
def terminalNumerator (node : Fin 945) (child : Fin 3) (strategy : Fin 6) : ℕ :=
  TerminalParameterData.numerators[(flat2 (flat2 node child) strategy).val]'(by
    rw [TerminalParameterData.numerators_length]
    exact (flat2 (flat2 node child) strategy).isLt)

/-- Every selected terminal parameter is a member of the original checked data. -/
theorem terminalNumerator_mem (node : Fin 945) (child : Fin 3) (strategy : Fin 6) :
    terminalNumerator node child strategy ∈ TerminalParameterData.numerators :=
  List.getElem_mem _

/-- Every indexed terminal has positive integer extreme and middle split counts. -/
theorem terminalCounts_positive (node : Fin 945) (child : Fin 3) (strategy : Fin 6) :
    0 < terminalNumerator node child strategy ∧
      0 < TerminalParameterData.middleCount (terminalNumerator node child strategy) :=
  TerminalParameterData.split_counts_positive _ (terminalNumerator_mem node child strategy)

/-- Every indexed terminal has exactly the original common denominator population. -/
theorem terminalCounts_population (node : Fin 945) (child : Fin 3) (strategy : Fin 6) :
    2*(terminalNumerator node child strategy+
      TerminalParameterData.middleCount (terminalNumerator node child strategy)) = 17592186044416 :=
  TerminalParameterData.split_population _ (terminalNumerator_mem node child strategy)

end MatrixBounds.Numeric.SuppliedParameters
