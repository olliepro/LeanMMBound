import SuppliedDimensionLeafInputData132

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionLeafInputBlock132
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Every cached integer for original source-node offset 4 is exact. -/
theorem zero_checked4 : ∀ index : Fin 72,
    zeroInputs (finProdFinEquiv ((4 : Fin 7), index)) =
      zero2InputBlock 132 (finProdFinEquiv ((4 : Fin 7), index)) := by decide +kernel

/-- Every cached integer for original source-node offset 5 is exact. -/
theorem zero_checked5 : ∀ index : Fin 72,
    zeroInputs (finProdFinEquiv ((5 : Fin 7), index)) =
      zero2InputBlock 132 (finProdFinEquiv ((5 : Fin 7), index)) := by decide +kernel

/-- Every cached integer for original source-node offset 4 is exact. -/
theorem terminal_checked4 : ∀ index : Fin 18,
    terminalInputs (finProdFinEquiv ((4 : Fin 7), index)) =
      terminalInputBlock 132 (finProdFinEquiv ((4 : Fin 7), index)) := by decide +kernel

/-- Every cached integer for original source-node offset 5 is exact. -/
theorem terminal_checked5 : ∀ index : Fin 18,
    terminalInputs (finProdFinEquiv ((5 : Fin 7), index)) =
      terminalInputBlock 132 (finProdFinEquiv ((5 : Fin 7), index)) := by decide +kernel

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionLeafInputBlock132
