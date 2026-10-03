module

public import FKLBridge.Gibbs.Tree

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 50 (rows 6400…6527). -/
theorem check050 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part050.rows [chunk0800, chunk0801, chunk0802, chunk0803, chunk0804, chunk0805, chunk0806, chunk0807, chunk0808, chunk0809, chunk0810, chunk0811, chunk0812, chunk0813, chunk0814, chunk0815] 800 128 = true := by decide +kernel
theorem sound050 : GibbsCertificateData.Part050.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part050.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (6400 + j) 3)) (Nat.land (6400 + j) 7) GibbsCertificateData.Part050.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part050.rows [chunk0800, chunk0801, chunk0802, chunk0803, chunk0804, chunk0805, chunk0806, chunk0807, chunk0808, chunk0809, chunk0810, chunk0811, chunk0812, chunk0813, chunk0814, chunk0815] 800 128 6400 rfl check050
theorem len050 : GibbsCertificateData.Part050.rows.length = 128 := sound050.1

/-- Kernel check of part 51 (rows 6528…6655). -/
theorem check051 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part051.rows [chunk0816, chunk0817, chunk0818, chunk0819, chunk0820, chunk0821, chunk0822, chunk0823, chunk0824, chunk0825, chunk0826, chunk0827, chunk0828, chunk0829, chunk0830, chunk0831] 816 128 = true := by decide +kernel
theorem sound051 : GibbsCertificateData.Part051.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part051.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (6528 + j) 3)) (Nat.land (6528 + j) 7) GibbsCertificateData.Part051.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part051.rows [chunk0816, chunk0817, chunk0818, chunk0819, chunk0820, chunk0821, chunk0822, chunk0823, chunk0824, chunk0825, chunk0826, chunk0827, chunk0828, chunk0829, chunk0830, chunk0831] 816 128 6528 rfl check051
theorem len051 : GibbsCertificateData.Part051.rows.length = 128 := sound051.1

/-- Kernel check of part 52 (rows 6656…6783). -/
theorem check052 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part052.rows [chunk0832, chunk0833, chunk0834, chunk0835, chunk0836, chunk0837, chunk0838, chunk0839, chunk0840, chunk0841, chunk0842, chunk0843, chunk0844, chunk0845, chunk0846, chunk0847] 832 128 = true := by decide +kernel
theorem sound052 : GibbsCertificateData.Part052.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part052.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (6656 + j) 3)) (Nat.land (6656 + j) 7) GibbsCertificateData.Part052.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part052.rows [chunk0832, chunk0833, chunk0834, chunk0835, chunk0836, chunk0837, chunk0838, chunk0839, chunk0840, chunk0841, chunk0842, chunk0843, chunk0844, chunk0845, chunk0846, chunk0847] 832 128 6656 rfl check052
theorem len052 : GibbsCertificateData.Part052.rows.length = 128 := sound052.1

/-- Kernel check of part 53 (rows 6784…6911). -/
theorem check053 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part053.rows [chunk0848, chunk0849, chunk0850, chunk0851, chunk0852, chunk0853, chunk0854, chunk0855, chunk0856, chunk0857, chunk0858, chunk0859, chunk0860, chunk0861, chunk0862, chunk0863] 848 128 = true := by decide +kernel
theorem sound053 : GibbsCertificateData.Part053.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part053.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (6784 + j) 3)) (Nat.land (6784 + j) 7) GibbsCertificateData.Part053.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part053.rows [chunk0848, chunk0849, chunk0850, chunk0851, chunk0852, chunk0853, chunk0854, chunk0855, chunk0856, chunk0857, chunk0858, chunk0859, chunk0860, chunk0861, chunk0862, chunk0863] 848 128 6784 rfl check053
theorem len053 : GibbsCertificateData.Part053.rows.length = 128 := sound053.1

/-- Kernel check of part 54 (rows 6912…7039). -/
theorem check054 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part054.rows [chunk0864, chunk0865, chunk0866, chunk0867, chunk0868, chunk0869, chunk0870, chunk0871, chunk0872, chunk0873, chunk0874, chunk0875, chunk0876, chunk0877, chunk0878, chunk0879] 864 128 = true := by decide +kernel
theorem sound054 : GibbsCertificateData.Part054.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part054.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (6912 + j) 3)) (Nat.land (6912 + j) 7) GibbsCertificateData.Part054.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part054.rows [chunk0864, chunk0865, chunk0866, chunk0867, chunk0868, chunk0869, chunk0870, chunk0871, chunk0872, chunk0873, chunk0874, chunk0875, chunk0876, chunk0877, chunk0878, chunk0879] 864 128 6912 rfl check054
theorem len054 : GibbsCertificateData.Part054.rows.length = 128 := sound054.1

