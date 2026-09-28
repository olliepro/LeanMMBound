import RootFineSparseLookup
import SuppliedRootFineParent3IntegerValidity
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Block909
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000
set_option Elab.async false

/-- Exact candidate at original node909, strategy0, axis0; every orbit is retained. -/
def row00 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(14,387743296123175826358272),(17,9239984065482782248671236849664),(18,21778071473700077208429896503786102325248)] orbit.val

/-- Exact candidate at original node909, strategy0, axis1; every orbit is retained. -/
def row01 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node909, strategy0, axis2; every orbit is retained. -/
def row02 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node909, strategy1, axis0; every orbit is retained. -/
def row10 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(14,409987110611114363191296),(17,9418247408896062520318173904896),(18,21778071473521813842772801744200628436992)] orbit.val

/-- Exact candidate at original node909, strategy1, axis1; every orbit is retained. -/
def row11 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node909, strategy1, axis2; every orbit is retained. -/
def row12 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node909, strategy2, axis0; every orbit is retained. -/
def row20 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(14,5506313303188794456932352),(17,9700492641526936645315080486912),(18,21778071473239563513815735041523628113920)] orbit.val

/-- Exact candidate at original node909, strategy2, axis1; every orbit is retained. -/
def row21 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node909, strategy2, axis2; every orbit is retained. -/
def row22 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node909, strategy3, axis0; every orbit is retained. -/
def row30 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(14,2567843290732093457301504),(17,9205319564282796992056430428160),(18,21778071473734739529529887151483277803520)] orbit.val

/-- Exact candidate at original node909, strategy3, axis1; every orbit is retained. -/
def row31 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node909, strategy3, axis2; every orbit is retained. -/
def row32 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node909, strategy4, axis0; every orbit is retained. -/
def row40 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(14,304733758439415770775552),(17,9319212311006584270024836382720),(18,21778071473620849045915632166192558374912)] orbit.val

/-- Exact candidate at original node909, strategy4, axis1; every orbit is retained. -/
def row41 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node909, strategy4, axis2; every orbit is retained. -/
def row42 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node909, strategy5, axis0; every orbit is retained. -/
def row50 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(14,2174829877821369049153536),(17,9165705876039077733984066600960),(18,21778071473774353610787019320280049778688)] orbit.val

/-- Exact candidate at original node909, strategy5, axis1; every orbit is retained. -/
def row51 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Exact candidate at original node909, strategy5, axis2; every orbit is retained. -/
def row52 (orbit : Fin 21) : ℤ :=
  sparseIntegerLookup [(1,21778071482940061661655974875633165533184)] orbit.val

/-- Fast complete lookup preserves the original finite node, strategy, axis, and orbit coordinates. -/
def value (_node : Fin 1) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if strategy = 0 then (if axis = 0 then row00 orbit else if axis = 1 then row01 orbit else row02 orbit) else if strategy = 1 then (if axis = 0 then row10 orbit else if axis = 1 then row11 orbit else row12 orbit) else if strategy = 2 then (if axis = 0 then row20 orbit else if axis = 1 then row21 orbit else row22 orbit) else if strategy = 3 then (if axis = 0 then row30 orbit else if axis = 1 then row31 orbit else row32 orbit) else if strategy = 4 then (if axis = 0 then row40 orbit else if axis = 1 then row41 orbit else row42 orbit) else if axis = 0 then row50 orbit else if axis = 1 then row51 orbit else row52 orbit

