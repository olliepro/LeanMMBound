module

public import FKLBridge.Gibbs.Sel

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch040 (j : ℕ) (hc : j < 128) (h : 5120 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨5120 + j, h⟩).val = GibbsCertificateData.Part040.rows[j]'(by rw [len040]; exact hc) := by
  have p : 5120 + j - 4096 < 4096 := Rows.sub_lt_of_part 5120 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (5120 + j) h _ rfl
  have e := sel_gibbsGroup1 (5120 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 5120 j 4096 (by decide))).1 (Rows.lt_of_part 5120 j 128 8192 hc (by decide))) p)
  have e1 := (((((((((e.2 (Rows.not_lt_sub_of_part 5120 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 5120 j 4096 1024 (by decide))).1 (Rows.lt_sub_of_part 5120 j 128 4096 1152 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 5120 j 4096 1024 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link040 : ∀ j < 128, Good (5120 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part040.rows.length := by rw [len040]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨5120 + j, h⟩).property
  rw [dispatch040 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound040.2 j hj')

theorem dispatch041 (j : ℕ) (hc : j < 128) (h : 5248 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨5248 + j, h⟩).val = GibbsCertificateData.Part041.rows[j]'(by rw [len041]; exact hc) := by
  have p : 5248 + j - 4096 < 4096 := Rows.sub_lt_of_part 5248 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (5248 + j) h _ rfl
  have e := sel_gibbsGroup1 (5248 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 5248 j 4096 (by decide))).1 (Rows.lt_of_part 5248 j 128 8192 hc (by decide))) p)
  have e1 := ((((((((((e.2 (Rows.not_lt_sub_of_part 5248 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 5248 j 4096 1152 (by decide))).1 (Rows.lt_sub_of_part 5248 j 128 4096 1280 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 5248 j 4096 1152 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link041 : ∀ j < 128, Good (5248 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part041.rows.length := by rw [len041]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨5248 + j, h⟩).property
  rw [dispatch041 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound041.2 j hj')

theorem dispatch042 (j : ℕ) (hc : j < 128) (h : 5376 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨5376 + j, h⟩).val = GibbsCertificateData.Part042.rows[j]'(by rw [len042]; exact hc) := by
  have p : 5376 + j - 4096 < 4096 := Rows.sub_lt_of_part 5376 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (5376 + j) h _ rfl
  have e := sel_gibbsGroup1 (5376 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 5376 j 4096 (by decide))).1 (Rows.lt_of_part 5376 j 128 8192 hc (by decide))) p)
  have e1 := (((((((((((e.2 (Rows.not_lt_sub_of_part 5376 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 5376 j 4096 1280 (by decide))).1 (Rows.lt_sub_of_part 5376 j 128 4096 1408 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 5376 j 4096 1280 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link042 : ∀ j < 128, Good (5376 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part042.rows.length := by rw [len042]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨5376 + j, h⟩).property
  rw [dispatch042 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound042.2 j hj')

theorem dispatch043 (j : ℕ) (hc : j < 128) (h : 5504 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨5504 + j, h⟩).val = GibbsCertificateData.Part043.rows[j]'(by rw [len043]; exact hc) := by
  have p : 5504 + j - 4096 < 4096 := Rows.sub_lt_of_part 5504 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (5504 + j) h _ rfl
  have e := sel_gibbsGroup1 (5504 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 5504 j 4096 (by decide))).1 (Rows.lt_of_part 5504 j 128 8192 hc (by decide))) p)
  have e1 := ((((((((((((e.2 (Rows.not_lt_sub_of_part 5504 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 5504 j 4096 1408 (by decide))).1 (Rows.lt_sub_of_part 5504 j 128 4096 1536 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 5504 j 4096 1408 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link043 : ∀ j < 128, Good (5504 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part043.rows.length := by rw [len043]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨5504 + j, h⟩).property
  rw [dispatch043 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound043.2 j hj')

theorem dispatch044 (j : ℕ) (hc : j < 128) (h : 5632 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨5632 + j, h⟩).val = GibbsCertificateData.Part044.rows[j]'(by rw [len044]; exact hc) := by
  have p : 5632 + j - 4096 < 4096 := Rows.sub_lt_of_part 5632 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (5632 + j) h _ rfl
  have e := sel_gibbsGroup1 (5632 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 5632 j 4096 (by decide))).1 (Rows.lt_of_part 5632 j 128 8192 hc (by decide))) p)
  have e1 := (((((((((((((e.2 (Rows.not_lt_sub_of_part 5632 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 4096 1408 (by decide))).2 (Rows.not_lt_sub_of_part 5632 j 4096 1536 (by decide))).1 (Rows.lt_sub_of_part 5632 j 128 4096 1664 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 5632 j 4096 1536 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link044 : ∀ j < 128, Good (5632 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part044.rows.length := by rw [len044]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨5632 + j, h⟩).property
  rw [dispatch044 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound044.2 j hj')

theorem dispatch045 (j : ℕ) (hc : j < 128) (h : 5760 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨5760 + j, h⟩).val = GibbsCertificateData.Part045.rows[j]'(by rw [len045]; exact hc) := by
  have p : 5760 + j - 4096 < 4096 := Rows.sub_lt_of_part 5760 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (5760 + j) h _ rfl
  have e := sel_gibbsGroup1 (5760 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 5760 j 4096 (by decide))).1 (Rows.lt_of_part 5760 j 128 8192 hc (by decide))) p)
  have e1 := ((((((((((((((e.2 (Rows.not_lt_sub_of_part 5760 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 5760 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 5760 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 5760 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 5760 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 5760 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 5760 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 5760 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 5760 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 5760 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 5760 j 4096 1408 (by decide))).2 (Rows.not_lt_sub_of_part 5760 j 4096 1536 (by decide))).2 (Rows.not_lt_sub_of_part 5760 j 4096 1664 (by decide))).1 (Rows.lt_sub_of_part 5760 j 128 4096 1792 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 5760 j 4096 1664 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link045 : ∀ j < 128, Good (5760 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part045.rows.length := by rw [len045]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨5760 + j, h⟩).property
  rw [dispatch045 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound045.2 j hj')

theorem dispatch046 (j : ℕ) (hc : j < 128) (h : 5888 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨5888 + j, h⟩).val = GibbsCertificateData.Part046.rows[j]'(by rw [len046]; exact hc) := by
  have p : 5888 + j - 4096 < 4096 := Rows.sub_lt_of_part 5888 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (5888 + j) h _ rfl
  have e := sel_gibbsGroup1 (5888 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 5888 j 4096 (by decide))).1 (Rows.lt_of_part 5888 j 128 8192 hc (by decide))) p)
  have e1 := (((((((((((((((e.2 (Rows.not_lt_sub_of_part 5888 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 4096 1408 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 4096 1536 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 4096 1664 (by decide))).2 (Rows.not_lt_sub_of_part 5888 j 4096 1792 (by decide))).1 (Rows.lt_sub_of_part 5888 j 128 4096 1920 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 5888 j 4096 1792 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link046 : ∀ j < 128, Good (5888 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part046.rows.length := by rw [len046]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨5888 + j, h⟩).property
  rw [dispatch046 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound046.2 j hj')

theorem dispatch047 (j : ℕ) (hc : j < 128) (h : 6016 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨6016 + j, h⟩).val = GibbsCertificateData.Part047.rows[j]'(by rw [len047]; exact hc) := by
  have p : 6016 + j - 4096 < 4096 := Rows.sub_lt_of_part 6016 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (6016 + j) h _ rfl
  have e := sel_gibbsGroup1 (6016 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 6016 j 4096 (by decide))).1 (Rows.lt_of_part 6016 j 128 8192 hc (by decide))) p)
  have e1 := ((((((((((((((((e.2 (Rows.not_lt_sub_of_part 6016 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 6016 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 6016 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 6016 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 6016 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 6016 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 6016 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 6016 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 6016 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 6016 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 6016 j 4096 1408 (by decide))).2 (Rows.not_lt_sub_of_part 6016 j 4096 1536 (by decide))).2 (Rows.not_lt_sub_of_part 6016 j 4096 1664 (by decide))).2 (Rows.not_lt_sub_of_part 6016 j 4096 1792 (by decide))).2 (Rows.not_lt_sub_of_part 6016 j 4096 1920 (by decide))).1 (Rows.lt_sub_of_part 6016 j 128 4096 2048 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 6016 j 4096 1920 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link047 : ∀ j < 128, Good (6016 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part047.rows.length := by rw [len047]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨6016 + j, h⟩).property
  rw [dispatch047 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound047.2 j hj')

theorem dispatch048 (j : ℕ) (hc : j < 128) (h : 6144 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨6144 + j, h⟩).val = GibbsCertificateData.Part048.rows[j]'(by rw [len048]; exact hc) := by
  have p : 6144 + j - 4096 < 4096 := Rows.sub_lt_of_part 6144 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (6144 + j) h _ rfl
  have e := sel_gibbsGroup1 (6144 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 6144 j 4096 (by decide))).1 (Rows.lt_of_part 6144 j 128 8192 hc (by decide))) p)
  have e1 := (((((((((((((((((e.2 (Rows.not_lt_sub_of_part 6144 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 4096 1408 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 4096 1536 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 4096 1664 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 4096 1792 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 4096 1920 (by decide))).2 (Rows.not_lt_sub_of_part 6144 j 4096 2048 (by decide))).1 (Rows.lt_sub_of_part 6144 j 128 4096 2176 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 6144 j 4096 2048 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link048 : ∀ j < 128, Good (6144 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part048.rows.length := by rw [len048]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨6144 + j, h⟩).property
  rw [dispatch048 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound048.2 j hj')

theorem dispatch049 (j : ℕ) (hc : j < 128) (h : 6272 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨6272 + j, h⟩).val = GibbsCertificateData.Part049.rows[j]'(by rw [len049]; exact hc) := by
  have p : 6272 + j - 4096 < 4096 := Rows.sub_lt_of_part 6272 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (6272 + j) h _ rfl
  have e := sel_gibbsGroup1 (6272 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 6272 j 4096 (by decide))).1 (Rows.lt_of_part 6272 j 128 8192 hc (by decide))) p)
  have e1 := ((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 6272 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 6272 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 6272 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 6272 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 6272 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 6272 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 6272 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 6272 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 6272 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 6272 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 6272 j 4096 1408 (by decide))).2 (Rows.not_lt_sub_of_part 6272 j 4096 1536 (by decide))).2 (Rows.not_lt_sub_of_part 6272 j 4096 1664 (by decide))).2 (Rows.not_lt_sub_of_part 6272 j 4096 1792 (by decide))).2 (Rows.not_lt_sub_of_part 6272 j 4096 1920 (by decide))).2 (Rows.not_lt_sub_of_part 6272 j 4096 2048 (by decide))).2 (Rows.not_lt_sub_of_part 6272 j 4096 2176 (by decide))).1 (Rows.lt_sub_of_part 6272 j 128 4096 2304 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 6272 j 4096 2176 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link049 : ∀ j < 128, Good (6272 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part049.rows.length := by rw [len049]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨6272 + j, h⟩).property
  rw [dispatch049 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound049.2 j hj')


end FKLBridge.Gibbs
