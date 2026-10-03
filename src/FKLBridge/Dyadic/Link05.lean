module

public import FKLBridge.Dyadic.Sel

@[expose] public section

namespace FKLBridge.Dyadic

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch050 (j : ℕ) (hc : j < 256) (h : 12800 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨12800 + j, h⟩).val = CertificateData.Part050.rows[j]'(by rw [len050]; exact hc) := by
  have p : 12800 + j - 8192 < 7087 := Rows.sub_lt_of_part 12800 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (12800 + j) h _ rfl
  have e := sel_dyadicGroup1 (12800 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 12800 j 8192 (by decide))) p)
  have e1 := (((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 12800 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 12800 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 12800 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 12800 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 12800 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 12800 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 12800 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 12800 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 12800 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 12800 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 12800 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 12800 j 8192 3072 (by decide))).2 (Rows.not_lt_sub_of_part 12800 j 8192 3328 (by decide))).2 (Rows.not_lt_sub_of_part 12800 j 8192 3584 (by decide))).2 (Rows.not_lt_sub_of_part 12800 j 8192 3840 (by decide))).2 (Rows.not_lt_sub_of_part 12800 j 8192 4096 (by decide))).2 (Rows.not_lt_sub_of_part 12800 j 8192 4352 (by decide))).2 (Rows.not_lt_sub_of_part 12800 j 8192 4608 (by decide))).1 (Rows.lt_sub_of_part 12800 j 256 8192 4864 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 12800 j 8192 4608 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link050 : ∀ j < 256, Good (12800 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part050.rows.length := by rw [len050]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨12800 + j, h⟩).property
  rw [dispatch050 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound050.2 j hj')

theorem dispatch051 (j : ℕ) (hc : j < 256) (h : 13056 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨13056 + j, h⟩).val = CertificateData.Part051.rows[j]'(by rw [len051]; exact hc) := by
  have p : 13056 + j - 8192 < 7087 := Rows.sub_lt_of_part 13056 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (13056 + j) h _ rfl
  have e := sel_dyadicGroup1 (13056 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 13056 j 8192 (by decide))) p)
  have e1 := ((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 13056 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 8192 3072 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 8192 3328 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 8192 3584 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 8192 3840 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 8192 4096 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 8192 4352 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 8192 4608 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 8192 4864 (by decide))).1 (Rows.lt_sub_of_part 13056 j 256 8192 5120 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 13056 j 8192 4864 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link051 : ∀ j < 256, Good (13056 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part051.rows.length := by rw [len051]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨13056 + j, h⟩).property
  rw [dispatch051 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound051.2 j hj')

theorem dispatch052 (j : ℕ) (hc : j < 256) (h : 13312 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨13312 + j, h⟩).val = CertificateData.Part052.rows[j]'(by rw [len052]; exact hc) := by
  have p : 13312 + j - 8192 < 7087 := Rows.sub_lt_of_part 13312 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (13312 + j) h _ rfl
  have e := sel_dyadicGroup1 (13312 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 13312 j 8192 (by decide))) p)
  have e1 := (((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 13312 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 8192 3072 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 8192 3328 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 8192 3584 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 8192 3840 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 8192 4096 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 8192 4352 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 8192 4608 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 8192 4864 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 8192 5120 (by decide))).1 (Rows.lt_sub_of_part 13312 j 256 8192 5376 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 13312 j 8192 5120 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link052 : ∀ j < 256, Good (13312 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part052.rows.length := by rw [len052]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨13312 + j, h⟩).property
  rw [dispatch052 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound052.2 j hj')

theorem dispatch053 (j : ℕ) (hc : j < 256) (h : 13568 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨13568 + j, h⟩).val = CertificateData.Part053.rows[j]'(by rw [len053]; exact hc) := by
  have p : 13568 + j - 8192 < 7087 := Rows.sub_lt_of_part 13568 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (13568 + j) h _ rfl
  have e := sel_dyadicGroup1 (13568 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 13568 j 8192 (by decide))) p)
  have e1 := ((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 13568 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 8192 3072 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 8192 3328 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 8192 3584 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 8192 3840 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 8192 4096 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 8192 4352 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 8192 4608 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 8192 4864 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 8192 5120 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 8192 5376 (by decide))).1 (Rows.lt_sub_of_part 13568 j 256 8192 5632 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 13568 j 8192 5376 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link053 : ∀ j < 256, Good (13568 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part053.rows.length := by rw [len053]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨13568 + j, h⟩).property
  rw [dispatch053 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound053.2 j hj')

theorem dispatch054 (j : ℕ) (hc : j < 256) (h : 13824 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨13824 + j, h⟩).val = CertificateData.Part054.rows[j]'(by rw [len054]; exact hc) := by
  have p : 13824 + j - 8192 < 7087 := Rows.sub_lt_of_part 13824 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (13824 + j) h _ rfl
  have e := sel_dyadicGroup1 (13824 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 13824 j 8192 (by decide))) p)
  have e1 := (((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 13824 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 8192 3072 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 8192 3328 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 8192 3584 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 8192 3840 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 8192 4096 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 8192 4352 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 8192 4608 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 8192 4864 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 8192 5120 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 8192 5376 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 8192 5632 (by decide))).1 (Rows.lt_sub_of_part 13824 j 256 8192 5888 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 13824 j 8192 5632 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link054 : ∀ j < 256, Good (13824 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part054.rows.length := by rw [len054]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨13824 + j, h⟩).property
  rw [dispatch054 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound054.2 j hj')

theorem dispatch055 (j : ℕ) (hc : j < 256) (h : 14080 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨14080 + j, h⟩).val = CertificateData.Part055.rows[j]'(by rw [len055]; exact hc) := by
  have p : 14080 + j - 8192 < 7087 := Rows.sub_lt_of_part 14080 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (14080 + j) h _ rfl
  have e := sel_dyadicGroup1 (14080 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 14080 j 8192 (by decide))) p)
  have e1 := ((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 14080 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 8192 3072 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 8192 3328 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 8192 3584 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 8192 3840 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 8192 4096 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 8192 4352 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 8192 4608 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 8192 4864 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 8192 5120 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 8192 5376 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 8192 5632 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 8192 5888 (by decide))).1 (Rows.lt_sub_of_part 14080 j 256 8192 6144 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 14080 j 8192 5888 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link055 : ∀ j < 256, Good (14080 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part055.rows.length := by rw [len055]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨14080 + j, h⟩).property
  rw [dispatch055 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound055.2 j hj')

theorem dispatch056 (j : ℕ) (hc : j < 256) (h : 14336 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨14336 + j, h⟩).val = CertificateData.Part056.rows[j]'(by rw [len056]; exact hc) := by
  have p : 14336 + j - 8192 < 7087 := Rows.sub_lt_of_part 14336 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (14336 + j) h _ rfl
  have e := sel_dyadicGroup1 (14336 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 14336 j 8192 (by decide))) p)
  have e1 := (((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 14336 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 3072 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 3328 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 3584 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 3840 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 4096 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 4352 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 4608 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 4864 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 5120 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 5376 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 5632 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 5888 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 8192 6144 (by decide))).1 (Rows.lt_sub_of_part 14336 j 256 8192 6400 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 14336 j 8192 6144 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link056 : ∀ j < 256, Good (14336 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part056.rows.length := by rw [len056]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨14336 + j, h⟩).property
  rw [dispatch056 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound056.2 j hj')

theorem dispatch057 (j : ℕ) (hc : j < 256) (h : 14592 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨14592 + j, h⟩).val = CertificateData.Part057.rows[j]'(by rw [len057]; exact hc) := by
  have p : 14592 + j - 8192 < 7087 := Rows.sub_lt_of_part 14592 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (14592 + j) h _ rfl
  have e := sel_dyadicGroup1 (14592 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 14592 j 8192 (by decide))) p)
  have e1 := ((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 14592 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 3072 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 3328 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 3584 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 3840 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 4096 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 4352 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 4608 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 4864 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 5120 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 5376 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 5632 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 5888 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 6144 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 8192 6400 (by decide))).1 (Rows.lt_sub_of_part 14592 j 256 8192 6656 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 14592 j 8192 6400 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link057 : ∀ j < 256, Good (14592 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part057.rows.length := by rw [len057]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨14592 + j, h⟩).property
  rw [dispatch057 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound057.2 j hj')

theorem dispatch058 (j : ℕ) (hc : j < 256) (h : 14848 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨14848 + j, h⟩).val = CertificateData.Part058.rows[j]'(by rw [len058]; exact hc) := by
  have p : 14848 + j - 8192 < 7087 := Rows.sub_lt_of_part 14848 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (14848 + j) h _ rfl
  have e := sel_dyadicGroup1 (14848 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 14848 j 8192 (by decide))) p)
  have e1 := (((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 14848 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 3072 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 3328 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 3584 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 3840 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 4096 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 4352 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 4608 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 4864 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 5120 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 5376 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 5632 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 5888 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 6144 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 6400 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 8192 6656 (by decide))).1 (Rows.lt_sub_of_part 14848 j 256 8192 6912 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 14848 j 8192 6656 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link058 : ∀ j < 256, Good (14848 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part058.rows.length := by rw [len058]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨14848 + j, h⟩).property
  rw [dispatch058 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound058.2 j hj')

theorem dispatch059 (j : ℕ) (hc : j < 175) (h : 15104 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨15104 + j, h⟩).val = CertificateData.Part059.rows[j]'(by rw [len059]; exact hc) := by
  have p : 15104 + j - 8192 < 7087 := Rows.sub_lt_of_part 15104 j 175 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (15104 + j) h _ rfl
  have e := sel_dyadicGroup1 (15104 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 15104 j 8192 (by decide))) p)
  have e1 := (((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 15104 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 3072 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 3328 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 3584 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 3840 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 4096 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 4352 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 4608 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 4864 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 5120 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 5376 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 5632 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 5888 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 6144 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 6400 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 6656 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 8192 6912 (by decide)))
  rw [Rows.sub_sub_part 15104 j 8192 6912 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link059 : ∀ j < 175, Good (15104 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part059.rows.length := by rw [len059]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨15104 + j, h⟩).property
  rw [dispatch059 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound059.2 j hj')


end FKLBridge.Dyadic
