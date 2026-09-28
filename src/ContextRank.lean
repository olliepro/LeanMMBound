import ContextComposition

/-! Turn context-preserving transformations into actual rank certificates.
Polynomial coefficient extraction is needed only once, at the original input. -/
namespace MatrixBounds.Tensor

universe v
noncomputable section
variable {K X Y Z U V W : Type*} [CommSemiring K]

/-- Specializing to a one-dimensional companion yields an ordinary rank transformation. -/
theorem ContextReduction.apply_rank {source : Coeff K X Y Z} {target : Coeff K U V W} {cost rank : ℕ}
    (reduction : ContextReduction.{v} source target cost) (algorithm : RankLE source rank) :
    RankLE target (cost*rank) := by
  let unitTensor : Coeff K (ULift.{v} Unit) (ULift.{v} Unit) (ULift.{v} Unit) := fun _ _ _ => 1
  have input : RankLE (product unitTensor source) rank := by
    change RankLE (fun (x : ULift.{v} Unit × X) (y : ULift.{v} Unit × Y) (z : ULift.{v} Unit × Z) => 1*source x.2 y.2 z.2) rank
    simpa only [product, unitTensor, one_mul] using rankLE_pullback algorithm
      (fun x : ULift.{v} Unit × X => x.2) (fun y : ULift.{v} Unit × Y => y.2) (fun z : ULift.{v} Unit × Z => z.2)
  have output := reduction _ _ _ unitTensor rank input
  simpa only [product, unitTensor, one_mul] using rankLE_pullback output
    (fun x : U => (ULift.up (), x)) (fun y : V => (ULift.up (), y)) (fun z : W => (ULift.up (), z))

/-- An initial polynomial degeneration supplies the whole contextual construction after one coefficient extraction. -/
theorem ContextReduction.apply_certificate {source : Coeff K X Y Z} {target : Coeff K U V W} {cost rank degree : ℕ}
    (reduction : ContextReduction.{v} source target cost) (certificate : Degeneration.Certificate source rank degree) :
    RankLE target (cost*(rank*(degree+1)^2)) := reduction.apply_rank certificate.exact_rank

end
end MatrixBounds.Tensor
