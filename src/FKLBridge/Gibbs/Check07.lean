module

public import FKLBridge.Gibbs.Tree

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 70 (rows 8960…9087). -/
theorem check070 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part070.rows [chunk1120, chunk1121, chunk1122, chunk1123, chunk1124, chunk1125, chunk1126, chunk1127, chunk1128, chunk1129, chunk1130, chunk1131, chunk1132, chunk1133, chunk1134, chunk1135] 1120 128 = true := by decide +kernel
theorem sound070 : GibbsCertificateData.Part070.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part070.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (8960 + j) 3)) (Nat.land (8960 + j) 7) GibbsCertificateData.Part070.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part070.rows [chunk1120, chunk1121, chunk1122, chunk1123, chunk1124, chunk1125, chunk1126, chunk1127, chunk1128, chunk1129, chunk1130, chunk1131, chunk1132, chunk1133, chunk1134, chunk1135] 1120 128 8960 rfl check070
theorem len070 : GibbsCertificateData.Part070.rows.length = 128 := sound070.1

/-- Kernel check of part 71 (rows 9088…9215). -/
theorem check071 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part071.rows [chunk1136, chunk1137, chunk1138, chunk1139, chunk1140, chunk1141, chunk1142, chunk1143, chunk1144, chunk1145, chunk1146, chunk1147, chunk1148, chunk1149, chunk1150, chunk1151] 1136 128 = true := by decide +kernel
theorem sound071 : GibbsCertificateData.Part071.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part071.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (9088 + j) 3)) (Nat.land (9088 + j) 7) GibbsCertificateData.Part071.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part071.rows [chunk1136, chunk1137, chunk1138, chunk1139, chunk1140, chunk1141, chunk1142, chunk1143, chunk1144, chunk1145, chunk1146, chunk1147, chunk1148, chunk1149, chunk1150, chunk1151] 1136 128 9088 rfl check071
theorem len071 : GibbsCertificateData.Part071.rows.length = 128 := sound071.1

/-- Kernel check of part 72 (rows 9216…9343). -/
theorem check072 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part072.rows [chunk1152, chunk1153, chunk1154, chunk1155, chunk1156, chunk1157, chunk1158, chunk1159, chunk1160, chunk1161, chunk1162, chunk1163, chunk1164, chunk1165, chunk1166, chunk1167] 1152 128 = true := by decide +kernel
theorem sound072 : GibbsCertificateData.Part072.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part072.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (9216 + j) 3)) (Nat.land (9216 + j) 7) GibbsCertificateData.Part072.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part072.rows [chunk1152, chunk1153, chunk1154, chunk1155, chunk1156, chunk1157, chunk1158, chunk1159, chunk1160, chunk1161, chunk1162, chunk1163, chunk1164, chunk1165, chunk1166, chunk1167] 1152 128 9216 rfl check072
theorem len072 : GibbsCertificateData.Part072.rows.length = 128 := sound072.1

/-- Kernel check of part 73 (rows 9344…9471). -/
theorem check073 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part073.rows [chunk1168, chunk1169, chunk1170, chunk1171, chunk1172, chunk1173, chunk1174, chunk1175, chunk1176, chunk1177, chunk1178, chunk1179, chunk1180, chunk1181, chunk1182, chunk1183] 1168 128 = true := by decide +kernel
theorem sound073 : GibbsCertificateData.Part073.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part073.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (9344 + j) 3)) (Nat.land (9344 + j) 7) GibbsCertificateData.Part073.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part073.rows [chunk1168, chunk1169, chunk1170, chunk1171, chunk1172, chunk1173, chunk1174, chunk1175, chunk1176, chunk1177, chunk1178, chunk1179, chunk1180, chunk1181, chunk1182, chunk1183] 1168 128 9344 rfl check073
theorem len073 : GibbsCertificateData.Part073.rows.length = 128 := sound073.1

/-- Kernel check of part 74 (rows 9472…9599). -/
theorem check074 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part074.rows [chunk1184, chunk1185, chunk1186, chunk1187, chunk1188, chunk1189, chunk1190, chunk1191, chunk1192, chunk1193, chunk1194, chunk1195, chunk1196, chunk1197, chunk1198, chunk1199] 1184 128 = true := by decide +kernel
theorem sound074 : GibbsCertificateData.Part074.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part074.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (9472 + j) 3)) (Nat.land (9472 + j) 7) GibbsCertificateData.Part074.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part074.rows [chunk1184, chunk1185, chunk1186, chunk1187, chunk1188, chunk1189, chunk1190, chunk1191, chunk1192, chunk1193, chunk1194, chunk1195, chunk1196, chunk1197, chunk1198, chunk1199] 1184 128 9472 rfl check074
theorem len074 : GibbsCertificateData.Part074.rows.length = 128 := sound074.1

