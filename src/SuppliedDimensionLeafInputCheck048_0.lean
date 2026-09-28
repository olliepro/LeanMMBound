import SuppliedDimensionLeafInputData048

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionLeafInputBlock048
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Every cached integer for original source-node offset 0 is exact. -/
theorem zero_checked0 : ∀ index : Fin 72,
    zeroInputs (finProdFinEquiv ((0 : Fin 7), index)) =
      zero2InputBlock 48 (finProdFinEquiv ((0 : Fin 7), index)) := by decide +kernel

/-- Every cached integer for original source-node offset 1 is exact. -/
theorem zero_checked1 : ∀ index : Fin 72,
    zeroInputs (finProdFinEquiv ((1 : Fin 7), index)) =
      zero2InputBlock 48 (finProdFinEquiv ((1 : Fin 7), index)) := by decide +kernel

/-- Every cached integer for original source-node offset 0 is exact. -/
theorem terminal_checked0 : ∀ index : Fin 18,
    terminalInputs (finProdFinEquiv ((0 : Fin 7), index)) =
      terminalInputBlock 48 (finProdFinEquiv ((0 : Fin 7), index)) := by decide +kernel

/-- Every cached integer for original source-node offset 1 is exact. -/
theorem terminal_checked1 : ∀ index : Fin 18,
    terminalInputs (finProdFinEquiv ((1 : Fin 7), index)) =
      terminalInputBlock 48 (finProdFinEquiv ((1 : Fin 7), index)) := by decide +kernel

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionLeafInputBlock048
