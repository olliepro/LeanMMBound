import SuppliedTerminalLaws
import CheckedIndexTable

/-! Balanced lookup preserves every original terminal parameter coordinate.
Each leaf is an unchanged existing source part, with a proved global index binding. -/
namespace MatrixBounds.Numeric.SuppliedRootFineTerminalLookup
set_option maxRecDepth 100000
set_option maxHeartbeats 32000000

/-- Original terminal source part 0, retaining all 256 input entries. -/
def part000 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart000.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 1, retaining all 256 input entries. -/
def part001 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart001.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 2, retaining all 256 input entries. -/
def part002 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart002.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 3, retaining all 256 input entries. -/
def part003 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart003.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 4, retaining all 256 input entries. -/
def part004 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart004.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 5, retaining all 256 input entries. -/
def part005 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart005.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 6, retaining all 256 input entries. -/
def part006 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart006.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 7, retaining all 256 input entries. -/
def part007 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart007.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 8, retaining all 256 input entries. -/
def part008 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart008.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 9, retaining all 256 input entries. -/
def part009 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart009.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 10, retaining all 256 input entries. -/
def part010 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart010.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 11, retaining all 256 input entries. -/
def part011 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart011.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 12, retaining all 256 input entries. -/
def part012 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart012.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 13, retaining all 256 input entries. -/
def part013 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart013.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 14, retaining all 256 input entries. -/
def part014 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart014.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 15, retaining all 256 input entries. -/
def part015 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart015.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 16, retaining all 256 input entries. -/
def part016 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart016.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 17, retaining all 256 input entries. -/
def part017 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart017.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 18, retaining all 256 input entries. -/
def part018 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart018.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 19, retaining all 256 input entries. -/
def part019 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart019.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 20, retaining all 256 input entries. -/
def part020 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart020.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 21, retaining all 256 input entries. -/
def part021 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart021.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 22, retaining all 256 input entries. -/
def part022 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart022.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 23, retaining all 256 input entries. -/
def part023 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart023.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 24, retaining all 256 input entries. -/
def part024 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart024.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 25, retaining all 256 input entries. -/
def part025 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart025.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 26, retaining all 256 input entries. -/
def part026 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart026.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 27, retaining all 256 input entries. -/
def part027 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart027.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 28, retaining all 256 input entries. -/
def part028 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart028.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 29, retaining all 256 input entries. -/
def part029 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart029.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 30, retaining all 256 input entries. -/
def part030 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart030.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 31, retaining all 256 input entries. -/
def part031 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart031.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 32, retaining all 256 input entries. -/
def part032 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart032.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 33, retaining all 256 input entries. -/
def part033 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart033.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 34, retaining all 256 input entries. -/
def part034 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart034.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 35, retaining all 256 input entries. -/
def part035 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart035.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 36, retaining all 256 input entries. -/
def part036 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart036.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 37, retaining all 256 input entries. -/
def part037 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart037.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 38, retaining all 256 input entries. -/
def part038 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart038.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 39, retaining all 256 input entries. -/
def part039 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart039.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 40, retaining all 256 input entries. -/
def part040 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart040.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 41, retaining all 256 input entries. -/
def part041 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart041.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 42, retaining all 256 input entries. -/
def part042 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart042.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 43, retaining all 256 input entries. -/
def part043 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart043.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 44, retaining all 256 input entries. -/
def part044 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart044.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 45, retaining all 256 input entries. -/
def part045 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart045.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 46, retaining all 256 input entries. -/
def part046 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart046.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 47, retaining all 256 input entries. -/
def part047 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart047.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 48, retaining all 256 input entries. -/
def part048 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart048.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 49, retaining all 256 input entries. -/
def part049 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart049.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 50, retaining all 256 input entries. -/
def part050 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart050.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 51, retaining all 256 input entries. -/
def part051 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart051.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 52, retaining all 256 input entries. -/
def part052 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart052.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 53, retaining all 256 input entries. -/
def part053 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart053.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 54, retaining all 256 input entries. -/
def part054 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart054.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 55, retaining all 256 input entries. -/
def part055 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart055.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 56, retaining all 256 input entries. -/
def part056 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart056.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 57, retaining all 256 input entries. -/
def part057 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart057.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 58, retaining all 256 input entries. -/
def part058 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart058.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 59, retaining all 256 input entries. -/
def part059 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart059.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 60, retaining all 256 input entries. -/
def part060 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart060.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 61, retaining all 256 input entries. -/
def part061 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart061.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 62, retaining all 256 input entries. -/
def part062 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart062.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 63, retaining all 256 input entries. -/
def part063 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart063.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 64, retaining all 256 input entries. -/
def part064 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart064.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 65, retaining all 256 input entries. -/
def part065 : CheckedIndexTable 256 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart065.numerators
    (by decide +kernel) (by decide +kernel)

