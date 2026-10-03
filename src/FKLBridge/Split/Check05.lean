module

public import FKLBridge.Split.Tree

@[expose] public section

namespace FKLBridge.Split

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 50 (rows 3200…3263). -/
theorem check050 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part050.rows [chunk0400, chunk0401, chunk0402, chunk0403, chunk0404, chunk0405, chunk0406, chunk0407] 400 64 = true := by decide +kernel
theorem sound050 : SplitCertificateData.Part050.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part050.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (3200 + j) 3)) (Nat.land (3200 + j) 7) SplitCertificateData.Part050.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part050.rows [chunk0400, chunk0401, chunk0402, chunk0403, chunk0404, chunk0405, chunk0406, chunk0407] 400 64 3200 rfl check050
theorem len050 : SplitCertificateData.Part050.rows.length = 64 := sound050.1

/-- Kernel check of part 51 (rows 3264…3327). -/
theorem check051 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part051.rows [chunk0408, chunk0409, chunk0410, chunk0411, chunk0412, chunk0413, chunk0414, chunk0415] 408 64 = true := by decide +kernel
theorem sound051 : SplitCertificateData.Part051.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part051.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (3264 + j) 3)) (Nat.land (3264 + j) 7) SplitCertificateData.Part051.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part051.rows [chunk0408, chunk0409, chunk0410, chunk0411, chunk0412, chunk0413, chunk0414, chunk0415] 408 64 3264 rfl check051
theorem len051 : SplitCertificateData.Part051.rows.length = 64 := sound051.1

/-- Kernel check of part 52 (rows 3328…3391). -/
theorem check052 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part052.rows [chunk0416, chunk0417, chunk0418, chunk0419, chunk0420, chunk0421, chunk0422, chunk0423] 416 64 = true := by decide +kernel
theorem sound052 : SplitCertificateData.Part052.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part052.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (3328 + j) 3)) (Nat.land (3328 + j) 7) SplitCertificateData.Part052.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part052.rows [chunk0416, chunk0417, chunk0418, chunk0419, chunk0420, chunk0421, chunk0422, chunk0423] 416 64 3328 rfl check052
theorem len052 : SplitCertificateData.Part052.rows.length = 64 := sound052.1

/-- Kernel check of part 53 (rows 3392…3455). -/
theorem check053 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part053.rows [chunk0424, chunk0425, chunk0426, chunk0427, chunk0428, chunk0429, chunk0430, chunk0431] 424 64 = true := by decide +kernel
theorem sound053 : SplitCertificateData.Part053.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part053.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (3392 + j) 3)) (Nat.land (3392 + j) 7) SplitCertificateData.Part053.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part053.rows [chunk0424, chunk0425, chunk0426, chunk0427, chunk0428, chunk0429, chunk0430, chunk0431] 424 64 3392 rfl check053
theorem len053 : SplitCertificateData.Part053.rows.length = 64 := sound053.1

/-- Kernel check of part 54 (rows 3456…3519). -/
theorem check054 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part054.rows [chunk0432, chunk0433, chunk0434, chunk0435, chunk0436, chunk0437, chunk0438, chunk0439] 432 64 = true := by decide +kernel
theorem sound054 : SplitCertificateData.Part054.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part054.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (3456 + j) 3)) (Nat.land (3456 + j) 7) SplitCertificateData.Part054.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part054.rows [chunk0432, chunk0433, chunk0434, chunk0435, chunk0436, chunk0437, chunk0438, chunk0439] 432 64 3456 rfl check054
theorem len054 : SplitCertificateData.Part054.rows.length = 64 := sound054.1

/-- Kernel check of part 55 (rows 3520…3583). -/
theorem check055 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part055.rows [chunk0440, chunk0441, chunk0442, chunk0443, chunk0444, chunk0445, chunk0446, chunk0447] 440 64 = true := by decide +kernel
theorem sound055 : SplitCertificateData.Part055.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part055.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (3520 + j) 3)) (Nat.land (3520 + j) 7) SplitCertificateData.Part055.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part055.rows [chunk0440, chunk0441, chunk0442, chunk0443, chunk0444, chunk0445, chunk0446, chunk0447] 440 64 3520 rfl check055
theorem len055 : SplitCertificateData.Part055.rows.length = 64 := sound055.1

/-- Kernel check of part 56 (rows 3584…3647). -/
theorem check056 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part056.rows [chunk0448, chunk0449, chunk0450, chunk0451, chunk0452, chunk0453, chunk0454, chunk0455] 448 64 = true := by decide +kernel
theorem sound056 : SplitCertificateData.Part056.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part056.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (3584 + j) 3)) (Nat.land (3584 + j) 7) SplitCertificateData.Part056.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part056.rows [chunk0448, chunk0449, chunk0450, chunk0451, chunk0452, chunk0453, chunk0454, chunk0455] 448 64 3584 rfl check056
theorem len056 : SplitCertificateData.Part056.rows.length = 64 := sound056.1

/-- Kernel check of part 57 (rows 3648…3711). -/
theorem check057 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part057.rows [chunk0456, chunk0457, chunk0458, chunk0459, chunk0460, chunk0461, chunk0462, chunk0463] 456 64 = true := by decide +kernel
theorem sound057 : SplitCertificateData.Part057.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part057.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (3648 + j) 3)) (Nat.land (3648 + j) 7) SplitCertificateData.Part057.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part057.rows [chunk0456, chunk0457, chunk0458, chunk0459, chunk0460, chunk0461, chunk0462, chunk0463] 456 64 3648 rfl check057
theorem len057 : SplitCertificateData.Part057.rows.length = 64 := sound057.1

/-- Kernel check of part 58 (rows 3712…3775). -/
theorem check058 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part058.rows [chunk0464, chunk0465, chunk0466, chunk0467, chunk0468, chunk0469, chunk0470, chunk0471] 464 64 = true := by decide +kernel
theorem sound058 : SplitCertificateData.Part058.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part058.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (3712 + j) 3)) (Nat.land (3712 + j) 7) SplitCertificateData.Part058.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part058.rows [chunk0464, chunk0465, chunk0466, chunk0467, chunk0468, chunk0469, chunk0470, chunk0471] 464 64 3712 rfl check058
theorem len058 : SplitCertificateData.Part058.rows.length = 64 := sound058.1

/-- Kernel check of part 59 (rows 3776…3839). -/
theorem check059 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part059.rows [chunk0472, chunk0473, chunk0474, chunk0475, chunk0476, chunk0477, chunk0478, chunk0479] 472 64 = true := by decide +kernel
theorem sound059 : SplitCertificateData.Part059.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part059.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (3776 + j) 3)) (Nat.land (3776 + j) 7) SplitCertificateData.Part059.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part059.rows [chunk0472, chunk0473, chunk0474, chunk0475, chunk0476, chunk0477, chunk0478, chunk0479] 472 64 3776 rfl check059
theorem len059 : SplitCertificateData.Part059.rows.length = 64 := sound059.1


end FKLBridge.Split
