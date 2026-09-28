import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 4096 through 6143. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock002
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 4096 through 4223. -/
theorem block00 : IndexBlockCertificate valid 4096 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 4224 through 4351. -/
theorem block01 : IndexBlockCertificate valid 4224 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 4352 through 4479. -/
theorem block02 : IndexBlockCertificate valid 4352 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 4480 through 4607. -/
theorem block03 : IndexBlockCertificate valid 4480 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 4608 through 4735. -/
theorem block04 : IndexBlockCertificate valid 4608 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 4736 through 4863. -/
theorem block05 : IndexBlockCertificate valid 4736 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 4864 through 4991. -/
theorem block06 : IndexBlockCertificate valid 4864 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 4992 through 5119. -/
theorem block07 : IndexBlockCertificate valid 4992 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 5120 through 5247. -/
theorem block08 : IndexBlockCertificate valid 5120 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 5248 through 5375. -/
theorem block09 : IndexBlockCertificate valid 5248 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 5376 through 5503. -/
theorem block10 : IndexBlockCertificate valid 5376 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 5504 through 5631. -/
theorem block11 : IndexBlockCertificate valid 5504 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 5632 through 5759. -/
theorem block12 : IndexBlockCertificate valid 5632 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 5760 through 5887. -/
theorem block13 : IndexBlockCertificate valid 5760 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 5888 through 6015. -/
theorem block14 : IndexBlockCertificate valid 5888 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 6016 through 6143. -/
theorem block15 : IndexBlockCertificate valid 6016 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 4096 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock002
