import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 40960 through 43007. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock020
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 40960 through 41087. -/
theorem block00 : IndexBlockCertificate valid 40960 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 41088 through 41215. -/
theorem block01 : IndexBlockCertificate valid 41088 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 41216 through 41343. -/
theorem block02 : IndexBlockCertificate valid 41216 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 41344 through 41471. -/
theorem block03 : IndexBlockCertificate valid 41344 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 41472 through 41599. -/
theorem block04 : IndexBlockCertificate valid 41472 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 41600 through 41727. -/
theorem block05 : IndexBlockCertificate valid 41600 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 41728 through 41855. -/
theorem block06 : IndexBlockCertificate valid 41728 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 41856 through 41983. -/
theorem block07 : IndexBlockCertificate valid 41856 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 41984 through 42111. -/
theorem block08 : IndexBlockCertificate valid 41984 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 42112 through 42239. -/
theorem block09 : IndexBlockCertificate valid 42112 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 42240 through 42367. -/
theorem block10 : IndexBlockCertificate valid 42240 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 42368 through 42495. -/
theorem block11 : IndexBlockCertificate valid 42368 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 42496 through 42623. -/
theorem block12 : IndexBlockCertificate valid 42496 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 42624 through 42751. -/
theorem block13 : IndexBlockCertificate valid 42624 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 42752 through 42879. -/
theorem block14 : IndexBlockCertificate valid 42752 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 42880 through 43007. -/
theorem block15 : IndexBlockCertificate valid 42880 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 40960 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock020
