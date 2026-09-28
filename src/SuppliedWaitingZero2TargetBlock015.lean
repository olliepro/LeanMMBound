import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 30720 through 32767. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock015
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 30720 through 30847. -/
theorem block00 : IndexBlockCertificate valid 30720 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 30848 through 30975. -/
theorem block01 : IndexBlockCertificate valid 30848 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 30976 through 31103. -/
theorem block02 : IndexBlockCertificate valid 30976 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 31104 through 31231. -/
theorem block03 : IndexBlockCertificate valid 31104 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 31232 through 31359. -/
theorem block04 : IndexBlockCertificate valid 31232 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 31360 through 31487. -/
theorem block05 : IndexBlockCertificate valid 31360 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 31488 through 31615. -/
theorem block06 : IndexBlockCertificate valid 31488 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 31616 through 31743. -/
theorem block07 : IndexBlockCertificate valid 31616 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 31744 through 31871. -/
theorem block08 : IndexBlockCertificate valid 31744 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 31872 through 31999. -/
theorem block09 : IndexBlockCertificate valid 31872 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 32000 through 32127. -/
theorem block10 : IndexBlockCertificate valid 32000 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 32128 through 32255. -/
theorem block11 : IndexBlockCertificate valid 32128 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 32256 through 32383. -/
theorem block12 : IndexBlockCertificate valid 32256 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 32384 through 32511. -/
theorem block13 : IndexBlockCertificate valid 32384 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 32512 through 32639. -/
theorem block14 : IndexBlockCertificate valid 32512 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 32640 through 32767. -/
theorem block15 : IndexBlockCertificate valid 32640 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 30720 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock015
