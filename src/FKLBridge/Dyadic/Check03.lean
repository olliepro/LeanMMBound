module

public import FKLBridge.Dyadic.Tree

@[expose] public section

namespace FKLBridge.Dyadic

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 30 (rows 7680…7935). -/
theorem check030 : Rows.partOk tree Rows.dyOk CertificateData.Part030.rows [chunk0960, chunk0961, chunk0962, chunk0963, chunk0964, chunk0965, chunk0966, chunk0967, chunk0968, chunk0969, chunk0970, chunk0971, chunk0972, chunk0973, chunk0974, chunk0975, chunk0976, chunk0977, chunk0978, chunk0979, chunk0980, chunk0981, chunk0982, chunk0983, chunk0984, chunk0985, chunk0986, chunk0987, chunk0988, chunk0989, chunk0990, chunk0991] 960 256 = true := by decide +kernel
theorem sound030 : CertificateData.Part030.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part030.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (7680 + j) 3)) (Nat.land (7680 + j) 7) CertificateData.Part030.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part030.rows [chunk0960, chunk0961, chunk0962, chunk0963, chunk0964, chunk0965, chunk0966, chunk0967, chunk0968, chunk0969, chunk0970, chunk0971, chunk0972, chunk0973, chunk0974, chunk0975, chunk0976, chunk0977, chunk0978, chunk0979, chunk0980, chunk0981, chunk0982, chunk0983, chunk0984, chunk0985, chunk0986, chunk0987, chunk0988, chunk0989, chunk0990, chunk0991] 960 256 7680 rfl check030
theorem len030 : CertificateData.Part030.rows.length = 256 := sound030.1

/-- Kernel check of part 31 (rows 7936…8191). -/
theorem check031 : Rows.partOk tree Rows.dyOk CertificateData.Part031.rows [chunk0992, chunk0993, chunk0994, chunk0995, chunk0996, chunk0997, chunk0998, chunk0999, chunk1000, chunk1001, chunk1002, chunk1003, chunk1004, chunk1005, chunk1006, chunk1007, chunk1008, chunk1009, chunk1010, chunk1011, chunk1012, chunk1013, chunk1014, chunk1015, chunk1016, chunk1017, chunk1018, chunk1019, chunk1020, chunk1021, chunk1022, chunk1023] 992 256 = true := by decide +kernel
theorem sound031 : CertificateData.Part031.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part031.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (7936 + j) 3)) (Nat.land (7936 + j) 7) CertificateData.Part031.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part031.rows [chunk0992, chunk0993, chunk0994, chunk0995, chunk0996, chunk0997, chunk0998, chunk0999, chunk1000, chunk1001, chunk1002, chunk1003, chunk1004, chunk1005, chunk1006, chunk1007, chunk1008, chunk1009, chunk1010, chunk1011, chunk1012, chunk1013, chunk1014, chunk1015, chunk1016, chunk1017, chunk1018, chunk1019, chunk1020, chunk1021, chunk1022, chunk1023] 992 256 7936 rfl check031
theorem len031 : CertificateData.Part031.rows.length = 256 := sound031.1

/-- Kernel check of part 32 (rows 8192…8447). -/
theorem check032 : Rows.partOk tree Rows.dyOk CertificateData.Part032.rows [chunk1024, chunk1025, chunk1026, chunk1027, chunk1028, chunk1029, chunk1030, chunk1031, chunk1032, chunk1033, chunk1034, chunk1035, chunk1036, chunk1037, chunk1038, chunk1039, chunk1040, chunk1041, chunk1042, chunk1043, chunk1044, chunk1045, chunk1046, chunk1047, chunk1048, chunk1049, chunk1050, chunk1051, chunk1052, chunk1053, chunk1054, chunk1055] 1024 256 = true := by decide +kernel
theorem sound032 : CertificateData.Part032.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part032.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (8192 + j) 3)) (Nat.land (8192 + j) 7) CertificateData.Part032.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part032.rows [chunk1024, chunk1025, chunk1026, chunk1027, chunk1028, chunk1029, chunk1030, chunk1031, chunk1032, chunk1033, chunk1034, chunk1035, chunk1036, chunk1037, chunk1038, chunk1039, chunk1040, chunk1041, chunk1042, chunk1043, chunk1044, chunk1045, chunk1046, chunk1047, chunk1048, chunk1049, chunk1050, chunk1051, chunk1052, chunk1053, chunk1054, chunk1055] 1024 256 8192 rfl check032
theorem len032 : CertificateData.Part032.rows.length = 256 := sound032.1

