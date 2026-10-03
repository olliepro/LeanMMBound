module

public import TerminalRateCertificateWindows
public import CertifiedLevel3Rate1

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine3TableA0
open TerminalSourceNodeLookup SuppliedTerminalRates
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

/-- Unchanged complete original certificate slice. -/
def part000 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block000.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part001 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block001.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part002 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block002.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part003 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block003.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part004 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block004.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part005 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block005.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part006 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block006.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part007 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block007.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part008 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block008.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part009 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block009.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part010 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block010.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part011 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block011.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part012 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block012.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part013 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block013.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part014 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block014.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part015 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block015.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part016 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block016.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part017 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block017.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part018 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block018.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part019 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block019.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part020 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block020.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part021 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block021.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part022 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block022.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part023 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block023.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part024 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block024.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part025 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block025.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part026 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block026.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part027 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block027.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part028 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block028.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part029 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block029.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part030 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block030.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part031 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block031.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part032 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block032.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part033 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block033.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part034 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block034.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part035 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block035.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part036 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block036.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part037 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block037.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part038 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block038.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part039 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block039.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part040 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block040.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part041 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block041.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part042 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block042.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part043 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block043.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part044 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block044.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part045 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block045.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part046 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level31Block046.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part047 : SourceTable IntegerLogTerm 477 :=
  SourceTable.ofList RateCertificateData.Level31Block047.terms (by decide)

/-- Every unchanged original certificate term, with balanced coordinate lookup. -/
def table : SourceTable IntegerLogTerm 24541 := (((((part000).append ((part001).append (part002))).append ((part003).append ((part004).append (part005)))).append (((part006).append ((part007).append (part008))).append ((part009).append ((part010).append (part011))))).append ((((part012).append ((part013).append (part014))).append ((part015).append ((part016).append (part017)))).append (((part018).append ((part019).append (part020))).append ((part021).append ((part022).append (part023)))))).append (((((part024).append ((part025).append (part026))).append ((part027).append ((part028).append (part029)))).append (((part030).append ((part031).append (part032))).append ((part033).append ((part034).append (part035))))).append ((((part036).append ((part037).append (part038))).append ((part039).append ((part040).append (part041)))).append (((part042).append ((part043).append (part044))).append ((part045).append ((part046).append (part047))))))

attribute [local irreducible] integerLogValue

/-- Balanced lookup preserves the complete independently certified logarithmic value. -/
theorem table_value : integerLogValue table.entries = CertifiedLevel3Rate1.value := by
  simp (config := { maxSteps := 1000000 }) only [table, part000, part001, part002, part003, part004, part005, part006, part007, part008, part009, part010, part011, part012, part013, part014, part015, part016, part017, part018, part019, part020, part021, part022, part023, part024, part025, part026, part027, part028, part029, part030, part031, part032, part033, part034, part035, part036, part037, part038, part039, part040, part041, part042, part043, part044, part045, part046, part047, RateCertificateData.Level31Block000.certificate, RateCertificateData.Level31Block001.certificate, RateCertificateData.Level31Block002.certificate, RateCertificateData.Level31Block003.certificate, RateCertificateData.Level31Block004.certificate, RateCertificateData.Level31Block005.certificate, RateCertificateData.Level31Block006.certificate, RateCertificateData.Level31Block007.certificate, RateCertificateData.Level31Block008.certificate, RateCertificateData.Level31Block009.certificate, RateCertificateData.Level31Block010.certificate, RateCertificateData.Level31Block011.certificate, RateCertificateData.Level31Block012.certificate, RateCertificateData.Level31Block013.certificate, RateCertificateData.Level31Block014.certificate, RateCertificateData.Level31Block015.certificate, RateCertificateData.Level31Block016.certificate, RateCertificateData.Level31Block017.certificate, RateCertificateData.Level31Block018.certificate, RateCertificateData.Level31Block019.certificate, RateCertificateData.Level31Block020.certificate, RateCertificateData.Level31Block021.certificate, RateCertificateData.Level31Block022.certificate, RateCertificateData.Level31Block023.certificate, RateCertificateData.Level31Block024.certificate, RateCertificateData.Level31Block025.certificate, RateCertificateData.Level31Block026.certificate, RateCertificateData.Level31Block027.certificate, RateCertificateData.Level31Block028.certificate, RateCertificateData.Level31Block029.certificate, RateCertificateData.Level31Block030.certificate, RateCertificateData.Level31Block031.certificate, RateCertificateData.Level31Block032.certificate, RateCertificateData.Level31Block033.certificate, RateCertificateData.Level31Block034.certificate, RateCertificateData.Level31Block035.certificate, RateCertificateData.Level31Block036.certificate, RateCertificateData.Level31Block037.certificate, RateCertificateData.Level31Block038.certificate, RateCertificateData.Level31Block039.certificate, RateCertificateData.Level31Block040.certificate, RateCertificateData.Level31Block041.certificate, RateCertificateData.Level31Block042.certificate, RateCertificateData.Level31Block043.certificate, RateCertificateData.Level31Block044.certificate, RateCertificateData.Level31Block045.certificate, RateCertificateData.Level31Block046.certificate, RateCertificateData.Level31Block047.certificate, SourceTable.append, SourceTable.ofList,
    integerLogValue_append, CertifiedLevel3Rate1.value, CertifiedLevel3Rate1.blocks,
    certifiedBlocksValue, add_zero, add_assoc]

