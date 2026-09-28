import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 24576 through 26623. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock012
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 24576 through 24703. -/
theorem block00 : IndexBlockCertificate valid 24576 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 24704 through 24831. -/
theorem block01 : IndexBlockCertificate valid 24704 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 24832 through 24959. -/
theorem block02 : IndexBlockCertificate valid 24832 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 24960 through 25087. -/
theorem block03 : IndexBlockCertificate valid 24960 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 25088 through 25215. -/
theorem block04 : IndexBlockCertificate valid 25088 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 25216 through 25343. -/
theorem block05 : IndexBlockCertificate valid 25216 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 25344 through 25471. -/
theorem block06 : IndexBlockCertificate valid 25344 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 25472 through 25599. -/
theorem block07 : IndexBlockCertificate valid 25472 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 25600 through 25727. -/
theorem block08 : IndexBlockCertificate valid 25600 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 25728 through 25855. -/
theorem block09 : IndexBlockCertificate valid 25728 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 25856 through 25983. -/
theorem block10 : IndexBlockCertificate valid 25856 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 25984 through 26111. -/
theorem block11 : IndexBlockCertificate valid 25984 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 26112 through 26239. -/
theorem block12 : IndexBlockCertificate valid 26112 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 26240 through 26367. -/
theorem block13 : IndexBlockCertificate valid 26240 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 26368 through 26495. -/
theorem block14 : IndexBlockCertificate valid 26368 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 26496 through 26623. -/
theorem block15 : IndexBlockCertificate valid 26496 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 24576 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock012