/-- Kernel check of part 55 (rows 7040…7167). -/
theorem check055 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part055.rows [chunk0880, chunk0881, chunk0882, chunk0883, chunk0884, chunk0885, chunk0886, chunk0887, chunk0888, chunk0889, chunk0890, chunk0891, chunk0892, chunk0893, chunk0894, chunk0895] 880 128 = true := by decide +kernel
theorem sound055 : GibbsCertificateData.Part055.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part055.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (7040 + j) 3)) (Nat.land (7040 + j) 7) GibbsCertificateData.Part055.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part055.rows [chunk0880, chunk0881, chunk0882, chunk0883, chunk0884, chunk0885, chunk0886, chunk0887, chunk0888, chunk0889, chunk0890, chunk0891, chunk0892, chunk0893, chunk0894, chunk0895] 880 128 7040 rfl check055
theorem len055 : GibbsCertificateData.Part055.rows.length = 128 := sound055.1

/-- Kernel check of part 56 (rows 7168…7295). -/
theorem check056 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part056.rows [chunk0896, chunk0897, chunk0898, chunk0899, chunk0900, chunk0901, chunk0902, chunk0903, chunk0904, chunk0905, chunk0906, chunk0907, chunk0908, chunk0909, chunk0910, chunk0911] 896 128 = true := by decide +kernel
theorem sound056 : GibbsCertificateData.Part056.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part056.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (7168 + j) 3)) (Nat.land (7168 + j) 7) GibbsCertificateData.Part056.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part056.rows [chunk0896, chunk0897, chunk0898, chunk0899, chunk0900, chunk0901, chunk0902, chunk0903, chunk0904, chunk0905, chunk0906, chunk0907, chunk0908, chunk0909, chunk0910, chunk0911] 896 128 7168 rfl check056
theorem len056 : GibbsCertificateData.Part056.rows.length = 128 := sound056.1

/-- Kernel check of part 57 (rows 7296…7423). -/
theorem check057 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part057.rows [chunk0912, chunk0913, chunk0914, chunk0915, chunk0916, chunk0917, chunk0918, chunk0919, chunk0920, chunk0921, chunk0922, chunk0923, chunk0924, chunk0925, chunk0926, chunk0927] 912 128 = true := by decide +kernel
theorem sound057 : GibbsCertificateData.Part057.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part057.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (7296 + j) 3)) (Nat.land (7296 + j) 7) GibbsCertificateData.Part057.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part057.rows [chunk0912, chunk0913, chunk0914, chunk0915, chunk0916, chunk0917, chunk0918, chunk0919, chunk0920, chunk0921, chunk0922, chunk0923, chunk0924, chunk0925, chunk0926, chunk0927] 912 128 7296 rfl check057
theorem len057 : GibbsCertificateData.Part057.rows.length = 128 := sound057.1

/-- Kernel check of part 58 (rows 7424…7551). -/
theorem check058 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part058.rows [chunk0928, chunk0929, chunk0930, chunk0931, chunk0932, chunk0933, chunk0934, chunk0935, chunk0936, chunk0937, chunk0938, chunk0939, chunk0940, chunk0941, chunk0942, chunk0943] 928 128 = true := by decide +kernel
theorem sound058 : GibbsCertificateData.Part058.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part058.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (7424 + j) 3)) (Nat.land (7424 + j) 7) GibbsCertificateData.Part058.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part058.rows [chunk0928, chunk0929, chunk0930, chunk0931, chunk0932, chunk0933, chunk0934, chunk0935, chunk0936, chunk0937, chunk0938, chunk0939, chunk0940, chunk0941, chunk0942, chunk0943] 928 128 7424 rfl check058
theorem len058 : GibbsCertificateData.Part058.rows.length = 128 := sound058.1

/-- Kernel check of part 59 (rows 7552…7679). -/
theorem check059 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part059.rows [chunk0944, chunk0945, chunk0946, chunk0947, chunk0948, chunk0949, chunk0950, chunk0951, chunk0952, chunk0953, chunk0954, chunk0955, chunk0956, chunk0957, chunk0958, chunk0959] 944 128 = true := by decide +kernel
theorem sound059 : GibbsCertificateData.Part059.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part059.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (7552 + j) 3)) (Nat.land (7552 + j) 7) GibbsCertificateData.Part059.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part059.rows [chunk0944, chunk0945, chunk0946, chunk0947, chunk0948, chunk0949, chunk0950, chunk0951, chunk0952, chunk0953, chunk0954, chunk0955, chunk0956, chunk0957, chunk0958, chunk0959] 944 128 7552 rfl check059
theorem len059 : GibbsCertificateData.Part059.rows.length = 128 := sound059.1


end FKLBridge.Gibbs
