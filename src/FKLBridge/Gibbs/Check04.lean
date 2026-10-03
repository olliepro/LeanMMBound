module

public import FKLBridge.Gibbs.Tree

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 40 (rows 5120…5247). -/
theorem check040 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part040.rows [chunk0640, chunk0641, chunk0642, chunk0643, chunk0644, chunk0645, chunk0646, chunk0647, chunk0648, chunk0649, chunk0650, chunk0651, chunk0652, chunk0653, chunk0654, chunk0655] 640 128 = true := by decide +kernel
theorem sound040 : GibbsCertificateData.Part040.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part040.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (5120 + j) 3)) (Nat.land (5120 + j) 7) GibbsCertificateData.Part040.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part040.rows [chunk0640, chunk0641, chunk0642, chunk0643, chunk0644, chunk0645, chunk0646, chunk0647, chunk0648, chunk0649, chunk0650, chunk0651, chunk0652, chunk0653, chunk0654, chunk0655] 640 128 5120 rfl check040
theorem len040 : GibbsCertificateData.Part040.rows.length = 128 := sound040.1

/-- Kernel check of part 41 (rows 5248…5375). -/
theorem check041 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part041.rows [chunk0656, chunk0657, chunk0658, chunk0659, chunk0660, chunk0661, chunk0662, chunk0663, chunk0664, chunk0665, chunk0666, chunk0667, chunk0668, chunk0669, chunk0670, chunk0671] 656 128 = true := by decide +kernel
theorem sound041 : GibbsCertificateData.Part041.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part041.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (5248 + j) 3)) (Nat.land (5248 + j) 7) GibbsCertificateData.Part041.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part041.rows [chunk0656, chunk0657, chunk0658, chunk0659, chunk0660, chunk0661, chunk0662, chunk0663, chunk0664, chunk0665, chunk0666, chunk0667, chunk0668, chunk0669, chunk0670, chunk0671] 656 128 5248 rfl check041
theorem len041 : GibbsCertificateData.Part041.rows.length = 128 := sound041.1

/-- Kernel check of part 42 (rows 5376…5503). -/
theorem check042 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part042.rows [chunk0672, chunk0673, chunk0674, chunk0675, chunk0676, chunk0677, chunk0678, chunk0679, chunk0680, chunk0681, chunk0682, chunk0683, chunk0684, chunk0685, chunk0686, chunk0687] 672 128 = true := by decide +kernel
theorem sound042 : GibbsCertificateData.Part042.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part042.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (5376 + j) 3)) (Nat.land (5376 + j) 7) GibbsCertificateData.Part042.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part042.rows [chunk0672, chunk0673, chunk0674, chunk0675, chunk0676, chunk0677, chunk0678, chunk0679, chunk0680, chunk0681, chunk0682, chunk0683, chunk0684, chunk0685, chunk0686, chunk0687] 672 128 5376 rfl check042
theorem len042 : GibbsCertificateData.Part042.rows.length = 128 := sound042.1

/-- Kernel check of part 43 (rows 5504…5631). -/
theorem check043 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part043.rows [chunk0688, chunk0689, chunk0690, chunk0691, chunk0692, chunk0693, chunk0694, chunk0695, chunk0696, chunk0697, chunk0698, chunk0699, chunk0700, chunk0701, chunk0702, chunk0703] 688 128 = true := by decide +kernel
theorem sound043 : GibbsCertificateData.Part043.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part043.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (5504 + j) 3)) (Nat.land (5504 + j) 7) GibbsCertificateData.Part043.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part043.rows [chunk0688, chunk0689, chunk0690, chunk0691, chunk0692, chunk0693, chunk0694, chunk0695, chunk0696, chunk0697, chunk0698, chunk0699, chunk0700, chunk0701, chunk0702, chunk0703] 688 128 5504 rfl check043
theorem len043 : GibbsCertificateData.Part043.rows.length = 128 := sound043.1

/-- Kernel check of part 44 (rows 5632…5759). -/
theorem check044 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part044.rows [chunk0704, chunk0705, chunk0706, chunk0707, chunk0708, chunk0709, chunk0710, chunk0711, chunk0712, chunk0713, chunk0714, chunk0715, chunk0716, chunk0717, chunk0718, chunk0719] 704 128 = true := by decide +kernel
theorem sound044 : GibbsCertificateData.Part044.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part044.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (5632 + j) 3)) (Nat.land (5632 + j) 7) GibbsCertificateData.Part044.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part044.rows [chunk0704, chunk0705, chunk0706, chunk0707, chunk0708, chunk0709, chunk0710, chunk0711, chunk0712, chunk0713, chunk0714, chunk0715, chunk0716, chunk0717, chunk0718, chunk0719] 704 128 5632 rfl check044
theorem len044 : GibbsCertificateData.Part044.rows.length = 128 := sound044.1

