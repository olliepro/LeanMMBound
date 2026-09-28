import ParameterIndexData
import ParameterIndexMetadata

/-! Every original source-array reference selects the intended finite alphabet. -/
namespace MatrixBounds.Numeric.SuppliedParameterChecks
set_option maxRecDepth 200000
set_option maxHeartbeats 32000000

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicRootAPart000_metadata :
    ParameterIndexData.DyadicRootAPart000.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 1)) = true := by decide +kernel

/-- Every original reference has the intended alphabet metadata, by its independently checked slice. -/
theorem DyadicRootA_metadata :
    ParameterIndexData.DyadicRootA.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 1)) = true := by
  simp only [ParameterIndexData.DyadicRootA.table, DyadicRootAPart000_metadata]

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicRootAlphaPart000_metadata :
    ParameterIndexData.DyadicRootAlphaPart000.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 153)) = true := by decide +kernel

/-- Every original reference has the intended alphabet metadata, by its independently checked slice. -/
theorem DyadicRootAlpha_metadata :
    ParameterIndexData.DyadicRootAlpha.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 153)) = true := by
  simp only [ParameterIndexData.DyadicRootAlpha.table, DyadicRootAlphaPart000_metadata]

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicA3Part000_metadata :
    ParameterIndexData.DyadicA3Part000.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Every original reference has the intended alphabet metadata, by its independently checked slice. -/
theorem DyadicA3_metadata :
    ParameterIndexData.DyadicA3.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by
  simp only [ParameterIndexData.DyadicA3.table, DyadicA3Part000_metadata]

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicAlpha3Part000_metadata :
    ParameterIndexData.DyadicAlpha3Part000.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 15)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicAlpha3Part001_metadata :
    ParameterIndexData.DyadicAlpha3Part001.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 15)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicAlpha3Part002_metadata :
    ParameterIndexData.DyadicAlpha3Part002.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 15)) = true := by decide +kernel

/-- Every original reference has the intended alphabet metadata, by its independently checked slice. -/
theorem DyadicAlpha3_metadata :
    ParameterIndexData.DyadicAlpha3.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 15)) = true := by
  simp only [ParameterIndexData.DyadicAlpha3.table, CheckedIndexTable.append, List.all_append, DyadicAlpha3Part000_metadata, DyadicAlpha3Part001_metadata, DyadicAlpha3Part002_metadata, Bool.and_true]

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicAlpha4Part000_metadata :
    ParameterIndexData.DyadicAlpha4Part000.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 45)) = true := by decide +kernel

