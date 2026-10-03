module

public import FKLBridge.Gibbs.Tree

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- Kernel check of part 120 (rows 15360…15487). -/
theorem check120 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part120.rows [chunk1920, chunk1921, chunk1922, chunk1923, chunk1924, chunk1925, chunk1926, chunk1927, chunk1928, chunk1929, chunk1930, chunk1931, chunk1932, chunk1933, chunk1934, chunk1935] 1920 128 = true := by decide +kernel
theorem sound120 : GibbsCertificateData.Part120.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part120.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (15360 + j) 3)) (Nat.land (15360 + j) 7) GibbsCertificateData.Part120.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part120.rows [chunk1920, chunk1921, chunk1922, chunk1923, chunk1924, chunk1925, chunk1926, chunk1927, chunk1928, chunk1929, chunk1930, chunk1931, chunk1932, chunk1933, chunk1934, chunk1935] 1920 128 15360 rfl check120
theorem len120 : GibbsCertificateData.Part120.rows.length = 128 := sound120.1

/-- Kernel check of part 121 (rows 15488…15615). -/
theorem check121 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part121.rows [chunk1936, chunk1937, chunk1938, chunk1939, chunk1940, chunk1941, chunk1942, chunk1943, chunk1944, chunk1945, chunk1946, chunk1947, chunk1948, chunk1949, chunk1950, chunk1951] 1936 128 = true := by decide +kernel
theorem sound121 : GibbsCertificateData.Part121.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part121.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (15488 + j) 3)) (Nat.land (15488 + j) 7) GibbsCertificateData.Part121.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part121.rows [chunk1936, chunk1937, chunk1938, chunk1939, chunk1940, chunk1941, chunk1942, chunk1943, chunk1944, chunk1945, chunk1946, chunk1947, chunk1948, chunk1949, chunk1950, chunk1951] 1936 128 15488 rfl check121
theorem len121 : GibbsCertificateData.Part121.rows.length = 128 := sound121.1

/-- Kernel check of part 122 (rows 15616…15743). -/
theorem check122 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part122.rows [chunk1952, chunk1953, chunk1954, chunk1955, chunk1956, chunk1957, chunk1958, chunk1959, chunk1960, chunk1961, chunk1962, chunk1963, chunk1964, chunk1965, chunk1966, chunk1967] 1952 128 = true := by decide +kernel
theorem sound122 : GibbsCertificateData.Part122.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part122.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (15616 + j) 3)) (Nat.land (15616 + j) 7) GibbsCertificateData.Part122.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part122.rows [chunk1952, chunk1953, chunk1954, chunk1955, chunk1956, chunk1957, chunk1958, chunk1959, chunk1960, chunk1961, chunk1962, chunk1963, chunk1964, chunk1965, chunk1966, chunk1967] 1952 128 15616 rfl check122
theorem len122 : GibbsCertificateData.Part122.rows.length = 128 := sound122.1

/-- Kernel check of part 123 (rows 15744…15871). -/
theorem check123 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part123.rows [chunk1968, chunk1969, chunk1970, chunk1971, chunk1972, chunk1973, chunk1974, chunk1975, chunk1976, chunk1977, chunk1978, chunk1979, chunk1980, chunk1981, chunk1982, chunk1983] 1968 128 = true := by decide +kernel
theorem sound123 : GibbsCertificateData.Part123.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part123.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (15744 + j) 3)) (Nat.land (15744 + j) 7) GibbsCertificateData.Part123.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part123.rows [chunk1968, chunk1969, chunk1970, chunk1971, chunk1972, chunk1973, chunk1974, chunk1975, chunk1976, chunk1977, chunk1978, chunk1979, chunk1980, chunk1981, chunk1982, chunk1983] 1968 128 15744 rfl check123
theorem len123 : GibbsCertificateData.Part123.rows.length = 128 := sound123.1

/-- Kernel check of part 124 (rows 15872…15999). -/
theorem check124 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part124.rows [chunk1984, chunk1985, chunk1986, chunk1987, chunk1988, chunk1989, chunk1990, chunk1991, chunk1992, chunk1993, chunk1994, chunk1995, chunk1996, chunk1997, chunk1998, chunk1999] 1984 128 = true := by decide +kernel
theorem sound124 : GibbsCertificateData.Part124.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part124.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (15872 + j) 3)) (Nat.land (15872 + j) 7) GibbsCertificateData.Part124.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part124.rows [chunk1984, chunk1985, chunk1986, chunk1987, chunk1988, chunk1989, chunk1990, chunk1991, chunk1992, chunk1993, chunk1994, chunk1995, chunk1996, chunk1997, chunk1998, chunk1999] 1984 128 15872 rfl check124
theorem len124 : GibbsCertificateData.Part124.rows.length = 128 := sound124.1

