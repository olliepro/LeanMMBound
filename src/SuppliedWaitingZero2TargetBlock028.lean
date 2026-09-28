import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 57344 through 59391. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock028
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 57344 through 57471. -/
theorem block00 : IndexBlockCertificate valid 57344 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 57472 through 57599. -/
theorem block01 : IndexBlockCertificate valid 57472 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 57600 through 57727. -/
theorem block02 : IndexBlockCertificate valid 57600 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 57728 through 57855. -/
theorem block03 : IndexBlockCertificate valid 57728 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 57856 through 57983. -/
theorem block04 : IndexBlockCertificate valid 57856 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 57984 through 58111. -/
theorem block05 : IndexBlockCertificate valid 57984 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 58112 through 58239. -/
theorem block06 : IndexBlockCertificate valid 58112 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 58240 through 58367. -/
theorem block07 : IndexBlockCertificate valid 58240 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 58368 through 58495. -/
theorem block08 : IndexBlockCertificate valid 58368 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 58496 through 58623. -/
theorem block09 : IndexBlockCertificate valid 58496 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 58624 through 58751. -/
theorem block10 : IndexBlockCertificate valid 58624 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 58752 through 58879. -/
theorem block11 : IndexBlockCertificate valid 58752 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 58880 through 59007. -/
theorem block12 : IndexBlockCertificate valid 58880 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 59008 through 59135. -/
theorem block13 : IndexBlockCertificate valid 59008 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 59136 through 59263. -/
theorem block14 : IndexBlockCertificate valid 59136 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 59264 through 59391. -/
theorem block15 : IndexBlockCertificate valid 59264 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 57344 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock028