/-- Original terminal source part 66, retaining all 114 input entries. -/
def part066 : CheckedIndexTable 114 17592186044416 :=
  CheckedIndexTable.ofList TerminalParameterData.TerminalPart066.numerators
    (by decide +kernel) (by decide +kernel)

/-- Balanced lookup for all original 945-by-3-by-6 terminal positions. -/
def table : CheckedIndexTable 17010 17592186044416 :=
  ((((((part000).append (part001)).append ((part002).append (part003))).append (((part004).append (part005)).append ((part006).append (part007)))).append ((((part008).append (part009)).append ((part010).append (part011))).append (((part012).append (part013)).append ((part014).append (part015))))).append (((((part016).append (part017)).append ((part018).append (part019))).append (((part020).append (part021)).append ((part022).append (part023)))).append ((((part024).append (part025)).append ((part026).append (part027))).append (((part028).append (part029)).append ((part030).append ((part031).append (part032))))))).append ((((((part033).append (part034)).append ((part035).append (part036))).append (((part037).append (part038)).append ((part039).append (part040)))).append ((((part041).append (part042)).append ((part043).append (part044))).append (((part045).append (part046)).append ((part047).append ((part048).append (part049)))))).append (((((part050).append (part051)).append ((part052).append (part053))).append (((part054).append (part055)).append ((part056).append (part057)))).append ((((part058).append (part059)).append ((part060).append (part061))).append (((part062).append (part063)).append ((part064).append ((part065).append (part066)))))))

/-- The balanced tree retains the complete original source list without reordering. -/
theorem entries_eq : table.entries = TerminalParameterData.numerators := by
  simp only [table, CheckedIndexTable.append, part000, part001, part002, part003, part004, part005, part006, part007, part008, part009, part010, part011, part012, part013, part014, part015, part016, part017, part018, part019, part020, part021, part022, part023, part024, part025, part026, part027, part028, part029, part030, part031, part032, part033, part034, part035, part036, part037, part038, part039, part040, part041, part042, part043, part044, part045, part046, part047, part048, part049, part050, part051, part052, part053, part054, part055, part056, part057, part058, part059, part060, part061, part062, part063, part064, part065, part066,
    CheckedIndexTable.ofList, TerminalParameterData.numerators, List.append_assoc]


/-- Read one original node, positive child, and strategy through the proved balanced lookup. -/
def numerator (node : Fin 945) (child : Fin 3) (strategy : Fin 6) : ℕ :=
  (table.get (SuppliedParameters.flat2 (SuppliedParameters.flat2 node child) strategy)).val

/-- Fast lookup equals the actual original terminal input at the same three coordinates. -/
theorem numerator_eq (node : Fin 945) (child : Fin 3) (strategy : Fin 6) :
    numerator node child strategy = SuppliedParameters.terminalNumerator node child strategy := by
  unfold numerator
  rw [CheckedIndexTable.get_val]
  simp only [entries_eq, SuppliedParameters.terminalNumerator]

/-- Exact rational terminal parameter using the original proved fast lookup. -/
def mu (node : Fin 945) (child : Fin 3) (strategy : Fin 6) : ℚ :=
  (numerator node child strategy : ℚ)/17592186044416

/-- The executable fast rational parameter is exactly the original supplied terminal parameter. -/
theorem mu_eq (node : Fin 945) (child : Fin 3) (strategy : Fin 6) :
    mu node child strategy = SuppliedTerminalLaws.mu node child strategy := by
  simp only [mu, numerator_eq, SuppliedTerminalLaws.mu]

end MatrixBounds.Numeric.SuppliedRootFineTerminalLookup
