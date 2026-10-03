module

public import FKLBridge.Split.Tree

@[expose] public section

namespace FKLBridge.Split

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 80 (rows 5120…5183). -/
theorem check080 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part080.rows [chunk0640, chunk0641, chunk0642, chunk0643, chunk0644, chunk0645, chunk0646, chunk0647] 640 64 = true := by decide +kernel
theorem sound080 : SplitCertificateData.Part080.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part080.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (5120 + j) 3)) (Nat.land (5120 + j) 7) SplitCertificateData.Part080.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part080.rows [chunk0640, chunk0641, chunk0642, chunk0643, chunk0644, chunk0645, chunk0646, chunk0647] 640 64 5120 rfl check080
theorem len080 : SplitCertificateData.Part080.rows.length = 64 := sound080.1

/-- Kernel check of part 81 (rows 5184…5247). -/
theorem check081 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part081.rows [chunk0648, chunk0649, chunk0650, chunk0651, chunk0652, chunk0653, chunk0654, chunk0655] 648 64 = true := by decide +kernel
theorem sound081 : SplitCertificateData.Part081.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part081.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (5184 + j) 3)) (Nat.land (5184 + j) 7) SplitCertificateData.Part081.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part081.rows [chunk0648, chunk0649, chunk0650, chunk0651, chunk0652, chunk0653, chunk0654, chunk0655] 648 64 5184 rfl check081
theorem len081 : SplitCertificateData.Part081.rows.length = 64 := sound081.1

/-- Kernel check of part 82 (rows 5248…5311). -/
theorem check082 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part082.rows [chunk0656, chunk0657, chunk0658, chunk0659, chunk0660, chunk0661, chunk0662, chunk0663] 656 64 = true := by decide +kernel
theorem sound082 : SplitCertificateData.Part082.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part082.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (5248 + j) 3)) (Nat.land (5248 + j) 7) SplitCertificateData.Part082.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part082.rows [chunk0656, chunk0657, chunk0658, chunk0659, chunk0660, chunk0661, chunk0662, chunk0663] 656 64 5248 rfl check082
theorem len082 : SplitCertificateData.Part082.rows.length = 64 := sound082.1

/-- Kernel check of part 83 (rows 5312…5375). -/
theorem check083 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part083.rows [chunk0664, chunk0665, chunk0666, chunk0667, chunk0668, chunk0669, chunk0670, chunk0671] 664 64 = true := by decide +kernel
theorem sound083 : SplitCertificateData.Part083.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part083.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (5312 + j) 3)) (Nat.land (5312 + j) 7) SplitCertificateData.Part083.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part083.rows [chunk0664, chunk0665, chunk0666, chunk0667, chunk0668, chunk0669, chunk0670, chunk0671] 664 64 5312 rfl check083
theorem len083 : SplitCertificateData.Part083.rows.length = 64 := sound083.1

/-- Kernel check of part 84 (rows 5376…5439). -/
theorem check084 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part084.rows [chunk0672, chunk0673, chunk0674, chunk0675, chunk0676, chunk0677, chunk0678, chunk0679] 672 64 = true := by decide +kernel
theorem sound084 : SplitCertificateData.Part084.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part084.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (5376 + j) 3)) (Nat.land (5376 + j) 7) SplitCertificateData.Part084.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part084.rows [chunk0672, chunk0673, chunk0674, chunk0675, chunk0676, chunk0677, chunk0678, chunk0679] 672 64 5376 rfl check084
theorem len084 : SplitCertificateData.Part084.rows.length = 64 := sound084.1

/-- Kernel check of part 85 (rows 5440…5503). -/
theorem check085 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part085.rows [chunk0680, chunk0681, chunk0682, chunk0683, chunk0684, chunk0685, chunk0686, chunk0687] 680 64 = true := by decide +kernel
theorem sound085 : SplitCertificateData.Part085.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part085.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (5440 + j) 3)) (Nat.land (5440 + j) 7) SplitCertificateData.Part085.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part085.rows [chunk0680, chunk0681, chunk0682, chunk0683, chunk0684, chunk0685, chunk0686, chunk0687] 680 64 5440 rfl check085
theorem len085 : SplitCertificateData.Part085.rows.length = 64 := sound085.1

/-- Kernel check of part 86 (rows 5504…5541). -/
theorem check086 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part086.rows [chunk0688, chunk0689, chunk0690, chunk0691, chunk0692] 688 38 = true := by decide +kernel
theorem sound086 : SplitCertificateData.Part086.rows.length = 38 ∧ ∀ j (hj : j < SplitCertificateData.Part086.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (5504 + j) 3)) (Nat.land (5504 + j) 7) SplitCertificateData.Part086.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part086.rows [chunk0688, chunk0689, chunk0690, chunk0691, chunk0692] 688 38 5504 rfl check086
theorem len086 : SplitCertificateData.Part086.rows.length = 38 := sound086.1


end FKLBridge.Split
