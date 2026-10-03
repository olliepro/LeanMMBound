module

public import FKLBridge.Gibbs.Sel

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch120 (j : ℕ) (hc : j < 128) (h : 15360 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨15360 + j, h⟩).val = GibbsCertificateData.Part120.rows[j]'(by rw [len120]; exact hc) := by
  have p : 15360 + j - 12288 < 4096 := Rows.sub_lt_of_part 15360 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (15360 + j) h _ rfl
  have e := sel_gibbsGroup3 (15360 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 15360 j 4096 (by decide))).2 (Rows.not_lt_of_part 15360 j 8192 (by decide))).2 (Rows.not_lt_of_part 15360 j 12288 (by decide))).1 (Rows.lt_of_part 15360 j 128 16384 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 15360 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 1152 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 1280 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 1408 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 1536 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 1664 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 1792 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 1920 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 2048 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 2176 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 2304 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 2432 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 2560 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 2688 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 2816 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 2944 (by decide))).2 (Rows.not_lt_sub_of_part 15360 j 12288 3072 (by decide))).1 (Rows.lt_sub_of_part 15360 j 128 12288 3200 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 15360 j 12288 3072 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link120 : ∀ j < 128, Good (15360 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part120.rows.length := by rw [len120]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨15360 + j, h⟩).property
  rw [dispatch120 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound120.2 j hj')

theorem dispatch121 (j : ℕ) (hc : j < 128) (h : 15488 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨15488 + j, h⟩).val = GibbsCertificateData.Part121.rows[j]'(by rw [len121]; exact hc) := by
  have p : 15488 + j - 12288 < 4096 := Rows.sub_lt_of_part 15488 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (15488 + j) h _ rfl
  have e := sel_gibbsGroup3 (15488 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 15488 j 4096 (by decide))).2 (Rows.not_lt_of_part 15488 j 8192 (by decide))).2 (Rows.not_lt_of_part 15488 j 12288 (by decide))).1 (Rows.lt_of_part 15488 j 128 16384 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 15488 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 1152 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 1280 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 1408 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 1536 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 1664 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 1792 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 1920 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 2048 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 2176 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 2304 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 2432 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 2560 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 2688 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 2816 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 2944 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 3072 (by decide))).2 (Rows.not_lt_sub_of_part 15488 j 12288 3200 (by decide))).1 (Rows.lt_sub_of_part 15488 j 128 12288 3328 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 15488 j 12288 3200 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link121 : ∀ j < 128, Good (15488 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part121.rows.length := by rw [len121]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨15488 + j, h⟩).property
  rw [dispatch121 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound121.2 j hj')

theorem dispatch122 (j : ℕ) (hc : j < 128) (h : 15616 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨15616 + j, h⟩).val = GibbsCertificateData.Part122.rows[j]'(by rw [len122]; exact hc) := by
  have p : 15616 + j - 12288 < 4096 := Rows.sub_lt_of_part 15616 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (15616 + j) h _ rfl
  have e := sel_gibbsGroup3 (15616 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 15616 j 4096 (by decide))).2 (Rows.not_lt_of_part 15616 j 8192 (by decide))).2 (Rows.not_lt_of_part 15616 j 12288 (by decide))).1 (Rows.lt_of_part 15616 j 128 16384 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 15616 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 1152 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 1280 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 1408 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 1536 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 1664 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 1792 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 1920 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 2048 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 2176 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 2304 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 2432 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 2560 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 2688 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 2816 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 2944 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 3072 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 3200 (by decide))).2 (Rows.not_lt_sub_of_part 15616 j 12288 3328 (by decide))).1 (Rows.lt_sub_of_part 15616 j 128 12288 3456 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 15616 j 12288 3328 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link122 : ∀ j < 128, Good (15616 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part122.rows.length := by rw [len122]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨15616 + j, h⟩).property
  rw [dispatch122 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound122.2 j hj')

theorem dispatch123 (j : ℕ) (hc : j < 128) (h : 15744 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨15744 + j, h⟩).val = GibbsCertificateData.Part123.rows[j]'(by rw [len123]; exact hc) := by
  have p : 15744 + j - 12288 < 4096 := Rows.sub_lt_of_part 15744 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (15744 + j) h _ rfl
  have e := sel_gibbsGroup3 (15744 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 15744 j 4096 (by decide))).2 (Rows.not_lt_of_part 15744 j 8192 (by decide))).2 (Rows.not_lt_of_part 15744 j 12288 (by decide))).1 (Rows.lt_of_part 15744 j 128 16384 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 15744 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 1152 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 1280 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 1408 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 1536 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 1664 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 1792 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 1920 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 2048 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 2176 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 2304 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 2432 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 2560 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 2688 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 2816 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 2944 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 3072 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 3200 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 3328 (by decide))).2 (Rows.not_lt_sub_of_part 15744 j 12288 3456 (by decide))).1 (Rows.lt_sub_of_part 15744 j 128 12288 3584 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 15744 j 12288 3456 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link123 : ∀ j < 128, Good (15744 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part123.rows.length := by rw [len123]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨15744 + j, h⟩).property
  rw [dispatch123 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound123.2 j hj')

theorem dispatch124 (j : ℕ) (hc : j < 128) (h : 15872 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨15872 + j, h⟩).val = GibbsCertificateData.Part124.rows[j]'(by rw [len124]; exact hc) := by
  have p : 15872 + j - 12288 < 4096 := Rows.sub_lt_of_part 15872 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (15872 + j) h _ rfl
  have e := sel_gibbsGroup3 (15872 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 15872 j 4096 (by decide))).2 (Rows.not_lt_of_part 15872 j 8192 (by decide))).2 (Rows.not_lt_of_part 15872 j 12288 (by decide))).1 (Rows.lt_of_part 15872 j 128 16384 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 15872 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 1152 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 1280 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 1408 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 1536 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 1664 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 1792 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 1920 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 2048 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 2176 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 2304 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 2432 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 2560 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 2688 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 2816 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 2944 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 3072 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 3200 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 3328 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 3456 (by decide))).2 (Rows.not_lt_sub_of_part 15872 j 12288 3584 (by decide))).1 (Rows.lt_sub_of_part 15872 j 128 12288 3712 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 15872 j 12288 3584 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link124 : ∀ j < 128, Good (15872 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part124.rows.length := by rw [len124]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨15872 + j, h⟩).property
  rw [dispatch124 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound124.2 j hj')

theorem dispatch125 (j : ℕ) (hc : j < 128) (h : 16000 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨16000 + j, h⟩).val = GibbsCertificateData.Part125.rows[j]'(by rw [len125]; exact hc) := by
  have p : 16000 + j - 12288 < 4096 := Rows.sub_lt_of_part 16000 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (16000 + j) h _ rfl
  have e := sel_gibbsGroup3 (16000 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 16000 j 4096 (by decide))).2 (Rows.not_lt_of_part 16000 j 8192 (by decide))).2 (Rows.not_lt_of_part 16000 j 12288 (by decide))).1 (Rows.lt_of_part 16000 j 128 16384 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 16000 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 1152 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 1280 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 1408 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 1536 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 1664 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 1792 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 1920 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 2048 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 2176 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 2304 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 2432 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 2560 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 2688 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 2816 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 2944 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 3072 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 3200 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 3328 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 3456 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 3584 (by decide))).2 (Rows.not_lt_sub_of_part 16000 j 12288 3712 (by decide))).1 (Rows.lt_sub_of_part 16000 j 128 12288 3840 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 16000 j 12288 3712 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link125 : ∀ j < 128, Good (16000 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part125.rows.length := by rw [len125]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨16000 + j, h⟩).property
  rw [dispatch125 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound125.2 j hj')

theorem dispatch126 (j : ℕ) (hc : j < 128) (h : 16128 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨16128 + j, h⟩).val = GibbsCertificateData.Part126.rows[j]'(by rw [len126]; exact hc) := by
  have p : 16128 + j - 12288 < 4096 := Rows.sub_lt_of_part 16128 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (16128 + j) h _ rfl
  have e := sel_gibbsGroup3 (16128 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 16128 j 4096 (by decide))).2 (Rows.not_lt_of_part 16128 j 8192 (by decide))).2 (Rows.not_lt_of_part 16128 j 12288 (by decide))).1 (Rows.lt_of_part 16128 j 128 16384 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 16128 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 1152 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 1280 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 1408 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 1536 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 1664 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 1792 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 1920 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 2048 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 2176 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 2304 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 2432 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 2560 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 2688 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 2816 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 2944 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 3072 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 3200 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 3328 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 3456 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 3584 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 3712 (by decide))).2 (Rows.not_lt_sub_of_part 16128 j 12288 3840 (by decide))).1 (Rows.lt_sub_of_part 16128 j 128 12288 3968 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 16128 j 12288 3840 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link126 : ∀ j < 128, Good (16128 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part126.rows.length := by rw [len126]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨16128 + j, h⟩).property
  rw [dispatch126 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound126.2 j hj')

theorem dispatch127 (j : ℕ) (hc : j < 128) (h : 16256 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨16256 + j, h⟩).val = GibbsCertificateData.Part127.rows[j]'(by rw [len127]; exact hc) := by
  have p : 16256 + j - 12288 < 4096 := Rows.sub_lt_of_part 16256 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (16256 + j) h _ rfl
  have e := sel_gibbsGroup3 (16256 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 16256 j 4096 (by decide))).2 (Rows.not_lt_of_part 16256 j 8192 (by decide))).2 (Rows.not_lt_of_part 16256 j 12288 (by decide))).1 (Rows.lt_of_part 16256 j 128 16384 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 16256 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 1152 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 1280 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 1408 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 1536 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 1664 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 1792 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 1920 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 2048 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 2176 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 2304 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 2432 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 2560 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 2688 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 2816 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 2944 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 3072 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 3200 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 3328 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 3456 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 3584 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 3712 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 3840 (by decide))).2 (Rows.not_lt_sub_of_part 16256 j 12288 3968 (by decide)))
  rw [Rows.sub_sub_part 16256 j 12288 3968 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link127 : ∀ j < 128, Good (16256 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part127.rows.length := by rw [len127]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨16256 + j, h⟩).property
  rw [dispatch127 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound127.2 j hj')

theorem dispatch128 (j : ℕ) (hc : j < 128) (h : 16384 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨16384 + j, h⟩).val = GibbsCertificateData.Part128.rows[j]'(by rw [len128]; exact hc) := by
  have p : 16384 + j - 16384 < 245 := Rows.sub_lt_of_part 16384 j 128 16384 245 hc (by decide) (by decide)
  have e0 := sel_top (16384 + j) h _ rfl
  have e := sel_gibbsGroup4 (16384 + j - 16384) p _ (((((e0.2 (Rows.not_lt_of_part 16384 j 4096 (by decide))).2 (Rows.not_lt_of_part 16384 j 8192 (by decide))).2 (Rows.not_lt_of_part 16384 j 12288 (by decide))).2 (Rows.not_lt_of_part 16384 j 16384 (by decide))) p)
  have e1 := (e.1 (Rows.lt_sub_of_part 16384 j 128 16384 128 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 16384 j 16384 0 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link128 : ∀ j < 128, Good (16384 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part128.rows.length := by rw [len128]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨16384 + j, h⟩).property
  rw [dispatch128 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound128.2 j hj')

theorem dispatch129 (j : ℕ) (hc : j < 117) (h : 16512 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨16512 + j, h⟩).val = GibbsCertificateData.Part129.rows[j]'(by rw [len129]; exact hc) := by
  have p : 16512 + j - 16384 < 245 := Rows.sub_lt_of_part 16512 j 117 16384 245 hc (by decide) (by decide)
  have e0 := sel_top (16512 + j) h _ rfl
  have e := sel_gibbsGroup4 (16512 + j - 16384) p _ (((((e0.2 (Rows.not_lt_of_part 16512 j 4096 (by decide))).2 (Rows.not_lt_of_part 16512 j 8192 (by decide))).2 (Rows.not_lt_of_part 16512 j 12288 (by decide))).2 (Rows.not_lt_of_part 16512 j 16384 (by decide))) p)
  have e1 := (e.2 (Rows.not_lt_sub_of_part 16512 j 16384 128 (by decide)))
  rw [Rows.sub_sub_part 16512 j 16384 128 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link129 : ∀ j < 117, Good (16512 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part129.rows.length := by rw [len129]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨16512 + j, h⟩).property
  rw [dispatch129 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound129.2 j hj')


end FKLBridge.Gibbs
