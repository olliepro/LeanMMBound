import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 28672 through 30719. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock014
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 28672 through 28799. -/
theorem block00 : IndexBlockCertificate valid 28672 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 28800 through 28927. -/
theorem block01 : IndexBlockCertificate valid 28800 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 28928 through 29055. -/
theorem block02 : IndexBlockCertificate valid 28928 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 29056 through 29183. -/
theorem block03 : IndexBlockCertificate valid 29056 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 29184 through 29311. -/
theorem block04 : IndexBlockCertificate valid 29184 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 29312 through 29439. -/
theorem block05 : IndexBlockCertificate valid 29312 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 29440 through 29567. -/
theorem block06 : IndexBlockCertificate valid 29440 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 29568 through 29695. -/
theorem block07 : IndexBlockCertificate valid 29568 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 29696 through 29823. -/
theorem block08 : IndexBlockCertificate valid 29696 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 29824 through 29951. -/
theorem block09 : IndexBlockCertificate valid 29824 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 29952 through 30079. -/
theorem block10 : IndexBlockCertificate valid 29952 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 30080 through 30207. -/
theorem block11 : IndexBlockCertificate valid 30080 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 30208 through 30335. -/
theorem block12 : IndexBlockCertificate valid 30208 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 30336 through 30463. -/
theorem block13 : IndexBlockCertificate valid 30336 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 30464 through 30591. -/
theorem block14 : IndexBlockCertificate valid 30464 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 30592 through 30719. -/
theorem block15 : IndexBlockCertificate valid 30592 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 28672 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock014