/-- Every original reference has the intended alphabet metadata, by its independently checked slice. -/
theorem DyadicAlpha4_metadata :
    ParameterIndexData.DyadicAlpha4.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 45)) = true := by
  simp only [ParameterIndexData.DyadicAlpha4.table, DyadicAlpha4Part000_metadata]

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart000_metadata :
    ParameterIndexData.DyadicLeafzeroPart000.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart001_metadata :
    ParameterIndexData.DyadicLeafzeroPart001.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart002_metadata :
    ParameterIndexData.DyadicLeafzeroPart002.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart003_metadata :
    ParameterIndexData.DyadicLeafzeroPart003.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart004_metadata :
    ParameterIndexData.DyadicLeafzeroPart004.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart005_metadata :
    ParameterIndexData.DyadicLeafzeroPart005.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart006_metadata :
    ParameterIndexData.DyadicLeafzeroPart006.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart007_metadata :
    ParameterIndexData.DyadicLeafzeroPart007.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart008_metadata :
    ParameterIndexData.DyadicLeafzeroPart008.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart009_metadata :
    ParameterIndexData.DyadicLeafzeroPart009.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart010_metadata :
    ParameterIndexData.DyadicLeafzeroPart010.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart011_metadata :
    ParameterIndexData.DyadicLeafzeroPart011.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart012_metadata :
    ParameterIndexData.DyadicLeafzeroPart012.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart013_metadata :
    ParameterIndexData.DyadicLeafzeroPart013.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart014_metadata :
    ParameterIndexData.DyadicLeafzeroPart014.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart015_metadata :
    ParameterIndexData.DyadicLeafzeroPart015.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart016_metadata :
    ParameterIndexData.DyadicLeafzeroPart016.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart017_metadata :
    ParameterIndexData.DyadicLeafzeroPart017.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart018_metadata :
    ParameterIndexData.DyadicLeafzeroPart018.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart019_metadata :
    ParameterIndexData.DyadicLeafzeroPart019.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart020_metadata :
    ParameterIndexData.DyadicLeafzeroPart020.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart021_metadata :
    ParameterIndexData.DyadicLeafzeroPart021.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart022_metadata :
    ParameterIndexData.DyadicLeafzeroPart022.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart023_metadata :
    ParameterIndexData.DyadicLeafzeroPart023.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart024_metadata :
    ParameterIndexData.DyadicLeafzeroPart024.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart025_metadata :
    ParameterIndexData.DyadicLeafzeroPart025.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart026_metadata :
    ParameterIndexData.DyadicLeafzeroPart026.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart027_metadata :
    ParameterIndexData.DyadicLeafzeroPart027.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart028_metadata :
    ParameterIndexData.DyadicLeafzeroPart028.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart029_metadata :
    ParameterIndexData.DyadicLeafzeroPart029.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart030_metadata :
    ParameterIndexData.DyadicLeafzeroPart030.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart031_metadata :
    ParameterIndexData.DyadicLeafzeroPart031.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart032_metadata :
    ParameterIndexData.DyadicLeafzeroPart032.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicLeafzeroPart033_metadata :
    ParameterIndexData.DyadicLeafzeroPart033.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Every original reference has the intended alphabet metadata, by its independently checked slice. -/
theorem DyadicLeafzero_metadata :
    ParameterIndexData.DyadicLeafzero.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by
  simp only [ParameterIndexData.DyadicLeafzero.table, CheckedIndexTable.append, List.all_append, DyadicLeafzeroPart000_metadata, DyadicLeafzeroPart001_metadata, DyadicLeafzeroPart002_metadata, DyadicLeafzeroPart003_metadata, DyadicLeafzeroPart004_metadata, DyadicLeafzeroPart005_metadata, DyadicLeafzeroPart006_metadata, DyadicLeafzeroPart007_metadata, DyadicLeafzeroPart008_metadata, DyadicLeafzeroPart009_metadata, DyadicLeafzeroPart010_metadata, DyadicLeafzeroPart011_metadata, DyadicLeafzeroPart012_metadata, DyadicLeafzeroPart013_metadata, DyadicLeafzeroPart014_metadata, DyadicLeafzeroPart015_metadata, DyadicLeafzeroPart016_metadata, DyadicLeafzeroPart017_metadata, DyadicLeafzeroPart018_metadata, DyadicLeafzeroPart019_metadata, DyadicLeafzeroPart020_metadata, DyadicLeafzeroPart021_metadata, DyadicLeafzeroPart022_metadata, DyadicLeafzeroPart023_metadata, DyadicLeafzeroPart024_metadata, DyadicLeafzeroPart025_metadata, DyadicLeafzeroPart026_metadata, DyadicLeafzeroPart027_metadata, DyadicLeafzeroPart028_metadata, DyadicLeafzeroPart029_metadata, DyadicLeafzeroPart030_metadata, DyadicLeafzeroPart031_metadata, DyadicLeafzeroPart032_metadata, DyadicLeafzeroPart033_metadata, Bool.and_true]

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicZero3Part000_metadata :
    ParameterIndexData.DyadicZero3Part000.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 21)) = true := by decide +kernel

/-- Every original reference has the intended alphabet metadata, by its independently checked slice. -/
theorem DyadicZero3_metadata :
    ParameterIndexData.DyadicZero3.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 21)) = true := by
  simp only [ParameterIndexData.DyadicZero3.table, DyadicZero3Part000_metadata]

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicZero4Part000_metadata :
    ParameterIndexData.DyadicZero4Part000.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 231)) = true := by decide +kernel