/-- Kernel check of part 125 (rows 16000…16127). -/
theorem check125 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part125.rows [chunk2000, chunk2001, chunk2002, chunk2003, chunk2004, chunk2005, chunk2006, chunk2007, chunk2008, chunk2009, chunk2010, chunk2011, chunk2012, chunk2013, chunk2014, chunk2015] 2000 128 = true := by decide +kernel
theorem sound125 : GibbsCertificateData.Part125.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part125.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (16000 + j) 3)) (Nat.land (16000 + j) 7) GibbsCertificateData.Part125.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part125.rows [chunk2000, chunk2001, chunk2002, chunk2003, chunk2004, chunk2005, chunk2006, chunk2007, chunk2008, chunk2009, chunk2010, chunk2011, chunk2012, chunk2013, chunk2014, chunk2015] 2000 128 16000 rfl check125
theorem len125 : GibbsCertificateData.Part125.rows.length = 128 := sound125.1

/-- Kernel check of part 126 (rows 16128…16255). -/
theorem check126 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part126.rows [chunk2016, chunk2017, chunk2018, chunk2019, chunk2020, chunk2021, chunk2022, chunk2023, chunk2024, chunk2025, chunk2026, chunk2027, chunk2028, chunk2029, chunk2030, chunk2031] 2016 128 = true := by decide +kernel
theorem sound126 : GibbsCertificateData.Part126.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part126.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (16128 + j) 3)) (Nat.land (16128 + j) 7) GibbsCertificateData.Part126.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part126.rows [chunk2016, chunk2017, chunk2018, chunk2019, chunk2020, chunk2021, chunk2022, chunk2023, chunk2024, chunk2025, chunk2026, chunk2027, chunk2028, chunk2029, chunk2030, chunk2031] 2016 128 16128 rfl check126
theorem len126 : GibbsCertificateData.Part126.rows.length = 128 := sound126.1

/-- Kernel check of part 127 (rows 16256…16383). -/
theorem check127 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part127.rows [chunk2032, chunk2033, chunk2034, chunk2035, chunk2036, chunk2037, chunk2038, chunk2039, chunk2040, chunk2041, chunk2042, chunk2043, chunk2044, chunk2045, chunk2046, chunk2047] 2032 128 = true := by decide +kernel
theorem sound127 : GibbsCertificateData.Part127.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part127.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (16256 + j) 3)) (Nat.land (16256 + j) 7) GibbsCertificateData.Part127.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part127.rows [chunk2032, chunk2033, chunk2034, chunk2035, chunk2036, chunk2037, chunk2038, chunk2039, chunk2040, chunk2041, chunk2042, chunk2043, chunk2044, chunk2045, chunk2046, chunk2047] 2032 128 16256 rfl check127
theorem len127 : GibbsCertificateData.Part127.rows.length = 128 := sound127.1

/-- Kernel check of part 128 (rows 16384…16511). -/
theorem check128 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part128.rows [chunk2048, chunk2049, chunk2050, chunk2051, chunk2052, chunk2053, chunk2054, chunk2055, chunk2056, chunk2057, chunk2058, chunk2059, chunk2060, chunk2061, chunk2062, chunk2063] 2048 128 = true := by decide +kernel
theorem sound128 : GibbsCertificateData.Part128.rows.length = 128 ∧ ∀ j (hj : j < GibbsCertificateData.Part128.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (16384 + j) 3)) (Nat.land (16384 + j) 7) GibbsCertificateData.Part128.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part128.rows [chunk2048, chunk2049, chunk2050, chunk2051, chunk2052, chunk2053, chunk2054, chunk2055, chunk2056, chunk2057, chunk2058, chunk2059, chunk2060, chunk2061, chunk2062, chunk2063] 2048 128 16384 rfl check128
theorem len128 : GibbsCertificateData.Part128.rows.length = 128 := sound128.1

/-- Kernel check of part 129 (rows 16512…16628). -/
theorem check129 : Rows.partOk tree Rows.gibbsOk GibbsCertificateData.Part129.rows [chunk2064, chunk2065, chunk2066, chunk2067, chunk2068, chunk2069, chunk2070, chunk2071, chunk2072, chunk2073, chunk2074, chunk2075, chunk2076, chunk2077, chunk2078] 2064 117 = true := by decide +kernel
theorem sound129 : GibbsCertificateData.Part129.rows.length = 117 ∧ ∀ j (hj : j < GibbsCertificateData.Part129.rows.length),
    Rows.gibbsOk (tree.get (Nat.shiftRight (16512 + j) 3)) (Nat.land (16512 + j) 7) GibbsCertificateData.Part129.rows[j] = true :=
  Rows.partOk_sound tree Rows.gibbsOk GibbsCertificateData.Part129.rows [chunk2064, chunk2065, chunk2066, chunk2067, chunk2068, chunk2069, chunk2070, chunk2071, chunk2072, chunk2073, chunk2074, chunk2075, chunk2076, chunk2077, chunk2078] 2064 117 16512 rfl check129
theorem len129 : GibbsCertificateData.Part129.rows.length = 117 := sound129.1


end FKLBridge.Gibbs