/-- Adjacent original-term window endpoints in complete source order. -/
def cuts : List ℕ := [0, 43, 121, 187, 263, 325, 405, 498, 566, 650, 742, 860, 1075, 1147, 1340, 1528, 1654, 1867, 1999, 2171, 2377, 2551, 2672, 2806, 2948, 3194, 3320, 3582, 3714, 3920, 4098, 4308, 4486, 4706, 4884, 5092, 5320, 5563, 5731, 5831, 6011, 6249, 6379, 6685, 6828, 7076, 7317, 7441, 7730, 7853, 8077, 8334, 8546, 8820, 9029, 9215, 9490, 9612, 9753, 9885, 10139, 10309, 10573, 10816, 10906, 11184, 11349, 11553, 11798, 11916, 12240, 12436, 12683, 12911, 13172, 13356, 13412, 13612, 13692, 13974, 14110, 14352, 14615, 14715, 15027, 15216, 15420, 15674, 15815, 16095, 16266, 16518, 16654, 16705, 16890, 16996, 17225, 17335, 17621, 17829, 18058, 18333, 18462, 18747, 18895, 19169, 19311, 19365, 19542, 19676, 19931, 20113, 20380, 20549, 20827, 20995, 21261, 21431, 21479, 21667, 21855, 22077, 22322, 22540, 22802, 22938, 23076, 23259, 23506, 23737, 23851, 23969, 24162, 24320, 24459, 24541]
/-- Read a source-aligned endpoint. -/
def cut (index : ℕ) : ℕ := cuts[index]?.getD 0
/-- The source partition begins with the first certificate term. -/
theorem first : cut 0 = 0 := by decide +kernel
/-- The source partition ends after the last certificate term. -/
theorem last : cut 135 = 24541 := by decide +kernel
/-- Every consecutive window is ordered and adjacent. -/
theorem ordered : ∀ index : Fin 135, cut index.val ≤ cut (index.val+1) := by decide +kernel
/-- Complete original certificate window corresponding to one original source block. -/
def window (block : Fin 135) : RationalLogExpression :=
  certificateWindow table (cut block.val) (cut (block.val+1))
/-- Every original numerical term occurs in exactly one source-aligned window. -/
theorem windows_value : (∑ block, rationalLogValue (window block)) = CertifiedLevel3Rate1.value := by
  rw [← table_value]
  exact certificate_windows_value table cut first last
    (fun index present => ordered ⟨index, present⟩)

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine3TableA0
