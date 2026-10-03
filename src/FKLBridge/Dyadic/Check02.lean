module

public import FKLBridge.Dyadic.Tree

@[expose] public section

namespace FKLBridge.Dyadic

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 20 (rows 5120…5375). -/
theorem check020 : Rows.partOk tree Rows.dyOk CertificateData.Part020.rows [chunk0640, chunk0641, chunk0642, chunk0643, chunk0644, chunk0645, chunk0646, chunk0647, chunk0648, chunk0649, chunk0650, chunk0651, chunk0652, chunk0653, chunk0654, chunk0655, chunk0656, chunk0657, chunk0658, chunk0659, chunk0660, chunk0661, chunk0662, chunk0663, chunk0664, chunk0665, chunk0666, chunk0667, chunk0668, chunk0669, chunk0670, chunk0671] 640 256 = true := by decide +kernel
theorem sound020 : CertificateData.Part020.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part020.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (5120 + j) 3)) (Nat.land (5120 + j) 7) CertificateData.Part020.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part020.rows [chunk0640, chunk0641, chunk0642, chunk0643, chunk0644, chunk0645, chunk0646, chunk0647, chunk0648, chunk0649, chunk0650, chunk0651, chunk0652, chunk0653, chunk0654, chunk0655, chunk0656, chunk0657, chunk0658, chunk0659, chunk0660, chunk0661, chunk0662, chunk0663, chunk0664, chunk0665, chunk0666, chunk0667, chunk0668, chunk0669, chunk0670, chunk0671] 640 256 5120 rfl check020
theorem len020 : CertificateData.Part020.rows.length = 256 := sound020.1

/-- Kernel check of part 21 (rows 5376…5631). -/
theorem check021 : Rows.partOk tree Rows.dyOk CertificateData.Part021.rows [chunk0672, chunk0673, chunk0674, chunk0675, chunk0676, chunk0677, chunk0678, chunk0679, chunk0680, chunk0681, chunk0682, chunk0683, chunk0684, chunk0685, chunk0686, chunk0687, chunk0688, chunk0689, chunk0690, chunk0691, chunk0692, chunk0693, chunk0694, chunk0695, chunk0696, chunk0697, chunk0698, chunk0699, chunk0700, chunk0701, chunk0702, chunk0703] 672 256 = true := by decide +kernel
theorem sound021 : CertificateData.Part021.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part021.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (5376 + j) 3)) (Nat.land (5376 + j) 7) CertificateData.Part021.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part021.rows [chunk0672, chunk0673, chunk0674, chunk0675, chunk0676, chunk0677, chunk0678, chunk0679, chunk0680, chunk0681, chunk0682, chunk0683, chunk0684, chunk0685, chunk0686, chunk0687, chunk0688, chunk0689, chunk0690, chunk0691, chunk0692, chunk0693, chunk0694, chunk0695, chunk0696, chunk0697, chunk0698, chunk0699, chunk0700, chunk0701, chunk0702, chunk0703] 672 256 5376 rfl check021
theorem len021 : CertificateData.Part021.rows.length = 256 := sound021.1

/-- Kernel check of part 22 (rows 5632…5887). -/
theorem check022 : Rows.partOk tree Rows.dyOk CertificateData.Part022.rows [chunk0704, chunk0705, chunk0706, chunk0707, chunk0708, chunk0709, chunk0710, chunk0711, chunk0712, chunk0713, chunk0714, chunk0715, chunk0716, chunk0717, chunk0718, chunk0719, chunk0720, chunk0721, chunk0722, chunk0723, chunk0724, chunk0725, chunk0726, chunk0727, chunk0728, chunk0729, chunk0730, chunk0731, chunk0732, chunk0733, chunk0734, chunk0735] 704 256 = true := by decide +kernel
theorem sound022 : CertificateData.Part022.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part022.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (5632 + j) 3)) (Nat.land (5632 + j) 7) CertificateData.Part022.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part022.rows [chunk0704, chunk0705, chunk0706, chunk0707, chunk0708, chunk0709, chunk0710, chunk0711, chunk0712, chunk0713, chunk0714, chunk0715, chunk0716, chunk0717, chunk0718, chunk0719, chunk0720, chunk0721, chunk0722, chunk0723, chunk0724, chunk0725, chunk0726, chunk0727, chunk0728, chunk0729, chunk0730, chunk0731, chunk0732, chunk0733, chunk0734, chunk0735] 704 256 5632 rfl check022
theorem len022 : CertificateData.Part022.rows.length = 256 := sound022.1

