module

public import FKLBridge.Gibbs.Tree

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 80 (rows 10240…10367). -/
theorem check080 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part080.rows [chunk1280, chunk1281, chunk1282, chunk1283, chunk1284, chunk1285, chunk1286, chunk1287, chunk1288, chunk1289, chunk1290, chunk1291, chunk1292, chunk1293, chunk1294, chunk1295] 1280 128 = true := by decide +kernel
theorem sound080 : GibbsCertificateData.Part080.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part080.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (10240 + j) 3)) (Nat.land (10240 + j) 7) GibbsCertificateData.Part080.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part080.rows [chunk1280, chunk1281, chunk1282, chunk1283, chunk1284, chunk1285, chunk1286, chunk1287, chunk1288, chunk1289, chunk1290, chunk1291, chunk1292, chunk1293, chunk1294, chunk1295] 1280 128 10240 rfl check080
theorem len080 : GibbsCertificateData.Part080.rows.length = 128 := sound080.1

/-- Kernel check of part 81 (rows 10368…10495). -/
theorem check081 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part081.rows [chunk1296, chunk1297, chunk1298, chunk1299, chunk1300, chunk1301, chunk1302, chunk1303, chunk1304, chunk1305, chunk1306, chunk1307, chunk1308, chunk1309, chunk1310, chunk1311] 1296 128 = true := by decide +kernel
theorem sound081 : GibbsCertificateData.Part081.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part081.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (10368 + j) 3)) (Nat.land (10368 + j) 7) GibbsCertificateData.Part081.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part081.rows [chunk1296, chunk1297, chunk1298, chunk1299, chunk1300, chunk1301, chunk1302, chunk1303, chunk1304, chunk1305, chunk1306, chunk1307, chunk1308, chunk1309, chunk1310, chunk1311] 1296 128 10368 rfl check081
theorem len081 : GibbsCertificateData.Part081.rows.length = 128 := sound081.1

/-- Kernel check of part 82 (rows 10496…10623). -/
theorem check082 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part082.rows [chunk1312, chunk1313, chunk1314, chunk1315, chunk1316, chunk1317, chunk1318, chunk1319, chunk1320, chunk1321, chunk1322, chunk1323, chunk1324, chunk1325, chunk1326, chunk1327] 1312 128 = true := by decide +kernel
theorem sound082 : GibbsCertificateData.Part082.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part082.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (10496 + j) 3)) (Nat.land (10496 + j) 7) GibbsCertificateData.Part082.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part082.rows [chunk1312, chunk1313, chunk1314, chunk1315, chunk1316, chunk1317, chunk1318, chunk1319, chunk1320, chunk1321, chunk1322, chunk1323, chunk1324, chunk1325, chunk1326, chunk1327] 1312 128 10496 rfl check082
theorem len082 : GibbsCertificateData.Part082.rows.length = 128 := sound082.1

/-- Kernel check of part 83 (rows 10624…10751). -/
theorem check083 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part083.rows [chunk1328, chunk1329, chunk1330, chunk1331, chunk1332, chunk1333, chunk1334, chunk1335, chunk1336, chunk1337, chunk1338, chunk1339, chunk1340, chunk1341, chunk1342, chunk1343] 1328 128 = true := by decide +kernel
theorem sound083 : GibbsCertificateData.Part083.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part083.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (10624 + j) 3)) (Nat.land (10624 + j) 7) GibbsCertificateData.Part083.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part083.rows [chunk1328, chunk1329, chunk1330, chunk1331, chunk1332, chunk1333, chunk1334, chunk1335, chunk1336, chunk1337, chunk1338, chunk1339, chunk1340, chunk1341, chunk1342, chunk1343] 1328 128 10624 rfl check083
theorem len083 : GibbsCertificateData.Part083.rows.length = 128 := sound083.1

/-- Kernel check of part 84 (rows 10752…10879). -/
theorem check084 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part084.rows [chunk1344, chunk1345, chunk1346, chunk1347, chunk1348, chunk1349, chunk1350, chunk1351, chunk1352, chunk1353, chunk1354, chunk1355, chunk1356, chunk1357, chunk1358, chunk1359] 1344 128 = true := by decide +kernel
theorem sound084 : GibbsCertificateData.Part084.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part084.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (10752 + j) 3)) (Nat.land (10752 + j) 7) GibbsCertificateData.Part084.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part084.rows [chunk1344, chunk1345, chunk1346, chunk1347, chunk1348, chunk1349, chunk1350, chunk1351, chunk1352, chunk1353, chunk1354, chunk1355, chunk1356, chunk1357, chunk1358, chunk1359] 1344 128 10752 rfl check084
theorem len084 : GibbsCertificateData.Part084.rows.length = 128 := sound084.1