/-- Kernel check of part 75 (rows 9600…9727). -/
theorem check075 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part075.rows [chunk1200, chunk1201, chunk1202, chunk1203, chunk1204, chunk1205, chunk1206, chunk1207, chunk1208, chunk1209, chunk1210, chunk1211, chunk1212, chunk1213, chunk1214, chunk1215] 1200 128 = true := by decide +kernel
theorem sound075 : GibbsCertificateData.Part075.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part075.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (9600 + j) 3)) (Nat.land (9600 + j) 7) GibbsCertificateData.Part075.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part075.rows [chunk1200, chunk1201, chunk1202, chunk1203, chunk1204, chunk1205, chunk1206, chunk1207, chunk1208, chunk1209, chunk1210, chunk1211, chunk1212, chunk1213, chunk1214, chunk1215] 1200 128 9600 rfl check075
theorem len075 : GibbsCertificateData.Part075.rows.length = 128 := sound075.1

/-- Kernel check of part 76 (rows 9728…9855). -/
theorem check076 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part076.rows [chunk1216, chunk1217, chunk1218, chunk1219, chunk1220, chunk1221, chunk1222, chunk1223, chunk1224, chunk1225, chunk1226, chunk1227, chunk1228, chunk1229, chunk1230, chunk1231] 1216 128 = true := by decide +kernel
theorem sound076 : GibbsCertificateData.Part076.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part076.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (9728 + j) 3)) (Nat.land (9728 + j) 7) GibbsCertificateData.Part076.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part076.rows [chunk1216, chunk1217, chunk1218, chunk1219, chunk1220, chunk1221, chunk1222, chunk1223, chunk1224, chunk1225, chunk1226, chunk1227, chunk1228, chunk1229, chunk1230, chunk1231] 1216 128 9728 rfl check076
theorem len076 : GibbsCertificateData.Part076.rows.length = 128 := sound076.1

/-- Kernel check of part 77 (rows 9856…9983). -/
theorem check077 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part077.rows [chunk1232, chunk1233, chunk1234, chunk1235, chunk1236, chunk1237, chunk1238, chunk1239, chunk1240, chunk1241, chunk1242, chunk1243, chunk1244, chunk1245, chunk1246, chunk1247] 1232 128 = true := by decide +kernel
theorem sound077 : GibbsCertificateData.Part077.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part077.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (9856 + j) 3)) (Nat.land (9856 + j) 7) GibbsCertificateData.Part077.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part077.rows [chunk1232, chunk1233, chunk1234, chunk1235, chunk1236, chunk1237, chunk1238, chunk1239, chunk1240, chunk1241, chunk1242, chunk1243, chunk1244, chunk1245, chunk1246, chunk1247] 1232 128 9856 rfl check077
theorem len077 : GibbsCertificateData.Part077.rows.length = 128 := sound077.1

/-- Kernel check of part 78 (rows 9984…10111). -/
theorem check078 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part078.rows [chunk1248, chunk1249, chunk1250, chunk1251, chunk1252, chunk1253, chunk1254, chunk1255, chunk1256, chunk1257, chunk1258, chunk1259, chunk1260, chunk1261, chunk1262, chunk1263] 1248 128 = true := by decide +kernel
theorem sound078 : GibbsCertificateData.Part078.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part078.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (9984 + j) 3)) (Nat.land (9984 + j) 7) GibbsCertificateData.Part078.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part078.rows [chunk1248, chunk1249, chunk1250, chunk1251, chunk1252, chunk1253, chunk1254, chunk1255, chunk1256, chunk1257, chunk1258, chunk1259, chunk1260, chunk1261, chunk1262, chunk1263] 1248 128 9984 rfl check078
theorem len078 : GibbsCertificateData.Part078.rows.length = 128 := sound078.1

/-- Kernel check of part 79 (rows 10112…10239). -/
theorem check079 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part079.rows [chunk1264, chunk1265, chunk1266, chunk1267, chunk1268, chunk1269, chunk1270, chunk1271, chunk1272, chunk1273, chunk1274, chunk1275, chunk1276, chunk1277, chunk1278, chunk1279] 1264 128 = true := by decide +kernel
theorem sound079 : GibbsCertificateData.Part079.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part079.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (10112 + j) 3)) (Nat.land (10112 + j) 7) GibbsCertificateData.Part079.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part079.rows [chunk1264, chunk1265, chunk1266, chunk1267, chunk1268, chunk1269, chunk1270, chunk1271, chunk1272, chunk1273, chunk1274, chunk1275, chunk1276, chunk1277, chunk1278, chunk1279] 1264 128 10112 rfl check079
theorem len079 : GibbsCertificateData.Part079.rows.length = 128 := sound079.1


end FKLBridge.Gibbs
