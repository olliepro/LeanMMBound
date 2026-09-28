import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 8192 through 10239. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock004
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 8192 through 8319. -/
theorem block00 : IndexBlockCertificate valid 8192 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 8320 through 8447. -/
theorem block01 : IndexBlockCertificate valid 8320 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 8448 through 8575. -/
theorem block02 : IndexBlockCertificate valid 8448 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 8576 through 8703. -/
theorem block03 : IndexBlockCertificate valid 8576 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 8704 through 8831. -/
theorem block04 : IndexBlockCertificate valid 8704 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 8832 through 8959. -/
theorem block05 : IndexBlockCertificate valid 8832 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 8960 through 9087. -/
theorem block06 : IndexBlockCertificate valid 8960 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 9088 through 9215. -/
theorem block07 : IndexBlockCertificate valid 9088 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 9216 through 9343. -/
theorem block08 : IndexBlockCertificate valid 9216 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 9344 through 9471. -/
theorem block09 : IndexBlockCertificate valid 9344 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 9472 through 9599. -/
theorem block10 : IndexBlockCertificate valid 9472 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 9600 through 9727. -/
theorem block11 : IndexBlockCertificate valid 9600 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 9728 through 9855. -/
theorem block12 : IndexBlockCertificate valid 9728 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 9856 through 9983. -/
theorem block13 : IndexBlockCertificate valid 9856 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 9984 through 10111. -/
theorem block14 : IndexBlockCertificate valid 9984 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 10112 through 10239. -/
theorem block15 : IndexBlockCertificate valid 10112 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 8192 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock004
