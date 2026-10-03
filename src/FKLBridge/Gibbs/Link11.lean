module

public import FKLBridge.Gibbs.Sel

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch110 (j : ℕ) (hc : j < 128) (h : 14080 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨14080 + j, h⟩).val = GibbsCertificateData.Part110.rows[j]'(by rw [len110]; exact hc) := by
  have p : 14080 + j - 12288 < 4096 := Rows.sub_lt_of_part 14080 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (14080 + j) h _ rfl
  have e := sel_gibbsGroup3 (14080 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 14080 j 4096 (by decide))).2 (Rows.not_lt_of_part 14080 j 8192 (by decide))).2 (Rows.not_lt_of_part 14080 j 12288 (by decide))).1 (Rows.lt_of_part 14080 j 128 16384 hc (by decide))) p)
  have e1 := (((((((((((((((e.2 (Rows.not_lt_sub_of_part 14080 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 12288 1152 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 12288 1280 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 12288 1408 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 12288 1536 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 12288 1664 (by decide))).2 (Rows.not_lt_sub_of_part 14080 j 12288 1792 (by decide))).1 (Rows.lt_sub_of_part 14080 j 128 12288 1920 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 14080 j 12288 1792 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link110 : ∀ j < 128, Good (14080 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part110.rows.length := by rw [len110]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨14080 + j, h⟩).property
  rw [dispatch110 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound110.2 j hj')

theorem dispatch111 (j : ℕ) (hc : j < 128) (h : 14208 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨14208 + j, h⟩).val = GibbsCertificateData.Part111.rows[j]'(by rw [len111]; exact hc) := by
  have p : 14208 + j - 12288 < 4096 := Rows.sub_lt_of_part 14208 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (14208 + j) h _ rfl
  have e := sel_gibbsGroup3 (14208 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 14208 j 4096 (by decide))).2 (Rows.not_lt_of_part 14208 j 8192 (by decide))).2 (Rows.not_lt_of_part 14208 j 12288 (by decide))).1 (Rows.lt_of_part 14208 j 128 16384 hc (by decide))) p)
  have e1 := ((((((((((((((((e.2 (Rows.not_lt_sub_of_part 14208 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 14208 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 14208 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 14208 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 14208 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 14208 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 14208 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 14208 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 14208 j 12288 1152 (by decide))).2 (Rows.not_lt_sub_of_part 14208 j 12288 1280 (by decide))).2 (Rows.not_lt_sub_of_part 14208 j 12288 1408 (by decide))).2 (Rows.not_lt_sub_of_part 14208 j 12288 1536 (by decide))).2 (Rows.not_lt_sub_of_part 14208 j 12288 1664 (by decide))).2 (Rows.not_lt_sub_of_part 14208 j 12288 1792 (by decide))).2 (Rows.not_lt_sub_of_part 14208 j 12288 1920 (by decide))).1 (Rows.lt_sub_of_part 14208 j 128 12288 2048 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 14208 j 12288 1920 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link111 : ∀ j < 128, Good (14208 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part111.rows.length := by rw [len111]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨14208 + j, h⟩).property
  rw [dispatch111 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound111.2 j hj')

theorem dispatch112 (j : ℕ) (hc : j < 128) (h : 14336 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨14336 + j, h⟩).val = GibbsCertificateData.Part112.rows[j]'(by rw [len112]; exact hc) := by
  have p : 14336 + j - 12288 < 4096 := Rows.sub_lt_of_part 14336 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (14336 + j) h _ rfl
  have e := sel_gibbsGroup3 (14336 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 14336 j 4096 (by decide))).2 (Rows.not_lt_of_part 14336 j 8192 (by decide))).2 (Rows.not_lt_of_part 14336 j 12288 (by decide))).1 (Rows.lt_of_part 14336 j 128 16384 hc (by decide))) p)
  have e1 := (((((((((((((((((e.2 (Rows.not_lt_sub_of_part 14336 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 12288 1152 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 12288 1280 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 12288 1408 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 12288 1536 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 12288 1664 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 12288 1792 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 12288 1920 (by decide))).2 (Rows.not_lt_sub_of_part 14336 j 12288 2048 (by decide))).1 (Rows.lt_sub_of_part 14336 j 128 12288 2176 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 14336 j 12288 2048 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link112 : ∀ j < 128, Good (14336 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part112.rows.length := by rw [len112]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨14336 + j, h⟩).property
  rw [dispatch112 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound112.2 j hj')

theorem dispatch113 (j : ℕ) (hc : j < 128) (h : 14464 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨14464 + j, h⟩).val = GibbsCertificateData.Part113.rows[j]'(by rw [len113]; exact hc) := by
  have p : 14464 + j - 12288 < 4096 := Rows.sub_lt_of_part 14464 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (14464 + j) h _ rfl
  have e := sel_gibbsGroup3 (14464 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 14464 j 4096 (by decide))).2 (Rows.not_lt_of_part 14464 j 8192 (by decide))).2 (Rows.not_lt_of_part 14464 j 12288 (by decide))).1 (Rows.lt_of_part 14464 j 128 16384 hc (by decide))) p)
  have e1 := ((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 14464 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 14464 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 14464 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 14464 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 14464 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 14464 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 14464 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 14464 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 14464 j 12288 1152 (by decide))).2 (Rows.not_lt_sub_of_part 14464 j 12288 1280 (by decide))).2 (Rows.not_lt_sub_of_part 14464 j 12288 1408 (by decide))).2 (Rows.not_lt_sub_of_part 14464 j 12288 1536 (by decide))).2 (Rows.not_lt_sub_of_part 14464 j 12288 1664 (by decide))).2 (Rows.not_lt_sub_of_part 14464 j 12288 1792 (by decide))).2 (Rows.not_lt_sub_of_part 14464 j 12288 1920 (by decide))).2 (Rows.not_lt_sub_of_part 14464 j 12288 2048 (by decide))).2 (Rows.not_lt_sub_of_part 14464 j 12288 2176 (by decide))).1 (Rows.lt_sub_of_part 14464 j 128 12288 2304 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 14464 j 12288 2176 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link113 : ∀ j < 128, Good (14464 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part113.rows.length := by rw [len113]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨14464 + j, h⟩).property
  rw [dispatch113 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound113.2 j hj')

theorem dispatch114 (j : ℕ) (hc : j < 128) (h : 14592 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨14592 + j, h⟩).val = GibbsCertificateData.Part114.rows[j]'(by rw [len114]; exact hc) := by
  have p : 14592 + j - 12288 < 4096 := Rows.sub_lt_of_part 14592 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (14592 + j) h _ rfl
  have e := sel_gibbsGroup3 (14592 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 14592 j 4096 (by decide))).2 (Rows.not_lt_of_part 14592 j 8192 (by decide))).2 (Rows.not_lt_of_part 14592 j 12288 (by decide))).1 (Rows.lt_of_part 14592 j 128 16384 hc (by decide))) p)
  have e1 := (((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 14592 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 12288 1152 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 12288 1280 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 12288 1408 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 12288 1536 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 12288 1664 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 12288 1792 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 12288 1920 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 12288 2048 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 12288 2176 (by decide))).2 (Rows.not_lt_sub_of_part 14592 j 12288 2304 (by decide))).1 (Rows.lt_sub_of_part 14592 j 128 12288 2432 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 14592 j 12288 2304 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link114 : ∀ j < 128, Good (14592 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part114.rows.length := by rw [len114]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨14592 + j, h⟩).property
  rw [dispatch114 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound114.2 j hj')

theorem dispatch115 (j : ℕ) (hc : j < 128) (h : 14720 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨14720 + j, h⟩).val = GibbsCertificateData.Part115.rows[j]'(by rw [len115]; exact hc) := by
  have p : 14720 + j - 12288 < 4096 := Rows.sub_lt_of_part 14720 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (14720 + j) h _ rfl
  have e := sel_gibbsGroup3 (14720 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 14720 j 4096 (by decide))).2 (Rows.not_lt_of_part 14720 j 8192 (by decide))).2 (Rows.not_lt_of_part 14720 j 12288 (by decide))).1 (Rows.lt_of_part 14720 j 128 16384 hc (by decide))) p)
  have e1 := ((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 14720 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 14720 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 14720 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 14720 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 14720 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 14720 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 14720 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 14720 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 14720 j 12288 1152 (by decide))).2 (Rows.not_lt_sub_of_part 14720 j 12288 1280 (by decide))).2 (Rows.not_lt_sub_of_part 14720 j 12288 1408 (by decide))).2 (Rows.not_lt_sub_of_part 14720 j 12288 1536 (by decide))).2 (Rows.not_lt_sub_of_part 14720 j 12288 1664 (by decide))).2 (Rows.not_lt_sub_of_part 14720 j 12288 1792 (by decide))).2 (Rows.not_lt_sub_of_part 14720 j 12288 1920 (by decide))).2 (Rows.not_lt_sub_of_part 14720 j 12288 2048 (by decide))).2 (Rows.not_lt_sub_of_part 14720 j 12288 2176 (by decide))).2 (Rows.not_lt_sub_of_part 14720 j 12288 2304 (by decide))).2 (Rows.not_lt_sub_of_part 14720 j 12288 2432 (by decide))).1 (Rows.lt_sub_of_part 14720 j 128 12288 2560 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 14720 j 12288 2432 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link115 : ∀ j < 128, Good (14720 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part115.rows.length := by rw [len115]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨14720 + j, h⟩).property
  rw [dispatch115 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound115.2 j hj')

theorem dispatch116 (j : ℕ) (hc : j < 128) (h : 14848 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨14848 + j, h⟩).val = GibbsCertificateData.Part116.rows[j]'(by rw [len116]; exact hc) := by
  have p : 14848 + j - 12288 < 4096 := Rows.sub_lt_of_part 14848 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (14848 + j) h _ rfl
  have e := sel_gibbsGroup3 (14848 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 14848 j 4096 (by decide))).2 (Rows.not_lt_of_part 14848 j 8192 (by decide))).2 (Rows.not_lt_of_part 14848 j 12288 (by decide))).1 (Rows.lt_of_part 14848 j 128 16384 hc (by decide))) p)
  have e1 := (((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 14848 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 12288 1152 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 12288 1280 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 12288 1408 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 12288 1536 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 12288 1664 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 12288 1792 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 12288 1920 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 12288 2048 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 12288 2176 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 12288 2304 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 12288 2432 (by decide))).2 (Rows.not_lt_sub_of_part 14848 j 12288 2560 (by decide))).1 (Rows.lt_sub_of_part 14848 j 128 12288 2688 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 14848 j 12288 2560 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link116 : ∀ j < 128, Good (14848 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part116.rows.length := by rw [len116]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨14848 + j, h⟩).property
  rw [dispatch116 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound116.2 j hj')

theorem dispatch117 (j : ℕ) (hc : j < 128) (h : 14976 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨14976 + j, h⟩).val = GibbsCertificateData.Part117.rows[j]'(by rw [len117]; exact hc) := by
  have p : 14976 + j - 12288 < 4096 := Rows.sub_lt_of_part 14976 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (14976 + j) h _ rfl
  have e := sel_gibbsGroup3 (14976 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 14976 j 4096 (by decide))).2 (Rows.not_lt_of_part 14976 j 8192 (by decide))).2 (Rows.not_lt_of_part 14976 j 12288 (by decide))).1 (Rows.lt_of_part 14976 j 128 16384 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 14976 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 14976 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 14976 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 14976 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 14976 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 14976 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 14976 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 14976 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 14976 j 12288 1152 (by decide))).2 (Rows.not_lt_sub_of_part 14976 j 12288 1280 (by decide))).2 (Rows.not_lt_sub_of_part 14976 j 12288 1408 (by decide))).2 (Rows.not_lt_sub_of_part 14976 j 12288 1536 (by decide))).2 (Rows.not_lt_sub_of_part 14976 j 12288 1664 (by decide))).2 (Rows.not_lt_sub_of_part 14976 j 12288 1792 (by decide))).2 (Rows.not_lt_sub_of_part 14976 j 12288 1920 (by decide))).2 (Rows.not_lt_sub_of_part 14976 j 12288 2048 (by decide))).2 (Rows.not_lt_sub_of_part 14976 j 12288 2176 (by decide))).2 (Rows.not_lt_sub_of_part 14976 j 12288 2304 (by decide))).2 (Rows.not_lt_sub_of_part 14976 j 12288 2432 (by decide))).2 (Rows.not_lt_sub_of_part 14976 j 12288 2560 (by decide))).2 (Rows.not_lt_sub_of_part 14976 j 12288 2688 (by decide))).1 (Rows.lt_sub_of_part 14976 j 128 12288 2816 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 14976 j 12288 2688 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link117 : ∀ j < 128, Good (14976 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part117.rows.length := by rw [len117]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨14976 + j, h⟩).property
  rw [dispatch117 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound117.2 j hj')

theorem dispatch118 (j : ℕ) (hc : j < 128) (h : 15104 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨15104 + j, h⟩).val = GibbsCertificateData.Part118.rows[j]'(by rw [len118]; exact hc) := by
  have p : 15104 + j - 12288 < 4096 := Rows.sub_lt_of_part 15104 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (15104 + j) h _ rfl
  have e := sel_gibbsGroup3 (15104 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 15104 j 4096 (by decide))).2 (Rows.not_lt_of_part 15104 j 8192 (by decide))).2 (Rows.not_lt_of_part 15104 j 12288 (by decide))).1 (Rows.lt_of_part 15104 j 128 16384 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 15104 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 12288 1152 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 12288 1280 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 12288 1408 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 12288 1536 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 12288 1664 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 12288 1792 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 12288 1920 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 12288 2048 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 12288 2176 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 12288 2304 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 12288 2432 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 12288 2560 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 12288 2688 (by decide))).2 (Rows.not_lt_sub_of_part 15104 j 12288 2816 (by decide))).1 (Rows.lt_sub_of_part 15104 j 128 12288 2944 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 15104 j 12288 2816 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link118 : ∀ j < 128, Good (15104 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part118.rows.length := by rw [len118]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨15104 + j, h⟩).property
  rw [dispatch118 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound118.2 j hj')

theorem dispatch119 (j : ℕ) (hc : j < 128) (h : 15232 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨15232 + j, h⟩).val = GibbsCertificateData.Part119.rows[j]'(by rw [len119]; exact hc) := by
  have p : 15232 + j - 12288 < 4096 := Rows.sub_lt_of_part 15232 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (15232 + j) h _ rfl
  have e := sel_gibbsGroup3 (15232 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 15232 j 4096 (by decide))).2 (Rows.not_lt_of_part 15232 j 8192 (by decide))).2 (Rows.not_lt_of_part 15232 j 12288 (by decide))).1 (Rows.lt_of_part 15232 j 128 16384 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 15232 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 15232 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 15232 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 15232 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 15232 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 15232 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 15232 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 15232 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 15232 j 12288 1152 (by decide))).2 (Rows.not_lt_sub_of_part 15232 j 12288 1280 (by decide))).2 (Rows.not_lt_sub_of_part 15232 j 12288 1408 (by decide))).2 (Rows.not_lt_sub_of_part 15232 j 12288 1536 (by decide))).2 (Rows.not_lt_sub_of_part 15232 j 12288 1664 (by decide))).2 (Rows.not_lt_sub_of_part 15232 j 12288 1792 (by decide))).2 (Rows.not_lt_sub_of_part 15232 j 12288 1920 (by decide))).2 (Rows.not_lt_sub_of_part 15232 j 12288 2048 (by decide))).2 (Rows.not_lt_sub_of_part 15232 j 12288 2176 (by decide))).2 (Rows.not_lt_sub_of_part 15232 j 12288 2304 (by decide))).2 (Rows.not_lt_sub_of_part 15232 j 12288 2432 (by decide))).2 (Rows.not_lt_sub_of_part 15232 j 12288 2560 (by decide))).2 (Rows.not_lt_sub_of_part 15232 j 12288 2688 (by decide))).2 (Rows.not_lt_sub_of_part 15232 j 12288 2816 (by decide))).2 (Rows.not_lt_sub_of_part 15232 j 12288 2944 (by decide))).1 (Rows.lt_sub_of_part 15232 j 128 12288 3072 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 15232 j 12288 2944 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link119 : ∀ j < 128, Good (15232 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part119.rows.length := by rw [len119]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨15232 + j, h⟩).property
  rw [dispatch119 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound119.2 j hj')


end FKLBridge.Gibbs
