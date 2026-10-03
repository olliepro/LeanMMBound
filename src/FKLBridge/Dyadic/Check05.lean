module

public import FKLBridge.Dyadic.Tree

@[expose] public section

namespace FKLBridge.Dyadic

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 50 (rows 12800…13055). -/
theorem check050 : Rows.partOk tree Rows.dyOk CertificateData.Part050.rows [chunk1600, chunk1601, chunk1602, chunk1603, chunk1604, chunk1605, chunk1606, chunk1607, chunk1608, chunk1609, chunk1610, chunk1611, chunk1612, chunk1613, chunk1614, chunk1615, chunk1616, chunk1617, chunk1618, chunk1619, chunk1620, chunk1621, chunk1622, chunk1623, chunk1624, chunk1625, chunk1626, chunk1627, chunk1628, chunk1629, chunk1630, chunk1631] 1600 256 = true := by decide +kernel
theorem sound050 : CertificateData.Part050.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part050.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (12800 + j) 3)) (Nat.land (12800 + j) 7) CertificateData.Part050.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part050.rows [chunk1600, chunk1601, chunk1602, chunk1603, chunk1604, chunk1605, chunk1606, chunk1607, chunk1608, chunk1609, chunk1610, chunk1611, chunk1612, chunk1613, chunk1614, chunk1615, chunk1616, chunk1617, chunk1618, chunk1619, chunk1620, chunk1621, chunk1622, chunk1623, chunk1624, chunk1625, chunk1626, chunk1627, chunk1628, chunk1629, chunk1630, chunk1631] 1600 256 12800 rfl check050
theorem len050 : CertificateData.Part050.rows.length = 256 := sound050.1

/-- Kernel check of part 51 (rows 13056…13311). -/
theorem check051 : Rows.partOk tree Rows.dyOk CertificateData.Part051.rows [chunk1632, chunk1633, chunk1634, chunk1635, chunk1636, chunk1637, chunk1638, chunk1639, chunk1640, chunk1641, chunk1642, chunk1643, chunk1644, chunk1645, chunk1646, chunk1647, chunk1648, chunk1649, chunk1650, chunk1651, chunk1652, chunk1653, chunk1654, chunk1655, chunk1656, chunk1657, chunk1658, chunk1659, chunk1660, chunk1661, chunk1662, chunk1663] 1632 256 = true := by decide +kernel
theorem sound051 : CertificateData.Part051.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part051.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (13056 + j) 3)) (Nat.land (13056 + j) 7) CertificateData.Part051.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part051.rows [chunk1632, chunk1633, chunk1634, chunk1635, chunk1636, chunk1637, chunk1638, chunk1639, chunk1640, chunk1641, chunk1642, chunk1643, chunk1644, chunk1645, chunk1646, chunk1647, chunk1648, chunk1649, chunk1650, chunk1651, chunk1652, chunk1653, chunk1654, chunk1655, chunk1656, chunk1657, chunk1658, chunk1659, chunk1660, chunk1661, chunk1662, chunk1663] 1632 256 13056 rfl check051
theorem len051 : CertificateData.Part051.rows.length = 256 := sound051.1

/-- Kernel check of part 52 (rows 13312…13567). -/
theorem check052 : Rows.partOk tree Rows.dyOk CertificateData.Part052.rows [chunk1664, chunk1665, chunk1666, chunk1667, chunk1668, chunk1669, chunk1670, chunk1671, chunk1672, chunk1673, chunk1674, chunk1675, chunk1676, chunk1677, chunk1678, chunk1679, chunk1680, chunk1681, chunk1682, chunk1683, chunk1684, chunk1685, chunk1686, chunk1687, chunk1688, chunk1689, chunk1690, chunk1691, chunk1692, chunk1693, chunk1694, chunk1695] 1664 256 = true := by decide +kernel
theorem sound052 : CertificateData.Part052.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part052.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (13312 + j) 3)) (Nat.land (13312 + j) 7) CertificateData.Part052.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part052.rows [chunk1664, chunk1665, chunk1666, chunk1667, chunk1668, chunk1669, chunk1670, chunk1671, chunk1672, chunk1673, chunk1674, chunk1675, chunk1676, chunk1677, chunk1678, chunk1679, chunk1680, chunk1681, chunk1682, chunk1683, chunk1684, chunk1685, chunk1686, chunk1687, chunk1688, chunk1689, chunk1690, chunk1691, chunk1692, chunk1693, chunk1694, chunk1695] 1664 256 13312 rfl check052
theorem len052 : CertificateData.Part052.rows.length = 256 := sound052.1

