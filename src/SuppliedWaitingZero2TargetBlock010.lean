import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 20480 through 22527. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock010
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 20480 through 20607. -/
theorem block00 : IndexBlockCertificate valid 20480 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 20608 through 20735. -/
theorem block01 : IndexBlockCertificate valid 20608 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 20736 through 20863. -/
theorem block02 : IndexBlockCertificate valid 20736 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 20864 through 20991. -/
theorem block03 : IndexBlockCertificate valid 20864 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 20992 through 21119. -/
theorem block04 : IndexBlockCertificate valid 20992 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 21120 through 21247. -/
theorem block05 : IndexBlockCertificate valid 21120 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 21248 through 21375. -/
theorem block06 : IndexBlockCertificate valid 21248 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 21376 through 21503. -/
theorem block07 : IndexBlockCertificate valid 21376 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 21504 through 21631. -/
theorem block08 : IndexBlockCertificate valid 21504 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 21632 through 21759. -/
theorem block09 : IndexBlockCertificate valid 21632 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 21760 through 21887. -/
theorem block10 : IndexBlockCertificate valid 21760 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 21888 through 22015. -/
theorem block11 : IndexBlockCertificate valid 21888 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 22016 through 22143. -/
theorem block12 : IndexBlockCertificate valid 22016 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 22144 through 22271. -/
theorem block13 : IndexBlockCertificate valid 22144 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 22272 through 22399. -/
theorem block14 : IndexBlockCertificate valid 22272 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 22400 through 22527. -/
theorem block15 : IndexBlockCertificate valid 22400 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 20480 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock010
