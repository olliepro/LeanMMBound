module

public import FKLBridge.Gibbs.Tree

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 110 (rows 14080…14207). -/
theorem check110 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part110.rows [chunk1760, chunk1761, chunk1762, chunk1763, chunk1764, chunk1765, chunk1766, chunk1767, chunk1768, chunk1769, chunk1770, chunk1771, chunk1772, chunk1773, chunk1774, chunk1775] 1760 128 = true := by decide +kernel
theorem sound110 : GibbsCertificateData.Part110.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part110.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (14080 + j) 3)) (Nat.land (14080 + j) 7) GibbsCertificateData.Part110.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part110.rows [chunk1760, chunk1761, chunk1762, chunk1763, chunk1764, chunk1765, chunk1766, chunk1767, chunk1768, chunk1769, chunk1770, chunk1771, chunk1772, chunk1773, chunk1774, chunk1775] 1760 128 14080 rfl check110
theorem len110 : GibbsCertificateData.Part110.rows.length = 128 := sound110.1

/-- Kernel check of part 111 (rows 14208…14335). -/
theorem check111 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part111.rows [chunk1776, chunk1777, chunk1778, chunk1779, chunk1780, chunk1781, chunk1782, chunk1783, chunk1784, chunk1785, chunk1786, chunk1787, chunk1788, chunk1789, chunk1790, chunk1791] 1776 128 = true := by decide +kernel
theorem sound111 : GibbsCertificateData.Part111.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part111.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (14208 + j) 3)) (Nat.land (14208 + j) 7) GibbsCertificateData.Part111.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part111.rows [chunk1776, chunk1777, chunk1778, chunk1779, chunk1780, chunk1781, chunk1782, chunk1783, chunk1784, chunk1785, chunk1786, chunk1787, chunk1788, chunk1789, chunk1790, chunk1791] 1776 128 14208 rfl check111
theorem len111 : GibbsCertificateData.Part111.rows.length = 128 := sound111.1

/-- Kernel check of part 112 (rows 14336…14463). -/
theorem check112 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part112.rows [chunk1792, chunk1793, chunk1794, chunk1795, chunk1796, chunk1797, chunk1798, chunk1799, chunk1800, chunk1801, chunk1802, chunk1803, chunk1804, chunk1805, chunk1806, chunk1807] 1792 128 = true := by decide +kernel
theorem sound112 : GibbsCertificateData.Part112.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part112.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (14336 + j) 3)) (Nat.land (14336 + j) 7) GibbsCertificateData.Part112.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part112.rows [chunk1792, chunk1793, chunk1794, chunk1795, chunk1796, chunk1797, chunk1798, chunk1799, chunk1800, chunk1801, chunk1802, chunk1803, chunk1804, chunk1805, chunk1806, chunk1807] 1792 128 14336 rfl check112
theorem len112 : GibbsCertificateData.Part112.rows.length = 128 := sound112.1

/-- Kernel check of part 113 (rows 14464…14591). -/
theorem check113 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part113.rows [chunk1808, chunk1809, chunk1810, chunk1811, chunk1812, chunk1813, chunk1814, chunk1815, chunk1816, chunk1817, chunk1818, chunk1819, chunk1820, chunk1821, chunk1822, chunk1823] 1808 128 = true := by decide +kernel
theorem sound113 : GibbsCertificateData.Part113.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part113.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (14464 + j) 3)) (Nat.land (14464 + j) 7) GibbsCertificateData.Part113.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part113.rows [chunk1808, chunk1809, chunk1810, chunk1811, chunk1812, chunk1813, chunk1814, chunk1815, chunk1816, chunk1817, chunk1818, chunk1819, chunk1820, chunk1821, chunk1822, chunk1823] 1808 128 14464 rfl check113
theorem len113 : GibbsCertificateData.Part113.rows.length = 128 := sound113.1

/-- Kernel check of part 114 (rows 14592…14719). -/
theorem check114 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part114.rows [chunk1824, chunk1825, chunk1826, chunk1827, chunk1828, chunk1829, chunk1830, chunk1831, chunk1832, chunk1833, chunk1834, chunk1835, chunk1836, chunk1837, chunk1838, chunk1839] 1824 128 = true := by decide +kernel
theorem sound114 : GibbsCertificateData.Part114.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part114.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (14592 + j) 3)) (Nat.land (14592 + j) 7) GibbsCertificateData.Part114.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part114.rows [chunk1824, chunk1825, chunk1826, chunk1827, chunk1828, chunk1829, chunk1830, chunk1831, chunk1832, chunk1833, chunk1834, chunk1835, chunk1836, chunk1837, chunk1838, chunk1839] 1824 128 14592 rfl check114
theorem len114 : GibbsCertificateData.Part114.rows.length = 128 := sound114.1

