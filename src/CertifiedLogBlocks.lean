module

public import IntegerLogLinearCertificates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Independently kernel-checked blocks can be composed without repeating their
analytic computations. The resulting value retains every original exact term. -/
namespace MatrixBounds.Numeric

/-- A complete exact expression block together with its proved 60-bit real enclosure. -/
structure CertifiedLogBlock where
  terms : List IntegerLogTerm
  bounds : FixedBounds
  sound : (bounds.interval (2^60)).Contains (integerLogValue terms)

/-- The actual real logarithmic sum represented by a finite list of certified blocks. -/
noncomputable def certifiedBlocksValue : List CertifiedLogBlock → ℝ
  | [] => 0
  | block :: rest => integerLogValue block.terms+certifiedBlocksValue rest

/-- Add the proved integer endpoint sums of all blocks at their shared scale. -/
def certifiedBlocksBounds : List CertifiedLogBlock → FixedBounds
  | [] => ⟨0, 0⟩
  | block :: rest => block.bounds.add (certifiedBlocksBounds rest)

/-- Every complete list of certified blocks encloses its complete exact real logarithmic expression. -/
theorem certifiedBlocksBounds_sound (blocks : List CertifiedLogBlock) :
    ((certifiedBlocksBounds blocks).interval (2^60)).Contains (certifiedBlocksValue blocks) := by
  induction blocks with
  | nil => norm_num [certifiedBlocksBounds, certifiedBlocksValue, FixedBounds.interval, Interval.Contains]
  | cons block rest induction => exact FixedBounds.add_sound block.sound induction

/-- A checked reported integer sum inherits the complete analytic soundness of its component blocks. -/
theorem certifiedBlocks_sound (blocks : List CertifiedLogBlock) (reported : FixedBounds)
    (checked : certifiedBlocksBounds blocks = reported) :
    (reported.interval (2^60)).Contains (certifiedBlocksValue blocks) := by
  rw [← checked]
  exact certifiedBlocksBounds_sound blocks

end MatrixBounds.Numeric
