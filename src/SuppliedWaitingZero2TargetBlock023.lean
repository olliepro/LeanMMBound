import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 47104 through 49151. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock023
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 47104 through 47231. -/
theorem block00 : IndexBlockCertificate valid 47104 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 47232 through 47359. -/
theorem block01 : IndexBlockCertificate valid 47232 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 47360 through 47487. -/
theorem block02 : IndexBlockCertificate valid 47360 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 47488 through 47615. -/
theorem block03 : IndexBlockCertificate valid 47488 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 47616 through 47743. -/
theorem block04 : IndexBlockCertificate valid 47616 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 47744 through 47871. -/
theorem block05 : IndexBlockCertificate valid 47744 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 47872 through 47999. -/
theorem block06 : IndexBlockCertificate valid 47872 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 48000 through 48127. -/
theorem block07 : IndexBlockCertificate valid 48000 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 48128 through 48255. -/
theorem block08 : IndexBlockCertificate valid 48128 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 48256 through 48383. -/
theorem block09 : IndexBlockCertificate valid 48256 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 48384 through 48511. -/
theorem block10 : IndexBlockCertificate valid 48384 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 48512 through 48639. -/
theorem block11 : IndexBlockCertificate valid 48512 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 48640 through 48767. -/
theorem block12 : IndexBlockCertificate valid 48640 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 48768 through 48895. -/
theorem block13 : IndexBlockCertificate valid 48768 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 48896 through 49023. -/
theorem block14 : IndexBlockCertificate valid 48896 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 49024 through 49151. -/
theorem block15 : IndexBlockCertificate valid 49024 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 47104 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock023
