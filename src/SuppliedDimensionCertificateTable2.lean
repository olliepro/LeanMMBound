import SuppliedDimensionCertificateCuts2
import CertifiedDimensionRate2

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionCertificateTable2
open TerminalSourceNodeLookup SuppliedTerminalRates
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 4000000

/-- Unchanged complete original certificate slice. -/
def part000 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Dimension2Block000.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part001 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Dimension2Block001.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part002 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Dimension2Block002.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part003 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Dimension2Block003.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part004 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Dimension2Block004.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part005 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Dimension2Block005.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part006 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Dimension2Block006.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part007 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Dimension2Block007.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part008 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Dimension2Block008.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part009 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Dimension2Block009.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part010 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Dimension2Block010.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part011 : SourceTable IntegerLogTerm 358 :=
  SourceTable.ofList RateCertificateData.Dimension2Block011.terms (by decide)

/-- The original certificate terms, with balanced lookup and unchanged order. -/
def table : SourceTable IntegerLogTerm 5990 :=
  (((part000).append ((part001).append (part002))).append ((part003).append ((part004).append (part005)))).append (((part006).append ((part007).append (part008))).append ((part009).append ((part010).append (part011))))

/-- Balanced lookup retains exactly the complete independently certified logarithmic value. -/
theorem table_value : integerLogValue table.entries = CertifiedDimensionRate2.value := by
  simp only [table, part000, part001, part002, part003, part004, part005, part006, part007, part008, part009, part010, part011, RateCertificateData.Dimension2Block000.certificate, RateCertificateData.Dimension2Block001.certificate, RateCertificateData.Dimension2Block002.certificate, RateCertificateData.Dimension2Block003.certificate, RateCertificateData.Dimension2Block004.certificate, RateCertificateData.Dimension2Block005.certificate, RateCertificateData.Dimension2Block006.certificate, RateCertificateData.Dimension2Block007.certificate, RateCertificateData.Dimension2Block008.certificate, RateCertificateData.Dimension2Block009.certificate, RateCertificateData.Dimension2Block010.certificate, RateCertificateData.Dimension2Block011.certificate, SourceTable.append, SourceTable.ofList,
    integerLogValue_append, CertifiedDimensionRate2.value, CertifiedDimensionRate2.blocks,
    certifiedBlocksValue, add_zero, add_assoc]

/-- One complete contiguous window of the original dimension certificate. -/
def window (block : Fin 267) : RationalLogExpression :=
  certificateWindow table (SuppliedDimensionCertificateCuts2.cut block.val) (SuppliedDimensionCertificateCuts2.cut (block.val+1))

/-- All windows partition every original certificate term exactly once. -/
theorem windows_value : (∑ block, rationalLogValue (window block)) = CertifiedDimensionRate2.value := by
  rw [← table_value]
  exact certificate_windows_value table SuppliedDimensionCertificateCuts2.cut SuppliedDimensionCertificateCuts2.first SuppliedDimensionCertificateCuts2.last
    (fun index present => SuppliedDimensionCertificateCuts2.ordered ⟨index, present⟩)

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionCertificateTable2
