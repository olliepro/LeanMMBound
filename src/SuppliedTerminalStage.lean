import SuppliedTerminalScaling

/-! Actual shared terminal matrix extraction for labelled supplied parameters,
with all integer population bounds and reference counts discharged internally. -/
namespace MatrixBounds.Numeric.SuppliedTerminalStage

universe v
open Tensor Tensor.CW Tensor.CW.Terminal Entropy Empirical RepairRates SuppliedTerminalScaling
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T : Type*} [Fintype T]

/-- Exact shared terminal rate for the original labelled parameters and integer population weights. -/
def retention (source : T → Source) (role : T → AxisOrder) (weight : T → ℕ) (error : ℝ) : ℝ :=
  permutedRetention (fun type => axes (source type) (role type)) error
    (fun type => weight type*extreme (source type)) (fun type => weight type*middle (source type))

/-- The actual complete supplied terminal input tensor at a common integer scale. -/
def parent {K : Type*} [CommRing K] (source : T → Source) (role : T → AxisOrder) (weight : T → ℕ)
    (size : ℕ) (wide : ℝ) :=
  permutedParentTensor (K := K) (fun type => axes (source type) (role type)) 5
    (fun type => size*(weight type*extreme (source type)))
    (fun type => size*(weight type*middle (source type))) wide

/-- Genuine rectangular matrix tensor yielded by all actual source terminal factors at the common scale. -/
def matrix {K : Type*} [CommRing K] (source : T → Source) (role : T → AxisOrder) (weight : T → ℕ) (size : ℕ) :=
  permutedMatrixTensor (K := K) (fun type => axes (source type) (role type)) 5
    (fun type => size*(weight type*extreme (source type)))
    (fun type => size*(weight type*middle (source type)))

/-- Scaled actual supplied terminal counts have precisely their fixed integer population coefficient. -/
theorem population_scaled (source : Source) (weight size : ℕ) :
    2*(size*(weight*extreme source)+size*(weight*middle source)) = (17592186044416*weight)*size := by
  calc
    _ = (size*weight)*(2*(extreme source+middle source)) := by ring
    _ = _ := by rw [population]; ring

/-- Every labelled supplied terminal collection yields actual rectangular matrix copies at its exact shared rate.
Only positive asymptotic losses, window size, and the chosen positive integer populations remain as inputs. -/
theorem eventual_extraction {K : Type*} [CommRing K]
    (source : T → Source) (role : T → AxisOrder) (weight : T → ℕ) (weightPositive : ∀ type, 0 < weight type)
    {degreeError copyError costError wide : ℝ} (degreePositive : 0 < degreeError)
    (copyPositive : 0 < copyError) (costPositive : 0 < costError) (widePositive : 0 < wide) :
    ∃ threshold : ℕ, ∀ k : ℕ, threshold ≤ k → ∃ copies overhead : ℕ,
      Real.exp ((retention source role weight degreeError-copyError)*scale k) ≤ copies ∧
      (overhead : ℝ) ≤ Real.exp (costError*scale k) ∧
      ContextReduction.{v} (parent (K := K) source role weight (scale k) wide)
        (directSum (fun _ : Fin copies => matrix (K := K) source role weight (scale k))) overhead := by
  obtain ⟨threshold, extract⟩ := eventual_permuted_terminal_extraction (K := K) (T := T) 5 3 (by decide)
    (fun type => 17592186044416*weight type) degreePositive copyPositive costPositive widePositive
  refine ⟨max 1 threshold, ?_⟩
  intro k large
  have scalePositive : 0 < scale k := (show 0 < k by omega).trans_le (index_le_scale k)
  have multiplierPositive (type : T) : 0 < 17592186044416*weight type := Nat.mul_pos (by decide) (weightPositive type)
  have countPositive (type : T) : 0 < scale k*(weight type*extreme (source type))+scale k*(weight type*middle (source type)) :=
    Nat.add_pos_left (Nat.mul_pos scalePositive (Nat.mul_pos (weightPositive type) (positive (source type)).1)) _
  have lower (type : T) : scale k ≤ (17592186044416*weight type)*
      (2*(scale k*(weight type*extreme (source type))+scale k*(weight type*middle (source type)))) := by
    rw [population_scaled]
    exact (Nat.le_mul_of_pos_left _ (multiplierPositive type)).trans
      (Nat.le_mul_of_pos_left _ (multiplierPositive type))
  have upper (type : T) : 2*(scale k*(weight type*extreme (source type))+scale k*(weight type*middle (source type))) ≤
      (17592186044416*weight type)*scale k := (population_scaled _ _ _).le
  obtain ⟨copies, overhead, retained, cost, reduction⟩ := extract k (by omega)
    (fun type => axes (source type) (role type))
    (fun type => scale k*(weight type*extreme (source type)))
    (fun type => scale k*(weight type*middle (source type))) countPositive lower upper
  refine ⟨copies, overhead, ?_, cost, reduction⟩
  rw [permutedRetention_scale _ _ _ _ (scale k) scalePositive] at retained
  simpa only [retention, sub_mul] using retained

end
end MatrixBounds.Numeric.SuppliedTerminalStage
