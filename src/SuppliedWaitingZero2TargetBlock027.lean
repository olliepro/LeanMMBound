import SuppliedWaitingZero2TargetPredicate

/-! Small independent exact support checks for original positions 55296 through 57343. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock027
open SuppliedWaitingZero2TargetPredicate
set_option maxRecDepth 100000
set_option maxHeartbeats 64000000

/-- Exact original support codes at positions 55296 through 55423. -/
theorem block00 : IndexBlockCertificate valid 55296 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 55424 through 55551. -/
theorem block01 : IndexBlockCertificate valid 55424 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 55552 through 55679. -/
theorem block02 : IndexBlockCertificate valid 55552 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 55680 through 55807. -/
theorem block03 : IndexBlockCertificate valid 55680 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 55808 through 55935. -/
theorem block04 : IndexBlockCertificate valid 55808 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 55936 through 56063. -/
theorem block05 : IndexBlockCertificate valid 55936 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 56064 through 56191. -/
theorem block06 : IndexBlockCertificate valid 56064 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 56192 through 56319. -/
theorem block07 : IndexBlockCertificate valid 56192 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 56320 through 56447. -/
theorem block08 : IndexBlockCertificate valid 56320 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 56448 through 56575. -/
theorem block09 : IndexBlockCertificate valid 56448 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 56576 through 56703. -/
theorem block10 : IndexBlockCertificate valid 56576 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 56704 through 56831. -/
theorem block11 : IndexBlockCertificate valid 56704 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 56832 through 56959. -/
theorem block12 : IndexBlockCertificate valid 56832 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 56960 through 57087. -/
theorem block13 : IndexBlockCertificate valid 56960 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 57088 through 57215. -/
theorem block14 : IndexBlockCertificate valid 57088 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- Exact original support codes at positions 57216 through 57343. -/
theorem block15 : IndexBlockCertificate valid 57216 128 :=
  ⟨by decide +kernel, by unfold valid; decide +kernel⟩

/-- All original positions in this source slice satisfy their exact target code. -/
theorem complete : IndexBlockCertificate valid 55296 2048 :=
  (((((((((((((((block00).append block01).append block02).append block03).append block04).append block05).append block06).append block07).append block08).append block09).append block10).append block11).append block12).append block13).append block14).append block15

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetBlock027