/-- Kernel check of part 115 (rows 14720…14847). -/
theorem check115 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part115.rows [chunk1840, chunk1841, chunk1842, chunk1843, chunk1844, chunk1845, chunk1846, chunk1847, chunk1848, chunk1849, chunk1850, chunk1851, chunk1852, chunk1853, chunk1854, chunk1855] 1840 128 = true := by decide +kernel
theorem sound115 : GibbsCertificateData.Part115.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part115.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (14720 + j) 3)) (Nat.land (14720 + j) 7) GibbsCertificateData.Part115.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part115.rows [chunk1840, chunk1841, chunk1842, chunk1843, chunk1844, chunk1845, chunk1846, chunk1847, chunk1848, chunk1849, chunk1850, chunk1851, chunk1852, chunk1853, chunk1854, chunk1855] 1840 128 14720 rfl check115
theorem len115 : GibbsCertificateData.Part115.rows.length = 128 := sound115.1

/-- Kernel check of part 116 (rows 14848…14975). -/
theorem check116 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part116.rows [chunk1856, chunk1857, chunk1858, chunk1859, chunk1860, chunk1861, chunk1862, chunk1863, chunk1864, chunk1865, chunk1866, chunk1867, chunk1868, chunk1869, chunk1870, chunk1871] 1856 128 = true := by decide +kernel
theorem sound116 : GibbsCertificateData.Part116.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part116.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (14848 + j) 3)) (Nat.land (14848 + j) 7) GibbsCertificateData.Part116.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part116.rows [chunk1856, chunk1857, chunk1858, chunk1859, chunk1860, chunk1861, chunk1862, chunk1863, chunk1864, chunk1865, chunk1866, chunk1867, chunk1868, chunk1869, chunk1870, chunk1871] 1856 128 14848 rfl check116
theorem len116 : GibbsCertificateData.Part116.rows.length = 128 := sound116.1

/-- Kernel check of part 117 (rows 14976…15103). -/
theorem check117 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part117.rows [chunk1872, chunk1873, chunk1874, chunk1875, chunk1876, chunk1877, chunk1878, chunk1879, chunk1880, chunk1881, chunk1882, chunk1883, chunk1884, chunk1885, chunk1886, chunk1887] 1872 128 = true := by decide +kernel
theorem sound117 : GibbsCertificateData.Part117.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part117.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (14976 + j) 3)) (Nat.land (14976 + j) 7) GibbsCertificateData.Part117.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part117.rows [chunk1872, chunk1873, chunk1874, chunk1875, chunk1876, chunk1877, chunk1878, chunk1879, chunk1880, chunk1881, chunk1882, chunk1883, chunk1884, chunk1885, chunk1886, chunk1887] 1872 128 14976 rfl check117
theorem len117 : GibbsCertificateData.Part117.rows.length = 128 := sound117.1

/-- Kernel check of part 118 (rows 15104…15231). -/
theorem check118 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part118.rows [chunk1888, chunk1889, chunk1890, chunk1891, chunk1892, chunk1893, chunk1894, chunk1895, chunk1896, chunk1897, chunk1898, chunk1899, chunk1900, chunk1901, chunk1902, chunk1903] 1888 128 = true := by decide +kernel
theorem sound118 : GibbsCertificateData.Part118.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part118.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (15104 + j) 3)) (Nat.land (15104 + j) 7) GibbsCertificateData.Part118.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part118.rows [chunk1888, chunk1889, chunk1890, chunk1891, chunk1892, chunk1893, chunk1894, chunk1895, chunk1896, chunk1897, chunk1898, chunk1899, chunk1900, chunk1901, chunk1902, chunk1903] 1888 128 15104 rfl check118
theorem len118 : GibbsCertificateData.Part118.rows.length = 128 := sound118.1

/-- Kernel check of part 119 (rows 15232…15359). -/
theorem check119 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part119.rows [chunk1904, chunk1905, chunk1906, chunk1907, chunk1908, chunk1909, chunk1910, chunk1911, chunk1912, chunk1913, chunk1914, chunk1915, chunk1916, chunk1917, chunk1918, chunk1919] 1904 128 = true := by decide +kernel
theorem sound119 : GibbsCertificateData.Part119.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part119.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (15232 + j) 3)) (Nat.land (15232 + j) 7) GibbsCertificateData.Part119.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part119.rows [chunk1904, chunk1905, chunk1906, chunk1907, chunk1908, chunk1909, chunk1910, chunk1911, chunk1912, chunk1913, chunk1914, chunk1915, chunk1916, chunk1917, chunk1918, chunk1919] 1904 128 15232 rfl check119
theorem len119 : GibbsCertificateData.Part119.rows.length = 128 := sound119.1


end FKLBridge.Gibbs