/-- Kernel check of part 33 (rows 8448…8703). -/
theorem check033 : Rows.partOk tree Rows.dyOk CertificateData.Part033.rows [chunk1056, chunk1057, chunk1058, chunk1059, chunk1060, chunk1061, chunk1062, chunk1063, chunk1064, chunk1065, chunk1066, chunk1067, chunk1068, chunk1069, chunk1070, chunk1071, chunk1072, chunk1073, chunk1074, chunk1075, chunk1076, chunk1077, chunk1078, chunk1079, chunk1080, chunk1081, chunk1082, chunk1083, chunk1084, chunk1085, chunk1086, chunk1087] 1056 256 = true := by decide +kernel
theorem sound033 : CertificateData.Part033.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part033.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (8448 + j) 3)) (Nat.land (8448 + j) 7) CertificateData.Part033.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part033.rows [chunk1056, chunk1057, chunk1058, chunk1059, chunk1060, chunk1061, chunk1062, chunk1063, chunk1064, chunk1065, chunk1066, chunk1067, chunk1068, chunk1069, chunk1070, chunk1071, chunk1072, chunk1073, chunk1074, chunk1075, chunk1076, chunk1077, chunk1078, chunk1079, chunk1080, chunk1081, chunk1082, chunk1083, chunk1084, chunk1085, chunk1086, chunk1087] 1056 256 8448 rfl check033
theorem len033 : CertificateData.Part033.rows.length = 256 := sound033.1

/-- Kernel check of part 34 (rows 8704…8959). -/
theorem check034 : Rows.partOk tree Rows.dyOk CertificateData.Part034.rows [chunk1088, chunk1089, chunk1090, chunk1091, chunk1092, chunk1093, chunk1094, chunk1095, chunk1096, chunk1097, chunk1098, chunk1099, chunk1100, chunk1101, chunk1102, chunk1103, chunk1104, chunk1105, chunk1106, chunk1107, chunk1108, chunk1109, chunk1110, chunk1111, chunk1112, chunk1113, chunk1114, chunk1115, chunk1116, chunk1117, chunk1118, chunk1119] 1088 256 = true := by decide +kernel
theorem sound034 : CertificateData.Part034.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part034.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (8704 + j) 3)) (Nat.land (8704 + j) 7) CertificateData.Part034.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part034.rows [chunk1088, chunk1089, chunk1090, chunk1091, chunk1092, chunk1093, chunk1094, chunk1095, chunk1096, chunk1097, chunk1098, chunk1099, chunk1100, chunk1101, chunk1102, chunk1103, chunk1104, chunk1105, chunk1106, chunk1107, chunk1108, chunk1109, chunk1110, chunk1111, chunk1112, chunk1113, chunk1114, chunk1115, chunk1116, chunk1117, chunk1118, chunk1119] 1088 256 8704 rfl check034
theorem len034 : CertificateData.Part034.rows.length = 256 := sound034.1

/-- Kernel check of part 35 (rows 8960…9215). -/
theorem check035 : Rows.partOk tree Rows.dyOk CertificateData.Part035.rows [chunk1120, chunk1121, chunk1122, chunk1123, chunk1124, chunk1125, chunk1126, chunk1127, chunk1128, chunk1129, chunk1130, chunk1131, chunk1132, chunk1133, chunk1134, chunk1135, chunk1136, chunk1137, chunk1138, chunk1139, chunk1140, chunk1141, chunk1142, chunk1143, chunk1144, chunk1145, chunk1146, chunk1147, chunk1148, chunk1149, chunk1150, chunk1151] 1120 256 = true := by decide +kernel
theorem sound035 : CertificateData.Part035.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part035.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (8960 + j) 3)) (Nat.land (8960 + j) 7) CertificateData.Part035.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part035.rows [chunk1120, chunk1121, chunk1122, chunk1123, chunk1124, chunk1125, chunk1126, chunk1127, chunk1128, chunk1129, chunk1130, chunk1131, chunk1132, chunk1133, chunk1134, chunk1135, chunk1136, chunk1137, chunk1138, chunk1139, chunk1140, chunk1141, chunk1142, chunk1143, chunk1144, chunk1145, chunk1146, chunk1147, chunk1148, chunk1149, chunk1150, chunk1151] 1120 256 8960 rfl check035
theorem len035 : CertificateData.Part035.rows.length = 256 := sound035.1

/-- Kernel check of part 36 (rows 9216…9471). -/
theorem check036 : Rows.partOk tree Rows.dyOk CertificateData.Part036.rows [chunk1152, chunk1153, chunk1154, chunk1155, chunk1156, chunk1157, chunk1158, chunk1159, chunk1160, chunk1161, chunk1162, chunk1163, chunk1164, chunk1165, chunk1166, chunk1167, chunk1168, chunk1169, chunk1170, chunk1171, chunk1172, chunk1173, chunk1174, chunk1175, chunk1176, chunk1177, chunk1178, chunk1179, chunk1180, chunk1181, chunk1182, chunk1183] 1152 256 = true := by decide +kernel
theorem sound036 : CertificateData.Part036.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part036.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (9216 + j) 3)) (Nat.land (9216 + j) 7) CertificateData.Part036.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part036.rows [chunk1152, chunk1153, chunk1154, chunk1155, chunk1156, chunk1157, chunk1158, chunk1159, chunk1160, chunk1161, chunk1162, chunk1163, chunk1164, chunk1165, chunk1166, chunk1167, chunk1168, chunk1169, chunk1170, chunk1171, chunk1172, chunk1173, chunk1174, chunk1175, chunk1176, chunk1177, chunk1178, chunk1179, chunk1180, chunk1181, chunk1182, chunk1183] 1152 256 9216 rfl check036
theorem len036 : CertificateData.Part036.rows.length = 256 := sound036.1

