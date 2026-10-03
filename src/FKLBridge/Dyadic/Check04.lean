module

public import FKLBridge.Dyadic.Tree

@[expose] public section

namespace FKLBridge.Dyadic

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 40 (rows 10240…10495). -/
theorem check040 : Rows.partOk tree Rows.dyOk CertificateData.Part040.rows [chunk1280, chunk1281, chunk1282, chunk1283, chunk1284, chunk1285, chunk1286, chunk1287, chunk1288, chunk1289, chunk1290, chunk1291, chunk1292, chunk1293, chunk1294, chunk1295, chunk1296, chunk1297, chunk1298, chunk1299, chunk1300, chunk1301, chunk1302, chunk1303, chunk1304, chunk1305, chunk1306, chunk1307, chunk1308, chunk1309, chunk1310, chunk1311] 1280 256 = true := by decide +kernel
theorem sound040 : CertificateData.Part040.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part040.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (10240 + j) 3)) (Nat.land (10240 + j) 7) CertificateData.Part040.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part040.rows [chunk1280, chunk1281, chunk1282, chunk1283, chunk1284, chunk1285, chunk1286, chunk1287, chunk1288, chunk1289, chunk1290, chunk1291, chunk1292, chunk1293, chunk1294, chunk1295, chunk1296, chunk1297, chunk1298, chunk1299, chunk1300, chunk1301, chunk1302, chunk1303, chunk1304, chunk1305, chunk1306, chunk1307, chunk1308, chunk1309, chunk1310, chunk1311] 1280 256 10240 rfl check040
theorem len040 : CertificateData.Part040.rows.length = 256 := sound040.1

/-- Kernel check of part 41 (rows 10496…10751). -/
theorem check041 : Rows.partOk tree Rows.dyOk CertificateData.Part041.rows [chunk1312, chunk1313, chunk1314, chunk1315, chunk1316, chunk1317, chunk1318, chunk1319, chunk1320, chunk1321, chunk1322, chunk1323, chunk1324, chunk1325, chunk1326, chunk1327, chunk1328, chunk1329, chunk1330, chunk1331, chunk1332, chunk1333, chunk1334, chunk1335, chunk1336, chunk1337, chunk1338, chunk1339, chunk1340, chunk1341, chunk1342, chunk1343] 1312 256 = true := by decide +kernel
theorem sound041 : CertificateData.Part041.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part041.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (10496 + j) 3)) (Nat.land (10496 + j) 7) CertificateData.Part041.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part041.rows [chunk1312, chunk1313, chunk1314, chunk1315, chunk1316, chunk1317, chunk1318, chunk1319, chunk1320, chunk1321, chunk1322, chunk1323, chunk1324, chunk1325, chunk1326, chunk1327, chunk1328, chunk1329, chunk1330, chunk1331, chunk1332, chunk1333, chunk1334, chunk1335, chunk1336, chunk1337, chunk1338, chunk1339, chunk1340, chunk1341, chunk1342, chunk1343] 1312 256 10496 rfl check041
theorem len041 : CertificateData.Part041.rows.length = 256 := sound041.1

/-- Kernel check of part 42 (rows 10752…11007). -/
theorem check042 : Rows.partOk tree Rows.dyOk CertificateData.Part042.rows [chunk1344, chunk1345, chunk1346, chunk1347, chunk1348, chunk1349, chunk1350, chunk1351, chunk1352, chunk1353, chunk1354, chunk1355, chunk1356, chunk1357, chunk1358, chunk1359, chunk1360, chunk1361, chunk1362, chunk1363, chunk1364, chunk1365, chunk1366, chunk1367, chunk1368, chunk1369, chunk1370, chunk1371, chunk1372, chunk1373, chunk1374, chunk1375] 1344 256 = true := by decide +kernel
theorem sound042 : CertificateData.Part042.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part042.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (10752 + j) 3)) (Nat.land (10752 + j) 7) CertificateData.Part042.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part042.rows [chunk1344, chunk1345, chunk1346, chunk1347, chunk1348, chunk1349, chunk1350, chunk1351, chunk1352, chunk1353, chunk1354, chunk1355, chunk1356, chunk1357, chunk1358, chunk1359, chunk1360, chunk1361, chunk1362, chunk1363, chunk1364, chunk1365, chunk1366, chunk1367, chunk1368, chunk1369, chunk1370, chunk1371, chunk1372, chunk1373, chunk1374, chunk1375] 1344 256 10752 rfl check042
theorem len042 : CertificateData.Part042.rows.length = 256 := sound042.1

