module

public import FKLBridge.Gibbs.Sel

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch000 (j : ℕ) (hc : j < 128) (h : 0 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨0 + j, h⟩).val = GibbsCertificateData.Part000.rows[j]'(by rw [len000]; exact hc) := by
  have p : 0 + j - 0 < 4096 := Rows.sub_lt_of_part 0 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (0 + j) h _ rfl
  have e := sel_gibbsGroup0 (0 + j - 0) p _ ((e0.1 (Rows.lt_of_part 0 j 128 4096 hc (by decide))) p)
  have e1 := (e.1 (Rows.lt_sub_of_part 0 j 128 0 128 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 0 j 0 0 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link000 : ∀ j < 128, Good (0 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part000.rows.length := by rw [len000]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨0 + j, h⟩).property
  rw [dispatch000 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound000.2 j hj')

theorem dispatch001 (j : ℕ) (hc : j < 128) (h : 128 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨128 + j, h⟩).val = GibbsCertificateData.Part001.rows[j]'(by rw [len001]; exact hc) := by
  have p : 128 + j - 0 < 4096 := Rows.sub_lt_of_part 128 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (128 + j) h _ rfl
  have e := sel_gibbsGroup0 (128 + j - 0) p _ ((e0.1 (Rows.lt_of_part 128 j 128 4096 hc (by decide))) p)
  have e1 := ((e.2 (Rows.not_lt_sub_of_part 128 j 0 128 (by decide))).1 (Rows.lt_sub_of_part 128 j 128 0 256 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 128 j 0 128 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link001 : ∀ j < 128, Good (128 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part001.rows.length := by rw [len001]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨128 + j, h⟩).property
  rw [dispatch001 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound001.2 j hj')

theorem dispatch002 (j : ℕ) (hc : j < 128) (h : 256 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨256 + j, h⟩).val = GibbsCertificateData.Part002.rows[j]'(by rw [len002]; exact hc) := by
  have p : 256 + j - 0 < 4096 := Rows.sub_lt_of_part 256 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (256 + j) h _ rfl
  have e := sel_gibbsGroup0 (256 + j - 0) p _ ((e0.1 (Rows.lt_of_part 256 j 128 4096 hc (by decide))) p)
  have e1 := (((e.2 (Rows.not_lt_sub_of_part 256 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 256 j 0 256 (by decide))).1 (Rows.lt_sub_of_part 256 j 128 0 384 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 256 j 0 256 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link002 : ∀ j < 128, Good (256 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part002.rows.length := by rw [len002]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨256 + j, h⟩).property
  rw [dispatch002 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound002.2 j hj')

theorem dispatch003 (j : ℕ) (hc : j < 128) (h : 384 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨384 + j, h⟩).val = GibbsCertificateData.Part003.rows[j]'(by rw [len003]; exact hc) := by
  have p : 384 + j - 0 < 4096 := Rows.sub_lt_of_part 384 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (384 + j) h _ rfl
  have e := sel_gibbsGroup0 (384 + j - 0) p _ ((e0.1 (Rows.lt_of_part 384 j 128 4096 hc (by decide))) p)
  have e1 := ((((e.2 (Rows.not_lt_sub_of_part 384 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 384 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 384 j 0 384 (by decide))).1 (Rows.lt_sub_of_part 384 j 128 0 512 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 384 j 0 384 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link003 : ∀ j < 128, Good (384 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part003.rows.length := by rw [len003]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨384 + j, h⟩).property
  rw [dispatch003 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound003.2 j hj')

theorem dispatch004 (j : ℕ) (hc : j < 128) (h : 512 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨512 + j, h⟩).val = GibbsCertificateData.Part004.rows[j]'(by rw [len004]; exact hc) := by
  have p : 512 + j - 0 < 4096 := Rows.sub_lt_of_part 512 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (512 + j) h _ rfl
  have e := sel_gibbsGroup0 (512 + j - 0) p _ ((e0.1 (Rows.lt_of_part 512 j 128 4096 hc (by decide))) p)
  have e1 := (((((e.2 (Rows.not_lt_sub_of_part 512 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 512 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 512 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 512 j 0 512 (by decide))).1 (Rows.lt_sub_of_part 512 j 128 0 640 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 512 j 0 512 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link004 : ∀ j < 128, Good (512 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part004.rows.length := by rw [len004]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨512 + j, h⟩).property
  rw [dispatch004 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound004.2 j hj')

theorem dispatch005 (j : ℕ) (hc : j < 128) (h : 640 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨640 + j, h⟩).val = GibbsCertificateData.Part005.rows[j]'(by rw [len005]; exact hc) := by
  have p : 640 + j - 0 < 4096 := Rows.sub_lt_of_part 640 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (640 + j) h _ rfl
  have e := sel_gibbsGroup0 (640 + j - 0) p _ ((e0.1 (Rows.lt_of_part 640 j 128 4096 hc (by decide))) p)
  have e1 := ((((((e.2 (Rows.not_lt_sub_of_part 640 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 640 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 640 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 640 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 640 j 0 640 (by decide))).1 (Rows.lt_sub_of_part 640 j 128 0 768 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 640 j 0 640 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link005 : ∀ j < 128, Good (640 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part005.rows.length := by rw [len005]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨640 + j, h⟩).property
  rw [dispatch005 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound005.2 j hj')

theorem dispatch006 (j : ℕ) (hc : j < 128) (h : 768 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨768 + j, h⟩).val = GibbsCertificateData.Part006.rows[j]'(by rw [len006]; exact hc) := by
  have p : 768 + j - 0 < 4096 := Rows.sub_lt_of_part 768 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (768 + j) h _ rfl
  have e := sel_gibbsGroup0 (768 + j - 0) p _ ((e0.1 (Rows.lt_of_part 768 j 128 4096 hc (by decide))) p)
  have e1 := (((((((e.2 (Rows.not_lt_sub_of_part 768 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 768 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 768 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 768 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 768 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 768 j 0 768 (by decide))).1 (Rows.lt_sub_of_part 768 j 128 0 896 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 768 j 0 768 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link006 : ∀ j < 128, Good (768 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part006.rows.length := by rw [len006]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨768 + j, h⟩).property
  rw [dispatch006 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound006.2 j hj')

theorem dispatch007 (j : ℕ) (hc : j < 128) (h : 896 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨896 + j, h⟩).val = GibbsCertificateData.Part007.rows[j]'(by rw [len007]; exact hc) := by
  have p : 896 + j - 0 < 4096 := Rows.sub_lt_of_part 896 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (896 + j) h _ rfl
  have e := sel_gibbsGroup0 (896 + j - 0) p _ ((e0.1 (Rows.lt_of_part 896 j 128 4096 hc (by decide))) p)
  have e1 := ((((((((e.2 (Rows.not_lt_sub_of_part 896 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 896 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 896 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 896 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 896 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 896 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 896 j 0 896 (by decide))).1 (Rows.lt_sub_of_part 896 j 128 0 1024 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 896 j 0 896 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link007 : ∀ j < 128, Good (896 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part007.rows.length := by rw [len007]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨896 + j, h⟩).property
  rw [dispatch007 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound007.2 j hj')

theorem dispatch008 (j : ℕ) (hc : j < 128) (h : 1024 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨1024 + j, h⟩).val = GibbsCertificateData.Part008.rows[j]'(by rw [len008]; exact hc) := by
  have p : 1024 + j - 0 < 4096 := Rows.sub_lt_of_part 1024 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (1024 + j) h _ rfl
  have e := sel_gibbsGroup0 (1024 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1024 j 128 4096 hc (by decide))) p)
  have e1 := (((((((((e.2 (Rows.not_lt_sub_of_part 1024 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1024 j 0 1024 (by decide))).1 (Rows.lt_sub_of_part 1024 j 128 0 1152 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1024 j 0 1024 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link008 : ∀ j < 128, Good (1024 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part008.rows.length := by rw [len008]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨1024 + j, h⟩).property
  rw [dispatch008 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound008.2 j hj')

theorem dispatch009 (j : ℕ) (hc : j < 128) (h : 1152 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨1152 + j, h⟩).val = GibbsCertificateData.Part009.rows[j]'(by rw [len009]; exact hc) := by
  have p : 1152 + j - 0 < 4096 := Rows.sub_lt_of_part 1152 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (1152 + j) h _ rfl
  have e := sel_gibbsGroup0 (1152 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1152 j 128 4096 hc (by decide))) p)
  have e1 := ((((((((((e.2 (Rows.not_lt_sub_of_part 1152 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1152 j 0 1152 (by decide))).1 (Rows.lt_sub_of_part 1152 j 128 0 1280 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1152 j 0 1152 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link009 : ∀ j < 128, Good (1152 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part009.rows.length := by rw [len009]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨1152 + j, h⟩).property
  rw [dispatch009 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound009.2 j hj')


end FKLBridge.Gibbs
