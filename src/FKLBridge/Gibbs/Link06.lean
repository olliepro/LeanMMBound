module

public import FKLBridge.Gibbs.Sel

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch060 (j : ℕ) (hc : j < 128) (h : 7680 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨7680 + j, h⟩).val = GibbsCertificateData.Part060.rows[j]'(by rw [len060]; exact hc) := by
  have p : 7680 + j - 4096 < 4096 := Rows.sub_lt_of_part 7680 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (7680 + j) h _ rfl
  have e := sel_gibbsGroup1 (7680 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 7680 j 4096 (by decide))).1 (Rows.lt_of_part 7680 j 128 8192 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 7680 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 1408 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 1536 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 1664 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 1792 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 1920 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 2048 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 2176 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 2304 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 2432 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 2560 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 2688 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 2816 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 2944 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 3072 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 3200 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 3328 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 3456 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 4096 3584 (by decide))).1 (Rows.lt_sub_of_part 7680 j 128 4096 3712 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 7680 j 4096 3584 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link060 : ∀ j < 128, Good (7680 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part060.rows.length := by rw [len060]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨7680 + j, h⟩).property
  rw [dispatch060 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound060.2 j hj')

theorem dispatch061 (j : ℕ) (hc : j < 128) (h : 7808 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨7808 + j, h⟩).val = GibbsCertificateData.Part061.rows[j]'(by rw [len061]; exact hc) := by
  have p : 7808 + j - 4096 < 4096 := Rows.sub_lt_of_part 7808 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (7808 + j) h _ rfl
  have e := sel_gibbsGroup1 (7808 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 7808 j 4096 (by decide))).1 (Rows.lt_of_part 7808 j 128 8192 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 7808 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 1408 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 1536 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 1664 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 1792 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 1920 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 2048 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 2176 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 2304 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 2432 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 2560 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 2688 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 2816 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 2944 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 3072 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 3200 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 3328 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 3456 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 3584 (by decide))).2 (Rows.not_lt_sub_of_part 7808 j 4096 3712 (by decide))).1 (Rows.lt_sub_of_part 7808 j 128 4096 3840 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 7808 j 4096 3712 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link061 : ∀ j < 128, Good (7808 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part061.rows.length := by rw [len061]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨7808 + j, h⟩).property
  rw [dispatch061 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound061.2 j hj')

theorem dispatch062 (j : ℕ) (hc : j < 128) (h : 7936 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨7936 + j, h⟩).val = GibbsCertificateData.Part062.rows[j]'(by rw [len062]; exact hc) := by
  have p : 7936 + j - 4096 < 4096 := Rows.sub_lt_of_part 7936 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (7936 + j) h _ rfl
  have e := sel_gibbsGroup1 (7936 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 7936 j 4096 (by decide))).1 (Rows.lt_of_part 7936 j 128 8192 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 7936 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 1408 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 1536 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 1664 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 1792 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 1920 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 2048 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 2176 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 2304 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 2432 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 2560 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 2688 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 2816 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 2944 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 3072 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 3200 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 3328 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 3456 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 3584 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 3712 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 4096 3840 (by decide))).1 (Rows.lt_sub_of_part 7936 j 128 4096 3968 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 7936 j 4096 3840 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link062 : ∀ j < 128, Good (7936 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part062.rows.length := by rw [len062]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨7936 + j, h⟩).property
  rw [dispatch062 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound062.2 j hj')

theorem dispatch063 (j : ℕ) (hc : j < 128) (h : 8064 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨8064 + j, h⟩).val = GibbsCertificateData.Part063.rows[j]'(by rw [len063]; exact hc) := by
  have p : 8064 + j - 4096 < 4096 := Rows.sub_lt_of_part 8064 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (8064 + j) h _ rfl
  have e := sel_gibbsGroup1 (8064 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 8064 j 4096 (by decide))).1 (Rows.lt_of_part 8064 j 128 8192 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 8064 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 1408 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 1536 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 1664 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 1792 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 1920 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 2048 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 2176 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 2304 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 2432 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 2560 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 2688 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 2816 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 2944 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 3072 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 3200 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 3328 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 3456 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 3584 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 3712 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 3840 (by decide))).2 (Rows.not_lt_sub_of_part 8064 j 4096 3968 (by decide)))
  rw [Rows.sub_sub_part 8064 j 4096 3968 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link063 : ∀ j < 128, Good (8064 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part063.rows.length := by rw [len063]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨8064 + j, h⟩).property
  rw [dispatch063 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound063.2 j hj')

theorem dispatch064 (j : ℕ) (hc : j < 128) (h : 8192 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨8192 + j, h⟩).val = GibbsCertificateData.Part064.rows[j]'(by rw [len064]; exact hc) := by
  have p : 8192 + j - 8192 < 4096 := Rows.sub_lt_of_part 8192 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (8192 + j) h _ rfl
  have e := sel_gibbsGroup2 (8192 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 8192 j 4096 (by decide))).2 (Rows.not_lt_of_part 8192 j 8192 (by decide))).1 (Rows.lt_of_part 8192 j 128 12288 hc (by decide))) p)
  have e1 := (e.1 (Rows.lt_sub_of_part 8192 j 128 8192 128 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 8192 j 8192 0 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link064 : ∀ j < 128, Good (8192 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part064.rows.length := by rw [len064]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨8192 + j, h⟩).property
  rw [dispatch064 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound064.2 j hj')

theorem dispatch065 (j : ℕ) (hc : j < 128) (h : 8320 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨8320 + j, h⟩).val = GibbsCertificateData.Part065.rows[j]'(by rw [len065]; exact hc) := by
  have p : 8320 + j - 8192 < 4096 := Rows.sub_lt_of_part 8320 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (8320 + j) h _ rfl
  have e := sel_gibbsGroup2 (8320 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 8320 j 4096 (by decide))).2 (Rows.not_lt_of_part 8320 j 8192 (by decide))).1 (Rows.lt_of_part 8320 j 128 12288 hc (by decide))) p)
  have e1 := ((e.2 (Rows.not_lt_sub_of_part 8320 j 8192 128 (by decide))).1 (Rows.lt_sub_of_part 8320 j 128 8192 256 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 8320 j 8192 128 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link065 : ∀ j < 128, Good (8320 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part065.rows.length := by rw [len065]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨8320 + j, h⟩).property
  rw [dispatch065 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound065.2 j hj')

theorem dispatch066 (j : ℕ) (hc : j < 128) (h : 8448 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨8448 + j, h⟩).val = GibbsCertificateData.Part066.rows[j]'(by rw [len066]; exact hc) := by
  have p : 8448 + j - 8192 < 4096 := Rows.sub_lt_of_part 8448 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (8448 + j) h _ rfl
  have e := sel_gibbsGroup2 (8448 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 8448 j 4096 (by decide))).2 (Rows.not_lt_of_part 8448 j 8192 (by decide))).1 (Rows.lt_of_part 8448 j 128 12288 hc (by decide))) p)
  have e1 := (((e.2 (Rows.not_lt_sub_of_part 8448 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 8448 j 8192 256 (by decide))).1 (Rows.lt_sub_of_part 8448 j 128 8192 384 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 8448 j 8192 256 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link066 : ∀ j < 128, Good (8448 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part066.rows.length := by rw [len066]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨8448 + j, h⟩).property
  rw [dispatch066 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound066.2 j hj')

theorem dispatch067 (j : ℕ) (hc : j < 128) (h : 8576 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨8576 + j, h⟩).val = GibbsCertificateData.Part067.rows[j]'(by rw [len067]; exact hc) := by
  have p : 8576 + j - 8192 < 4096 := Rows.sub_lt_of_part 8576 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (8576 + j) h _ rfl
  have e := sel_gibbsGroup2 (8576 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 8576 j 4096 (by decide))).2 (Rows.not_lt_of_part 8576 j 8192 (by decide))).1 (Rows.lt_of_part 8576 j 128 12288 hc (by decide))) p)
  have e1 := ((((e.2 (Rows.not_lt_sub_of_part 8576 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 8576 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 8576 j 8192 384 (by decide))).1 (Rows.lt_sub_of_part 8576 j 128 8192 512 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 8576 j 8192 384 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link067 : ∀ j < 128, Good (8576 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part067.rows.length := by rw [len067]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨8576 + j, h⟩).property
  rw [dispatch067 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound067.2 j hj')

theorem dispatch068 (j : ℕ) (hc : j < 128) (h : 8704 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨8704 + j, h⟩).val = GibbsCertificateData.Part068.rows[j]'(by rw [len068]; exact hc) := by
  have p : 8704 + j - 8192 < 4096 := Rows.sub_lt_of_part 8704 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (8704 + j) h _ rfl
  have e := sel_gibbsGroup2 (8704 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 8704 j 4096 (by decide))).2 (Rows.not_lt_of_part 8704 j 8192 (by decide))).1 (Rows.lt_of_part 8704 j 128 12288 hc (by decide))) p)
  have e1 := (((((e.2 (Rows.not_lt_sub_of_part 8704 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 8704 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 8704 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 8704 j 8192 512 (by decide))).1 (Rows.lt_sub_of_part 8704 j 128 8192 640 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 8704 j 8192 512 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link068 : ∀ j < 128, Good (8704 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part068.rows.length := by rw [len068]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨8704 + j, h⟩).property
  rw [dispatch068 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound068.2 j hj')

theorem dispatch069 (j : ℕ) (hc : j < 128) (h : 8832 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨8832 + j, h⟩).val = GibbsCertificateData.Part069.rows[j]'(by rw [len069]; exact hc) := by
  have p : 8832 + j - 8192 < 4096 := Rows.sub_lt_of_part 8832 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (8832 + j) h _ rfl
  have e := sel_gibbsGroup2 (8832 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 8832 j 4096 (by decide))).2 (Rows.not_lt_of_part 8832 j 8192 (by decide))).1 (Rows.lt_of_part 8832 j 128 12288 hc (by decide))) p)
  have e1 := ((((((e.2 (Rows.not_lt_sub_of_part 8832 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 8832 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 8832 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 8832 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 8832 j 8192 640 (by decide))).1 (Rows.lt_sub_of_part 8832 j 128 8192 768 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 8832 j 8192 640 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link069 : ∀ j < 128, Good (8832 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part069.rows.length := by rw [len069]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨8832 + j, h⟩).property
  rw [dispatch069 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound069.2 j hj')


end FKLBridge.Gibbs
