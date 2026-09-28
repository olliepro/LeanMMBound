import SuppliedDimensionLeafInputCheck086_0
import SuppliedDimensionLeafInputCheck086_1
import SuppliedDimensionLeafInputCheck086_2
import SuppliedDimensionLeafInputCheck086_3

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionLeafInputBlock086
set_option maxRecDepth 100000

/-- The seven disjoint checked nodes cover every original cached source input. -/
theorem zero_checked : ∀ index, zeroInputs index = zero2InputBlock 86 index := by
  intro index
  obtain ⟨⟨offset, inner⟩, rfl⟩ := (finProdFinEquiv : Fin 7 × Fin 72 ≃ Fin 504).surjective index
  fin_cases offset
  · exact zero_checked0 inner
  · exact zero_checked1 inner
  · exact zero_checked2 inner
  · exact zero_checked3 inner
  · exact zero_checked4 inner
  · exact zero_checked5 inner
  · exact zero_checked6 inner

/-- The seven disjoint checked nodes cover every original cached source input. -/
theorem terminal_checked : ∀ index, terminalInputs index = terminalInputBlock 86 index := by
  intro index
  obtain ⟨⟨offset, inner⟩, rfl⟩ := (finProdFinEquiv : Fin 7 × Fin 18 ≃ Fin 126).surjective index
  fin_cases offset
  · exact terminal_checked0 inner
  · exact terminal_checked1 inner
  · exact terminal_checked2 inner
  · exact terminal_checked3 inner
  · exact terminal_checked4 inner
  · exact terminal_checked5 inner
  · exact terminal_checked6 inner

/-- All independently checked inputs preserve the complete original leaf dimension contribution. -/
theorem expression_value : rationalLogValue expression = rationalLogValue (leafBlockExpression 86) := by
  simp only [expression, funext zero_checked, funext terminal_checked, rationalLogValue_append,
    zero2InputBlock_value, terminalInputBlock_value, leafBlockExpression]

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionLeafInputBlock086