/-- Kernel check of part 45 (rows 5760…5887). -/
theorem check045 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part045.rows [chunk0720, chunk0721, chunk0722, chunk0723, chunk0724, chunk0725, chunk0726, chunk0727, chunk0728, chunk0729, chunk0730, chunk0731, chunk0732, chunk0733, chunk0734, chunk0735] 720 128 = true := by decide +kernel
theorem sound045 : GibbsCertificateData.Part045.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part045.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (5760 + j) 3)) (Nat.land (5760 + j) 7) GibbsCertificateData.Part045.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part045.rows [chunk0720, chunk0721, chunk0722, chunk0723, chunk0724, chunk0725, chunk0726, chunk0727, chunk0728, chunk0729, chunk0730, chunk0731, chunk0732, chunk0733, chunk0734, chunk0735] 720 128 5760 rfl check045
theorem len045 : GibbsCertificateData.Part045.rows.length = 128 := sound045.1

/-- Kernel check of part 46 (rows 5888…6015). -/
theorem check046 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part046.rows [chunk0736, chunk0737, chunk0738, chunk0739, chunk0740, chunk0741, chunk0742, chunk0743, chunk0744, chunk0745, chunk0746, chunk0747, chunk0748, chunk0749, chunk0750, chunk0751] 736 128 = true := by decide +kernel
theorem sound046 : GibbsCertificateData.Part046.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part046.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (5888 + j) 3)) (Nat.land (5888 + j) 7) GibbsCertificateData.Part046.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part046.rows [chunk0736, chunk0737, chunk0738, chunk0739, chunk0740, chunk0741, chunk0742, chunk0743, chunk0744, chunk0745, chunk0746, chunk0747, chunk0748, chunk0749, chunk0750, chunk0751] 736 128 5888 rfl check046
theorem len046 : GibbsCertificateData.Part046.rows.length = 128 := sound046.1

/-- Kernel check of part 47 (rows 6016…6143). -/
theorem check047 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part047.rows [chunk0752, chunk0753, chunk0754, chunk0755, chunk0756, chunk0757, chunk0758, chunk0759, chunk0760, chunk0761, chunk0762, chunk0763, chunk0764, chunk0765, chunk0766, chunk0767] 752 128 = true := by decide +kernel
theorem sound047 : GibbsCertificateData.Part047.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part047.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (6016 + j) 3)) (Nat.land (6016 + j) 7) GibbsCertificateData.Part047.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part047.rows [chunk0752, chunk0753, chunk0754, chunk0755, chunk0756, chunk0757, chunk0758, chunk0759, chunk0760, chunk0761, chunk0762, chunk0763, chunk0764, chunk0765, chunk0766, chunk0767] 752 128 6016 rfl check047
theorem len047 : GibbsCertificateData.Part047.rows.length = 128 := sound047.1

/-- Kernel check of part 48 (rows 6144…6271). -/
theorem check048 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part048.rows [chunk0768, chunk0769, chunk0770, chunk0771, chunk0772, chunk0773, chunk0774, chunk0775, chunk0776, chunk0777, chunk0778, chunk0779, chunk0780, chunk0781, chunk0782, chunk0783] 768 128 = true := by decide +kernel
theorem sound048 : GibbsCertificateData.Part048.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part048.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (6144 + j) 3)) (Nat.land (6144 + j) 7) GibbsCertificateData.Part048.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part048.rows [chunk0768, chunk0769, chunk0770, chunk0771, chunk0772, chunk0773, chunk0774, chunk0775, chunk0776, chunk0777, chunk0778, chunk0779, chunk0780, chunk0781, chunk0782, chunk0783] 768 128 6144 rfl check048
theorem len048 : GibbsCertificateData.Part048.rows.length = 128 := sound048.1

/-- Kernel check of part 49 (rows 6272…6399). -/
theorem check049 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part049.rows [chunk0784, chunk0785, chunk0786, chunk0787, chunk0788, chunk0789, chunk0790, chunk0791, chunk0792, chunk0793, chunk0794, chunk0795, chunk0796, chunk0797, chunk0798, chunk0799] 784 128 = true := by decide +kernel
theorem sound049 : GibbsCertificateData.Part049.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part049.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (6272 + j) 3)) (Nat.land (6272 + j) 7) GibbsCertificateData.Part049.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part049.rows [chunk0784, chunk0785, chunk0786, chunk0787, chunk0788, chunk0789, chunk0790, chunk0791, chunk0792, chunk0793, chunk0794, chunk0795, chunk0796, chunk0797, chunk0798, chunk0799] 784 128 6272 rfl check049
theorem len049 : GibbsCertificateData.Part049.rows.length = 128 := sound049.1


end FKLBridge.Gibbs
