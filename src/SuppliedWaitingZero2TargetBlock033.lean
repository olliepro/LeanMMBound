import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 67584 through 68039. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock033
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 67584 through 67711. -/
theorem block00 : IndexBlockCertificate valid 67584 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 67712 through 67839. -/
theorem block01 : IndexBlockCertificate valid 67712 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 67840 through 67967. -/
theorem block02 : IndexBlockCertificate valid 67840 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 67968 through 68039. -/
theorem block03 : IndexBlockCertificate valid 67968 72 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 67584 456 :=
  (((block00).append block01).append block02).append block03

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock033