/-- Kernel check of part 23 (rows 5888…6143). -/
theorem check023 : Rows.partOk tree Rows.dyOk CertificateData.Part023.rows [chunk0736, chunk0737, chunk0738, chunk0739, chunk0740, chunk0741, chunk0742, chunk0743, chunk0744, chunk0745, chunk0746, chunk0747, chunk0748, chunk0749, chunk0750, chunk0751, chunk0752, chunk0753, chunk0754, chunk0755, chunk0756, chunk0757, chunk0758, chunk0759, chunk0760, chunk0761, chunk0762, chunk0763, chunk0764, chunk0765, chunk0766, chunk0767] 736 256 = true := by decide +kernel
theorem sound023 : CertificateData.Part023.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part023.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (5888 + j) 3)) (Nat.land (5888 + j) 7) CertificateData.Part023.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part023.rows [chunk0736, chunk0737, chunk0738, chunk0739, chunk0740, chunk0741, chunk0742, chunk0743, chunk0744, chunk0745, chunk0746, chunk0747, chunk0748, chunk0749, chunk0750, chunk0751, chunk0752, chunk0753, chunk0754, chunk0755, chunk0756, chunk0757, chunk0758, chunk0759, chunk0760, chunk0761, chunk0762, chunk0763, chunk0764, chunk0765, chunk0766, chunk0767] 736 256 5888 rfl check023
theorem len023 : CertificateData.Part023.rows.length = 256 := sound023.1

/-- Kernel check of part 24 (rows 6144…6399). -/
theorem check024 : Rows.partOk tree Rows.dyOk CertificateData.Part024.rows [chunk0768, chunk0769, chunk0770, chunk0771, chunk0772, chunk0773, chunk0774, chunk0775, chunk0776, chunk0777, chunk0778, chunk0779, chunk0780, chunk0781, chunk0782, chunk0783, chunk0784, chunk0785, chunk0786, chunk0787, chunk0788, chunk0789, chunk0790, chunk0791, chunk0792, chunk0793, chunk0794, chunk0795, chunk0796, chunk0797, chunk0798, chunk0799] 768 256 = true := by decide +kernel
theorem sound024 : CertificateData.Part024.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part024.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (6144 + j) 3)) (Nat.land (6144 + j) 7) CertificateData.Part024.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part024.rows [chunk0768, chunk0769, chunk0770, chunk0771, chunk0772, chunk0773, chunk0774, chunk0775, chunk0776, chunk0777, chunk0778, chunk0779, chunk0780, chunk0781, chunk0782, chunk0783, chunk0784, chunk0785, chunk0786, chunk0787, chunk0788, chunk0789, chunk0790, chunk0791, chunk0792, chunk0793, chunk0794, chunk0795, chunk0796, chunk0797, chunk0798, chunk0799] 768 256 6144 rfl check024
theorem len024 : CertificateData.Part024.rows.length = 256 := sound024.1

/-- Kernel check of part 25 (rows 6400…6655). -/
theorem check025 : Rows.partOk tree Rows.dyOk CertificateData.Part025.rows [chunk0800, chunk0801, chunk0802, chunk0803, chunk0804, chunk0805, chunk0806, chunk0807, chunk0808, chunk0809, chunk0810, chunk0811, chunk0812, chunk0813, chunk0814, chunk0815, chunk0816, chunk0817, chunk0818, chunk0819, chunk0820, chunk0821, chunk0822, chunk0823, chunk0824, chunk0825, chunk0826, chunk0827, chunk0828, chunk0829, chunk0830, chunk0831] 800 256 = true := by decide +kernel
theorem sound025 : CertificateData.Part025.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part025.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (6400 + j) 3)) (Nat.land (6400 + j) 7) CertificateData.Part025.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part025.rows [chunk0800, chunk0801, chunk0802, chunk0803, chunk0804, chunk0805, chunk0806, chunk0807, chunk0808, chunk0809, chunk0810, chunk0811, chunk0812, chunk0813, chunk0814, chunk0815, chunk0816, chunk0817, chunk0818, chunk0819, chunk0820, chunk0821, chunk0822, chunk0823, chunk0824, chunk0825, chunk0826, chunk0827, chunk0828, chunk0829, chunk0830, chunk0831] 800 256 6400 rfl check025
theorem len025 : CertificateData.Part025.rows.length = 256 := sound025.1

/-- Kernel check of part 26 (rows 6656…6911). -/
theorem check026 : Rows.partOk tree Rows.dyOk CertificateData.Part026.rows [chunk0832, chunk0833, chunk0834, chunk0835, chunk0836, chunk0837, chunk0838, chunk0839, chunk0840, chunk0841, chunk0842, chunk0843, chunk0844, chunk0845, chunk0846, chunk0847, chunk0848, chunk0849, chunk0850, chunk0851, chunk0852, chunk0853, chunk0854, chunk0855, chunk0856, chunk0857, chunk0858, chunk0859, chunk0860, chunk0861, chunk0862, chunk0863] 832 256 = true := by decide +kernel
theorem sound026 : CertificateData.Part026.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part026.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (6656 + j) 3)) (Nat.land (6656 + j) 7) CertificateData.Part026.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part026.rows [chunk0832, chunk0833, chunk0834, chunk0835, chunk0836, chunk0837, chunk0838, chunk0839, chunk0840, chunk0841, chunk0842, chunk0843, chunk0844, chunk0845, chunk0846, chunk0847, chunk0848, chunk0849, chunk0850, chunk0851, chunk0852, chunk0853, chunk0854, chunk0855, chunk0856, chunk0857, chunk0858, chunk0859, chunk0860, chunk0861, chunk0862, chunk0863] 832 256 6656 rfl check026
theorem len026 : CertificateData.Part026.rows.length = 256 := sound026.1

