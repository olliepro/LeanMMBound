import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 14336 through 16383. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock007
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 14336 through 14463. -/
theorem block00 : IndexBlockCertificate valid 14336 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 14464 through 14591. -/
theorem block01 : IndexBlockCertificate valid 14464 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 14592 through 14719. -/
theorem block02 : IndexBlockCertificate valid 14592 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 14720 through 14847. -/
theorem block03 : IndexBlockCertificate valid 14720 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 14848 through 14975. -/
theorem block04 : IndexBlockCertificate valid 14848 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 14976 through 15103. -/
theorem block05 : IndexBlockCertificate valid 14976 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 15104 through 15231. -/
theorem block06 : IndexBlockCertificate valid 15104 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 15232 through 15359. -/
theorem block07 : IndexBlockCertificate valid 15232 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 15360 through 15487. -/
theorem block08 : IndexBlockCertificate valid 15360 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 15488 through 15615. -/
theorem block09 : IndexBlockCertificate valid 15488 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 15616 through 15743. -/
theorem block10 : IndexBlockCertificate valid 15616 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 15744 through 15871. -/
theorem block11 : IndexBlockCertificate valid 15744 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 15872 through 15999. -/
theorem block12 : IndexBlockCertificate valid 15872 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 16000 through 16127. -/
theorem block13 : IndexBlockCertificate valid 16000 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 16128 through 16255. -/
theorem block14 : IndexBlockCertificate valid 16128 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 16256 through 16383. -/
theorem block15 : IndexBlockCertificate valid 16256 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 14336 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock007
