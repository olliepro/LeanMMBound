import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 61440 through 63487. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock030
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 61440 through 61567. -/
theorem block00 : IndexBlockCertificate valid 61440 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 61568 through 61695. -/
theorem block01 : IndexBlockCertificate valid 61568 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 61696 through 61823. -/
theorem block02 : IndexBlockCertificate valid 61696 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 61824 through 61951. -/
theorem block03 : IndexBlockCertificate valid 61824 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 61952 through 62079. -/
theorem block04 : IndexBlockCertificate valid 61952 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 62080 through 62207. -/
theorem block05 : IndexBlockCertificate valid 62080 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 62208 through 62335. -/
theorem block06 : IndexBlockCertificate valid 62208 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 62336 through 62463. -/
theorem block07 : IndexBlockCertificate valid 62336 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 62464 through 62591. -/
theorem block08 : IndexBlockCertificate valid 62464 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 62592 through 62719. -/
theorem block09 : IndexBlockCertificate valid 62592 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 62720 through 62847. -/
theorem block10 : IndexBlockCertificate valid 62720 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 62848 through 62975. -/
theorem block11 : IndexBlockCertificate valid 62848 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 62976 through 63103. -/
theorem block12 : IndexBlockCertificate valid 62976 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 63104 through 63231. -/
theorem block13 : IndexBlockCertificate valid 63104 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 63232 through 63359. -/
theorem block14 : IndexBlockCertificate valid 63232 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 63360 through 63487. -/
theorem block15 : IndexBlockCertificate valid 63360 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 61440 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock030
