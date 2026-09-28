import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 45056 through 47103. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock022
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 45056 through 45183. -/
theorem block00 : IndexBlockCertificate valid 45056 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 45184 through 45311. -/
theorem block01 : IndexBlockCertificate valid 45184 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 45312 through 45439. -/
theorem block02 : IndexBlockCertificate valid 45312 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 45440 through 45567. -/
theorem block03 : IndexBlockCertificate valid 45440 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 45568 through 45695. -/
theorem block04 : IndexBlockCertificate valid 45568 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 45696 through 45823. -/
theorem block05 : IndexBlockCertificate valid 45696 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 45824 through 45951. -/
theorem block06 : IndexBlockCertificate valid 45824 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 45952 through 46079. -/
theorem block07 : IndexBlockCertificate valid 45952 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 46080 through 46207. -/
theorem block08 : IndexBlockCertificate valid 46080 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 46208 through 46335. -/
theorem block09 : IndexBlockCertificate valid 46208 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 46336 through 46463. -/
theorem block10 : IndexBlockCertificate valid 46336 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 46464 through 46591. -/
theorem block11 : IndexBlockCertificate valid 46464 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 46592 through 46719. -/
theorem block12 : IndexBlockCertificate valid 46592 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 46720 through 46847. -/
theorem block13 : IndexBlockCertificate valid 46720 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 46848 through 46975. -/
theorem block14 : IndexBlockCertificate valid 46848 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 46976 through 47103. -/
theorem block15 : IndexBlockCertificate valid 46976 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 45056 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock022
