module

public import FKLBridge.Gibbs.Tree

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 60 (rows 7680…7807). -/
theorem check060 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part060.rows [chunk0960, chunk0961, chunk0962, chunk0963, chunk0964, chunk0965, chunk0966, chunk0967, chunk0968, chunk0969, chunk0970, chunk0971, chunk0972, chunk0973, chunk0974, chunk0975] 960 128 = true := by decide +kernel
theorem sound060 : GibbsCertificateData.Part060.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part060.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (7680 + j) 3)) (Nat.land (7680 + j) 7) GibbsCertificateData.Part060.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part060.rows [chunk0960, chunk0961, chunk0962, chunk0963, chunk0964, chunk0965, chunk0966, chunk0967, chunk0968, chunk0969, chunk0970, chunk0971, chunk0972, chunk0973, chunk0974, chunk0975] 960 128 7680 rfl check060
theorem len060 : GibbsCertificateData.Part060.rows.length = 128 := sound060.1

/-- Kernel check of part 61 (rows 7808…7935). -/
theorem check061 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part061.rows [chunk0976, chunk0977, chunk0978, chunk0979, chunk0980, chunk0981, chunk0982, chunk0983, chunk0984, chunk0985, chunk0986, chunk0987, chunk0988, chunk0989, chunk0990, chunk0991] 976 128 = true := by decide +kernel
theorem sound061 : GibbsCertificateData.Part061.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part061.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (7808 + j) 3)) (Nat.land (7808 + j) 7) GibbsCertificateData.Part061.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part061.rows [chunk0976, chunk0977, chunk0978, chunk0979, chunk0980, chunk0981, chunk0982, chunk0983, chunk0984, chunk0985, chunk0986, chunk0987, chunk0988, chunk0989, chunk0990, chunk0991] 976 128 7808 rfl check061
theorem len061 : GibbsCertificateData.Part061.rows.length = 128 := sound061.1

/-- Kernel check of part 62 (rows 7936…8063). -/
theorem check062 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part062.rows [chunk0992, chunk0993, chunk0994, chunk0995, chunk0996, chunk0997, chunk0998, chunk0999, chunk1000, chunk1001, chunk1002, chunk1003, chunk1004, chunk1005, chunk1006, chunk1007] 992 128 = true := by decide +kernel
theorem sound062 : GibbsCertificateData.Part062.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part062.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (7936 + j) 3)) (Nat.land (7936 + j) 7) GibbsCertificateData.Part062.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part062.rows [chunk0992, chunk0993, chunk0994, chunk0995, chunk0996, chunk0997, chunk0998, chunk0999, chunk1000, chunk1001, chunk1002, chunk1003, chunk1004, chunk1005, chunk1006, chunk1007] 992 128 7936 rfl check062
theorem len062 : GibbsCertificateData.Part062.rows.length = 128 := sound062.1

/-- Kernel check of part 63 (rows 8064…8191). -/
theorem check063 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part063.rows [chunk1008, chunk1009, chunk1010, chunk1011, chunk1012, chunk1013, chunk1014, chunk1015, chunk1016, chunk1017, chunk1018, chunk1019, chunk1020, chunk1021, chunk1022, chunk1023] 1008 128 = true := by decide +kernel
theorem sound063 : GibbsCertificateData.Part063.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part063.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (8064 + j) 3)) (Nat.land (8064 + j) 7) GibbsCertificateData.Part063.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part063.rows [chunk1008, chunk1009, chunk1010, chunk1011, chunk1012, chunk1013, chunk1014, chunk1015, chunk1016, chunk1017, chunk1018, chunk1019, chunk1020, chunk1021, chunk1022, chunk1023] 1008 128 8064 rfl check063
theorem len063 : GibbsCertificateData.Part063.rows.length = 128 := sound063.1

/-- Kernel check of part 64 (rows 8192…8319). -/
theorem check064 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part064.rows [chunk1024, chunk1025, chunk1026, chunk1027, chunk1028, chunk1029, chunk1030, chunk1031, chunk1032, chunk1033, chunk1034, chunk1035, chunk1036, chunk1037, chunk1038, chunk1039] 1024 128 = true := by decide +kernel
theorem sound064 : GibbsCertificateData.Part064.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part064.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (8192 + j) 3)) (Nat.land (8192 + j) 7) GibbsCertificateData.Part064.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part064.rows [chunk1024, chunk1025, chunk1026, chunk1027, chunk1028, chunk1029, chunk1030, chunk1031, chunk1032, chunk1033, chunk1034, chunk1035, chunk1036, chunk1037, chunk1038, chunk1039] 1024 128 8192 rfl check064
theorem len064 : GibbsCertificateData.Part064.rows.length = 128 := sound064.1

