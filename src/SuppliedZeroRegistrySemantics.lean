module

public import SuppliedZeroRegistryChecks

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Transfer the once-per-original-row support registry proof to its actual
accepted sparse row, without repeating row checks at every source occurrence. -/
namespace MatrixBounds.Numeric.SuppliedZeroRegistry

/-- A registered six-orbit source row has its exact registry support target. -/
theorem support2 (index : Fin 15279)
    (width : (IndexedCertificateRows.dyadic index).val.width = 6)
    (registered : (table.get index).val ≠ 0) :
    (IndexedCertificateRows.dyadic index).val.supportCheck OrbitLevel2.totalAt ((table.get index).val-1) = true := by
  have checked := validComplete.complete index
  simpa [valid, check, registered, width] using checked

/-- A registered twenty-one-orbit source row has its exact registry support target. -/
theorem support3 (index : Fin 15279)
    (width : (IndexedCertificateRows.dyadic index).val.width = 21)
    (registered : (table.get index).val ≠ 0) :
    (IndexedCertificateRows.dyadic index).val.supportCheck OrbitLevel3.totalAt ((table.get index).val-1) = true := by
  have checked := validComplete.complete index
  simpa [valid, check, registered, width] using checked

/-- A registered 231-orbit source row has its exact registry support target. -/
theorem support4 (index : Fin 15279)
    (width : (IndexedCertificateRows.dyadic index).val.width = 231)
    (registered : (table.get index).val ≠ 0) :
    (IndexedCertificateRows.dyadic index).val.supportCheck OrbitLevel4.totalAt ((table.get index).val-1) = true := by
  have checked := validComplete.complete index
  simpa [valid, check, registered, width] using checked

end MatrixBounds.Numeric.SuppliedZeroRegistry