/-- Kernel check of part 85 (rows 10880…11007). -/
theorem check085 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part085.rows [chunk1360, chunk1361, chunk1362, chunk1363, chunk1364, chunk1365, chunk1366, chunk1367, chunk1368, chunk1369, chunk1370, chunk1371, chunk1372, chunk1373, chunk1374, chunk1375] 1360 128 = true := by decide +kernel
theorem sound085 : GibbsCertificateData.Part085.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part085.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (10880 + j) 3)) (Nat.land (10880 + j) 7) GibbsCertificateData.Part085.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part085.rows [chunk1360, chunk1361, chunk1362, chunk1363, chunk1364, chunk1365, chunk1366, chunk1367, chunk1368, chunk1369, chunk1370, chunk1371, chunk1372, chunk1373, chunk1374, chunk1375] 1360 128 10880 rfl check085
theorem len085 : GibbsCertificateData.Part085.rows.length = 128 := sound085.1

/-- Kernel check of part 86 (rows 11008…11135). -/
theorem check086 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part086.rows [chunk1376, chunk1377, chunk1378, chunk1379, chunk1380, chunk1381, chunk1382, chunk1383, chunk1384, chunk1385, chunk1386, chunk1387, chunk1388, chunk1389, chunk1390, chunk1391] 1376 128 = true := by decide +kernel
theorem sound086 : GibbsCertificateData.Part086.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part086.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (11008 + j) 3)) (Nat.land (11008 + j) 7) GibbsCertificateData.Part086.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part086.rows [chunk1376, chunk1377, chunk1378, chunk1379, chunk1380, chunk1381, chunk1382, chunk1383, chunk1384, chunk1385, chunk1386, chunk1387, chunk1388, chunk1389, chunk1390, chunk1391] 1376 128 11008 rfl check086
theorem len086 : GibbsCertificateData.Part086.rows.length = 128 := sound086.1

/-- Kernel check of part 87 (rows 11136…11263). -/
theorem check087 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part087.rows [chunk1392, chunk1393, chunk1394, chunk1395, chunk1396, chunk1397, chunk1398, chunk1399, chunk1400, chunk1401, chunk1402, chunk1403, chunk1404, chunk1405, chunk1406, chunk1407] 1392 128 = true := by decide +kernel
theorem sound087 : GibbsCertificateData.Part087.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part087.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (11136 + j) 3)) (Nat.land (11136 + j) 7) GibbsCertificateData.Part087.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part087.rows [chunk1392, chunk1393, chunk1394, chunk1395, chunk1396, chunk1397, chunk1398, chunk1399, chunk1400, chunk1401, chunk1402, chunk1403, chunk1404, chunk1405, chunk1406, chunk1407] 1392 128 11136 rfl check087
theorem len087 : GibbsCertificateData.Part087.rows.length = 128 := sound087.1

/-- Kernel check of part 88 (rows 11264…11391). -/
theorem check088 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part088.rows [chunk1408, chunk1409, chunk1410, chunk1411, chunk1412, chunk1413, chunk1414, chunk1415, chunk1416, chunk1417, chunk1418, chunk1419, chunk1420, chunk1421, chunk1422, chunk1423] 1408 128 = true := by decide +kernel
theorem sound088 : GibbsCertificateData.Part088.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part088.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (11264 + j) 3)) (Nat.land (11264 + j) 7) GibbsCertificateData.Part088.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part088.rows [chunk1408, chunk1409, chunk1410, chunk1411, chunk1412, chunk1413, chunk1414, chunk1415, chunk1416, chunk1417, chunk1418, chunk1419, chunk1420, chunk1421, chunk1422, chunk1423] 1408 128 11264 rfl check088
theorem len088 : GibbsCertificateData.Part088.rows.length = 128 := sound088.1

/-- Kernel check of part 89 (rows 11392…11519). -/
theorem check089 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part089.rows [chunk1424, chunk1425, chunk1426, chunk1427, chunk1428, chunk1429, chunk1430, chunk1431, chunk1432, chunk1433, chunk1434, chunk1435, chunk1436, chunk1437, chunk1438, chunk1439] 1424 128 = true := by decide +kernel
theorem sound089 : GibbsCertificateData.Part089.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part089.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (11392 + j) 3)) (Nat.land (11392 + j) 7) GibbsCertificateData.Part089.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part089.rows [chunk1424, chunk1425, chunk1426, chunk1427, chunk1428, chunk1429, chunk1430, chunk1431, chunk1432, chunk1433, chunk1434, chunk1435, chunk1436, chunk1437, chunk1438, chunk1439] 1424 128 11392 rfl check089
theorem len089 : GibbsCertificateData.Part089.rows.length = 128 := sound089.1


end FKLBridge.Gibbs
