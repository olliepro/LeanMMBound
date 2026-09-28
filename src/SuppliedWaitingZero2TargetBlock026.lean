import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 53248 through 55295. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock026
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 53248 through 53375. -/
theorem block00 : IndexBlockCertificate valid 53248 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 53376 through 53503. -/
theorem block01 : IndexBlockCertificate valid 53376 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 53504 through 53631. -/
theorem block02 : IndexBlockCertificate valid 53504 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 53632 through 53759. -/
theorem block03 : IndexBlockCertificate valid 53632 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 53760 through 53887. -/
theorem block04 : IndexBlockCertificate valid 53760 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 53888 through 54015. -/
theorem block05 : IndexBlockCertificate valid 53888 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 54016 through 54143. -/
theorem block06 : IndexBlockCertificate valid 54016 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 54144 through 54271. -/
theorem block07 : IndexBlockCertificate valid 54144 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 54272 through 54399. -/
theorem block08 : IndexBlockCertificate valid 54272 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 54400 through 54527. -/
theorem block09 : IndexBlockCertificate valid 54400 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 54528 through 54655. -/
theorem block10 : IndexBlockCertificate valid 54528 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 54656 through 54783. -/
theorem block11 : IndexBlockCertificate valid 54656 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 54784 through 54911. -/
theorem block12 : IndexBlockCertificate valid 54784 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 54912 through 55039. -/
theorem block13 : IndexBlockCertificate valid 54912 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 55040 through 55167. -/
theorem block14 : IndexBlockCertificate valid 55040 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 55168 through 55295. -/
theorem block15 : IndexBlockCertificate valid 55168 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 53248 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock026
