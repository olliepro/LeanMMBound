module

public import FKLBridge.Gibbs.Sel

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch020 (j : ℕ) (hc : j < 128) (h : 2560 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨2560 + j, h⟩).val = GibbsCertificateData.Part020.rows[j]'(by rw [len020]; exact hc) := by
  have p : 2560 + j - 0 < 4096 := Rows.sub_lt_of_part 2560 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (2560 + j) h _ rfl
  have e := sel_gibbsGroup0 (2560 + j - 0) p _ ((e0.1 (Rows.lt_of_part 2560 j 128 4096 hc (by decide))) p)
  have e1 := (((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 2560 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 1920 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 2176 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 2432 (by decide))).2 (Rows.not_lt_sub_of_part 2560 j 0 2560 (by decide))).1 (Rows.lt_sub_of_part 2560 j 128 0 2688 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2560 j 0 2560 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link020 : ∀ j < 128, Good (2560 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part020.rows.length := by rw [len020]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨2560 + j, h⟩).property
  rw [dispatch020 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound020.2 j hj')

theorem dispatch021 (j : ℕ) (hc : j < 128) (h : 2688 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨2688 + j, h⟩).val = GibbsCertificateData.Part021.rows[j]'(by rw [len021]; exact hc) := by
  have p : 2688 + j - 0 < 4096 := Rows.sub_lt_of_part 2688 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (2688 + j) h _ rfl
  have e := sel_gibbsGroup0 (2688 + j - 0) p _ ((e0.1 (Rows.lt_of_part 2688 j 128 4096 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 2688 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 0 1920 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 0 2176 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 0 2432 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 2688 j 0 2688 (by decide))).1 (Rows.lt_sub_of_part 2688 j 128 0 2816 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2688 j 0 2688 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link021 : ∀ j < 128, Good (2688 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part021.rows.length := by rw [len021]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨2688 + j, h⟩).property
  rw [dispatch021 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound021.2 j hj')

theorem dispatch022 (j : ℕ) (hc : j < 128) (h : 2816 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨2816 + j, h⟩).val = GibbsCertificateData.Part022.rows[j]'(by rw [len022]; exact hc) := by
  have p : 2816 + j - 0 < 4096 := Rows.sub_lt_of_part 2816 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (2816 + j) h _ rfl
  have e := sel_gibbsGroup0 (2816 + j - 0) p _ ((e0.1 (Rows.lt_of_part 2816 j 128 4096 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 2816 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 1920 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 2176 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 2432 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 2688 (by decide))).2 (Rows.not_lt_sub_of_part 2816 j 0 2816 (by decide))).1 (Rows.lt_sub_of_part 2816 j 128 0 2944 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2816 j 0 2816 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link022 : ∀ j < 128, Good (2816 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part022.rows.length := by rw [len022]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨2816 + j, h⟩).property
  rw [dispatch022 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound022.2 j hj')

theorem dispatch023 (j : ℕ) (hc : j < 128) (h : 2944 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨2944 + j, h⟩).val = GibbsCertificateData.Part023.rows[j]'(by rw [len023]; exact hc) := by
  have p : 2944 + j - 0 < 4096 := Rows.sub_lt_of_part 2944 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (2944 + j) h _ rfl
  have e := sel_gibbsGroup0 (2944 + j - 0) p _ ((e0.1 (Rows.lt_of_part 2944 j 128 4096 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 2944 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 0 1920 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 0 2176 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 0 2432 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 0 2688 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 2944 j 0 2944 (by decide))).1 (Rows.lt_sub_of_part 2944 j 128 0 3072 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2944 j 0 2944 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link023 : ∀ j < 128, Good (2944 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part023.rows.length := by rw [len023]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨2944 + j, h⟩).property
  rw [dispatch023 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound023.2 j hj')

theorem dispatch024 (j : ℕ) (hc : j < 128) (h : 3072 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨3072 + j, h⟩).val = GibbsCertificateData.Part024.rows[j]'(by rw [len024]; exact hc) := by
  have p : 3072 + j - 0 < 4096 := Rows.sub_lt_of_part 3072 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (3072 + j) h _ rfl
  have e := sel_gibbsGroup0 (3072 + j - 0) p _ ((e0.1 (Rows.lt_of_part 3072 j 128 4096 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3072 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 1920 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 2176 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 2432 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 2688 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 2944 (by decide))).2 (Rows.not_lt_sub_of_part 3072 j 0 3072 (by decide))).1 (Rows.lt_sub_of_part 3072 j 128 0 3200 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3072 j 0 3072 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link024 : ∀ j < 128, Good (3072 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part024.rows.length := by rw [len024]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨3072 + j, h⟩).property
  rw [dispatch024 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound024.2 j hj')

theorem dispatch025 (j : ℕ) (hc : j < 128) (h : 3200 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨3200 + j, h⟩).val = GibbsCertificateData.Part025.rows[j]'(by rw [len025]; exact hc) := by
  have p : 3200 + j - 0 < 4096 := Rows.sub_lt_of_part 3200 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (3200 + j) h _ rfl
  have e := sel_gibbsGroup0 (3200 + j - 0) p _ ((e0.1 (Rows.lt_of_part 3200 j 128 4096 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3200 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 1920 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 2176 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 2432 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 2688 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 2944 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 3200 j 0 3200 (by decide))).1 (Rows.lt_sub_of_part 3200 j 128 0 3328 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3200 j 0 3200 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link025 : ∀ j < 128, Good (3200 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part025.rows.length := by rw [len025]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨3200 + j, h⟩).property
  rw [dispatch025 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound025.2 j hj')

theorem dispatch026 (j : ℕ) (hc : j < 128) (h : 3328 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨3328 + j, h⟩).val = GibbsCertificateData.Part026.rows[j]'(by rw [len026]; exact hc) := by
  have p : 3328 + j - 0 < 4096 := Rows.sub_lt_of_part 3328 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (3328 + j) h _ rfl
  have e := sel_gibbsGroup0 (3328 + j - 0) p _ ((e0.1 (Rows.lt_of_part 3328 j 128 4096 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3328 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 1920 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 2176 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 2432 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 2688 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 2944 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 3200 (by decide))).2 (Rows.not_lt_sub_of_part 3328 j 0 3328 (by decide))).1 (Rows.lt_sub_of_part 3328 j 128 0 3456 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3328 j 0 3328 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link026 : ∀ j < 128, Good (3328 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part026.rows.length := by rw [len026]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨3328 + j, h⟩).property
  rw [dispatch026 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound026.2 j hj')

theorem dispatch027 (j : ℕ) (hc : j < 128) (h : 3456 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨3456 + j, h⟩).val = GibbsCertificateData.Part027.rows[j]'(by rw [len027]; exact hc) := by
  have p : 3456 + j - 0 < 4096 := Rows.sub_lt_of_part 3456 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (3456 + j) h _ rfl
  have e := sel_gibbsGroup0 (3456 + j - 0) p _ ((e0.1 (Rows.lt_of_part 3456 j 128 4096 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3456 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 1920 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 2176 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 2432 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 2688 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 2944 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 3200 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 3456 j 0 3456 (by decide))).1 (Rows.lt_sub_of_part 3456 j 128 0 3584 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3456 j 0 3456 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link027 : ∀ j < 128, Good (3456 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part027.rows.length := by rw [len027]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨3456 + j, h⟩).property
  rw [dispatch027 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound027.2 j hj')

theorem dispatch028 (j : ℕ) (hc : j < 128) (h : 3584 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨3584 + j, h⟩).val = GibbsCertificateData.Part028.rows[j]'(by rw [len028]; exact hc) := by
  have p : 3584 + j - 0 < 4096 := Rows.sub_lt_of_part 3584 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (3584 + j) h _ rfl
  have e := sel_gibbsGroup0 (3584 + j - 0) p _ ((e0.1 (Rows.lt_of_part 3584 j 128 4096 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3584 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 1920 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 2176 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 2432 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 2688 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 2944 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 3200 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 3456 (by decide))).2 (Rows.not_lt_sub_of_part 3584 j 0 3584 (by decide))).1 (Rows.lt_sub_of_part 3584 j 128 0 3712 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3584 j 0 3584 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link028 : ∀ j < 128, Good (3584 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part028.rows.length := by rw [len028]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨3584 + j, h⟩).property
  rw [dispatch028 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound028.2 j hj')

theorem dispatch029 (j : ℕ) (hc : j < 128) (h : 3712 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨3712 + j, h⟩).val = GibbsCertificateData.Part029.rows[j]'(by rw [len029]; exact hc) := by
  have p : 3712 + j - 0 < 4096 := Rows.sub_lt_of_part 3712 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (3712 + j) h _ rfl
  have e := sel_gibbsGroup0 (3712 + j - 0) p _ ((e0.1 (Rows.lt_of_part 3712 j 128 4096 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3712 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 1920 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 2176 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 2432 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 2688 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 2944 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 3200 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 3456 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 3584 (by decide))).2 (Rows.not_lt_sub_of_part 3712 j 0 3712 (by decide))).1 (Rows.lt_sub_of_part 3712 j 128 0 3840 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3712 j 0 3712 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link029 : ∀ j < 128, Good (3712 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part029.rows.length := by rw [len029]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨3712 + j, h⟩).property
  rw [dispatch029 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound029.2 j hj')


end FKLBridge.Gibbs