/-- Every original reference has the intended alphabet metadata, by its independently checked slice. -/
theorem DyadicZero4_metadata :
    ParameterIndexData.DyadicZero4.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 231)) = true := by
  simp only [ParameterIndexData.DyadicZero4.table, DyadicZero4Part000_metadata]

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicTerminalrolesPart000_metadata :
    ParameterIndexData.DyadicTerminalrolesPart000.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 3)) = true := by decide +kernel

/-- Every original reference has the intended alphabet metadata, by its independently checked slice. -/
theorem DyadicTerminalroles_metadata :
    ParameterIndexData.DyadicTerminalroles.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 3)) = true := by
  simp only [ParameterIndexData.DyadicTerminalroles.table, DyadicTerminalrolesPart000_metadata]

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicAlloc4Part000_metadata :
    ParameterIndexData.DyadicAlloc4Part000.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Every original reference has the intended alphabet metadata, by its independently checked slice. -/
theorem DyadicAlloc4_metadata :
    ParameterIndexData.DyadicAlloc4.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by
  simp only [ParameterIndexData.DyadicAlloc4.table, DyadicAlloc4Part000_metadata]

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicAlloc3Part000_metadata :
    ParameterIndexData.DyadicAlloc3Part000.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicAlloc3Part001_metadata :
    ParameterIndexData.DyadicAlloc3Part001.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem DyadicAlloc3Part002_metadata :
    ParameterIndexData.DyadicAlloc3Part002.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by decide +kernel

/-- Every original reference has the intended alphabet metadata, by its independently checked slice. -/
theorem DyadicAlloc3_metadata :
    ParameterIndexData.DyadicAlloc3.table.entries.all
      (fun index => decide (DyadicRowMetadata.expected index = 6)) = true := by
  simp only [ParameterIndexData.DyadicAlloc3.table, CheckedIndexTable.append, List.all_append, DyadicAlloc3Part000_metadata, DyadicAlloc3Part001_metadata, DyadicAlloc3Part002_metadata, Bool.and_true]

