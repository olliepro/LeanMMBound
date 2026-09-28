import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 63488 through 65535. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock031
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 63488 through 63615. -/
theorem block00 : IndexBlockCertificate valid 63488 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 63616 through 63743. -/
theorem block01 : IndexBlockCertificate valid 63616 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 63744 through 63871. -/
theorem block02 : IndexBlockCertificate valid 63744 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 63872 through 63999. -/
theorem block03 : IndexBlockCertificate valid 63872 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 64000 through 64127. -/
theorem block04 : IndexBlockCertificate valid 64000 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 64128 through 64255. -/
theorem block05 : IndexBlockCertificate valid 64128 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 64256 through 64383. -/
theorem block06 : IndexBlockCertificate valid 64256 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 64384 through 64511. -/
theorem block07 : IndexBlockCertificate valid 64384 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 64512 through 64639. -/
theorem block08 : IndexBlockCertificate valid 64512 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 64640 through 64767. -/
theorem block09 : IndexBlockCertificate valid 64640 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 64768 through 64895. -/
theorem block10 : IndexBlockCertificate valid 64768 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 64896 through 65023. -/
theorem block11 : IndexBlockCertificate valid 64896 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 65024 through 65151. -/
theorem block12 : IndexBlockCertificate valid 65024 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 65152 through 65279. -/
theorem block13 : IndexBlockCertificate valid 65152 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 65280 through 65407. -/
theorem block14 : IndexBlockCertificate valid 65280 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 65408 through 65535. -/
theorem block15 : IndexBlockCertificate valid 65408 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 63488 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock031
