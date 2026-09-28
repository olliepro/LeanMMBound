import SuppliedDimensionLeafInputData134

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionLeafInputBlock134
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Every cached integer for original source-node offset 2 is exact. -/
theorem zero_checked2 : ∀ index : Fin 72,
    zeroInputs (finProdFinEquiv ((2 : Fin 7), index)) =
      zero2InputBlock 134 (finProdFinEquiv ((2 : Fin 7), index)) := by decide +kernel

/-- Every cached integer for original source-node offset 3 is exact. -/
theorem zero_checked3 : ∀ index : Fin 72,
    zeroInputs (finProdFinEquiv ((3 : Fin 7), index)) =
      zero2InputBlock 134 (finProdFinEquiv ((3 : Fin 7), index)) := by decide +kernel

/-- Every cached integer for original source-node offset 2 is exact. -/
theorem terminal_checked2 : ∀ index : Fin 18,
    terminalInputs (finProdFinEquiv ((2 : Fin 7), index)) =
      terminalInputBlock 134 (finProdFinEquiv ((2 : Fin 7), index)) := by decide +kernel

/-- Every cached integer for original source-node offset 3 is exact. -/
theorem terminal_checked3 : ∀ index : Fin 18,
    terminalInputs (finProdFinEquiv ((3 : Fin 7), index)) =
      terminalInputBlock 134 (finProdFinEquiv ((3 : Fin 7), index)) := by decide +kernel

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionLeafInputBlock134