/-- Exact alphabet check for one bounded source-array slice. -/
theorem GibbsU3Part000_metadata :
    ParameterIndexData.GibbsU3Part000.table.entries.all
      (fun index => decide (GibbsRowMetadata.expected index = 5)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem GibbsU3Part001_metadata :
    ParameterIndexData.GibbsU3Part001.table.entries.all
      (fun index => decide (GibbsRowMetadata.expected index = 5)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem GibbsU3Part002_metadata :
    ParameterIndexData.GibbsU3Part002.table.entries.all
      (fun index => decide (GibbsRowMetadata.expected index = 5)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem GibbsU3Part003_metadata :
    ParameterIndexData.GibbsU3Part003.table.entries.all
      (fun index => decide (GibbsRowMetadata.expected index = 5)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem GibbsU3Part004_metadata :
    ParameterIndexData.GibbsU3Part004.table.entries.all
      (fun index => decide (GibbsRowMetadata.expected index = 5)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem GibbsU3Part005_metadata :
    ParameterIndexData.GibbsU3Part005.table.entries.all
      (fun index => decide (GibbsRowMetadata.expected index = 5)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem GibbsU3Part006_metadata :
    ParameterIndexData.GibbsU3Part006.table.entries.all
      (fun index => decide (GibbsRowMetadata.expected index = 5)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem GibbsU3Part007_metadata :
    ParameterIndexData.GibbsU3Part007.table.entries.all
      (fun index => decide (GibbsRowMetadata.expected index = 5)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem GibbsU3Part008_metadata :
    ParameterIndexData.GibbsU3Part008.table.entries.all
      (fun index => decide (GibbsRowMetadata.expected index = 5)) = true := by decide +kernel

/-- Every original reference has the intended alphabet metadata, by its independently checked slice. -/
theorem GibbsU3_metadata :
    ParameterIndexData.GibbsU3.table.entries.all
      (fun index => decide (GibbsRowMetadata.expected index = 5)) = true := by
  simp only [ParameterIndexData.GibbsU3.table, CheckedIndexTable.append, List.all_append, GibbsU3Part000_metadata, GibbsU3Part001_metadata, GibbsU3Part002_metadata, GibbsU3Part003_metadata, GibbsU3Part004_metadata, GibbsU3Part005_metadata, GibbsU3Part006_metadata, GibbsU3Part007_metadata, GibbsU3Part008_metadata, Bool.and_true]

/-- Exact alphabet check for one bounded source-array slice. -/
theorem GibbsU4Part000_metadata :
    ParameterIndexData.GibbsU4Part000.table.entries.all
      (fun index => decide (GibbsRowMetadata.expected index = 9)) = true := by decide +kernel

/-- Every original reference has the intended alphabet metadata, by its independently checked slice. -/
theorem GibbsU4_metadata :
    ParameterIndexData.GibbsU4.table.entries.all
      (fun index => decide (GibbsRowMetadata.expected index = 9)) = true := by
  simp only [ParameterIndexData.GibbsU4.table, GibbsU4Part000_metadata]

/-- Exact alphabet check for one bounded source-array slice. -/
theorem GibbsURPart000_metadata :
    ParameterIndexData.GibbsURPart000.table.entries.all
      (fun index => decide (GibbsRowMetadata.expected index = 17)) = true := by decide +kernel

/-- Every original reference has the intended alphabet metadata, by its independently checked slice. -/
theorem GibbsUR_metadata :
    ParameterIndexData.GibbsUR.table.entries.all
      (fun index => decide (GibbsRowMetadata.expected index = 17)) = true := by
  simp only [ParameterIndexData.GibbsUR.table, GibbsURPart000_metadata]

/-- Exact alphabet check for one bounded source-array slice. -/
theorem SplitAlpha3Part000_metadata :
    ParameterIndexData.SplitAlpha3Part000.table.entries.all
      (fun index => decide (SplitRowMetadata.expected index = 4)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem SplitAlpha3Part001_metadata :
    ParameterIndexData.SplitAlpha3Part001.table.entries.all
      (fun index => decide (SplitRowMetadata.expected index = 4)) = true := by decide +kernel

/-- Exact alphabet check for one bounded source-array slice. -/
theorem SplitAlpha3Part002_metadata :
    ParameterIndexData.SplitAlpha3Part002.table.entries.all
      (fun index => decide (SplitRowMetadata.expected index = 4)) = true := by decide +kernel

/-- Every original reference has the intended alphabet metadata, by its independently checked slice. -/
theorem SplitAlpha3_metadata :
    ParameterIndexData.SplitAlpha3.table.entries.all
      (fun index => decide (SplitRowMetadata.expected index = 4)) = true := by
  simp only [ParameterIndexData.SplitAlpha3.table, CheckedIndexTable.append, List.all_append, SplitAlpha3Part000_metadata, SplitAlpha3Part001_metadata, SplitAlpha3Part002_metadata, Bool.and_true]

/-- Exact alphabet check for one bounded source-array slice. -/
theorem SplitAlpha4Part000_metadata :
    ParameterIndexData.SplitAlpha4Part000.table.entries.all
      (fun index => decide (SplitRowMetadata.expected index = 8)) = true := by decide +kernel

/-- Every original reference has the intended alphabet metadata, by its independently checked slice. -/
theorem SplitAlpha4_metadata :
    ParameterIndexData.SplitAlpha4.table.entries.all
      (fun index => decide (SplitRowMetadata.expected index = 8)) = true := by
  simp only [ParameterIndexData.SplitAlpha4.table, SplitAlpha4Part000_metadata]

end MatrixBounds.Numeric.SuppliedParameterChecks
