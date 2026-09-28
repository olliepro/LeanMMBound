import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 34816 through 36863. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock017
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 34816 through 34943. -/
theorem block00 : IndexBlockCertificate valid 34816 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 34944 through 35071. -/
theorem block01 : IndexBlockCertificate valid 34944 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 35072 through 35199. -/
theorem block02 : IndexBlockCertificate valid 35072 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 35200 through 35327. -/
theorem block03 : IndexBlockCertificate valid 35200 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 35328 through 35455. -/
theorem block04 : IndexBlockCertificate valid 35328 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 35456 through 35583. -/
theorem block05 : IndexBlockCertificate valid 35456 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 35584 through 35711. -/
theorem block06 : IndexBlockCertificate valid 35584 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 35712 through 35839. -/
theorem block07 : IndexBlockCertificate valid 35712 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 35840 through 35967. -/
theorem block08 : IndexBlockCertificate valid 35840 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 35968 through 36095. -/
theorem block09 : IndexBlockCertificate valid 35968 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 36096 through 36223. -/
theorem block10 : IndexBlockCertificate valid 36096 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 36224 through 36351. -/
theorem block11 : IndexBlockCertificate valid 36224 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 36352 through 36479. -/
theorem block12 : IndexBlockCertificate valid 36352 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 36480 through 36607. -/
theorem block13 : IndexBlockCertificate valid 36480 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 36608 through 36735. -/
theorem block14 : IndexBlockCertificate valid 36608 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 36736 through 36863. -/
theorem block15 : IndexBlockCertificate valid 36736 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 34816 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock017
