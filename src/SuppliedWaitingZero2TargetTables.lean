module

public import SuppliedZeroRegistryData
public import SuppliedTypedParameters
public import SuppliedLeafLaws
public import FiniteIndexBlockComposition

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Balanced exact lookup aliases preserve every original source entry, while
reducing the kernel evaluation depth of the large finite support certificate. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetTables
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Concatenated table entries are exactly their adjacent source lists. -/
theorem append_entries {left right bound : ℕ} (first : CheckedIndexTable left bound)
    (second : CheckedIndexTable right bound) :
    (first.append second).entries = first.entries ++ second.entries := rfl

/-- Equal exact source lists give equal bounded lookup results at every index. -/
theorem get_of_entries_eq {count bound : ℕ} (first second : CheckedIndexTable count bound)
    (equal : first.entries = second.entries) (index : Fin count) : first.get index = second.get index := by
  apply Fin.ext
  rw [CheckedIndexTable.get_val, CheckedIndexTable.get_val]
  simp only [equal]

/-- Balanced dispatch of all original 68040 leaf parameter references. -/
def references : CheckedIndexTable 68040 15279 :=
  (((((ParameterIndexData.DyadicLeafzeroPart000.table).append (ParameterIndexData.DyadicLeafzeroPart001.table)).append ((ParameterIndexData.DyadicLeafzeroPart002.table).append (ParameterIndexData.DyadicLeafzeroPart003.table))).append (((ParameterIndexData.DyadicLeafzeroPart004.table).append (ParameterIndexData.DyadicLeafzeroPart005.table)).append ((ParameterIndexData.DyadicLeafzeroPart006.table).append (ParameterIndexData.DyadicLeafzeroPart007.table)))).append ((((ParameterIndexData.DyadicLeafzeroPart008.table).append (ParameterIndexData.DyadicLeafzeroPart009.table)).append ((ParameterIndexData.DyadicLeafzeroPart010.table).append (ParameterIndexData.DyadicLeafzeroPart011.table))).append (((ParameterIndexData.DyadicLeafzeroPart012.table).append (ParameterIndexData.DyadicLeafzeroPart013.table)).append ((ParameterIndexData.DyadicLeafzeroPart014.table).append ((ParameterIndexData.DyadicLeafzeroPart015.table).append (ParameterIndexData.DyadicLeafzeroPart016.table)))))).append (((((ParameterIndexData.DyadicLeafzeroPart017.table).append (ParameterIndexData.DyadicLeafzeroPart018.table)).append ((ParameterIndexData.DyadicLeafzeroPart019.table).append (ParameterIndexData.DyadicLeafzeroPart020.table))).append (((ParameterIndexData.DyadicLeafzeroPart021.table).append (ParameterIndexData.DyadicLeafzeroPart022.table)).append ((ParameterIndexData.DyadicLeafzeroPart023.table).append (ParameterIndexData.DyadicLeafzeroPart024.table)))).append ((((ParameterIndexData.DyadicLeafzeroPart025.table).append (ParameterIndexData.DyadicLeafzeroPart026.table)).append ((ParameterIndexData.DyadicLeafzeroPart027.table).append (ParameterIndexData.DyadicLeafzeroPart028.table))).append (((ParameterIndexData.DyadicLeafzeroPart029.table).append (ParameterIndexData.DyadicLeafzeroPart030.table)).append ((ParameterIndexData.DyadicLeafzeroPart031.table).append ((ParameterIndexData.DyadicLeafzeroPart032.table).append (ParameterIndexData.DyadicLeafzeroPart033.table))))))

