import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 6144 through 8191. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock003
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 6144 through 6271. -/
theorem block00 : IndexBlockCertificate valid 6144 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 6272 through 6399. -/
theorem block01 : IndexBlockCertificate valid 6272 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 6400 through 6527. -/
theorem block02 : IndexBlockCertificate valid 6400 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 6528 through 6655. -/
theorem block03 : IndexBlockCertificate valid 6528 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 6656 through 6783. -/
theorem block04 : IndexBlockCertificate valid 6656 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 6784 through 6911. -/
theorem block05 : IndexBlockCertificate valid 6784 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 6912 through 7039. -/
theorem block06 : IndexBlockCertificate valid 6912 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 7040 through 7167. -/
theorem block07 : IndexBlockCertificate valid 7040 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 7168 through 7295. -/
theorem block08 : IndexBlockCertificate valid 7168 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 7296 through 7423. -/
theorem block09 : IndexBlockCertificate valid 7296 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 7424 through 7551. -/
theorem block10 : IndexBlockCertificate valid 7424 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 7552 through 7679. -/
theorem block11 : IndexBlockCertificate valid 7552 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 7680 through 7807. -/
theorem block12 : IndexBlockCertificate valid 7680 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 7808 through 7935. -/
theorem block13 : IndexBlockCertificate valid 7808 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 7936 through 8063. -/
theorem block14 : IndexBlockCertificate valid 7936 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 8064 through 8191. -/
theorem block15 : IndexBlockCertificate valid 8064 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 6144 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock003
