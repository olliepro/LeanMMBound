module

public import FKLBridge.Dyadic.Sel

@[expose] public section

namespace FKLBridge.Dyadic

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch020 (j : ℕ) (hc : j < 256) (h : 5120 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨5120 + j, h⟩).val = CertificateData.Part020.rows[j]'(by rw [len020]; exact hc) := by
  have p : 5120 + j - 0 < 8192 := Rows.sub_lt_of_part 5120 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (5120 + j) h _ rfl
  have e := sel_dyadicGroup0 (5120 + j - 0) p _ ((e0.1 (Rows.lt_of_part 5120 j 256 8192 hc (by decide))) p)
  have e1 := (((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 5120 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 0 3584 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 0 3840 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 0 4096 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 0 4352 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 0 4608 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 0 4864 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 0 5120 (by decide))).1 (Rows.lt_sub_of_part 5120 j 256 0 5376 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 5120 j 0 5120 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link020 : ∀ j < 256, Good (5120 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part020.rows.length := by rw [len020]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨5120 + j, h⟩).property
  rw [dispatch020 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound020.2 j hj')

theorem dispatch021 (j : ℕ) (hc : j < 256) (h : 5376 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨5376 + j, h⟩).val = CertificateData.Part021.rows[j]'(by rw [len021]; exact hc) := by
  have p : 5376 + j - 0 < 8192 := Rows.sub_lt_of_part 5376 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (5376 + j) h _ rfl
  have e := sel_dyadicGroup0 (5376 + j - 0) p _ ((e0.1 (Rows.lt_of_part 5376 j 256 8192 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 5376 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 0 3584 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 0 3840 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 0 4096 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 0 4352 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 0 4608 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 0 4864 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 0 5120 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 0 5376 (by decide))).1 (Rows.lt_sub_of_part 5376 j 256 0 5632 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 5376 j 0 5376 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link021 : ∀ j < 256, Good (5376 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part021.rows.length := by rw [len021]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨5376 + j, h⟩).property
  rw [dispatch021 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound021.2 j hj')

theorem dispatch022 (j : ℕ) (hc : j < 256) (h : 5632 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨5632 + j, h⟩).val = CertificateData.Part022.rows[j]'(by rw [len022]; exact hc) := by
  have p : 5632 + j - 0 < 8192 := Rows.sub_lt_of_part 5632 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (5632 + j) h _ rfl
  have e := sel_dyadicGroup0 (5632 + j - 0) p _ ((e0.1 (Rows.lt_of_part 5632 j 256 8192 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 5632 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 0 3584 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 0 3840 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 0 4096 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 0 4352 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 0 4608 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 0 4864 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 0 5120 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 0 5376 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 0 5632 (by decide))).1 (Rows.lt_sub_of_part 5632 j 256 0 5888 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 5632 j 0 5632 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link022 : ∀ j < 256, Good (5632 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part022.rows.length := by rw [len022]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨5632 + j, h⟩).property
  rw [dispatch022 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound022.2 j hj')

theorem dispatch023 (j : ℕ) (hc : j < 256) (h : 5888 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨5888 + j, h⟩).val = CertificateData.Part023.rows[j]'(by rw [len023]; exact hc) := by
  have p : 5888 + j - 0 < 8192 := Rows.sub_lt_of_part 5888 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (5888 + j) h _ rfl
  have e := sel_dyadicGroup0 (5888 + j - 0) p _ ((e0.1 (Rows.lt_of_part 5888 j 256 8192 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 5888 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 0 3584 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 0 3840 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 0 4096 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 0 4352 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 0 4608 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 0 4864 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 0 5120 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 0 5376 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 0 5632 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 0 5888 (by decide))).1 (Rows.lt_sub_of_part 5888 j 256 0 6144 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 5888 j 0 5888 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link023 : ∀ j < 256, Good (5888 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part023.rows.length := by rw [len023]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨5888 + j, h⟩).property
  rw [dispatch023 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound023.2 j hj')

theorem dispatch024 (j : ℕ) (hc : j < 256) (h : 6144 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨6144 + j, h⟩).val = CertificateData.Part024.rows[j]'(by rw [len024]; exact hc) := by
  have p : 6144 + j - 0 < 8192 := Rows.sub_lt_of_part 6144 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (6144 + j) h _ rfl
  have e := sel_dyadicGroup0 (6144 + j - 0) p _ ((e0.1 (Rows.lt_of_part 6144 j 256 8192 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 6144 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 3584 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 3840 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 4096 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 4352 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 4608 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 4864 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 5120 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 5376 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 5632 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 5888 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 0 6144 (by decide))).1 (Rows.lt_sub_of_part 6144 j 256 0 6400 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 6144 j 0 6144 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link024 : ∀ j < 256, Good (6144 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part024.rows.length := by rw [len024]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨6144 + j, h⟩).property
  rw [dispatch024 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound024.2 j hj')

theorem dispatch025 (j : ℕ) (hc : j < 256) (h : 6400 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨6400 + j, h⟩).val = CertificateData.Part025.rows[j]'(by rw [len025]; exact hc) := by
  have p : 6400 + j - 0 < 8192 := Rows.sub_lt_of_part 6400 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (6400 + j) h _ rfl
  have e := sel_dyadicGroup0 (6400 + j - 0) p _ ((e0.1 (Rows.lt_of_part 6400 j 256 8192 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 6400 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 3584 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 3840 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 4096 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 4352 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 4608 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 4864 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 5120 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 5376 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 5632 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 5888 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 6144 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 0 6400 (by decide))).1 (Rows.lt_sub_of_part 6400 j 256 0 6656 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 6400 j 0 6400 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link025 : ∀ j < 256, Good (6400 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part025.rows.length := by rw [len025]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨6400 + j, h⟩).property
  rw [dispatch025 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound025.2 j hj')

theorem dispatch026 (j : ℕ) (hc : j < 256) (h : 6656 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨6656 + j, h⟩).val = CertificateData.Part026.rows[j]'(by rw [len026]; exact hc) := by
  have p : 6656 + j - 0 < 8192 := Rows.sub_lt_of_part 6656 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (6656 + j) h _ rfl
  have e := sel_dyadicGroup0 (6656 + j - 0) p _ ((e0.1 (Rows.lt_of_part 6656 j 256 8192 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 6656 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 3584 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 3840 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 4096 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 4352 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 4608 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 4864 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 5120 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 5376 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 5632 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 5888 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 6144 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 6400 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 0 6656 (by decide))).1 (Rows.lt_sub_of_part 6656 j 256 0 6912 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 6656 j 0 6656 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link026 : ∀ j < 256, Good (6656 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part026.rows.length := by rw [len026]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨6656 + j, h⟩).property
  rw [dispatch026 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound026.2 j hj')

theorem dispatch027 (j : ℕ) (hc : j < 256) (h : 6912 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨6912 + j, h⟩).val = CertificateData.Part027.rows[j]'(by rw [len027]; exact hc) := by
  have p : 6912 + j - 0 < 8192 := Rows.sub_lt_of_part 6912 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (6912 + j) h _ rfl
  have e := sel_dyadicGroup0 (6912 + j - 0) p _ ((e0.1 (Rows.lt_of_part 6912 j 256 8192 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 6912 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 3584 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 3840 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 4096 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 4352 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 4608 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 4864 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 5120 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 5376 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 5632 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 5888 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 6144 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 6400 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 6656 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 0 6912 (by decide))).1 (Rows.lt_sub_of_part 6912 j 256 0 7168 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 6912 j 0 6912 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link027 : ∀ j < 256, Good (6912 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part027.rows.length := by rw [len027]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨6912 + j, h⟩).property
  rw [dispatch027 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound027.2 j hj')

theorem dispatch028 (j : ℕ) (hc : j < 256) (h : 7168 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨7168 + j, h⟩).val = CertificateData.Part028.rows[j]'(by rw [len028]; exact hc) := by
  have p : 7168 + j - 0 < 8192 := Rows.sub_lt_of_part 7168 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (7168 + j) h _ rfl
  have e := sel_dyadicGroup0 (7168 + j - 0) p _ ((e0.1 (Rows.lt_of_part 7168 j 256 8192 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 7168 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 3584 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 3840 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 4096 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 4352 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 4608 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 4864 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 5120 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 5376 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 5632 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 5888 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 6144 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 6400 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 6656 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 6912 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 0 7168 (by decide))).1 (Rows.lt_sub_of_part 7168 j 256 0 7424 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 7168 j 0 7168 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link028 : ∀ j < 256, Good (7168 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part028.rows.length := by rw [len028]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨7168 + j, h⟩).property
  rw [dispatch028 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound028.2 j hj')

theorem dispatch029 (j : ℕ) (hc : j < 256) (h : 7424 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨7424 + j, h⟩).val = CertificateData.Part029.rows[j]'(by rw [len029]; exact hc) := by
  have p : 7424 + j - 0 < 8192 := Rows.sub_lt_of_part 7424 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (7424 + j) h _ rfl
  have e := sel_dyadicGroup0 (7424 + j - 0) p _ ((e0.1 (Rows.lt_of_part 7424 j 256 8192 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 7424 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 3584 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 3840 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 4096 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 4352 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 4608 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 4864 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 5120 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 5376 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 5632 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 5888 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 6144 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 6400 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 6656 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 6912 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 7168 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 0 7424 (by decide))).1 (Rows.lt_sub_of_part 7424 j 256 0 7680 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 7424 j 0 7424 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link029 : ∀ j < 256, Good (7424 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part029.rows.length := by rw [len029]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨7424 + j, h⟩).property
  rw [dispatch029 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound029.2 j hj')


end FKLBridge.Dyadic
