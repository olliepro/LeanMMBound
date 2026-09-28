import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 12288 through 14335. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock006
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 12288 through 12415. -/
theorem block00 : IndexBlockCertificate valid 12288 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 12416 through 12543. -/
theorem block01 : IndexBlockCertificate valid 12416 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 12544 through 12671. -/
theorem block02 : IndexBlockCertificate valid 12544 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 12672 through 12799. -/
theorem block03 : IndexBlockCertificate valid 12672 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 12800 through 12927. -/
theorem block04 : IndexBlockCertificate valid 12800 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 12928 through 13055. -/
theorem block05 : IndexBlockCertificate valid 12928 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 13056 through 13183. -/
theorem block06 : IndexBlockCertificate valid 13056 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 13184 through 13311. -/
theorem block07 : IndexBlockCertificate valid 13184 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 13312 through 13439. -/
theorem block08 : IndexBlockCertificate valid 13312 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 13440 through 13567. -/
theorem block09 : IndexBlockCertificate valid 13440 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 13568 through 13695. -/
theorem block10 : IndexBlockCertificate valid 13568 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 13696 through 13823. -/
theorem block11 : IndexBlockCertificate valid 13696 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 13824 through 13951. -/
theorem block12 : IndexBlockCertificate valid 13824 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 13952 through 14079. -/
theorem block13 : IndexBlockCertificate valid 13952 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 14080 through 14207. -/
theorem block14 : IndexBlockCertificate valid 14080 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 14208 through 14335. -/
theorem block15 : IndexBlockCertificate valid 14208 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 12288 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock006
