module

public import FKLBridge.Gibbs.Tree

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 100 (rows 12800…12927). -/
theorem check100 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part100.rows [chunk1600, chunk1601, chunk1602, chunk1603, chunk1604, chunk1605, chunk1606, chunk1607, chunk1608, chunk1609, chunk1610, chunk1611, chunk1612, chunk1613, chunk1614, chunk1615] 1600 128 = true := by decide +kernel
theorem sound100 : GibbsCertificateData.Part100.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part100.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (12800 + j) 3)) (Nat.land (12800 + j) 7) GibbsCertificateData.Part100.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part100.rows [chunk1600, chunk1601, chunk1602, chunk1603, chunk1604, chunk1605, chunk1606, chunk1607, chunk1608, chunk1609, chunk1610, chunk1611, chunk1612, chunk1613, chunk1614, chunk1615] 1600 128 12800 rfl check100
theorem len100 : GibbsCertificateData.Part100.rows.length = 128 := sound100.1

/-- Kernel check of part 101 (rows 12928…13055). -/
theorem check101 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part101.rows [chunk1616, chunk1617, chunk1618, chunk1619, chunk1620, chunk1621, chunk1622, chunk1623, chunk1624, chunk1625, chunk1626, chunk1627, chunk1628, chunk1629, chunk1630, chunk1631] 1616 128 = true := by decide +kernel
theorem sound101 : GibbsCertificateData.Part101.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part101.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (12928 + j) 3)) (Nat.land (12928 + j) 7) GibbsCertificateData.Part101.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part101.rows [chunk1616, chunk1617, chunk1618, chunk1619, chunk1620, chunk1621, chunk1622, chunk1623, chunk1624, chunk1625, chunk1626, chunk1627, chunk1628, chunk1629, chunk1630, chunk1631] 1616 128 12928 rfl check101
theorem len101 : GibbsCertificateData.Part101.rows.length = 128 := sound101.1

/-- Kernel check of part 102 (rows 13056…13183). -/
theorem check102 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part102.rows [chunk1632, chunk1633, chunk1634, chunk1635, chunk1636, chunk1637, chunk1638, chunk1639, chunk1640, chunk1641, chunk1642, chunk1643, chunk1644, chunk1645, chunk1646, chunk1647] 1632 128 = true := by decide +kernel
theorem sound102 : GibbsCertificateData.Part102.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part102.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (13056 + j) 3)) (Nat.land (13056 + j) 7) GibbsCertificateData.Part102.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part102.rows [chunk1632, chunk1633, chunk1634, chunk1635, chunk1636, chunk1637, chunk1638, chunk1639, chunk1640, chunk1641, chunk1642, chunk1643, chunk1644, chunk1645, chunk1646, chunk1647] 1632 128 13056 rfl check102
theorem len102 : GibbsCertificateData.Part102.rows.length = 128 := sound102.1

/-- Kernel check of part 103 (rows 13184…13311). -/
theorem check103 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part103.rows [chunk1648, chunk1649, chunk1650, chunk1651, chunk1652, chunk1653, chunk1654, chunk1655, chunk1656, chunk1657, chunk1658, chunk1659, chunk1660, chunk1661, chunk1662, chunk1663] 1648 128 = true := by decide +kernel
theorem sound103 : GibbsCertificateData.Part103.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part103.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (13184 + j) 3)) (Nat.land (13184 + j) 7) GibbsCertificateData.Part103.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part103.rows [chunk1648, chunk1649, chunk1650, chunk1651, chunk1652, chunk1653, chunk1654, chunk1655, chunk1656, chunk1657, chunk1658, chunk1659, chunk1660, chunk1661, chunk1662, chunk1663] 1648 128 13184 rfl check103
theorem len103 : GibbsCertificateData.Part103.rows.length = 128 := sound103.1

/-- Kernel check of part 104 (rows 13312…13439). -/
theorem check104 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part104.rows [chunk1664, chunk1665, chunk1666, chunk1667, chunk1668, chunk1669, chunk1670, chunk1671, chunk1672, chunk1673, chunk1674, chunk1675, chunk1676, chunk1677, chunk1678, chunk1679] 1664 128 = true := by decide +kernel
theorem sound104 : GibbsCertificateData.Part104.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part104.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (13312 + j) 3)) (Nat.land (13312 + j) 7) GibbsCertificateData.Part104.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part104.rows [chunk1664, chunk1665, chunk1666, chunk1667, chunk1668, chunk1669, chunk1670, chunk1671, chunk1672, chunk1673, chunk1674, chunk1675, chunk1676, chunk1677, chunk1678, chunk1679] 1664 128 13312 rfl check104
theorem len104 : GibbsCertificateData.Part104.rows.length = 128 := sound104.1

