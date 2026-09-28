import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 18432 through 20479. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock009
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 18432 through 18559. -/
theorem block00 : IndexBlockCertificate valid 18432 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 18560 through 18687. -/
theorem block01 : IndexBlockCertificate valid 18560 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 18688 through 18815. -/
theorem block02 : IndexBlockCertificate valid 18688 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 18816 through 18943. -/
theorem block03 : IndexBlockCertificate valid 18816 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 18944 through 19071. -/
theorem block04 : IndexBlockCertificate valid 18944 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 19072 through 19199. -/
theorem block05 : IndexBlockCertificate valid 19072 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 19200 through 19327. -/
theorem block06 : IndexBlockCertificate valid 19200 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 19328 through 19455. -/
theorem block07 : IndexBlockCertificate valid 19328 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 19456 through 19583. -/
theorem block08 : IndexBlockCertificate valid 19456 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 19584 through 19711. -/
theorem block09 : IndexBlockCertificate valid 19584 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 19712 through 19839. -/
theorem block10 : IndexBlockCertificate valid 19712 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 19840 through 19967. -/
theorem block11 : IndexBlockCertificate valid 19840 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 19968 through 20095. -/
theorem block12 : IndexBlockCertificate valid 19968 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 20096 through 20223. -/
theorem block13 : IndexBlockCertificate valid 20096 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 20224 through 20351. -/
theorem block14 : IndexBlockCertificate valid 20224 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 20352 through 20479. -/
theorem block15 : IndexBlockCertificate valid 20352 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 18432 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock009
