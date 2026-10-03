module

public import TerminalRateCertificateWindows
public import CertifiedLevel3Rate2

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine3TableA1
open TerminalSourceNodeLookup SuppliedTerminalRates
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

/-- Unchanged complete original certificate slice. -/
def part000 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block000.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part001 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block001.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part002 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block002.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part003 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block003.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part004 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block004.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part005 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block005.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part006 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block006.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part007 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block007.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part008 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block008.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part009 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block009.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part010 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block010.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part011 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block011.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part012 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block012.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part013 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block013.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part014 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block014.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part015 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block015.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part016 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block016.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part017 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block017.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part018 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block018.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part019 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block019.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part020 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block020.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part021 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block021.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part022 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block022.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part023 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block023.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part024 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block024.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part025 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block025.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part026 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block026.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part027 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block027.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part028 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block028.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part029 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block029.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part030 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block030.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part031 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block031.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part032 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block032.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part033 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block033.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part034 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block034.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part035 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block035.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part036 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block036.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part037 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block037.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part038 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block038.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part039 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block039.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part040 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block040.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part041 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block041.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part042 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block042.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part043 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block043.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part044 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block044.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part045 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block045.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part046 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block046.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part047 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block047.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part048 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block048.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part049 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block049.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part050 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block050.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part051 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block051.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part052 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block052.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part053 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block053.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part054 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block054.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part055 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block055.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part056 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block056.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part057 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block057.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part058 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block058.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part059 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block059.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part060 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block060.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part061 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block061.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part062 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block062.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part063 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block063.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part064 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block064.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part065 : SourceTable IntegerLogTerm 512 :=
  SourceTable.ofList RateCertificateData.Level32Block065.terms (by decide)
/-- Unchanged complete original certificate slice. -/
def part066 : SourceTable IntegerLogTerm 218 :=
  SourceTable.ofList RateCertificateData.Level32Block066.terms (by decide)

/-- Every unchanged original certificate term, with balanced coordinate lookup. -/
def table : SourceTable IntegerLogTerm 34010 := ((((((part000).append (part001)).append ((part002).append (part003))).append (((part004).append (part005)).append ((part006).append (part007)))).append ((((part008).append (part009)).append ((part010).append (part011))).append (((part012).append (part013)).append ((part014).append (part015))))).append (((((part016).append (part017)).append ((part018).append (part019))).append (((part020).append (part021)).append ((part022).append (part023)))).append ((((part024).append (part025)).append ((part026).append (part027))).append (((part028).append (part029)).append ((part030).append ((part031).append (part032))))))).append ((((((part033).append (part034)).append ((part035).append (part036))).append (((part037).append (part038)).append ((part039).append (part040)))).append ((((part041).append (part042)).append ((part043).append (part044))).append (((part045).append (part046)).append ((part047).append ((part048).append (part049)))))).append (((((part050).append (part051)).append ((part052).append (part053))).append (((part054).append (part055)).append ((part056).append (part057)))).append ((((part058).append (part059)).append ((part060).append (part061))).append (((part062).append (part063)).append ((part064).append ((part065).append (part066)))))))

attribute [local irreducible] integerLogValue