/-- Kernel check of part 37 (rows 9472…9727). -/
theorem check037 : Rows.partOk tree Rows.dyOk CertificateData.Part037.rows [chunk1184, chunk1185, chunk1186, chunk1187, chunk1188, chunk1189, chunk1190, chunk1191, chunk1192, chunk1193, chunk1194, chunk1195, chunk1196, chunk1197, chunk1198, chunk1199, chunk1200, chunk1201, chunk1202, chunk1203, chunk1204, chunk1205, chunk1206, chunk1207, chunk1208, chunk1209, chunk1210, chunk1211, chunk1212, chunk1213, chunk1214, chunk1215] 1184 256 = true := by decide +kernel
theorem sound037 : CertificateData.Part037.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part037.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (9472 + j) 3)) (Nat.land (9472 + j) 7) CertificateData.Part037.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part037.rows [chunk1184, chunk1185, chunk1186, chunk1187, chunk1188, chunk1189, chunk1190, chunk1191, chunk1192, chunk1193, chunk1194, chunk1195, chunk1196, chunk1197, chunk1198, chunk1199, chunk1200, chunk1201, chunk1202, chunk1203, chunk1204, chunk1205, chunk1206, chunk1207, chunk1208, chunk1209, chunk1210, chunk1211, chunk1212, chunk1213, chunk1214, chunk1215] 1184 256 9472 rfl check037
theorem len037 : CertificateData.Part037.rows.length = 256 := sound037.1

/-- Kernel check of part 38 (rows 9728…9983). -/
theorem check038 : Rows.partOk tree Rows.dyOk CertificateData.Part038.rows [chunk1216, chunk1217, chunk1218, chunk1219, chunk1220, chunk1221, chunk1222, chunk1223, chunk1224, chunk1225, chunk1226, chunk1227, chunk1228, chunk1229, chunk1230, chunk1231, chunk1232, chunk1233, chunk1234, chunk1235, chunk1236, chunk1237, chunk1238, chunk1239, chunk1240, chunk1241, chunk1242, chunk1243, chunk1244, chunk1245, chunk1246, chunk1247] 1216 256 = true := by decide +kernel
theorem sound038 : CertificateData.Part038.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part038.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (9728 + j) 3)) (Nat.land (9728 + j) 7) CertificateData.Part038.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part038.rows [chunk1216, chunk1217, chunk1218, chunk1219, chunk1220, chunk1221, chunk1222, chunk1223, chunk1224, chunk1225, chunk1226, chunk1227, chunk1228, chunk1229, chunk1230, chunk1231, chunk1232, chunk1233, chunk1234, chunk1235, chunk1236, chunk1237, chunk1238, chunk1239, chunk1240, chunk1241, chunk1242, chunk1243, chunk1244, chunk1245, chunk1246, chunk1247] 1216 256 9728 rfl check038
theorem len038 : CertificateData.Part038.rows.length = 256 := sound038.1

/-- Kernel check of part 39 (rows 9984…10239). -/
theorem check039 : Rows.partOk tree Rows.dyOk CertificateData.Part039.rows [chunk1248, chunk1249, chunk1250, chunk1251, chunk1252, chunk1253, chunk1254, chunk1255, chunk1256, chunk1257, chunk1258, chunk1259, chunk1260, chunk1261, chunk1262, chunk1263, chunk1264, chunk1265, chunk1266, chunk1267, chunk1268, chunk1269, chunk1270, chunk1271, chunk1272, chunk1273, chunk1274, chunk1275, chunk1276, chunk1277, chunk1278, chunk1279] 1248 256 = true := by decide +kernel
theorem sound039 : CertificateData.Part039.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part039.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (9984 + j) 3)) (Nat.land (9984 + j) 7) CertificateData.Part039.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part039.rows [chunk1248, chunk1249, chunk1250, chunk1251, chunk1252, chunk1253, chunk1254, chunk1255, chunk1256, chunk1257, chunk1258, chunk1259, chunk1260, chunk1261, chunk1262, chunk1263, chunk1264, chunk1265, chunk1266, chunk1267, chunk1268, chunk1269, chunk1270, chunk1271, chunk1272, chunk1273, chunk1274, chunk1275, chunk1276, chunk1277, chunk1278, chunk1279] 1248 256 9984 rfl check039
theorem len039 : CertificateData.Part039.rows.length = 256 := sound039.1


end FKLBridge.Dyadic
