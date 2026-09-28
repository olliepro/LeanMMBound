import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 38912 through 40959. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock019
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 38912 through 39039. -/
theorem block00 : IndexBlockCertificate valid 38912 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 39040 through 39167. -/
theorem block01 : IndexBlockCertificate valid 39040 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 39168 through 39295. -/
theorem block02 : IndexBlockCertificate valid 39168 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 39296 through 39423. -/
theorem block03 : IndexBlockCertificate valid 39296 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 39424 through 39551. -/
theorem block04 : IndexBlockCertificate valid 39424 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 39552 through 39679. -/
theorem block05 : IndexBlockCertificate valid 39552 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 39680 through 39807. -/
theorem block06 : IndexBlockCertificate valid 39680 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 39808 through 39935. -/
theorem block07 : IndexBlockCertificate valid 39808 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 39936 through 40063. -/
theorem block08 : IndexBlockCertificate valid 39936 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 40064 through 40191. -/
theorem block09 : IndexBlockCertificate valid 40064 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 40192 through 40319. -/
theorem block10 : IndexBlockCertificate valid 40192 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 40320 through 40447. -/
theorem block11 : IndexBlockCertificate valid 40320 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 40448 through 40575. -/
theorem block12 : IndexBlockCertificate valid 40448 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 40576 through 40703. -/
theorem block13 : IndexBlockCertificate valid 40576 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 40704 through 40831. -/
theorem block14 : IndexBlockCertificate valid 40704 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 40832 through 40959. -/
theorem block15 : IndexBlockCertificate valid 40832 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 38912 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock019
