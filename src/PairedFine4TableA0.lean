module

public import TerminalRateCertificateWindows
public import CertifiedLevel4Rate1

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA0
open TerminalSourceNodeLookup SuppliedTerminalRates
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

/-- Unchanged complete original certificate slice. -/
def part000 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level41Block000.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part001 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level41Block001.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part002 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level41Block002.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part003 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level41Block003.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part004 : SourceTable IntegerLogTerm 241 :=
  SourceTable.ofList RateCertificateData.Level41Block004.terms (by decide)

/-- Every unchanged original certificate term, with balanced coordinate lookup. -/
def table : SourceTable IntegerLogTerm 2289 := ((part000).append (part001)).append ((part002).append ((part003).append (part004)))

attribute [local irreducible] integerLogValue

/-- Balanced lookup preserves the complete independently certified logarithmic value. -/
theorem table_value : integerLogValue table.entries = CertifiedLevel4Rate1.value := by
  simp (config := { maxSteps := 1000000 }) only [table, part000, part001, part002, part003, part004, RateCertificateData.Level41Block000.certificate, RateCertificateData.Level41Block001.certificate, RateCertificateData.Level41Block002.certificate, RateCertificateData.Level41Block003.certificate, RateCertificateData.Level41Block004.certificate, SourceTable.append, SourceTable.ofList,
    integerLogValue_append, CertifiedLevel4Rate1.value, CertifiedLevel4Rate1.blocks,
    certifiedBlocksValue, add_zero, add_assoc]

/-- Adjacent original-term window endpoints in complete source order. -/
def cuts : List ℕ := [0, 67, 109, 195, 227, 393, 473, 633, 907, 1154, 1432, 1738, 1907, 2126, 2230, 2289]
/-- Read a source-aligned endpoint. -/
def cut (index : ℕ) : ℕ := cuts[index]?.getD 0
/-- The source partition begins with the first certificate term. -/
theorem first : cut 0 = 0 := by decide +kernel
/-- The source partition ends after the last certificate term. -/
theorem last : cut 15 = 2289 := by decide +kernel
/-- Every consecutive window is ordered and adjacent. -/
theorem ordered : ∀ index : Fin 15, cut index.val ≤ cut (index.val+1) := by decide +kernel
/-- Complete original certificate window corresponding to one original source block. -/
def window (block : Fin 15) : RationalLogExpression :=
  certificateWindow table (cut block.val) (cut (block.val+1))
/-- Every original numerical term occurs in exactly one source-aligned window. -/
theorem windows_value : (∑ block, rationalLogValue (window block)) = CertifiedLevel4Rate1.value := by
  rw [← table_value]
  exact certificate_windows_value table cut first last
    (fun index present => ordered ⟨index, present⟩)

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA0
