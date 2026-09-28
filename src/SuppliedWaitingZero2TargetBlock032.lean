import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 65536 through 67583. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock032
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 65536 through 65663. -/
theorem block00 : IndexBlockCertificate valid 65536 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 65664 through 65791. -/
theorem block01 : IndexBlockCertificate valid 65664 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 65792 through 65919. -/
theorem block02 : IndexBlockCertificate valid 65792 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 65920 through 66047. -/
theorem block03 : IndexBlockCertificate valid 65920 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 66048 through 66175. -/
theorem block04 : IndexBlockCertificate valid 66048 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 66176 through 66303. -/
theorem block05 : IndexBlockCertificate valid 66176 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 66304 through 66431. -/
theorem block06 : IndexBlockCertificate valid 66304 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 66432 through 66559. -/
theorem block07 : IndexBlockCertificate valid 66432 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 66560 through 66687. -/
theorem block08 : IndexBlockCertificate valid 66560 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 66688 through 66815. -/
theorem block09 : IndexBlockCertificate valid 66688 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 66816 through 66943. -/
theorem block10 : IndexBlockCertificate valid 66816 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 66944 through 67071. -/
theorem block11 : IndexBlockCertificate valid 66944 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 67072 through 67199. -/
theorem block12 : IndexBlockCertificate valid 67072 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 67200 through 67327. -/
theorem block13 : IndexBlockCertificate valid 67200 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 67328 through 67455. -/
theorem block14 : IndexBlockCertificate valid 67328 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 67456 through 67583. -/
theorem block15 : IndexBlockCertificate valid 67456 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 65536 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock032