/-- Kernel check of part 53 (rows 13568…13823). -/
theorem check053 : Rows.partOk tree Rows.dyOk CertificateData.Part053.rows [chunk1696, chunk1697, chunk1698, chunk1699, chunk1700, chunk1701, chunk1702, chunk1703, chunk1704, chunk1705, chunk1706, chunk1707, chunk1708, chunk1709, chunk1710, chunk1711, chunk1712, chunk1713, chunk1714, chunk1715, chunk1716, chunk1717, chunk1718, chunk1719, chunk1720, chunk1721, chunk1722, chunk1723, chunk1724, chunk1725, chunk1726, chunk1727] 1696 256 = true := by decide +kernel
theorem sound053 : CertificateData.Part053.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part053.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (13568 + j) 3)) (Nat.land (13568 + j) 7) CertificateData.Part053.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part053.rows [chunk1696, chunk1697, chunk1698, chunk1699, chunk1700, chunk1701, chunk1702, chunk1703, chunk1704, chunk1705, chunk1706, chunk1707, chunk1708, chunk1709, chunk1710, chunk1711, chunk1712, chunk1713, chunk1714, chunk1715, chunk1716, chunk1717, chunk1718, chunk1719, chunk1720, chunk1721, chunk1722, chunk1723, chunk1724, chunk1725, chunk1726, chunk1727] 1696 256 13568 rfl check053
theorem len053 : CertificateData.Part053.rows.length = 256 := sound053.1

/-- Kernel check of part 54 (rows 13824…14079). -/
theorem check054 : Rows.partOk tree Rows.dyOk CertificateData.Part054.rows [chunk1728, chunk1729, chunk1730, chunk1731, chunk1732, chunk1733, chunk1734, chunk1735, chunk1736, chunk1737, chunk1738, chunk1739, chunk1740, chunk1741, chunk1742, chunk1743, chunk1744, chunk1745, chunk1746, chunk1747, chunk1748, chunk1749, chunk1750, chunk1751, chunk1752, chunk1753, chunk1754, chunk1755, chunk1756, chunk1757, chunk1758, chunk1759] 1728 256 = true := by decide +kernel
theorem sound054 : CertificateData.Part054.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part054.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (13824 + j) 3)) (Nat.land (13824 + j) 7) CertificateData.Part054.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part054.rows [chunk1728, chunk1729, chunk1730, chunk1731, chunk1732, chunk1733, chunk1734, chunk1735, chunk1736, chunk1737, chunk1738, chunk1739, chunk1740, chunk1741, chunk1742, chunk1743, chunk1744, chunk1745, chunk1746, chunk1747, chunk1748, chunk1749, chunk1750, chunk1751, chunk1752, chunk1753, chunk1754, chunk1755, chunk1756, chunk1757, chunk1758, chunk1759] 1728 256 13824 rfl check054
theorem len054 : CertificateData.Part054.rows.length = 256 := sound054.1

/-- Kernel check of part 55 (rows 14080…14335). -/
theorem check055 : Rows.partOk tree Rows.dyOk CertificateData.Part055.rows [chunk1760, chunk1761, chunk1762, chunk1763, chunk1764, chunk1765, chunk1766, chunk1767, chunk1768, chunk1769, chunk1770, chunk1771, chunk1772, chunk1773, chunk1774, chunk1775, chunk1776, chunk1777, chunk1778, chunk1779, chunk1780, chunk1781, chunk1782, chunk1783, chunk1784, chunk1785, chunk1786, chunk1787, chunk1788, chunk1789, chunk1790, chunk1791] 1760 256 = true := by decide +kernel
theorem sound055 : CertificateData.Part055.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part055.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (14080 + j) 3)) (Nat.land (14080 + j) 7) CertificateData.Part055.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part055.rows [chunk1760, chunk1761, chunk1762, chunk1763, chunk1764, chunk1765, chunk1766, chunk1767, chunk1768, chunk1769, chunk1770, chunk1771, chunk1772, chunk1773, chunk1774, chunk1775, chunk1776, chunk1777, chunk1778, chunk1779, chunk1780, chunk1781, chunk1782, chunk1783, chunk1784, chunk1785, chunk1786, chunk1787, chunk1788, chunk1789, chunk1790, chunk1791] 1760 256 14080 rfl check055
theorem len055 : CertificateData.Part055.rows.length = 256 := sound055.1

/-- Kernel check of part 56 (rows 14336…14591). -/
theorem check056 : Rows.partOk tree Rows.dyOk CertificateData.Part056.rows [chunk1792, chunk1793, chunk1794, chunk1795, chunk1796, chunk1797, chunk1798, chunk1799, chunk1800, chunk1801, chunk1802, chunk1803, chunk1804, chunk1805, chunk1806, chunk1807, chunk1808, chunk1809, chunk1810, chunk1811, chunk1812, chunk1813, chunk1814, chunk1815, chunk1816, chunk1817, chunk1818, chunk1819, chunk1820, chunk1821, chunk1822, chunk1823] 1792 256 = true := by decide +kernel
theorem sound056 : CertificateData.Part056.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part056.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (14336 + j) 3)) (Nat.land (14336 + j) 7) CertificateData.Part056.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part056.rows [chunk1792, chunk1793, chunk1794, chunk1795, chunk1796, chunk1797, chunk1798, chunk1799, chunk1800, chunk1801, chunk1802, chunk1803, chunk1804, chunk1805, chunk1806, chunk1807, chunk1808, chunk1809, chunk1810, chunk1811, chunk1812, chunk1813, chunk1814, chunk1815, chunk1816, chunk1817, chunk1818, chunk1819, chunk1820, chunk1821, chunk1822, chunk1823] 1792 256 14336 rfl check056
theorem len056 : CertificateData.Part056.rows.length = 256 := sound056.1

