import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 51200 through 53247. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock025
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 51200 through 51327. -/
theorem block00 : IndexBlockCertificate valid 51200 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 51328 through 51455. -/
theorem block01 : IndexBlockCertificate valid 51328 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 51456 through 51583. -/
theorem block02 : IndexBlockCertificate valid 51456 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 51584 through 51711. -/
theorem block03 : IndexBlockCertificate valid 51584 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 51712 through 51839. -/
theorem block04 : IndexBlockCertificate valid 51712 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 51840 through 51967. -/
theorem block05 : IndexBlockCertificate valid 51840 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 51968 through 52095. -/
theorem block06 : IndexBlockCertificate valid 51968 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 52096 through 52223. -/
theorem block07 : IndexBlockCertificate valid 52096 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 52224 through 52351. -/
theorem block08 : IndexBlockCertificate valid 52224 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 52352 through 52479. -/
theorem block09 : IndexBlockCertificate valid 52352 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 52480 through 52607. -/
theorem block10 : IndexBlockCertificate valid 52480 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 52608 through 52735. -/
theorem block11 : IndexBlockCertificate valid 52608 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 52736 through 52863. -/
theorem block12 : IndexBlockCertificate valid 52736 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 52864 through 52991. -/
theorem block13 : IndexBlockCertificate valid 52864 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 52992 through 53119. -/
theorem block14 : IndexBlockCertificate valid 52992 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 53120 through 53247. -/
theorem block15 : IndexBlockCertificate valid 53120 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 51200 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock025
