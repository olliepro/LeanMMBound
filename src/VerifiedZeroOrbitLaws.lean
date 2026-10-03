module

public import OrbitDiracLaws
public import VerifiedOrbitLevel4
public import CWZeroRationalExtraction

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The all-zero fine law is represented by the first supplied orbit at all
three recursive levels, as required for the zero coordinate of each leaf. -/
namespace MatrixBounds.Numeric

open Entropy Tensor.CW
noncomputable section

namespace OrbitLevel2

/-- The first supplied orbit has exactly the constant-zero fine-word representative. -/
theorem zero_representative : orbits.representative 0 = (fun _ => 0) := by
  funext position
  fin_cases position <;> rfl

/-- The first supplied orbit is the complete all-zero law of a two-letter zero axis. -/
theorem decode_zero : orbits.decode (fun orbit => if orbit = 0 then 1 else 0) = zeroFineLaw 2 := by
  rw [orbits.decode_singleton 0 (by rw [sizes_correct]; rfl), zero_representative]
  rfl

end OrbitLevel2

namespace OrbitLevel3

/-- The first supplied orbit has exactly the constant-zero fine-word representative. -/
theorem zero_representative : orbits.representative 0 = (fun _ => 0) := by
  funext position
  fin_cases position <;> rfl

/-- The first supplied orbit is the complete all-zero law of a four-letter zero axis. -/
theorem decode_zero : orbits.decode (fun orbit => if orbit = 0 then 1 else 0) = zeroFineLaw 4 := by
  rw [orbits.decode_singleton 0 (by rw [sizes_correct]; rfl), zero_representative]
  rfl

end OrbitLevel3

namespace OrbitLevel4

/-- The first supplied orbit has exactly the constant-zero fine-word representative. -/
theorem zero_representative : orbits.representative 0 = (fun _ => 0) := by
  funext position
  fin_cases position <;> rfl

/-- The first supplied orbit is the complete all-zero law of an eight-letter zero axis. -/
theorem decode_zero : orbits.decode (fun orbit => if orbit = 0 then 1 else 0) = zeroFineLaw 8 := by
  rw [orbits.decode_singleton 0 (by rw [sizes_correct]; rfl), zero_representative]
  rfl

end OrbitLevel4
end
end MatrixBounds.Numeric
