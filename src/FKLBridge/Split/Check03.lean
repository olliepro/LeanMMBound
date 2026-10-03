module

public import FKLBridge.Split.Tree

@[expose] public section

namespace FKLBridge.Split

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 30 (rows 1920…1983). -/
theorem check030 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part030.rows [chunk0240, chunk0241, chunk0242, chunk0243, chunk0244, chunk0245, chunk0246, chunk0247] 240 64 = true := by decide +kernel
theorem sound030 : SplitCertificateData.Part030.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part030.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (1920 + j) 3)) (Nat.land (1920 + j) 7) SplitCertificateData.Part030.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part030.rows [chunk0240, chunk0241, chunk0242, chunk0243, chunk0244, chunk0245, chunk0246, chunk0247] 240 64 1920 rfl check030
theorem len030 : SplitCertificateData.Part030.rows.length = 64 := sound030.1

/-- Kernel check of part 31 (rows 1984…2047). -/
theorem check031 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part031.rows [chunk0248, chunk0249, chunk0250, chunk0251, chunk0252, chunk0253, chunk0254, chunk0255] 248 64 = true := by decide +kernel
theorem sound031 : SplitCertificateData.Part031.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part031.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (1984 + j) 3)) (Nat.land (1984 + j) 7) SplitCertificateData.Part031.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part031.rows [chunk0248, chunk0249, chunk0250, chunk0251, chunk0252, chunk0253, chunk0254, chunk0255] 248 64 1984 rfl check031
theorem len031 : SplitCertificateData.Part031.rows.length = 64 := sound031.1

/-- Kernel check of part 32 (rows 2048…2111). -/
theorem check032 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part032.rows [chunk0256, chunk0257, chunk0258, chunk0259, chunk0260, chunk0261, chunk0262, chunk0263] 256 64 = true := by decide +kernel
theorem sound032 : SplitCertificateData.Part032.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part032.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (2048 + j) 3)) (Nat.land (2048 + j) 7) SplitCertificateData.Part032.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part032.rows [chunk0256, chunk0257, chunk0258, chunk0259, chunk0260, chunk0261, chunk0262, chunk0263] 256 64 2048 rfl check032
theorem len032 : SplitCertificateData.Part032.rows.length = 64 := sound032.1

/-- Kernel check of part 33 (rows 2112…2175). -/
theorem check033 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part033.rows [chunk0264, chunk0265, chunk0266, chunk0267, chunk0268, chunk0269, chunk0270, chunk0271] 264 64 = true := by decide +kernel
theorem sound033 : SplitCertificateData.Part033.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part033.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (2112 + j) 3)) (Nat.land (2112 + j) 7) SplitCertificateData.Part033.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part033.rows [chunk0264, chunk0265, chunk0266, chunk0267, chunk0268, chunk0269, chunk0270, chunk0271] 264 64 2112 rfl check033
theorem len033 : SplitCertificateData.Part033.rows.length = 64 := sound033.1

/-- Kernel check of part 34 (rows 2176…2239). -/
theorem check034 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part034.rows [chunk0272, chunk0273, chunk0274, chunk0275, chunk0276, chunk0277, chunk0278, chunk0279] 272 64 = true := by decide +kernel
theorem sound034 : SplitCertificateData.Part034.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part034.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (2176 + j) 3)) (Nat.land (2176 + j) 7) SplitCertificateData.Part034.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part034.rows [chunk0272, chunk0273, chunk0274, chunk0275, chunk0276, chunk0277, chunk0278, chunk0279] 272 64 2176 rfl check034
theorem len034 : SplitCertificateData.Part034.rows.length = 64 := sound034.1

/-- Kernel check of part 35 (rows 2240…2303). -/
theorem check035 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part035.rows [chunk0280, chunk0281, chunk0282, chunk0283, chunk0284, chunk0285, chunk0286, chunk0287] 280 64 = true := by decide +kernel
theorem sound035 : SplitCertificateData.Part035.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part035.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (2240 + j) 3)) (Nat.land (2240 + j) 7) SplitCertificateData.Part035.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part035.rows [chunk0280, chunk0281, chunk0282, chunk0283, chunk0284, chunk0285, chunk0286, chunk0287] 280 64 2240 rfl check035
theorem len035 : SplitCertificateData.Part035.rows.length = 64 := sound035.1

/-- Kernel check of part 36 (rows 2304…2367). -/
theorem check036 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part036.rows [chunk0288, chunk0289, chunk0290, chunk0291, chunk0292, chunk0293, chunk0294, chunk0295] 288 64 = true := by decide +kernel
theorem sound036 : SplitCertificateData.Part036.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part036.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (2304 + j) 3)) (Nat.land (2304 + j) 7) SplitCertificateData.Part036.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part036.rows [chunk0288, chunk0289, chunk0290, chunk0291, chunk0292, chunk0293, chunk0294, chunk0295] 288 64 2304 rfl check036
theorem len036 : SplitCertificateData.Part036.rows.length = 64 := sound036.1

/-- Kernel check of part 37 (rows 2368…2431). -/
theorem check037 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part037.rows [chunk0296, chunk0297, chunk0298, chunk0299, chunk0300, chunk0301, chunk0302, chunk0303] 296 64 = true := by decide +kernel
theorem sound037 : SplitCertificateData.Part037.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part037.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (2368 + j) 3)) (Nat.land (2368 + j) 7) SplitCertificateData.Part037.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part037.rows [chunk0296, chunk0297, chunk0298, chunk0299, chunk0300, chunk0301, chunk0302, chunk0303] 296 64 2368 rfl check037
theorem len037 : SplitCertificateData.Part037.rows.length = 64 := sound037.1

/-- Kernel check of part 38 (rows 2432…2495). -/
theorem check038 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part038.rows [chunk0304, chunk0305, chunk0306, chunk0307, chunk0308, chunk0309, chunk0310, chunk0311] 304 64 = true := by decide +kernel
theorem sound038 : SplitCertificateData.Part038.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part038.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (2432 + j) 3)) (Nat.land (2432 + j) 7) SplitCertificateData.Part038.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part038.rows [chunk0304, chunk0305, chunk0306, chunk0307, chunk0308, chunk0309, chunk0310, chunk0311] 304 64 2432 rfl check038
theorem len038 : SplitCertificateData.Part038.rows.length = 64 := sound038.1

/-- Kernel check of part 39 (rows 2496…2559). -/
theorem check039 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part039.rows [chunk0312, chunk0313, chunk0314, chunk0315, chunk0316, chunk0317, chunk0318, chunk0319] 312 64 = true := by decide +kernel
theorem sound039 : SplitCertificateData.Part039.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part039.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (2496 + j) 3)) (Nat.land (2496 + j) 7) SplitCertificateData.Part039.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part039.rows [chunk0312, chunk0313, chunk0314, chunk0315, chunk0316, chunk0317, chunk0318, chunk0319] 312 64 2496 rfl check039
theorem len039 : SplitCertificateData.Part039.rows.length = 64 := sound039.1


end FKLBridge.Split
