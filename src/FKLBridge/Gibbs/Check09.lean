module

public import FKLBridge.Gibbs.Tree

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 90 (rows 11520…11647). -/
theorem check090 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part090.rows [chunk1440, chunk1441, chunk1442, chunk1443, chunk1444, chunk1445, chunk1446, chunk1447, chunk1448, chunk1449, chunk1450, chunk1451, chunk1452, chunk1453, chunk1454, chunk1455] 1440 128 = true := by decide +kernel
theorem sound090 : GibbsCertificateData.Part090.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part090.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (11520 + j) 3)) (Nat.land (11520 + j) 7) GibbsCertificateData.Part090.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part090.rows [chunk1440, chunk1441, chunk1442, chunk1443, chunk1444, chunk1445, chunk1446, chunk1447, chunk1448, chunk1449, chunk1450, chunk1451, chunk1452, chunk1453, chunk1454, chunk1455] 1440 128 11520 rfl check090
theorem len090 : GibbsCertificateData.Part090.rows.length = 128 := sound090.1

/-- Kernel check of part 91 (rows 11648…11775). -/
theorem check091 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part091.rows [chunk1456, chunk1457, chunk1458, chunk1459, chunk1460, chunk1461, chunk1462, chunk1463, chunk1464, chunk1465, chunk1466, chunk1467, chunk1468, chunk1469, chunk1470, chunk1471] 1456 128 = true := by decide +kernel
theorem sound091 : GibbsCertificateData.Part091.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part091.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (11648 + j) 3)) (Nat.land (11648 + j) 7) GibbsCertificateData.Part091.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part091.rows [chunk1456, chunk1457, chunk1458, chunk1459, chunk1460, chunk1461, chunk1462, chunk1463, chunk1464, chunk1465, chunk1466, chunk1467, chunk1468, chunk1469, chunk1470, chunk1471] 1456 128 11648 rfl check091
theorem len091 : GibbsCertificateData.Part091.rows.length = 128 := sound091.1

/-- Kernel check of part 92 (rows 11776…11903). -/
theorem check092 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part092.rows [chunk1472, chunk1473, chunk1474, chunk1475, chunk1476, chunk1477, chunk1478, chunk1479, chunk1480, chunk1481, chunk1482, chunk1483, chunk1484, chunk1485, chunk1486, chunk1487] 1472 128 = true := by decide +kernel
theorem sound092 : GibbsCertificateData.Part092.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part092.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (11776 + j) 3)) (Nat.land (11776 + j) 7) GibbsCertificateData.Part092.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part092.rows [chunk1472, chunk1473, chunk1474, chunk1475, chunk1476, chunk1477, chunk1478, chunk1479, chunk1480, chunk1481, chunk1482, chunk1483, chunk1484, chunk1485, chunk1486, chunk1487] 1472 128 11776 rfl check092
theorem len092 : GibbsCertificateData.Part092.rows.length = 128 := sound092.1

/-- Kernel check of part 93 (rows 11904…12031). -/
theorem check093 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part093.rows [chunk1488, chunk1489, chunk1490, chunk1491, chunk1492, chunk1493, chunk1494, chunk1495, chunk1496, chunk1497, chunk1498, chunk1499, chunk1500, chunk1501, chunk1502, chunk1503] 1488 128 = true := by decide +kernel
theorem sound093 : GibbsCertificateData.Part093.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part093.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (11904 + j) 3)) (Nat.land (11904 + j) 7) GibbsCertificateData.Part093.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part093.rows [chunk1488, chunk1489, chunk1490, chunk1491, chunk1492, chunk1493, chunk1494, chunk1495, chunk1496, chunk1497, chunk1498, chunk1499, chunk1500, chunk1501, chunk1502, chunk1503] 1488 128 11904 rfl check093
theorem len093 : GibbsCertificateData.Part093.rows.length = 128 := sound093.1

/-- Kernel check of part 94 (rows 12032…12159). -/
theorem check094 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part094.rows [chunk1504, chunk1505, chunk1506, chunk1507, chunk1508, chunk1509, chunk1510, chunk1511, chunk1512, chunk1513, chunk1514, chunk1515, chunk1516, chunk1517, chunk1518, chunk1519] 1504 128 = true := by decide +kernel
theorem sound094 : GibbsCertificateData.Part094.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part094.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (12032 + j) 3)) (Nat.land (12032 + j) 7) GibbsCertificateData.Part094.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part094.rows [chunk1504, chunk1505, chunk1506, chunk1507, chunk1508, chunk1509, chunk1510, chunk1511, chunk1512, chunk1513, chunk1514, chunk1515, chunk1516, chunk1517, chunk1518, chunk1519] 1504 128 12032 rfl check094
theorem len094 : GibbsCertificateData.Part094.rows.length = 128 := sound094.1