/-- Balanced dispatch of every original registry support target code. -/
def targets : CheckedIndexTable 15279 18 :=
  ((((((SuppliedZeroRegistry.leaf000).append ((SuppliedZeroRegistry.leaf001).append (SuppliedZeroRegistry.leaf002))).append (((SuppliedZeroRegistry.leaf003).append (SuppliedZeroRegistry.leaf004)).append ((SuppliedZeroRegistry.leaf005).append (SuppliedZeroRegistry.leaf006)))).append ((((SuppliedZeroRegistry.leaf007).append (SuppliedZeroRegistry.leaf008)).append ((SuppliedZeroRegistry.leaf009).append (SuppliedZeroRegistry.leaf010))).append (((SuppliedZeroRegistry.leaf011).append (SuppliedZeroRegistry.leaf012)).append ((SuppliedZeroRegistry.leaf013).append (SuppliedZeroRegistry.leaf014))))).append ((((SuppliedZeroRegistry.leaf015).append ((SuppliedZeroRegistry.leaf016).append (SuppliedZeroRegistry.leaf017))).append (((SuppliedZeroRegistry.leaf018).append (SuppliedZeroRegistry.leaf019)).append ((SuppliedZeroRegistry.leaf020).append (SuppliedZeroRegistry.leaf021)))).append ((((SuppliedZeroRegistry.leaf022).append (SuppliedZeroRegistry.leaf023)).append ((SuppliedZeroRegistry.leaf024).append (SuppliedZeroRegistry.leaf025))).append (((SuppliedZeroRegistry.leaf026).append (SuppliedZeroRegistry.leaf027)).append ((SuppliedZeroRegistry.leaf028).append (SuppliedZeroRegistry.leaf029)))))).append (((((SuppliedZeroRegistry.leaf030).append ((SuppliedZeroRegistry.leaf031).append (SuppliedZeroRegistry.leaf032))).append (((SuppliedZeroRegistry.leaf033).append (SuppliedZeroRegistry.leaf034)).append ((SuppliedZeroRegistry.leaf035).append (SuppliedZeroRegistry.leaf036)))).append ((((SuppliedZeroRegistry.leaf037).append (SuppliedZeroRegistry.leaf038)).append ((SuppliedZeroRegistry.leaf039).append (SuppliedZeroRegistry.leaf040))).append (((SuppliedZeroRegistry.leaf041).append (SuppliedZeroRegistry.leaf042)).append ((SuppliedZeroRegistry.leaf043).append (SuppliedZeroRegistry.leaf044))))).append ((((SuppliedZeroRegistry.leaf045).append ((SuppliedZeroRegistry.leaf046).append (SuppliedZeroRegistry.leaf047))).append (((SuppliedZeroRegistry.leaf048).append (SuppliedZeroRegistry.leaf049)).append ((SuppliedZeroRegistry.leaf050).append (SuppliedZeroRegistry.leaf051)))).append ((((SuppliedZeroRegistry.leaf052).append (SuppliedZeroRegistry.leaf053)).append ((SuppliedZeroRegistry.leaf054).append (SuppliedZeroRegistry.leaf055))).append (((SuppliedZeroRegistry.leaf056).append (SuppliedZeroRegistry.leaf057)).append ((SuppliedZeroRegistry.leaf058).append (SuppliedZeroRegistry.leaf059))))))).append ((((((SuppliedZeroRegistry.leaf060).append ((SuppliedZeroRegistry.leaf061).append (SuppliedZeroRegistry.leaf062))).append (((SuppliedZeroRegistry.leaf063).append (SuppliedZeroRegistry.leaf064)).append ((SuppliedZeroRegistry.leaf065).append (SuppliedZeroRegistry.leaf066)))).append ((((SuppliedZeroRegistry.leaf067).append (SuppliedZeroRegistry.leaf068)).append ((SuppliedZeroRegistry.leaf069).append (SuppliedZeroRegistry.leaf070))).append (((SuppliedZeroRegistry.leaf071).append (SuppliedZeroRegistry.leaf072)).append ((SuppliedZeroRegistry.leaf073).append (SuppliedZeroRegistry.leaf074))))).append ((((SuppliedZeroRegistry.leaf075).append ((SuppliedZeroRegistry.leaf076).append (SuppliedZeroRegistry.leaf077))).append (((SuppliedZeroRegistry.leaf078).append (SuppliedZeroRegistry.leaf079)).append ((SuppliedZeroRegistry.leaf080).append (SuppliedZeroRegistry.leaf081)))).append ((((SuppliedZeroRegistry.leaf082).append (SuppliedZeroRegistry.leaf083)).append ((SuppliedZeroRegistry.leaf084).append (SuppliedZeroRegistry.leaf085))).append (((SuppliedZeroRegistry.leaf086).append (SuppliedZeroRegistry.leaf087)).append ((SuppliedZeroRegistry.leaf088).append (SuppliedZeroRegistry.leaf089)))))).append (((((SuppliedZeroRegistry.leaf090).append ((SuppliedZeroRegistry.leaf091).append (SuppliedZeroRegistry.leaf092))).append (((SuppliedZeroRegistry.leaf093).append (SuppliedZeroRegistry.leaf094)).append ((SuppliedZeroRegistry.leaf095).append (SuppliedZeroRegistry.leaf096)))).append ((((SuppliedZeroRegistry.leaf097).append (SuppliedZeroRegistry.leaf098)).append ((SuppliedZeroRegistry.leaf099).append (SuppliedZeroRegistry.leaf100))).append (((SuppliedZeroRegistry.leaf101).append (SuppliedZeroRegistry.leaf102)).append ((SuppliedZeroRegistry.leaf103).append (SuppliedZeroRegistry.leaf104))))).append ((((SuppliedZeroRegistry.leaf105).append ((SuppliedZeroRegistry.leaf106).append (SuppliedZeroRegistry.leaf107))).append (((SuppliedZeroRegistry.leaf108).append (SuppliedZeroRegistry.leaf109)).append ((SuppliedZeroRegistry.leaf110).append (SuppliedZeroRegistry.leaf111)))).append ((((SuppliedZeroRegistry.leaf112).append (SuppliedZeroRegistry.leaf113)).append ((SuppliedZeroRegistry.leaf114).append (SuppliedZeroRegistry.leaf115))).append (((SuppliedZeroRegistry.leaf116).append (SuppliedZeroRegistry.leaf117)).append ((SuppliedZeroRegistry.leaf118).append (SuppliedZeroRegistry.leaf119)))))))

/-- Balanced parameter dispatch retains exactly the original source entries. -/
theorem references_entries : references.entries = ParameterIndexData.DyadicLeafzero.table.entries := by
  simp only [references, ParameterIndexData.DyadicLeafzero.table, append_entries, List.append_assoc]

/-- Balanced target dispatch retains exactly the original registry entries. -/
theorem targets_entries : targets.entries = SuppliedZeroRegistry.table.entries := by
  simp only [targets, SuppliedZeroRegistry.table, append_entries, List.append_assoc]

/-- Every balanced parameter lookup selects its original checked source row. -/
theorem references_get (index : Fin 68040) : references.get index = ParameterIndexData.DyadicLeafzero.table.get index :=
  get_of_entries_eq _ _ references_entries index

/-- Every balanced target lookup selects its original checked support code. -/
theorem targets_get (index : Fin 15279) : targets.get index = SuppliedZeroRegistry.table.get index :=
  get_of_entries_eq _ _ targets_entries index

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetTables
