module

public import SuppliedDimensionCertificateCuts1
public import CertifiedDimensionRate1

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionCertificateTable1
open TerminalSourceNodeLookup SuppliedTerminalRates
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 4000000

/-- Unchanged complete original certificate slice. -/
def part000 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Dimension1Block000.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part001 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Dimension1Block001.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part002 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Dimension1Block002.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part003 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Dimension1Block003.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part004 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Dimension1Block004.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part005 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Dimension1Block005.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part006 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Dimension1Block006.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part007 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Dimension1Block007.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part008 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Dimension1Block008.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part009 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Dimension1Block009.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part010 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Dimension1Block010.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part011 : SourceTable IntegerLogTerm 331 :=
  SourceTable.ofList RateCertificateData.Dimension1Block011.terms (by decide)

/-- The original certificate terms, with balanced lookup and unchanged order. -/
def table : SourceTable IntegerLogTerm 5963 :=
  (((part000).append ((part001).append (part002))).append ((part003).append ((part004).append (part005)))).append (((part006).append ((part007).append (part008))).append ((part009).append ((part010).append (part011))))

/-- Balanced lookup retains exactly the complete independently certified logarithmic value. -/
theorem table_value : integerLogValue table.entries = CertifiedDimensionRate1.value := by
  simp only [table, part000, part001, part002, part003, part004, part005, part006, part007, part008, part009, part010, part011, RateCertificateData.Dimension1Block000.certificate, RateCertificateData.Dimension1Block001.certificate, RateCertificateData.Dimension1Block002.certificate, RateCertificateData.Dimension1Block003.certificate, RateCertificateData.Dimension1Block004.certificate, RateCertificateData.Dimension1Block005.certificate, RateCertificateData.Dimension1Block006.certificate, RateCertificateData.Dimension1Block007.certificate, RateCertificateData.Dimension1Block008.certificate, RateCertificateData.Dimension1Block009.certificate, RateCertificateData.Dimension1Block010.certificate, RateCertificateData.Dimension1Block011.certificate, SourceTable.append, SourceTable.ofList,
    integerLogValue_append, CertifiedDimensionRate1.value, CertifiedDimensionRate1.blocks,
    certifiedBlocksValue, add_zero, add_assoc]

/-- One complete contiguous window of the original dimension certificate. -/
def window (block : Fin 267) : RationalLogExpression :=
  certificateWindow table (SuppliedDimensionCertificateCuts1.cut block.val) (SuppliedDimensionCertificateCuts1.cut (block.val+1))

/-- All windows partition every original certificate term exactly once. -/
theorem windows_value : (∑ block, rationalLogValue (window block)) = CertifiedDimensionRate1.value := by
  rw [← table_value]
  exact certificate_windows_value table SuppliedDimensionCertificateCuts1.cut SuppliedDimensionCertificateCuts1.first SuppliedDimensionCertificateCuts1.last
    (fun index present => SuppliedDimensionCertificateCuts1.ordered ⟨index, present⟩)

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionCertificateTable1