/-- Kernel check of part 43 (rows 11008…11263). -/
theorem check043 : Rows.partOk tree Rows.dyOk CertificateData.Part043.rows [chunk1376, chunk1377, chunk1378, chunk1379, chunk1380, chunk1381, chunk1382, chunk1383, chunk1384, chunk1385, chunk1386, chunk1387, chunk1388, chunk1389, chunk1390, chunk1391, chunk1392, chunk1393, chunk1394, chunk1395, chunk1396, chunk1397, chunk1398, chunk1399, chunk1400, chunk1401, chunk1402, chunk1403, chunk1404, chunk1405, chunk1406, chunk1407] 1376 256 = true := by decide +kernel
theorem sound043 : CertificateData.Part043.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part043.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (11008 + j) 3)) (Nat.land (11008 + j) 7) CertificateData.Part043.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part043.rows [chunk1376, chunk1377, chunk1378, chunk1379, chunk1380, chunk1381, chunk1382, chunk1383, chunk1384, chunk1385, chunk1386, chunk1387, chunk1388, chunk1389, chunk1390, chunk1391, chunk1392, chunk1393, chunk1394, chunk1395, chunk1396, chunk1397, chunk1398, chunk1399, chunk1400, chunk1401, chunk1402, chunk1403, chunk1404, chunk1405, chunk1406, chunk1407] 1376 256 11008 rfl check043
theorem len043 : CertificateData.Part043.rows.length = 256 := sound043.1

/-- Kernel check of part 44 (rows 11264…11519). -/
theorem check044 : Rows.partOk tree Rows.dyOk CertificateData.Part044.rows [chunk1408, chunk1409, chunk1410, chunk1411, chunk1412, chunk1413, chunk1414, chunk1415, chunk1416, chunk1417, chunk1418, chunk1419, chunk1420, chunk1421, chunk1422, chunk1423, chunk1424, chunk1425, chunk1426, chunk1427, chunk1428, chunk1429, chunk1430, chunk1431, chunk1432, chunk1433, chunk1434, chunk1435, chunk1436, chunk1437, chunk1438, chunk1439] 1408 256 = true := by decide +kernel
theorem sound044 : CertificateData.Part044.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part044.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (11264 + j) 3)) (Nat.land (11264 + j) 7) CertificateData.Part044.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part044.rows [chunk1408, chunk1409, chunk1410, chunk1411, chunk1412, chunk1413, chunk1414, chunk1415, chunk1416, chunk1417, chunk1418, chunk1419, chunk1420, chunk1421, chunk1422, chunk1423, chunk1424, chunk1425, chunk1426, chunk1427, chunk1428, chunk1429, chunk1430, chunk1431, chunk1432, chunk1433, chunk1434, chunk1435, chunk1436, chunk1437, chunk1438, chunk1439] 1408 256 11264 rfl check044
theorem len044 : CertificateData.Part044.rows.length = 256 := sound044.1

/-- Kernel check of part 45 (rows 11520…11775). -/
theorem check045 : Rows.partOk tree Rows.dyOk CertificateData.Part045.rows [chunk1440, chunk1441, chunk1442, chunk1443, chunk1444, chunk1445, chunk1446, chunk1447, chunk1448, chunk1449, chunk1450, chunk1451, chunk1452, chunk1453, chunk1454, chunk1455, chunk1456, chunk1457, chunk1458, chunk1459, chunk1460, chunk1461, chunk1462, chunk1463, chunk1464, chunk1465, chunk1466, chunk1467, chunk1468, chunk1469, chunk1470, chunk1471] 1440 256 = true := by decide +kernel
theorem sound045 : CertificateData.Part045.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part045.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (11520 + j) 3)) (Nat.land (11520 + j) 7) CertificateData.Part045.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part045.rows [chunk1440, chunk1441, chunk1442, chunk1443, chunk1444, chunk1445, chunk1446, chunk1447, chunk1448, chunk1449, chunk1450, chunk1451, chunk1452, chunk1453, chunk1454, chunk1455, chunk1456, chunk1457, chunk1458, chunk1459, chunk1460, chunk1461, chunk1462, chunk1463, chunk1464, chunk1465, chunk1466, chunk1467, chunk1468, chunk1469, chunk1470, chunk1471] 1440 256 11520 rfl check045
theorem len045 : CertificateData.Part045.rows.length = 256 := sound045.1

/-- Kernel check of part 46 (rows 11776…12031). -/
theorem check046 : Rows.partOk tree Rows.dyOk CertificateData.Part046.rows [chunk1472, chunk1473, chunk1474, chunk1475, chunk1476, chunk1477, chunk1478, chunk1479, chunk1480, chunk1481, chunk1482, chunk1483, chunk1484, chunk1485, chunk1486, chunk1487, chunk1488, chunk1489, chunk1490, chunk1491, chunk1492, chunk1493, chunk1494, chunk1495, chunk1496, chunk1497, chunk1498, chunk1499, chunk1500, chunk1501, chunk1502, chunk1503] 1472 256 = true := by decide +kernel
theorem sound046 : CertificateData.Part046.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part046.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (11776 + j) 3)) (Nat.land (11776 + j) 7) CertificateData.Part046.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part046.rows [chunk1472, chunk1473, chunk1474, chunk1475, chunk1476, chunk1477, chunk1478, chunk1479, chunk1480, chunk1481, chunk1482, chunk1483, chunk1484, chunk1485, chunk1486, chunk1487, chunk1488, chunk1489, chunk1490, chunk1491, chunk1492, chunk1493, chunk1494, chunk1495, chunk1496, chunk1497, chunk1498, chunk1499, chunk1500, chunk1501, chunk1502, chunk1503] 1472 256 11776 rfl check046
theorem len046 : CertificateData.Part046.rows.length = 256 := sound046.1