/-- Balanced lookup preserves the complete independently certified logarithmic value. -/
theorem table_value : integerLogValue table.entries = CertifiedLevel3Rate2.value := by
  simp (config := { maxSteps := 1000000 }) only [table, part000, part001, part002, part003, part004, part005, part006, part007, part008, part009, part010, part011, part012, part013, part014, part015, part016, part017, part018, part019, part020, part021, part022, part023, part024, part025, part026, part027, part028, part029, part030, part031, part032, part033, part034, part035, part036, part037, part038, part039, part040, part041, part042, part043, part044, part045, part046, part047, part048, part049, part050, part051, part052, part053, part054, part055, part056, part057, part058, part059, part060, part061, part062, part063, part064, part065, part066, RateCertificateData.Level32Block000.certificate, RateCertificateData.Level32Block001.certificate, RateCertificateData.Level32Block002.certificate, RateCertificateData.Level32Block003.certificate, RateCertificateData.Level32Block004.certificate, RateCertificateData.Level32Block005.certificate, RateCertificateData.Level32Block006.certificate, RateCertificateData.Level32Block007.certificate, RateCertificateData.Level32Block008.certificate, RateCertificateData.Level32Block009.certificate, RateCertificateData.Level32Block010.certificate, RateCertificateData.Level32Block011.certificate, RateCertificateData.Level32Block012.certificate, RateCertificateData.Level32Block013.certificate, RateCertificateData.Level32Block014.certificate, RateCertificateData.Level32Block015.certificate, RateCertificateData.Level32Block016.certificate, RateCertificateData.Level32Block017.certificate, RateCertificateData.Level32Block018.certificate, RateCertificateData.Level32Block019.certificate, RateCertificateData.Level32Block020.certificate, RateCertificateData.Level32Block021.certificate, RateCertificateData.Level32Block022.certificate, RateCertificateData.Level32Block023.certificate, RateCertificateData.Level32Block024.certificate, RateCertificateData.Level32Block025.certificate, RateCertificateData.Level32Block026.certificate, RateCertificateData.Level32Block027.certificate, RateCertificateData.Level32Block028.certificate, RateCertificateData.Level32Block029.certificate, RateCertificateData.Level32Block030.certificate, RateCertificateData.Level32Block031.certificate, RateCertificateData.Level32Block032.certificate, RateCertificateData.Level32Block033.certificate, RateCertificateData.Level32Block034.certificate, RateCertificateData.Level32Block035.certificate, RateCertificateData.Level32Block036.certificate, RateCertificateData.Level32Block037.certificate, RateCertificateData.Level32Block038.certificate, RateCertificateData.Level32Block039.certificate, RateCertificateData.Level32Block040.certificate, RateCertificateData.Level32Block041.certificate, RateCertificateData.Level32Block042.certificate, RateCertificateData.Level32Block043.certificate, RateCertificateData.Level32Block044.certificate, RateCertificateData.Level32Block045.certificate, RateCertificateData.Level32Block046.certificate, RateCertificateData.Level32Block047.certificate, RateCertificateData.Level32Block048.certificate, RateCertificateData.Level32Block049.certificate, RateCertificateData.Level32Block050.certificate, RateCertificateData.Level32Block051.certificate, RateCertificateData.Level32Block052.certificate, RateCertificateData.Level32Block053.certificate, RateCertificateData.Level32Block054.certificate, RateCertificateData.Level32Block055.certificate, RateCertificateData.Level32Block056.certificate, RateCertificateData.Level32Block057.certificate, RateCertificateData.Level32Block058.certificate, RateCertificateData.Level32Block059.certificate, RateCertificateData.Level32Block060.certificate, RateCertificateData.Level32Block061.certificate, RateCertificateData.Level32Block062.certificate, RateCertificateData.Level32Block063.certificate, RateCertificateData.Level32Block064.certificate, RateCertificateData.Level32Block065.certificate, RateCertificateData.Level32Block066.certificate, SourceTable.append, SourceTable.ofList,
    integerLogValue_append, CertifiedLevel3Rate2.value, CertifiedLevel3Rate2.blocks,
    certifiedBlocksValue, add_zero, add_assoc]

/-- Adjacent original-term window endpoints in complete source order. -/
def cuts : List ℕ := [0, 160, 376, 609, 785, 1033, 1325, 1555, 1658, 1905, 2143, 2418, 2755, 2984, 3303, 3628, 3798, 4074, 4322, 4600, 4900, 5068, 5272, 5577, 5836, 6181, 6473, 6805, 7083, 7376, 7650, 7943, 8255, 8534, 8834, 9088, 9333, 9574, 9714, 9988, 10239, 10605, 10872, 11219, 11490, 11787, 12049, 12322, 12629, 12965, 13237, 13535, 13838, 14110, 14386, 14615, 14826, 14997, 15231, 15480, 15824, 16044, 16387, 16650, 16951, 17264, 17548, 17855, 18165, 18388, 18724, 18974, 19280, 19507, 19746, 19829, 19995, 20314, 20509, 20887, 21037, 21405, 21642, 21939, 22221, 22422, 22731, 23033, 23226, 23551, 23714, 23957, 24047, 24223, 24541, 24722, 25089, 25311, 25671, 25846, 26178, 26454, 26659, 26972, 27162, 27370, 27446, 27629, 27980, 28234, 28585, 28839, 29191, 29410, 29744, 29923, 30130, 30177, 30398, 30742, 31016, 31234, 31594, 31818, 32046, 32141, 32317, 32567, 32871, 33126, 33207, 33472, 33682, 33792, 33928, 34010]
/-- Read a source-aligned endpoint. -/
def cut (index : ℕ) : ℕ := cuts[index]?.getD 0
/-- The source partition begins with the first certificate term. -/
theorem first : cut 0 = 0 := by decide +kernel
/-- The source partition ends after the last certificate term. -/
theorem last : cut 135 = 34010 := by decide +kernel
/-- Every consecutive window is ordered and adjacent. -/
theorem ordered : ∀ index : Fin 135, cut index.val ≤ cut (index.val+1) := by decide +kernel
/-- Complete original certificate window corresponding to one original source block. -/
def window (block : Fin 135) : RationalLogExpression :=
  certificateWindow table (cut block.val) (cut (block.val+1))
/-- Every original numerical term occurs in exactly one source-aligned window. -/
theorem windows_value : (∑ block, rationalLogValue (window block)) = CertifiedLevel3Rate2.value := by
  rw [← table_value]
  exact certificate_windows_value table cut first last
    (fun index present => ordered ⟨index, present⟩)

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine3TableA1
