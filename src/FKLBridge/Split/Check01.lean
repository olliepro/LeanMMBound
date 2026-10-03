module

public import FKLBridge.Split.Tree

@[expose] public section

namespace FKLBridge.Split

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 10 (rows 640…703). -/
theorem check010 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part010.rows [chunk0080, chunk0081, chunk0082, chunk0083, chunk0084, chunk0085, chunk0086, chunk0087] 80 64 = true := by decide +kernel
theorem sound010 : SplitCertificateData.Part010.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part010.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (640 + j) 3)) (Nat.land (640 + j) 7) SplitCertificateData.Part010.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part010.rows [chunk0080, chunk0081, chunk0082, chunk0083, chunk0084, chunk0085, chunk0086, chunk0087] 80 64 640 rfl check010
theorem len010 : SplitCertificateData.Part010.rows.length = 64 := sound010.1

/-- Kernel check of part 11 (rows 704…767). -/
theorem check011 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part011.rows [chunk0088, chunk0089, chunk0090, chunk0091, chunk0092, chunk0093, chunk0094, chunk0095] 88 64 = true := by decide +kernel
theorem sound011 : SplitCertificateData.Part011.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part011.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (704 + j) 3)) (Nat.land (704 + j) 7) SplitCertificateData.Part011.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part011.rows [chunk0088, chunk0089, chunk0090, chunk0091, chunk0092, chunk0093, chunk0094, chunk0095] 88 64 704 rfl check011
theorem len011 : SplitCertificateData.Part011.rows.length = 64 := sound011.1

/-- Kernel check of part 12 (rows 768…831). -/
theorem check012 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part012.rows [chunk0096, chunk0097, chunk0098, chunk0099, chunk0100, chunk0101, chunk0102, chunk0103] 96 64 = true := by decide +kernel
theorem sound012 : SplitCertificateData.Part012.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part012.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (768 + j) 3)) (Nat.land (768 + j) 7) SplitCertificateData.Part012.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part012.rows [chunk0096, chunk0097, chunk0098, chunk0099, chunk0100, chunk0101, chunk0102, chunk0103] 96 64 768 rfl check012
theorem len012 : SplitCertificateData.Part012.rows.length = 64 := sound012.1

/-- Kernel check of part 13 (rows 832…895). -/
theorem check013 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part013.rows [chunk0104, chunk0105, chunk0106, chunk0107, chunk0108, chunk0109, chunk0110, chunk0111] 104 64 = true := by decide +kernel
theorem sound013 : SplitCertificateData.Part013.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part013.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (832 + j) 3)) (Nat.land (832 + j) 7) SplitCertificateData.Part013.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part013.rows [chunk0104, chunk0105, chunk0106, chunk0107, chunk0108, chunk0109, chunk0110, chunk0111] 104 64 832 rfl check013
theorem len013 : SplitCertificateData.Part013.rows.length = 64 := sound013.1

/-- Kernel check of part 14 (rows 896…959). -/
theorem check014 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part014.rows [chunk0112, chunk0113, chunk0114, chunk0115, chunk0116, chunk0117, chunk0118, chunk0119] 112 64 = true := by decide +kernel
theorem sound014 : SplitCertificateData.Part014.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part014.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (896 + j) 3)) (Nat.land (896 + j) 7) SplitCertificateData.Part014.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part014.rows [chunk0112, chunk0113, chunk0114, chunk0115, chunk0116, chunk0117, chunk0118, chunk0119] 112 64 896 rfl check014
theorem len014 : SplitCertificateData.Part014.rows.length = 64 := sound014.1

/-- Kernel check of part 15 (rows 960…1023). -/
theorem check015 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part015.rows [chunk0120, chunk0121, chunk0122, chunk0123, chunk0124, chunk0125, chunk0126, chunk0127] 120 64 = true := by decide +kernel
theorem sound015 : SplitCertificateData.Part015.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part015.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (960 + j) 3)) (Nat.land (960 + j) 7) SplitCertificateData.Part015.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part015.rows [chunk0120, chunk0121, chunk0122, chunk0123, chunk0124, chunk0125, chunk0126, chunk0127] 120 64 960 rfl check015
theorem len015 : SplitCertificateData.Part015.rows.length = 64 := sound015.1

/-- Kernel check of part 16 (rows 1024…1087). -/
theorem check016 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part016.rows [chunk0128, chunk0129, chunk0130, chunk0131, chunk0132, chunk0133, chunk0134, chunk0135] 128 64 = true := by decide +kernel
theorem sound016 : SplitCertificateData.Part016.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part016.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (1024 + j) 3)) (Nat.land (1024 + j) 7) SplitCertificateData.Part016.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part016.rows [chunk0128, chunk0129, chunk0130, chunk0131, chunk0132, chunk0133, chunk0134, chunk0135] 128 64 1024 rfl check016
theorem len016 : SplitCertificateData.Part016.rows.length = 64 := sound016.1

/-- Kernel check of part 17 (rows 1088…1151). -/
theorem check017 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part017.rows [chunk0136, chunk0137, chunk0138, chunk0139, chunk0140, chunk0141, chunk0142, chunk0143] 136 64 = true := by decide +kernel
theorem sound017 : SplitCertificateData.Part017.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part017.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (1088 + j) 3)) (Nat.land (1088 + j) 7) SplitCertificateData.Part017.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part017.rows [chunk0136, chunk0137, chunk0138, chunk0139, chunk0140, chunk0141, chunk0142, chunk0143] 136 64 1088 rfl check017
theorem len017 : SplitCertificateData.Part017.rows.length = 64 := sound017.1

/-- Kernel check of part 18 (rows 1152…1215). -/
theorem check018 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part018.rows [chunk0144, chunk0145, chunk0146, chunk0147, chunk0148, chunk0149, chunk0150, chunk0151] 144 64 = true := by decide +kernel
theorem sound018 : SplitCertificateData.Part018.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part018.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (1152 + j) 3)) (Nat.land (1152 + j) 7) SplitCertificateData.Part018.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part018.rows [chunk0144, chunk0145, chunk0146, chunk0147, chunk0148, chunk0149, chunk0150, chunk0151] 144 64 1152 rfl check018
theorem len018 : SplitCertificateData.Part018.rows.length = 64 := sound018.1

/-- Kernel check of part 19 (rows 1216…1279). -/
theorem check019 : Rows.partOk tree Rows.splitOk SplitCertificateData.Part019.rows [chunk0152, chunk0153, chunk0154, chunk0155, chunk0156, chunk0157, chunk0158, chunk0159] 152 64 = true := by decide +kernel
theorem sound019 : SplitCertificateData.Part019.rows.length = 64 ∧ ∀ j (hj : j < SplitCertificateData.Part019.rows.length),
    Rows.splitOk (tree.get (Nat.shiftRight (1216 + j) 3)) (Nat.land (1216 + j) 7) SplitCertificateData.Part019.rows[j] = true :=
  Rows.partOk_sound tree Rows.splitOk SplitCertificateData.Part019.rows [chunk0152, chunk0153, chunk0154, chunk0155, chunk0156, chunk0157, chunk0158, chunk0159] 152 64 1216 rfl check019
theorem len019 : SplitCertificateData.Part019.rows.length = 64 := sound019.1


end FKLBridge.Split
