import SuppliedLeafLaws
import ZeroOrbitLawData
import VerifiedOrbitSupportTables
import FiniteIndexBlockComposition

/-! Exact coarse support of the higher zero-coordinate rows at their original
source positions, using the actual complete fine-orbit total statistics. -/
namespace MatrixBounds.Numeric.SuppliedZeroSupport

open SuppliedLeafLaws
set_option maxRecDepth 100000
set_option maxHeartbeats 32000000

/-- The exact original shape named by a zero-coordinate level-three hierarchy node. -/
def shape3 (node : Fin 840) : Shape :=
  SuppliedShapeIndices.shapeAt 8 (SuppliedShapeIndices.zeroNode node).child

/-- The original zero-coordinate root-child shape at its source zero-column index. -/
def shape4 (child : Fin 48) : Shape :=
  SuppliedShapeIndices.shapeAt 16 ((SuppliedShapeIndices.childColumns 16 false)[child.val]?.getD 0)

/-- Actual source zero row and the coarse total of its first nonzero physical coordinate. -/
def entry3 (node : Fin 840) : ZeroOrbitRow :=
  ⟨(SuppliedTypedParameters.zero3 node).row, Shape.coordinates (shape3 node) (positiveAxis (shape3 node))⟩

/-- Actual source root zero row and the coarse total of its first nonzero physical coordinate. -/
def entry4 (child : Fin 48) : ZeroOrbitRow :=
  ⟨(SuppliedTypedParameters.zero4 child).row, Shape.coordinates (shape4 child) (positiveAxis (shape4 child))⟩

/-- Decidable complete validity and exact coarse support of one supplied level-three zero row. -/
def valid3 (node : Fin 840) : Prop := (entry3 node).check 21 17592186044416 OrbitLevel3.totalAt = true

/-- Complete source-row support at positions zero through 127. -/
theorem block000 : IndexBlockCertificate valid3 0 128 := ⟨by decide +kernel, by unfold valid3; decide +kernel⟩

/-- Complete source-row support at positions 128 through 255. -/
theorem block001 : IndexBlockCertificate valid3 128 128 := ⟨by decide +kernel, by unfold valid3; decide +kernel⟩

/-- Complete source-row support at positions 256 through 383. -/
theorem block002 : IndexBlockCertificate valid3 256 128 := ⟨by decide +kernel, by unfold valid3; decide +kernel⟩

/-- Complete source-row support at positions 384 through 511. -/
theorem block003 : IndexBlockCertificate valid3 384 128 := ⟨by decide +kernel, by unfold valid3; decide +kernel⟩

/-- Complete source-row support at positions 512 through 639. -/
theorem block004 : IndexBlockCertificate valid3 512 128 := ⟨by decide +kernel, by unfold valid3; decide +kernel⟩

/-- Complete source-row support at positions 640 through 767. -/
theorem block005 : IndexBlockCertificate valid3 640 128 := ⟨by decide +kernel, by unfold valid3; decide +kernel⟩

/-- Complete source-row support at the remaining original positions 768 through 839. -/
theorem block006 : IndexBlockCertificate valid3 768 72 := ⟨by decide +kernel, by unfold valid3; decide +kernel⟩

/-- All 840 original higher zero rows have exact normalized probability and actual coarse support. -/
theorem complete3 : IndexBlockCertificate valid3 0 840 :=
  (((((block000.append block001).append block002).append block003).append block004).append block005).append block006

/-- Every source root zero row has the required exact coarse support and probability normalization. -/
theorem checked4 : ∀ child : Fin 48, (entry4 child).check 231 17592186044416 OrbitLevel4.totalAt = true := by decide +kernel

end MatrixBounds.Numeric.SuppliedZeroSupport