/-- Kernel check of part 57 (rows 14592…14847). -/
theorem check057 : Rows.partOk tree Rows.dyOk CertificateData.Part057.rows [chunk1824, chunk1825, chunk1826, chunk1827, chunk1828, chunk1829, chunk1830, chunk1831, chunk1832, chunk1833, chunk1834, chunk1835, chunk1836, chunk1837, chunk1838, chunk1839, chunk1840, chunk1841, chunk1842, chunk1843, chunk1844, chunk1845, chunk1846, chunk1847, chunk1848, chunk1849, chunk1850, chunk1851, chunk1852, chunk1853, chunk1854, chunk1855] 1824 256 = true := by decide +kernel
theorem sound057 : CertificateData.Part057.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part057.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (14592 + j) 3)) (Nat.land (14592 + j) 7) CertificateData.Part057.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part057.rows [chunk1824, chunk1825, chunk1826, chunk1827, chunk1828, chunk1829, chunk1830, chunk1831, chunk1832, chunk1833, chunk1834, chunk1835, chunk1836, chunk1837, chunk1838, chunk1839, chunk1840, chunk1841, chunk1842, chunk1843, chunk1844, chunk1845, chunk1846, chunk1847, chunk1848, chunk1849, chunk1850, chunk1851, chunk1852, chunk1853, chunk1854, chunk1855] 1824 256 14592 rfl check057
theorem len057 : CertificateData.Part057.rows.length = 256 := sound057.1

/-- Kernel check of part 58 (rows 14848…15103). -/
theorem check058 : Rows.partOk tree Rows.dyOk CertificateData.Part058.rows [chunk1856, chunk1857, chunk1858, chunk1859, chunk1860, chunk1861, chunk1862, chunk1863, chunk1864, chunk1865, chunk1866, chunk1867, chunk1868, chunk1869, chunk1870, chunk1871, chunk1872, chunk1873, chunk1874, chunk1875, chunk1876, chunk1877, chunk1878, chunk1879, chunk1880, chunk1881, chunk1882, chunk1883, chunk1884, chunk1885, chunk1886, chunk1887] 1856 256 = true := by decide +kernel
theorem sound058 : CertificateData.Part058.rows.length = 256 ∧ ∀ j (hj : j < CertificateData.Part058.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (14848 + j) 3)) (Nat.land (14848 + j) 7) CertificateData.Part058.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part058.rows [chunk1856, chunk1857, chunk1858, chunk1859, chunk1860, chunk1861, chunk1862, chunk1863, chunk1864, chunk1865, chunk1866, chunk1867, chunk1868, chunk1869, chunk1870, chunk1871, chunk1872, chunk1873, chunk1874, chunk1875, chunk1876, chunk1877, chunk1878, chunk1879, chunk1880, chunk1881, chunk1882, chunk1883, chunk1884, chunk1885, chunk1886, chunk1887] 1856 256 14848 rfl check058
theorem len058 : CertificateData.Part058.rows.length = 256 := sound058.1

/-- Kernel check of part 59 (rows 15104…15278). -/
theorem check059 : Rows.partOk tree Rows.dyOk CertificateData.Part059.rows [chunk1888, chunk1889, chunk1890, chunk1891, chunk1892, chunk1893, chunk1894, chunk1895, chunk1896, chunk1897, chunk1898, chunk1899, chunk1900, chunk1901, chunk1902, chunk1903, chunk1904, chunk1905, chunk1906, chunk1907, chunk1908, chunk1909] 1888 175 = true := by decide +kernel
theorem sound059 : CertificateData.Part059.rows.length = 175 ∧ ∀ j (hj : j < CertificateData.Part059.rows.length),
    Rows.dyOk (tree.get (Nat.shiftRight (15104 + j) 3)) (Nat.land (15104 + j) 7) CertificateData.Part059.rows[j] = true :=
  Rows.partOk_sound tree Rows.dyOk CertificateData.Part059.rows [chunk1888, chunk1889, chunk1890, chunk1891, chunk1892, chunk1893, chunk1894, chunk1895, chunk1896, chunk1897, chunk1898, chunk1899, chunk1900, chunk1901, chunk1902, chunk1903, chunk1904, chunk1905, chunk1906, chunk1907, chunk1908, chunk1909] 1888 175 15104 rfl check059
theorem len059 : CertificateData.Part059.rows.length = 175 := sound059.1


end FKLBridge.Dyadic