/-- Independent finite check of the complete original strategy0, physical axis0 orbit row. -/
theorem checked90900 : sparseIntegerVectorCheck ((2:ℤ)^134) row00
    (SuppliedRootFineParent3Columns.numerator 909 0 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis1 orbit row. -/
theorem checked90901 : sparseIntegerVectorCheck ((2:ℤ)^134) row01
    (SuppliedRootFineParent3Columns.numerator 909 0 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy0, physical axis2 orbit row. -/
theorem checked90902 : sparseIntegerVectorCheck ((2:ℤ)^134) row02
    (SuppliedRootFineParent3Columns.numerator 909 0 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis0 orbit row. -/
theorem checked90910 : sparseIntegerVectorCheck ((2:ℤ)^134) row10
    (SuppliedRootFineParent3Columns.numerator 909 1 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis1 orbit row. -/
theorem checked90911 : sparseIntegerVectorCheck ((2:ℤ)^134) row11
    (SuppliedRootFineParent3Columns.numerator 909 1 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy1, physical axis2 orbit row. -/
theorem checked90912 : sparseIntegerVectorCheck ((2:ℤ)^134) row12
    (SuppliedRootFineParent3Columns.numerator 909 1 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis0 orbit row. -/
theorem checked90920 : sparseIntegerVectorCheck ((2:ℤ)^134) row20
    (SuppliedRootFineParent3Columns.numerator 909 2 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis1 orbit row. -/
theorem checked90921 : sparseIntegerVectorCheck ((2:ℤ)^134) row21
    (SuppliedRootFineParent3Columns.numerator 909 2 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy2, physical axis2 orbit row. -/
theorem checked90922 : sparseIntegerVectorCheck ((2:ℤ)^134) row22
    (SuppliedRootFineParent3Columns.numerator 909 2 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis0 orbit row. -/
theorem checked90930 : sparseIntegerVectorCheck ((2:ℤ)^134) row30
    (SuppliedRootFineParent3Columns.numerator 909 3 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis1 orbit row. -/
theorem checked90931 : sparseIntegerVectorCheck ((2:ℤ)^134) row31
    (SuppliedRootFineParent3Columns.numerator 909 3 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy3, physical axis2 orbit row. -/
theorem checked90932 : sparseIntegerVectorCheck ((2:ℤ)^134) row32
    (SuppliedRootFineParent3Columns.numerator 909 3 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis0 orbit row. -/
theorem checked90940 : sparseIntegerVectorCheck ((2:ℤ)^134) row40
    (SuppliedRootFineParent3Columns.numerator 909 4 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis1 orbit row. -/
theorem checked90941 : sparseIntegerVectorCheck ((2:ℤ)^134) row41
    (SuppliedRootFineParent3Columns.numerator 909 4 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy4, physical axis2 orbit row. -/
theorem checked90942 : sparseIntegerVectorCheck ((2:ℤ)^134) row42
    (SuppliedRootFineParent3Columns.numerator 909 4 2) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis0 orbit row. -/
theorem checked90950 : sparseIntegerVectorCheck ((2:ℤ)^134) row50
    (SuppliedRootFineParent3Columns.numerator 909 5 0) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis1 orbit row. -/
theorem checked90951 : sparseIntegerVectorCheck ((2:ℤ)^134) row51
    (SuppliedRootFineParent3Columns.numerator 909 5 1) = true := by decide +kernel

/-- Independent finite check of the complete original strategy5, physical axis2 orbit row. -/
theorem checked90952 : sparseIntegerVectorCheck ((2:ℤ)^134) row52
    (SuppliedRootFineParent3Columns.numerator 909 5 2) = true := by decide +kernel

/-- The complete checked block retains every original strategy, physical axis, and fine orbit. -/
def table : RootFineParent3CacheTable 909 1 :=
  RootFineParent3CacheTable.single 909 (value 0) (by
    intro strategy axis orbit
    refine finSixCases (predicate := fun selected => value 0 selected axis orbit =
      SuppliedRootFineParent3Columns.numerator 909 selected axis orbit) ?_ ?_ ?_ ?_ ?_ ?_ strategy

    · exact finThreeCases (predicate := fun selected => value 0 0 selected orbit =
        SuppliedRootFineParent3Columns.numerator 909 0 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 909 0 0) (SuppliedRootFineParent3Columns.numerator_normalized 909 0 0) checked90900 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 909 0 1) (SuppliedRootFineParent3Columns.numerator_normalized 909 0 1) checked90901 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 909 0 2) (SuppliedRootFineParent3Columns.numerator_normalized 909 0 2) checked90902 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 1 selected orbit =
        SuppliedRootFineParent3Columns.numerator 909 1 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 909 1 0) (SuppliedRootFineParent3Columns.numerator_normalized 909 1 0) checked90910 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 909 1 1) (SuppliedRootFineParent3Columns.numerator_normalized 909 1 1) checked90911 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 909 1 2) (SuppliedRootFineParent3Columns.numerator_normalized 909 1 2) checked90912 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 2 selected orbit =
        SuppliedRootFineParent3Columns.numerator 909 2 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 909 2 0) (SuppliedRootFineParent3Columns.numerator_normalized 909 2 0) checked90920 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 909 2 1) (SuppliedRootFineParent3Columns.numerator_normalized 909 2 1) checked90921 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 909 2 2) (SuppliedRootFineParent3Columns.numerator_normalized 909 2 2) checked90922 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 3 selected orbit =
        SuppliedRootFineParent3Columns.numerator 909 3 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 909 3 0) (SuppliedRootFineParent3Columns.numerator_normalized 909 3 0) checked90930 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 909 3 1) (SuppliedRootFineParent3Columns.numerator_normalized 909 3 1) checked90931 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 909 3 2) (SuppliedRootFineParent3Columns.numerator_normalized 909 3 2) checked90932 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 4 selected orbit =
        SuppliedRootFineParent3Columns.numerator 909 4 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 909 4 0) (SuppliedRootFineParent3Columns.numerator_normalized 909 4 0) checked90940 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 909 4 1) (SuppliedRootFineParent3Columns.numerator_normalized 909 4 1) checked90941 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 909 4 2) (SuppliedRootFineParent3Columns.numerator_normalized 909 4 2) checked90942 orbit) axis

    · exact finThreeCases (predicate := fun selected => value 0 5 selected orbit =
        SuppliedRootFineParent3Columns.numerator 909 5 selected orbit)
        (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 909 5 0) (SuppliedRootFineParent3Columns.numerator_normalized 909 5 0) checked90950 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 909 5 1) (SuppliedRootFineParent3Columns.numerator_normalized 909 5 1) checked90951 orbit) (sparseIntegerVectorCheck_sound _ _ _ (SuppliedRootFineParent3Columns.numerator_nonnegative 909 5 2) (SuppliedRootFineParent3Columns.numerator_normalized 909 5 2) checked90952 orbit) axis

)
end MatrixBounds.Numeric.SuppliedRootFineParent3Block909
