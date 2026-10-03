module

public import FKLBridge.Split.Tree

@[expose] public section

namespace FKLBridge.Split

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 20 (rows 1280…1343). -/
theorem check020 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part020.rows [chunk0160, chunk0161, chunk0162, chunk0163, chunk0164, chunk0165, chunk0166, chunk0167] 160 64 = true := by decide +kernel
theorem sound020 : SplitCertificateData.Part020.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part020.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (1280 + j) 3)) (Nat.land (1280 + j) 7) SplitCertificateData.Part020.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part020.rows [chunk0160, chunk0161, chunk0162, chunk0163, chunk0164, chunk0165, chunk0166, chunk0167] 160 64 1280 rfl check020
theorem len020 : SplitCertificateData.Part020.rows.length = 64 := sound020.1

/-- Kernel check of part 21 (rows 1344…1407). -/
theorem check021 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part021.rows [chunk0168, chunk0169, chunk0170, chunk0171, chunk0172, chunk0173, chunk0174, chunk0175] 168 64 = true := by decide +kernel
theorem sound021 : SplitCertificateData.Part021.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part021.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (1344 + j) 3)) (Nat.land (1344 + j) 7) SplitCertificateData.Part021.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part021.rows [chunk0168, chunk0169, chunk0170, chunk0171, chunk0172, chunk0173, chunk0174, chunk0175] 168 64 1344 rfl check021
theorem len021 : SplitCertificateData.Part021.rows.length = 64 := sound021.1

/-- Kernel check of part 22 (rows 1408…1471). -/
theorem check022 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part022.rows [chunk0176, chunk0177, chunk0178, chunk0179, chunk0180, chunk0181, chunk0182, chunk0183] 176 64 = true := by decide +kernel
theorem sound022 : SplitCertificateData.Part022.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part022.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (1408 + j) 3)) (Nat.land (1408 + j) 7) SplitCertificateData.Part022.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part022.rows [chunk0176, chunk0177, chunk0178, chunk0179, chunk0180, chunk0181, chunk0182, chunk0183] 176 64 1408 rfl check022
theorem len022 : SplitCertificateData.Part022.rows.length = 64 := sound022.1

/-- Kernel check of part 23 (rows 1472…1535). -/
theorem check023 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part023.rows [chunk0184, chunk0185, chunk0186, chunk0187, chunk0188, chunk0189, chunk0190, chunk0191] 184 64 = true := by decide +kernel
theorem sound023 : SplitCertificateData.Part023.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part023.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (1472 + j) 3)) (Nat.land (1472 + j) 7) SplitCertificateData.Part023.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part023.rows [chunk0184, chunk0185, chunk0186, chunk0187, chunk0188, chunk0189, chunk0190, chunk0191] 184 64 1472 rfl check023
theorem len023 : SplitCertificateData.Part023.rows.length = 64 := sound023.1

/-- Kernel check of part 24 (rows 1536…1599). -/
theorem check024 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part024.rows [chunk0192, chunk0193, chunk0194, chunk0195, chunk0196, chunk0197, chunk0198, chunk0199] 192 64 = true := by decide +kernel
theorem sound024 : SplitCertificateData.Part024.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part024.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (1536 + j) 3)) (Nat.land (1536 + j) 7) SplitCertificateData.Part024.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part024.rows [chunk0192, chunk0193, chunk0194, chunk0195, chunk0196, chunk0197, chunk0198, chunk0199] 192 64 1536 rfl check024
theorem len024 : SplitCertificateData.Part024.rows.length = 64 := sound024.1

/-- Kernel check of part 25 (rows 1600…1663). -/
theorem check025 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part025.rows [chunk0200, chunk0201, chunk0202, chunk0203, chunk0204, chunk0205, chunk0206, chunk0207] 200 64 = true := by decide +kernel
theorem sound025 : SplitCertificateData.Part025.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part025.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (1600 + j) 3)) (Nat.land (1600 + j) 7) SplitCertificateData.Part025.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part025.rows [chunk0200, chunk0201, chunk0202, chunk0203, chunk0204, chunk0205, chunk0206, chunk0207] 200 64 1600 rfl check025
theorem len025 : SplitCertificateData.Part025.rows.length = 64 := sound025.1

/-- Kernel check of part 26 (rows 1664…1727). -/
theorem check026 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part026.rows [chunk0208, chunk0209, chunk0210, chunk0211, chunk0212, chunk0213, chunk0214, chunk0215] 208 64 = true := by decide +kernel
theorem sound026 : SplitCertificateData.Part026.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part026.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (1664 + j) 3)) (Nat.land (1664 + j) 7) SplitCertificateData.Part026.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part026.rows [chunk0208, chunk0209, chunk0210, chunk0211, chunk0212, chunk0213, chunk0214, chunk0215] 208 64 1664 rfl check026
theorem len026 : SplitCertificateData.Part026.rows.length = 64 := sound026.1

/-- Kernel check of part 27 (rows 1728…1791). -/
theorem check027 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part027.rows [chunk0216, chunk0217, chunk0218, chunk0219, chunk0220, chunk0221, chunk0222, chunk0223] 216 64 = true := by decide +kernel
theorem sound027 : SplitCertificateData.Part027.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part027.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (1728 + j) 3)) (Nat.land (1728 + j) 7) SplitCertificateData.Part027.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part027.rows [chunk0216, chunk0217, chunk0218, chunk0219, chunk0220, chunk0221, chunk0222, chunk0223] 216 64 1728 rfl check027
theorem len027 : SplitCertificateData.Part027.rows.length = 64 := sound027.1

/-- Kernel check of part 28 (rows 1792…1855). -/
theorem check028 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part028.rows [chunk0224, chunk0225, chunk0226, chunk0227, chunk0228, chunk0229, chunk0230, chunk0231] 224 64 = true := by decide +kernel
theorem sound028 : SplitCertificateData.Part028.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part028.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (1792 + j) 3)) (Nat.land (1792 + j) 7) SplitCertificateData.Part028.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part028.rows [chunk0224, chunk0225, chunk0226, chunk0227, chunk0228, chunk0229, chunk0230, chunk0231] 224 64 1792 rfl check028
theorem len028 : SplitCertificateData.Part028.rows.length = 64 := sound028.1

/-- Kernel check of part 29 (rows 1856…1919). -/
theorem check029 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part029.rows [chunk0232, chunk0233, chunk0234, chunk0235, chunk0236, chunk0237, chunk0238, chunk0239] 232 64 = true := by decide +kernel
theorem sound029 : SplitCertificateData.Part029.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part029.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (1856 + j) 3)) (Nat.land (1856 + j) 7) SplitCertificateData.Part029.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part029.rows [chunk0232, chunk0233, chunk0234, chunk0235, chunk0236, chunk0237, chunk0238, chunk0239] 232 64 1856 rfl check029
theorem len029 : SplitCertificateData.Part029.rows.length = 64 := sound029.1


end FKLBridge.Split
