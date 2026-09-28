import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 36864 through 38911. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock018
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 36864 through 36991. -/
theorem block00 : IndexBlockCertificate valid 36864 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 36992 through 37119. -/
theorem block01 : IndexBlockCertificate valid 36992 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 37120 through 37247. -/
theorem block02 : IndexBlockCertificate valid 37120 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 37248 through 37375. -/
theorem block03 : IndexBlockCertificate valid 37248 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 37376 through 37503. -/
theorem block04 : IndexBlockCertificate valid 37376 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 37504 through 37631. -/
theorem block05 : IndexBlockCertificate valid 37504 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 37632 through 37759. -/
theorem block06 : IndexBlockCertificate valid 37632 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 37760 through 37887. -/
theorem block07 : IndexBlockCertificate valid 37760 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 37888 through 38015. -/
theorem block08 : IndexBlockCertificate valid 37888 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 38016 through 38143. -/
theorem block09 : IndexBlockCertificate valid 38016 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 38144 through 38271. -/
theorem block10 : IndexBlockCertificate valid 38144 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 38272 through 38399. -/
theorem block11 : IndexBlockCertificate valid 38272 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 38400 through 38527. -/
theorem block12 : IndexBlockCertificate valid 38400 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 38528 through 38655. -/
theorem block13 : IndexBlockCertificate valid 38528 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 38656 through 38783. -/
theorem block14 : IndexBlockCertificate valid 38656 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 38784 through 38911. -/
theorem block15 : IndexBlockCertificate valid 38784 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 36864 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock018