/-- Kernel check of part 27 (rows 6912…7167). -/
theorem check027 : Rows.partOk tree Rows.dyOk CertificateData.Part027.rows [chunk0864, chunk0865, chunk0866, chunk0867, chunk0868, chunk0869, chunk0870, chunk0871, chunk0872, chunk0873, chunk0874, chunk0875, chunk0876, chunk0877, chunk0878, chunk0879, chunk0880, chunk0881, chunk0882, chunk0883, chunk0884, chunk0885, chunk0886, chunk0887, chunk0888, chunk0889, chunk0890, chunk0891, chunk0892, chunk0893, chunk0894, chunk0895] 864 256 = true := by decide +kernel
theorem sound027 : CertificateData.Part027.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part027.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (6912 + j) 3)) (Nat.land (6912 + j) 7) CertificateData.Part027.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part027.rows [chunk0864, chunk0865, chunk0866, chunk0867, chunk0868, chunk0869, chunk0870, chunk0871, chunk0872, chunk0873, chunk0874, chunk0875, chunk0876, chunk0877, chunk0878, chunk0879, chunk0880, chunk0881, chunk0882, chunk0883, chunk0884, chunk0885, chunk0886, chunk0887, chunk0888, chunk0889, chunk0890, chunk0891, chunk0892, chunk0893, chunk0894, chunk0895] 864 256 6912 rfl check027
theorem len027 : CertificateData.Part027.rows.length = 256 := sound027.1

/-- Kernel check of part 28 (rows 7168…7423). -/
theorem check028 : Rows.partOk tree Rows.dyOk CertificateData.Part028.rows [chunk0896, chunk0897, chunk0898, chunk0899, chunk0900, chunk0901, chunk0902, chunk0903, chunk0904, chunk0905, chunk0906, chunk0907, chunk0908, chunk0909, chunk0910, chunk0911, chunk0912, chunk0913, chunk0914, chunk0915, chunk0916, chunk0917, chunk0918, chunk0919, chunk0920, chunk0921, chunk0922, chunk0923, chunk0924, chunk0925, chunk0926, chunk0927] 896 256 = true := by decide +kernel
theorem sound028 : CertificateData.Part028.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part028.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (7168 + j) 3)) (Nat.land (7168 + j) 7) CertificateData.Part028.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part028.rows [chunk0896, chunk0897, chunk0898, chunk0899, chunk0900, chunk0901, chunk0902, chunk0903, chunk0904, chunk0905, chunk0906, chunk0907, chunk0908, chunk0909, chunk0910, chunk0911, chunk0912, chunk0913, chunk0914, chunk0915, chunk0916, chunk0917, chunk0918, chunk0919, chunk0920, chunk0921, chunk0922, chunk0923, chunk0924, chunk0925, chunk0926, chunk0927] 896 256 7168 rfl check028
theorem len028 : CertificateData.Part028.rows.length = 256 := sound028.1

/-- Kernel check of part 29 (rows 7424…7679). -/
theorem check029 : Rows.partOk tree Rows.dyOk CertificateData.Part029.rows [chunk0928, chunk0929, chunk0930, chunk0931, chunk0932, chunk0933, chunk0934, chunk0935, chunk0936, chunk0937, chunk0938, chunk0939, chunk0940, chunk0941, chunk0942, chunk0943, chunk0944, chunk0945, chunk0946, chunk0947, chunk0948, chunk0949, chunk0950, chunk0951, chunk0952, chunk0953, chunk0954, chunk0955, chunk0956, chunk0957, chunk0958, chunk0959] 928 256 = true := by decide +kernel
theorem sound029 : CertificateData.Part029.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part029.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (7424 + j) 3)) (Nat.land (7424 + j) 7) CertificateData.Part029.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part029.rows [chunk0928, chunk0929, chunk0930, chunk0931, chunk0932, chunk0933, chunk0934, chunk0935, chunk0936, chunk0937, chunk0938, chunk0939, chunk0940, chunk0941, chunk0942, chunk0943, chunk0944, chunk0945, chunk0946, chunk0947, chunk0948, chunk0949, chunk0950, chunk0951, chunk0952, chunk0953, chunk0954, chunk0955, chunk0956, chunk0957, chunk0958, chunk0959] 928 256 7424 rfl check029
theorem len029 : CertificateData.Part029.rows.length = 256 := sound029.1


end FKLBridge.Dyadic