/-- Kernel check of part 105 (rows 13440…13567). -/
theorem check105 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part105.rows [chunk1680, chunk1681, chunk1682, chunk1683, chunk1684, chunk1685, chunk1686, chunk1687, chunk1688, chunk1689, chunk1690, chunk1691, chunk1692, chunk1693, chunk1694, chunk1695] 1680 128 = true := by decide +kernel
theorem sound105 : GibbsCertificateData.Part105.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part105.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (13440 + j) 3)) (Nat.land (13440 + j) 7) GibbsCertificateData.Part105.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part105.rows [chunk1680, chunk1681, chunk1682, chunk1683, chunk1684, chunk1685, chunk1686, chunk1687, chunk1688, chunk1689, chunk1690, chunk1691, chunk1692, chunk1693, chunk1694, chunk1695] 1680 128 13440 rfl check105
theorem len105 : GibbsCertificateData.Part105.rows.length = 128 := sound105.1

/-- Kernel check of part 106 (rows 13568…13695). -/
theorem check106 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part106.rows [chunk1696, chunk1697, chunk1698, chunk1699, chunk1700, chunk1701, chunk1702, chunk1703, chunk1704, chunk1705, chunk1706, chunk1707, chunk1708, chunk1709, chunk1710, chunk1711] 1696 128 = true := by decide +kernel
theorem sound106 : GibbsCertificateData.Part106.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part106.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (13568 + j) 3)) (Nat.land (13568 + j) 7) GibbsCertificateData.Part106.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part106.rows [chunk1696, chunk1697, chunk1698, chunk1699, chunk1700, chunk1701, chunk1702, chunk1703, chunk1704, chunk1705, chunk1706, chunk1707, chunk1708, chunk1709, chunk1710, chunk1711] 1696 128 13568 rfl check106
theorem len106 : GibbsCertificateData.Part106.rows.length = 128 := sound106.1

/-- Kernel check of part 107 (rows 13696…13823). -/
theorem check107 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part107.rows [chunk1712, chunk1713, chunk1714, chunk1715, chunk1716, chunk1717, chunk1718, chunk1719, chunk1720, chunk1721, chunk1722, chunk1723, chunk1724, chunk1725, chunk1726, chunk1727] 1712 128 = true := by decide +kernel
theorem sound107 : GibbsCertificateData.Part107.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part107.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (13696 + j) 3)) (Nat.land (13696 + j) 7) GibbsCertificateData.Part107.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part107.rows [chunk1712, chunk1713, chunk1714, chunk1715, chunk1716, chunk1717, chunk1718, chunk1719, chunk1720, chunk1721, chunk1722, chunk1723, chunk1724, chunk1725, chunk1726, chunk1727] 1712 128 13696 rfl check107
theorem len107 : GibbsCertificateData.Part107.rows.length = 128 := sound107.1

/-- Kernel check of part 108 (rows 13824…13951). -/
theorem check108 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part108.rows [chunk1728, chunk1729, chunk1730, chunk1731, chunk1732, chunk1733, chunk1734, chunk1735, chunk1736, chunk1737, chunk1738, chunk1739, chunk1740, chunk1741, chunk1742, chunk1743] 1728 128 = true := by decide +kernel
theorem sound108 : GibbsCertificateData.Part108.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part108.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (13824 + j) 3)) (Nat.land (13824 + j) 7) GibbsCertificateData.Part108.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part108.rows [chunk1728, chunk1729, chunk1730, chunk1731, chunk1732, chunk1733, chunk1734, chunk1735, chunk1736, chunk1737, chunk1738, chunk1739, chunk1740, chunk1741, chunk1742, chunk1743] 1728 128 13824 rfl check108
theorem len108 : GibbsCertificateData.Part108.rows.length = 128 := sound108.1

/-- Kernel check of part 109 (rows 13952…14079). -/
theorem check109 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part109.rows [chunk1744, chunk1745, chunk1746, chunk1747, chunk1748, chunk1749, chunk1750, chunk1751, chunk1752, chunk1753, chunk1754, chunk1755, chunk1756, chunk1757, chunk1758, chunk1759] 1744 128 = true := by decide +kernel
theorem sound109 : GibbsCertificateData.Part109.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part109.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (13952 + j) 3)) (Nat.land (13952 + j) 7) GibbsCertificateData.Part109.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part109.rows [chunk1744, chunk1745, chunk1746, chunk1747, chunk1748, chunk1749, chunk1750, chunk1751, chunk1752, chunk1753, chunk1754, chunk1755, chunk1756, chunk1757, chunk1758, chunk1759] 1744 128 13952 rfl check109
theorem len109 : GibbsCertificateData.Part109.rows.length = 128 := sound109.1


end FKLBridge.Gibbs
