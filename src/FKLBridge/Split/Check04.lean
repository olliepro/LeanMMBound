module

public import FKLBridge.Split.Tree

@[expose] public section

namespace FKLBridge.Split

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 40 (rows 2560…2623). -/
theorem check040 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part040.rows [chunk0320, chunk0321, chunk0322, chunk0323, chunk0324, chunk0325, chunk0326, chunk0327] 320 64 = true := by decide +kernel
theorem sound040 : SplitCertificateData.Part040.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part040.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (2560 + j) 3)) (Nat.land (2560 + j) 7) SplitCertificateData.Part040.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part040.rows [chunk0320, chunk0321, chunk0322, chunk0323, chunk0324, chunk0325, chunk0326, chunk0327] 320 64 2560 rfl check040
theorem len040 : SplitCertificateData.Part040.rows.length = 64 := sound040.1

/-- Kernel check of part 41 (rows 2624…2687). -/
theorem check041 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part041.rows [chunk0328, chunk0329, chunk0330, chunk0331, chunk0332, chunk0333, chunk0334, chunk0335] 328 64 = true := by decide +kernel
theorem sound041 : SplitCertificateData.Part041.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part041.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (2624 + j) 3)) (Nat.land (2624 + j) 7) SplitCertificateData.Part041.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part041.rows [chunk0328, chunk0329, chunk0330, chunk0331, chunk0332, chunk0333, chunk0334, chunk0335] 328 64 2624 rfl check041
theorem len041 : SplitCertificateData.Part041.rows.length = 64 := sound041.1

/-- Kernel check of part 42 (rows 2688…2751). -/
theorem check042 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part042.rows [chunk0336, chunk0337, chunk0338, chunk0339, chunk0340, chunk0341, chunk0342, chunk0343] 336 64 = true := by decide +kernel
theorem sound042 : SplitCertificateData.Part042.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part042.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (2688 + j) 3)) (Nat.land (2688 + j) 7) SplitCertificateData.Part042.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part042.rows [chunk0336, chunk0337, chunk0338, chunk0339, chunk0340, chunk0341, chunk0342, chunk0343] 336 64 2688 rfl check042
theorem len042 : SplitCertificateData.Part042.rows.length = 64 := sound042.1

/-- Kernel check of part 43 (rows 2752…2815). -/
theorem check043 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part043.rows [chunk0344, chunk0345, chunk0346, chunk0347, chunk0348, chunk0349, chunk0350, chunk0351] 344 64 = true := by decide +kernel
theorem sound043 : SplitCertificateData.Part043.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part043.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (2752 + j) 3)) (Nat.land (2752 + j) 7) SplitCertificateData.Part043.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part043.rows [chunk0344, chunk0345, chunk0346, chunk0347, chunk0348, chunk0349, chunk0350, chunk0351] 344 64 2752 rfl check043
theorem len043 : SplitCertificateData.Part043.rows.length = 64 := sound043.1

/-- Kernel check of part 44 (rows 2816…2879). -/
theorem check044 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part044.rows [chunk0352, chunk0353, chunk0354, chunk0355, chunk0356, chunk0357, chunk0358, chunk0359] 352 64 = true := by decide +kernel
theorem sound044 : SplitCertificateData.Part044.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part044.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (2816 + j) 3)) (Nat.land (2816 + j) 7) SplitCertificateData.Part044.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part044.rows [chunk0352, chunk0353, chunk0354, chunk0355, chunk0356, chunk0357, chunk0358, chunk0359] 352 64 2816 rfl check044
theorem len044 : SplitCertificateData.Part044.rows.length = 64 := sound044.1

/-- Kernel check of part 45 (rows 2880…2943). -/
theorem check045 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part045.rows [chunk0360, chunk0361, chunk0362, chunk0363, chunk0364, chunk0365, chunk0366, chunk0367] 360 64 = true := by decide +kernel
theorem sound045 : SplitCertificateData.Part045.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part045.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (2880 + j) 3)) (Nat.land (2880 + j) 7) SplitCertificateData.Part045.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part045.rows [chunk0360, chunk0361, chunk0362, chunk0363, chunk0364, chunk0365, chunk0366, chunk0367] 360 64 2880 rfl check045
theorem len045 : SplitCertificateData.Part045.rows.length = 64 := sound045.1

/-- Kernel check of part 46 (rows 2944…3007). -/
theorem check046 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part046.rows [chunk0368, chunk0369, chunk0370, chunk0371, chunk0372, chunk0373, chunk0374, chunk0375] 368 64 = true := by decide +kernel
theorem sound046 : SplitCertificateData.Part046.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part046.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (2944 + j) 3)) (Nat.land (2944 + j) 7) SplitCertificateData.Part046.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part046.rows [chunk0368, chunk0369, chunk0370, chunk0371, chunk0372, chunk0373, chunk0374, chunk0375] 368 64 2944 rfl check046
theorem len046 : SplitCertificateData.Part046.rows.length = 64 := sound046.1

/-- Kernel check of part 47 (rows 3008…3071). -/
theorem check047 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part047.rows [chunk0376, chunk0377, chunk0378, chunk0379, chunk0380, chunk0381, chunk0382, chunk0383] 376 64 = true := by decide +kernel
theorem sound047 : SplitCertificateData.Part047.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part047.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (3008 + j) 3)) (Nat.land (3008 + j) 7) SplitCertificateData.Part047.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part047.rows [chunk0376, chunk0377, chunk0378, chunk0379, chunk0380, chunk0381, chunk0382, chunk0383] 376 64 3008 rfl check047
theorem len047 : SplitCertificateData.Part047.rows.length = 64 := sound047.1

/-- Kernel check of part 48 (rows 3072…3135). -/
theorem check048 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part048.rows [chunk0384, chunk0385, chunk0386, chunk0387, chunk0388, chunk0389, chunk0390, chunk0391] 384 64 = true := by decide +kernel
theorem sound048 : SplitCertificateData.Part048.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part048.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (3072 + j) 3)) (Nat.land (3072 + j) 7) SplitCertificateData.Part048.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part048.rows [chunk0384, chunk0385, chunk0386, chunk0387, chunk0388, chunk0389, chunk0390, chunk0391] 384 64 3072 rfl check048
theorem len048 : SplitCertificateData.Part048.rows.length = 64 := sound048.1

/-- Kernel check of part 49 (rows 3136…3199). -/
theorem check049 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part049.rows [chunk0392, chunk0393, chunk0394, chunk0395, chunk0396, chunk0397, chunk0398, chunk0399] 392 64 = true := by decide +kernel
theorem sound049 : SplitCertificateData.Part049.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part049.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (3136 + j) 3)) (Nat.land (3136 + j) 7) SplitCertificateData.Part049.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part049.rows [chunk0392, chunk0393, chunk0394, chunk0395, chunk0396, chunk0397, chunk0398, chunk0399] 392 64 3136 rfl check049
theorem len049 : SplitCertificateData.Part049.rows.length = 64 := sound049.1


end FKLBridge.Split