/-- Kernel check of part 47 (rows 12032…12287). -/
theorem check047 : Rows.partOk tree Rows.dyOk CertificateData.Part047.rows [chunk1504, chunk1505, chunk1506, chunk1507, chunk1508, chunk1509, chunk1510, chunk1511, chunk1512, chunk1513, chunk1514, chunk1515, chunk1516, chunk1517, chunk1518, chunk1519, chunk1520, chunk1521, chunk1522, chunk1523, chunk1524, chunk1525, chunk1526, chunk1527, chunk1528, chunk1529, chunk1530, chunk1531, chunk1532, chunk1533, chunk1534, chunk1535] 1504 256 = true := by decide +kernel
theorem sound047 : CertificateData.Part047.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part047.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (12032 + j) 3)) (Nat.land (12032 + j) 7) CertificateData.Part047.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part047.rows [chunk1504, chunk1505, chunk1506, chunk1507, chunk1508, chunk1509, chunk1510, chunk1511, chunk1512, chunk1513, chunk1514, chunk1515, chunk1516, chunk1517, chunk1518, chunk1519, chunk1520, chunk1521, chunk1522, chunk1523, chunk1524, chunk1525, chunk1526, chunk1527, chunk1528, chunk1529, chunk1530, chunk1531, chunk1532, chunk1533, chunk1534, chunk1535] 1504 256 12032 rfl check047
theorem len047 : CertificateData.Part047.rows.length = 256 := sound047.1

/-- Kernel check of part 48 (rows 12288…12543). -/
theorem check048 : Rows.partOk tree Rows.dyOk CertificateData.Part048.rows [chunk1536, chunk1537, chunk1538, chunk1539, chunk1540, chunk1541, chunk1542, chunk1543, chunk1544, chunk1545, chunk1546, chunk1547, chunk1548, chunk1549, chunk1550, chunk1551, chunk1552, chunk1553, chunk1554, chunk1555, chunk1556, chunk1557, chunk1558, chunk1559, chunk1560, chunk1561, chunk1562, chunk1563, chunk1564, chunk1565, chunk1566, chunk1567] 1536 256 = true := by decide +kernel
theorem sound048 : CertificateData.Part048.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part048.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (12288 + j) 3)) (Nat.land (12288 + j) 7) CertificateData.Part048.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part048.rows [chunk1536, chunk1537, chunk1538, chunk1539, chunk1540, chunk1541, chunk1542, chunk1543, chunk1544, chunk1545, chunk1546, chunk1547, chunk1548, chunk1549, chunk1550, chunk1551, chunk1552, chunk1553, chunk1554, chunk1555, chunk1556, chunk1557, chunk1558, chunk1559, chunk1560, chunk1561, chunk1562, chunk1563, chunk1564, chunk1565, chunk1566, chunk1567] 1536 256 12288 rfl check048
theorem len048 : CertificateData.Part048.rows.length = 256 := sound048.1

/-- Kernel check of part 49 (rows 12544…12799). -/
theorem check049 : Rows.partOk tree Rows.dyOk CertificateData.Part049.rows [chunk1568, chunk1569, chunk1570, chunk1571, chunk1572, chunk1573, chunk1574, chunk1575, chunk1576, chunk1577, chunk1578, chunk1579, chunk1580, chunk1581, chunk1582, chunk1583, chunk1584, chunk1585, chunk1586, chunk1587, chunk1588, chunk1589, chunk1590, chunk1591, chunk1592, chunk1593, chunk1594, chunk1595, chunk1596, chunk1597, chunk1598, chunk1599] 1568 256 = true := by decide +kernel
theorem sound049 : CertificateData.Part049.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part049.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (12544 + j) 3)) (Nat.land (12544 + j) 7) CertificateData.Part049.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part049.rows [chunk1568, chunk1569, chunk1570, chunk1571, chunk1572, chunk1573, chunk1574, chunk1575, chunk1576, chunk1577, chunk1578, chunk1579, chunk1580, chunk1581, chunk1582, chunk1583, chunk1584, chunk1585, chunk1586, chunk1587, chunk1588, chunk1589, chunk1590, chunk1591, chunk1592, chunk1593, chunk1594, chunk1595, chunk1596, chunk1597, chunk1598, chunk1599] 1568 256 12544 rfl check049
theorem len049 : CertificateData.Part049.rows.length = 256 := sound049.1


end FKLBridge.Dyadic
