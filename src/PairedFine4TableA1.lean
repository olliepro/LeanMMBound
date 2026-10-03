module

public import TerminalRateCertificateWindows
public import CertifiedLevel4Rate2

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1
open TerminalSourceNodeLookup SuppliedTerminalRates
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

/-- Unchanged complete original certificate slice. -/
def part000 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level42Block000.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part001 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level42Block001.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part002 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level42Block002.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part003 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level42Block003.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part004 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level42Block004.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part005 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level42Block005.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part006 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level42Block006.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part007 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level42Block007.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part008 : SourceTable IntegerLogTerm 361 :=
  SourceTable.ofList RateCertificateData.Level42Block008.terms (by decide)

/-- Every unchanged original certificate term, with balanced coordinate lookup. -/
def table : SourceTable IntegerLogTerm 4457 := (((part000).append (part001)).append ((part002).append (part003))).append (((part004).append (part005)).append ((part006).append ((part007).append (part008))))

attribute [local irreducible] integerLogValue

/-- Balanced lookup preserves the complete independently certified logarithmic value. -/
theorem table_value : integerLogValue table.entries = CertifiedLevel4Rate2.value := by
  simp (config := { maxSteps := 1000000 }) only [table, part000, part001, part002, part003, part004, part005, part006, part007, part008, RateCertificateData.Level42Block000.certificate, RateCertificateData.Level42Block001.certificate, RateCertificateData.Level42Block002.certificate, RateCertificateData.Level42Block003.certificate, RateCertificateData.Level42Block004.certificate, RateCertificateData.Level42Block005.certificate, RateCertificateData.Level42Block006.certificate, RateCertificateData.Level42Block007.certificate, RateCertificateData.Level42Block008.certificate, SourceTable.append, SourceTable.ofList,
    integerLogValue_append, CertifiedLevel4Rate2.value, CertifiedLevel4Rate2.blocks,
    certifiedBlocksValue, add_zero, add_assoc]

/-- Adjacent original-term window endpoints in complete source order. -/
def cuts : List ℕ := [0, 217, 450, 735, 994, 1355, 1601, 2094, 2434, 2753, 3137, 3440, 3891, 4177, 4380, 4457]
/-- Read a source-aligned endpoint. -/
def cut (index : ℕ) : ℕ := cuts[index]?.getD 0
/-- The source partition begins with the first certificate term. -/
theorem first : cut 0 = 0 := by decide +kernel
/-- The source partition ends after the last certificate term. -/
theorem last : cut 15 = 4457 := by decide +kernel
/-- Every consecutive window is ordered and adjacent. -/
theorem ordered : ∀ index : Fin 15, cut index.val ≤ cut (index.val+1) := by decide +kernel
/-- Complete original certificate window corresponding to one original source block. -/
def window (block : Fin 15) : RationalLogExpression :=
  certificateWindow table (cut block.val) (cut (block.val+1))
/-- Every original numerical term occurs in exactly one source-aligned window. -/
theorem windows_value : (∑ block, rationalLogValue (window block)) = CertifiedLevel4Rate2.value := by
  rw [← table_value]
  exact certificate_windows_value table cut first last
    (fun index present => ordered ⟨index, present⟩)

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1
