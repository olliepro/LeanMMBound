import HashModulus
import HashSurvivors

/-! Explicit logarithmic loss of the progression-free hash buckets. These
finite estimates expose the square-root-log overhead in the output count. -/
namespace MatrixBounds.HashBuckets

noncomputable section

/-- At any modulus at least three, its integer half is at least one third of the modulus. -/
theorem half_modulus_lower {modulus : ℕ} (large : 3 ≤ modulus) :
    (modulus : ℝ)/3 ≤ (modulus/2 : ℕ) := by
  have integer_bound : modulus ≤ 3*(modulus/2) := by omega
  have real_bound : (modulus : ℝ) ≤ 3*(modulus/2 : ℕ) := by exact_mod_cast integer_bound
  linarith

/-- Replace the floor in the Behrend bound with a simple explicit factor of three. -/
theorem bucket_lower_simple {modulus size : ℕ} (large : 3 ≤ modulus)
    (bound : ((modulus/2 : ℕ) : ℝ)*Real.exp (-4*Real.sqrt (Real.log (modulus/2 : ℕ))) ≤ size) :
    (modulus : ℝ)/3*Real.exp (-4*Real.sqrt (Real.log modulus)) ≤ size := by
  have half_positive : (0 : ℝ) < (modulus/2 : ℕ) := by exact_mod_cast (show 0 < modulus/2 by omega)
  have half_upper : ((modulus/2 : ℕ) : ℝ) ≤ modulus := by exact_mod_cast Nat.div_le_self modulus 2
  have logarithm := Real.log_le_log half_positive half_upper
  have root := Real.sqrt_le_sqrt logarithm
  have exponential : Real.exp (-4*Real.sqrt (Real.log modulus)) ≤
      Real.exp (-4*Real.sqrt (Real.log (modulus/2 : ℕ))) := by
    apply Real.exp_le_exp.mpr
    linarith
  exact (mul_le_mul (half_modulus_lower large) exponential (Real.exp_pos _).le half_positive.le).trans bound

/-- The integer surviving-edge inequality gives the exact G/(6M) Behrend retention bound. -/
theorem surviving_count_lower {modulus edges buckets copies : ℕ} (large : 3 ≤ modulus)
    (bucket_bound : ((modulus/2 : ℕ) : ℝ)*Real.exp (-4*Real.sqrt (Real.log (modulus/2 : ℕ))) ≤ buckets)
    (selected : edges*buckets ≤ 2*modulus^2*copies) :
    (edges : ℝ)/(6*modulus)*Real.exp (-4*Real.sqrt (Real.log modulus)) ≤ copies := by
  have positive : (0 : ℝ) < modulus := by exact_mod_cast (show 0 < modulus by omega)
  have selection : (edges : ℝ)*buckets ≤ 2*(modulus : ℝ)^2*copies := by exact_mod_cast selected
  have bucket := mul_le_mul_of_nonneg_left (bucket_lower_simple large bucket_bound) (Nat.cast_nonneg edges)
  rw [div_mul_eq_mul_div]
  apply (div_le_iff₀ (by positivity : (0 : ℝ) < 6*modulus)).mpr
  have multiplied : (modulus : ℝ)*((edges : ℝ)*Real.exp (-4*Real.sqrt (Real.log modulus))) ≤
      modulus*((copies : ℝ)*(6*modulus)) := by nlinarith
  exact (mul_le_mul_iff_right₀ positive).mp multiplied

/-- Taking logarithms exposes the complete finite loss, including the constant factor six. -/
theorem surviving_count_exponential {modulus edges buckets copies : ℕ} (large : 3 ≤ modulus)
    (edges_positive : 0 < edges)
    (bucket_bound : ((modulus/2 : ℕ) : ℝ)*Real.exp (-4*Real.sqrt (Real.log (modulus/2 : ℕ))) ≤ buckets)
    (selected : edges*buckets ≤ 2*modulus^2*copies) :
    Real.exp (Real.log edges - Real.log modulus - Real.log 6 - 4*Real.sqrt (Real.log modulus)) ≤ copies := by
  have positive : (0 : ℝ) < modulus := by exact_mod_cast (show 0 < modulus by omega)
  have edge_positive : (0 : ℝ) < edges := by exact_mod_cast edges_positive
  have result := surviving_count_lower large bucket_bound selected
  have identity : Real.exp (Real.log edges - Real.log modulus - Real.log 6 - 4*Real.sqrt (Real.log modulus)) =
      (edges : ℝ)/(6*modulus)*Real.exp (-4*Real.sqrt (Real.log modulus)) := by
    rw [show Real.log edges - Real.log modulus - Real.log 6 - 4*Real.sqrt (Real.log modulus) =
      (Real.log edges - Real.log modulus - Real.log 6) + (-4*Real.sqrt (Real.log modulus)) by ring,
      Real.exp_add, Real.exp_sub, Real.exp_sub, Real.exp_log edge_positive,
      Real.exp_log positive, Real.exp_log (by norm_num : (0 : ℝ) < 6)]
    ring
  rwa [identity]

/-- A square-root loss is below epsilon*N once the displayed elementary size inequality holds. -/
theorem square_root_loss {cost size epsilon : ℝ} (cost_nonneg : 0 ≤ cost) (size_positive : 0 < size)
    (epsilon_positive : 0 < epsilon) (large : 16*cost ≤ epsilon^2*size) :
    4*Real.sqrt (cost*size) ≤ epsilon*size := by
  have square := Real.sq_sqrt (mul_nonneg cost_nonneg size_positive.le)
  have scaled := mul_le_mul_of_nonneg_right large size_positive.le
  apply (sq_le_sq₀ (by positivity : 0 ≤ 4*Real.sqrt (cost*size))
    (mul_nonneg epsilon_positive.le size_positive.le)).mp
  nlinarith

end
end MatrixBounds.HashBuckets