/-- Kernel check of part 95 (rows 12160…12287). -/
theorem check095 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part095.rows [chunk1520, chunk1521, chunk1522, chunk1523, chunk1524, chunk1525, chunk1526, chunk1527, chunk1528, chunk1529, chunk1530, chunk1531, chunk1532, chunk1533, chunk1534, chunk1535] 1520 128 = true := by decide +kernel
theorem sound095 : GibbsCertificateData.Part095.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part095.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (12160 + j) 3)) (Nat.land (12160 + j) 7) GibbsCertificateData.Part095.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part095.rows [chunk1520, chunk1521, chunk1522, chunk1523, chunk1524, chunk1525, chunk1526, chunk1527, chunk1528, chunk1529, chunk1530, chunk1531, chunk1532, chunk1533, chunk1534, chunk1535] 1520 128 12160 rfl check095
theorem len095 : GibbsCertificateData.Part095.rows.length = 128 := sound095.1

/-- Kernel check of part 96 (rows 12288…12415). -/
theorem check096 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part096.rows [chunk1536, chunk1537, chunk1538, chunk1539, chunk1540, chunk1541, chunk1542, chunk1543, chunk1544, chunk1545, chunk1546, chunk1547, chunk1548, chunk1549, chunk1550, chunk1551] 1536 128 = true := by decide +kernel
theorem sound096 : GibbsCertificateData.Part096.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part096.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (12288 + j) 3)) (Nat.land (12288 + j) 7) GibbsCertificateData.Part096.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part096.rows [chunk1536, chunk1537, chunk1538, chunk1539, chunk1540, chunk1541, chunk1542, chunk1543, chunk1544, chunk1545, chunk1546, chunk1547, chunk1548, chunk1549, chunk1550, chunk1551] 1536 128 12288 rfl check096
theorem len096 : GibbsCertificateData.Part096.rows.length = 128 := sound096.1

/-- Kernel check of part 97 (rows 12416…12543). -/
theorem check097 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part097.rows [chunk1552, chunk1553, chunk1554, chunk1555, chunk1556, chunk1557, chunk1558, chunk1559, chunk1560, chunk1561, chunk1562, chunk1563, chunk1564, chunk1565, chunk1566, chunk1567] 1552 128 = true := by decide +kernel
theorem sound097 : GibbsCertificateData.Part097.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part097.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (12416 + j) 3)) (Nat.land (12416 + j) 7) GibbsCertificateData.Part097.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part097.rows [chunk1552, chunk1553, chunk1554, chunk1555, chunk1556, chunk1557, chunk1558, chunk1559, chunk1560, chunk1561, chunk1562, chunk1563, chunk1564, chunk1565, chunk1566, chunk1567] 1552 128 12416 rfl check097
theorem len097 : GibbsCertificateData.Part097.rows.length = 128 := sound097.1

/-- Kernel check of part 98 (rows 12544…12671). -/
theorem check098 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part098.rows [chunk1568, chunk1569, chunk1570, chunk1571, chunk1572, chunk1573, chunk1574, chunk1575, chunk1576, chunk1577, chunk1578, chunk1579, chunk1580, chunk1581, chunk1582, chunk1583] 1568 128 = true := by decide +kernel
theorem sound098 : GibbsCertificateData.Part098.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part098.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (12544 + j) 3)) (Nat.land (12544 + j) 7) GibbsCertificateData.Part098.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part098.rows [chunk1568, chunk1569, chunk1570, chunk1571, chunk1572, chunk1573, chunk1574, chunk1575, chunk1576, chunk1577, chunk1578, chunk1579, chunk1580, chunk1581, chunk1582, chunk1583] 1568 128 12544 rfl check098
theorem len098 : GibbsCertificateData.Part098.rows.length = 128 := sound098.1

/-- Kernel check of part 99 (rows 12672…12799). -/
theorem check099 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part099.rows [chunk1584, chunk1585, chunk1586, chunk1587, chunk1588, chunk1589, chunk1590, chunk1591, chunk1592, chunk1593, chunk1594, chunk1595, chunk1596, chunk1597, chunk1598, chunk1599] 1584 128 = true := by decide +kernel
theorem sound099 : GibbsCertificateData.Part099.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part099.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (12672 + j) 3)) (Nat.land (12672 + j) 7) GibbsCertificateData.Part099.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part099.rows [chunk1584, chunk1585, chunk1586, chunk1587, chunk1588, chunk1589, chunk1590, chunk1591, chunk1592, chunk1593, chunk1594, chunk1595, chunk1596, chunk1597, chunk1598, chunk1599] 1584 128 12672 rfl check099
theorem len099 : GibbsCertificateData.Part099.rows.length = 128 := sound099.1


end FKLBridge.Gibbs
