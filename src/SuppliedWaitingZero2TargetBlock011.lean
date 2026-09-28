import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 22528 through 24575. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock011
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 22528 through 22655. -/
theorem block00 : IndexBlockCertificate valid 22528 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 22656 through 22783. -/
theorem block01 : IndexBlockCertificate valid 22656 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 22784 through 22911. -/
theorem block02 : IndexBlockCertificate valid 22784 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 22912 through 23039. -/
theorem block03 : IndexBlockCertificate valid 22912 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 23040 through 23167. -/
theorem block04 : IndexBlockCertificate valid 23040 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 23168 through 23295. -/
theorem block05 : IndexBlockCertificate valid 23168 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 23296 through 23423. -/
theorem block06 : IndexBlockCertificate valid 23296 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 23424 through 23551. -/
theorem block07 : IndexBlockCertificate valid 23424 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 23552 through 23679. -/
theorem block08 : IndexBlockCertificate valid 23552 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 23680 through 23807. -/
theorem block09 : IndexBlockCertificate valid 23680 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 23808 through 23935. -/
theorem block10 : IndexBlockCertificate valid 23808 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 23936 through 24063. -/
theorem block11 : IndexBlockCertificate valid 23936 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 24064 through 24191. -/
theorem block12 : IndexBlockCertificate valid 24064 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 24192 through 24319. -/
theorem block13 : IndexBlockCertificate valid 24192 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 24320 through 24447. -/
theorem block14 : IndexBlockCertificate valid 24320 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 24448 through 24575. -/
theorem block15 : IndexBlockCertificate valid 24448 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 22528 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock011
