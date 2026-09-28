import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 2048 through 4095. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock001
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 2048 through 2175. -/
theorem block00 : IndexBlockCertificate valid 2048 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 2176 through 2303. -/
theorem block01 : IndexBlockCertificate valid 2176 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 2304 through 2431. -/
theorem block02 : IndexBlockCertificate valid 2304 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 2432 through 2559. -/
theorem block03 : IndexBlockCertificate valid 2432 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 2560 through 2687. -/
theorem block04 : IndexBlockCertificate valid 2560 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 2688 through 2815. -/
theorem block05 : IndexBlockCertificate valid 2688 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 2816 through 2943. -/
theorem block06 : IndexBlockCertificate valid 2816 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 2944 through 3071. -/
theorem block07 : IndexBlockCertificate valid 2944 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 3072 through 3199. -/
theorem block08 : IndexBlockCertificate valid 3072 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 3200 through 3327. -/
theorem block09 : IndexBlockCertificate valid 3200 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 3328 through 3455. -/
theorem block10 : IndexBlockCertificate valid 3328 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 3456 through 3583. -/
theorem block11 : IndexBlockCertificate valid 3456 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 3584 through 3711. -/
theorem block12 : IndexBlockCertificate valid 3584 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 3712 through 3839. -/
theorem block13 : IndexBlockCertificate valid 3712 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 3840 through 3967. -/
theorem block14 : IndexBlockCertificate valid 3840 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 3968 through 4095. -/
theorem block15 : IndexBlockCertificate valid 3968 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 2048 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock001
