import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 43008 through 45055. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock021
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 43008 through 43135. -/
theorem block00 : IndexBlockCertificate valid 43008 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 43136 through 43263. -/
theorem block01 : IndexBlockCertificate valid 43136 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 43264 through 43391. -/
theorem block02 : IndexBlockCertificate valid 43264 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 43392 through 43519. -/
theorem block03 : IndexBlockCertificate valid 43392 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 43520 through 43647. -/
theorem block04 : IndexBlockCertificate valid 43520 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 43648 through 43775. -/
theorem block05 : IndexBlockCertificate valid 43648 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 43776 through 43903. -/
theorem block06 : IndexBlockCertificate valid 43776 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 43904 through 44031. -/
theorem block07 : IndexBlockCertificate valid 43904 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 44032 through 44159. -/
theorem block08 : IndexBlockCertificate valid 44032 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 44160 through 44287. -/
theorem block09 : IndexBlockCertificate valid 44160 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 44288 through 44415. -/
theorem block10 : IndexBlockCertificate valid 44288 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 44416 through 44543. -/
theorem block11 : IndexBlockCertificate valid 44416 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 44544 through 44671. -/
theorem block12 : IndexBlockCertificate valid 44544 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 44672 through 44799. -/
theorem block13 : IndexBlockCertificate valid 44672 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 44800 through 44927. -/
theorem block14 : IndexBlockCertificate valid 44800 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 44928 through 45055. -/
theorem block15 : IndexBlockCertificate valid 44928 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 43008 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock021
