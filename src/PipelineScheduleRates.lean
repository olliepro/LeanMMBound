import PipelineSchedule

/-! Exact retention accounting for every round of the finite pipeline. -/
namespace MatrixBounds.Pipeline

open scoped BigOperators
noncomputable section

/-- The first K rounds contain two warm-up rounds and K-2 complete rounds. -/
theorem prefix_retention {batches : ℕ} (large : 2 ≤ batches) (rates : Fin 3 → Rates) :
    (∑ round ∈ Finset.range batches, bottleneck (roundRates batches round rates)) =
      bottleneck (rates 0)+bottleneck (rates 0+rates 1)+
        ((batches : ℝ)-2)*bottleneck (rates 0+rates 1+rates 2) := by
  have count : batches = 2+(batches-2) := by omega
  rw [show Finset.range batches = Finset.range (2+(batches-2)) from congrArg Finset.range count,
    Finset.sum_range_add]
  have steady : (∑ round ∈ Finset.range (batches-2),
      bottleneck (roundRates batches (2+round) rates)) =
      ((batches : ℝ)-2)*bottleneck (rates 0+rates 1+rates 2) := by
    rw [Finset.sum_congr rfl (fun round inside =>
      congrArg bottleneck (roundRates_steady (by omega) (by
        have := Finset.mem_range.mp inside
        omega) rates))]
    simp only [Finset.sum_const, Finset.card_range, nsmul_eq_mul, Nat.cast_sub large, Nat.cast_ofNat]
  rw [steady]
  simp only [Finset.sum_range_succ, Finset.range_zero, Finset.sum_empty, zero_add,
    roundRates_first (by omega : 0 < batches), roundRates_second large]

/-- Summing the bottleneck of each actual scheduled round gives the advertised finite formula. -/
theorem total_retention {batches : ℕ} (large : 2 ≤ batches) (rates : Fin 3 → Rates) :
    (∑ round ∈ Finset.range (batches+2), bottleneck (roundRates batches round rates)) =
      scheduledRetention batches (rates 0) (rates 1) (rates 2) := by
  rw [show batches+2 = (batches+1)+1 by omega, Finset.sum_range_succ, Finset.sum_range_succ,
    prefix_retention large rates, roundRates_drain large,
    roundRates_last (by omega : 0 < batches)]
  rfl

/-- The boundary correction follows from the actual finite schedule, including every drain round. -/
theorem total_retention_boundary {batches : ℕ} (large : 2 ≤ batches) (rates : Fin 3 → Rates) :
    (∑ round ∈ Finset.range (batches+2), bottleneck (roundRates batches round rates)) =
      batches*bottleneck (rates 0+rates 1+rates 2)-boundaryLoss (rates 0) (rates 1) (rates 2) := by
  rw [total_retention large, schedule_identity]

/-- A common per-round error pays for precisely K+2 extraction rounds. -/
theorem total_growth {batches : ℕ} (large : 2 ≤ batches) (rates : Fin 3 → Rates)
    (error size : ℝ) :
    (∑ round ∈ Finset.range (batches+2), (bottleneck (roundRates batches round rates)-error)*size) =
      (batches*bottleneck (rates 0+rates 1+rates 2)-boundaryLoss (rates 0) (rates 1) (rates 2)
        -(batches+2)*error)*size := by
  rw [← Finset.sum_mul, Finset.sum_sub_distrib, total_retention_boundary large]
  simp only [Finset.sum_const, Finset.card_range, nsmul_eq_mul, Nat.cast_add, Nat.cast_ofNat]

end
end MatrixBounds.Pipeline
