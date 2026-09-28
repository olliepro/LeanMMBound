import SuppliedDimensionLeafInputData024

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionLeafInputBlock024
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Every cached integer for original source-node offset 6 is exact. -/
theorem zero_checked6 : ∀ index : Fin 72,
    zeroInputs (finProdFinEquiv ((6 : Fin 7), index)) =
      zero2InputBlock 24 (finProdFinEquiv ((6 : Fin 7), index)) := by decide +kernel

/-- Every cached integer for original source-node offset 6 is exact. -/
theorem terminal_checked6 : ∀ index : Fin 18,
    terminalInputs (finProdFinEquiv ((6 : Fin 7), index)) =
      terminalInputBlock 24 (finProdFinEquiv ((6 : Fin 7), index)) := by decide +kernel

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionLeafInputBlock024