/-- Kernel check of part 65 (rows 8320…8447). -/
theorem check065 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part065.rows [chunk1040, chunk1041, chunk1042, chunk1043, chunk1044, chunk1045, chunk1046, chunk1047, chunk1048, chunk1049, chunk1050, chunk1051, chunk1052, chunk1053, chunk1054, chunk1055] 1040 128 = true := by decide +kernel
theorem sound065 : GibbsCertificateData.Part065.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part065.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (8320 + j) 3)) (Nat.land (8320 + j) 7) GibbsCertificateData.Part065.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part065.rows [chunk1040, chunk1041, chunk1042, chunk1043, chunk1044, chunk1045, chunk1046, chunk1047, chunk1048, chunk1049, chunk1050, chunk1051, chunk1052, chunk1053, chunk1054, chunk1055] 1040 128 8320 rfl check065
theorem len065 : GibbsCertificateData.Part065.rows.length = 128 := sound065.1

/-- Kernel check of part 66 (rows 8448…8575). -/
theorem check066 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part066.rows [chunk1056, chunk1057, chunk1058, chunk1059, chunk1060, chunk1061, chunk1062, chunk1063, chunk1064, chunk1065, chunk1066, chunk1067, chunk1068, chunk1069, chunk1070, chunk1071] 1056 128 = true := by decide +kernel
theorem sound066 : GibbsCertificateData.Part066.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part066.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (8448 + j) 3)) (Nat.land (8448 + j) 7) GibbsCertificateData.Part066.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part066.rows [chunk1056, chunk1057, chunk1058, chunk1059, chunk1060, chunk1061, chunk1062, chunk1063, chunk1064, chunk1065, chunk1066, chunk1067, chunk1068, chunk1069, chunk1070, chunk1071] 1056 128 8448 rfl check066
theorem len066 : GibbsCertificateData.Part066.rows.length = 128 := sound066.1

/-- Kernel check of part 67 (rows 8576…8703). -/
theorem check067 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part067.rows [chunk1072, chunk1073, chunk1074, chunk1075, chunk1076, chunk1077, chunk1078, chunk1079, chunk1080, chunk1081, chunk1082, chunk1083, chunk1084, chunk1085, chunk1086, chunk1087] 1072 128 = true := by decide +kernel
theorem sound067 : GibbsCertificateData.Part067.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part067.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (8576 + j) 3)) (Nat.land (8576 + j) 7) GibbsCertificateData.Part067.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part067.rows [chunk1072, chunk1073, chunk1074, chunk1075, chunk1076, chunk1077, chunk1078, chunk1079, chunk1080, chunk1081, chunk1082, chunk1083, chunk1084, chunk1085, chunk1086, chunk1087] 1072 128 8576 rfl check067
theorem len067 : GibbsCertificateData.Part067.rows.length = 128 := sound067.1

/-- Kernel check of part 68 (rows 8704…8831). -/
theorem check068 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part068.rows [chunk1088, chunk1089, chunk1090, chunk1091, chunk1092, chunk1093, chunk1094, chunk1095, chunk1096, chunk1097, chunk1098, chunk1099, chunk1100, chunk1101, chunk1102, chunk1103] 1088 128 = true := by decide +kernel
theorem sound068 : GibbsCertificateData.Part068.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part068.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (8704 + j) 3)) (Nat.land (8704 + j) 7) GibbsCertificateData.Part068.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part068.rows [chunk1088, chunk1089, chunk1090, chunk1091, chunk1092, chunk1093, chunk1094, chunk1095, chunk1096, chunk1097, chunk1098, chunk1099, chunk1100, chunk1101, chunk1102, chunk1103] 1088 128 8704 rfl check068
theorem len068 : GibbsCertificateData.Part068.rows.length = 128 := sound068.1

/-- Kernel check of part 69 (rows 8832…8959). -/
theorem check069 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part069.rows [chunk1104, chunk1105, chunk1106, chunk1107, chunk1108, chunk1109, chunk1110, chunk1111, chunk1112, chunk1113, chunk1114, chunk1115, chunk1116, chunk1117, chunk1118, chunk1119] 1104 128 = true := by decide +kernel
theorem sound069 : GibbsCertificateData.Part069.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part069.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (8832 + j) 3)) (Nat.land (8832 + j) 7) GibbsCertificateData.Part069.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part069.rows [chunk1104, chunk1105, chunk1106, chunk1107, chunk1108, chunk1109, chunk1110, chunk1111, chunk1112, chunk1113, chunk1114, chunk1115, chunk1116, chunk1117, chunk1118, chunk1119] 1104 128 8832 rfl check069
theorem len069 : GibbsCertificateData.Part069.rows.length = 128 := sound069.1


end FKLBridge.Gibbs
