import TypePartition
import PolynomialDegeneration

/-! Nested accepted variable sets are connected by explicit diagonal axis maps.
This supplies actual tensor restrictions for shrinking interface tolerances. -/
namespace MatrixBounds.Empirical

open Tensor
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K X Y Z PX PY PZ : Type*} [CommSemiring K]
variable [Fintype X] [Fintype Y] [Fintype Z]

omit [Fintype X] [Fintype Y] [Fintype Z] in
/-- A nonzero accepted coefficient satisfies the original support and all three axis predicates. -/
theorem accepted_nonzero (tensor : Coeff K X Y Z)
    (typeX : X → PX) (typeY : Y → PY) (typeZ : Z → PZ)
    (acceptX : PX → Prop) (acceptY : PY → Prop) (acceptZ : PZ → Prop)
    (x : X) (y : Y) (z : Z)
    (nonzero : acceptedTensor tensor typeX typeY typeZ acceptX acceptY acceptZ x y z ≠ 0) :
    tensor x y z ≠ 0 ∧ acceptX (typeX x) ∧ acceptY (typeY y) ∧ acceptZ (typeZ z) := by
  unfold acceptedTensor at nonzero
  split_ifs at nonzero with accepted
  · exact ⟨nonzero, accepted⟩
  · exact (nonzero rfl).elim

/-- Applying three arbitrary axis acceptance tests preserves the existing degeneration budget. -/
def acceptedCertificate (tensor : Coeff K X Y Z)
    (typeX : X → PX) (typeY : Y → PY) (typeZ : Z → PZ)
    (acceptX : PX → Prop) (acceptY : PY → Prop) (acceptZ : PZ → Prop)
    {rank degree : ℕ} (certificate : Degeneration.Certificate tensor rank degree) :
    Degeneration.Certificate (acceptedTensor tensor typeX typeY typeZ acceptX acceptY acceptZ) rank degree := by
  have restricted := certificate.restrict
    (mask (fun x => decide (acceptX (typeX x)))) (mask (fun y => decide (acceptY (typeY y))))
    (mask (fun z => decide (acceptZ (typeZ z))))
  simpa only [restrict_mask, decide_eq_true_eq, acceptedTensor] using restricted

/-- Strengthening three acceptance predicates is a legitimate independent-axis tensor restriction. -/
theorem restrict_narrower_accepted (tensor : Coeff K X Y Z)
    (typeX : X → PX) (typeY : Y → PY) (typeZ : Z → PZ)
    (wideX narrowX : PX → Prop) (wideY narrowY : PY → Prop) (wideZ narrowZ : PZ → Prop)
    (includesX : ∀ label, narrowX label → wideX label)
    (includesY : ∀ label, narrowY label → wideY label)
    (includesZ : ∀ label, narrowZ label → wideZ label) :
    restrict (mask (fun x => decide (narrowX (typeX x)))) (mask (fun y => decide (narrowY (typeY y))))
      (mask (fun z => decide (narrowZ (typeZ z))))
      (acceptedTensor tensor typeX typeY typeZ wideX wideY wideZ) =
      acceptedTensor tensor typeX typeY typeZ narrowX narrowY narrowZ := by
  rw [restrict_mask]
  funext x y z
  by_cases hx : narrowX (typeX x)
  · by_cases hy : narrowY (typeY y)
    · by_cases hz : narrowZ (typeZ z)
      · simp [acceptedTensor, hx, hy, hz, includesX _ hx, includesY _ hy, includesZ _ hz]
      · simp [acceptedTensor, hz]
    · simp [acceptedTensor, hy]
  · simp [acceptedTensor, hx]

/-- Shrinking accepted variable sets transports any available polynomial degeneration. -/
def narrowerAcceptedCertificate (tensor : Coeff K X Y Z)
    (typeX : X → PX) (typeY : Y → PY) (typeZ : Z → PZ)
    (wideX narrowX : PX → Prop) (wideY narrowY : PY → Prop) (wideZ narrowZ : PZ → Prop)
    (includesX : ∀ label, narrowX label → wideX label)
    (includesY : ∀ label, narrowY label → wideY label)
    (includesZ : ∀ label, narrowZ label → wideZ label) {rank degree : ℕ}
    (certificate : Degeneration.Certificate (acceptedTensor tensor typeX typeY typeZ wideX wideY wideZ) rank degree) :
    Degeneration.Certificate (acceptedTensor tensor typeX typeY typeZ narrowX narrowY narrowZ) rank degree := by
  rw [← restrict_narrower_accepted tensor typeX typeY typeZ wideX narrowX wideY narrowY wideZ narrowZ
    includesX includesY includesZ]
  exact certificate.restrict _ _ _

end
end MatrixBounds.Empirical
