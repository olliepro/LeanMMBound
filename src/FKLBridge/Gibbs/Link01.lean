module

public import FKLBridge.Gibbs.Sel

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch010 (j : ℕ) (hc : j < 128) (h : 1280 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨1280 + j, h⟩).val = GibbsCertificateData.Part010.rows[j]'(by rw [len010]; exact hc) := by
  have p : 1280 + j - 0 < 4096 := Rows.sub_lt_of_part 1280 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (1280 + j) h _ rfl
  have e := sel_gibbsGroup0 (1280 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1280 j 128 4096 hc (by decide))) p)
  have e1 := (((((((((((e.2 (Rows.not_lt_sub_of_part 1280 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 1280 j 0 1280 (by decide))).1 (Rows.lt_sub_of_part 1280 j 128 0 1408 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1280 j 0 1280 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link010 : ∀ j < 128, Good (1280 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part010.rows.length := by rw [len010]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨1280 + j, h⟩).property
  rw [dispatch010 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound010.2 j hj')

theorem dispatch011 (j : ℕ) (hc : j < 128) (h : 1408 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨1408 + j, h⟩).val = GibbsCertificateData.Part011.rows[j]'(by rw [len011]; exact hc) := by
  have p : 1408 + j - 0 < 4096 := Rows.sub_lt_of_part 1408 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (1408 + j) h _ rfl
  have e := sel_gibbsGroup0 (1408 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1408 j 128 4096 hc (by decide))) p)
  have e1 := ((((((((((((e.2 (Rows.not_lt_sub_of_part 1408 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 1408 j 0 1408 (by decide))).1 (Rows.lt_sub_of_part 1408 j 128 0 1536 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1408 j 0 1408 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link011 : ∀ j < 128, Good (1408 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part011.rows.length := by rw [len011]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨1408 + j, h⟩).property
  rw [dispatch011 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound011.2 j hj')

theorem dispatch012 (j : ℕ) (hc : j < 128) (h : 1536 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨1536 + j, h⟩).val = GibbsCertificateData.Part012.rows[j]'(by rw [len012]; exact hc) := by
  have p : 1536 + j - 0 < 4096 := Rows.sub_lt_of_part 1536 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (1536 + j) h _ rfl
  have e := sel_gibbsGroup0 (1536 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1536 j 128 4096 hc (by decide))) p)
  have e1 := (((((((((((((e.2 (Rows.not_lt_sub_of_part 1536 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 1536 j 0 1536 (by decide))).1 (Rows.lt_sub_of_part 1536 j 128 0 1664 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1536 j 0 1536 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link012 : ∀ j < 128, Good (1536 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part012.rows.length := by rw [len012]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨1536 + j, h⟩).property
  rw [dispatch012 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound012.2 j hj')

theorem dispatch013 (j : ℕ) (hc : j < 128) (h : 1664 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨1664 + j, h⟩).val = GibbsCertificateData.Part013.rows[j]'(by rw [len013]; exact hc) := by
  have p : 1664 + j - 0 < 4096 := Rows.sub_lt_of_part 1664 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (1664 + j) h _ rfl
  have e := sel_gibbsGroup0 (1664 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1664 j 128 4096 hc (by decide))) p)
  have e1 := ((((((((((((((e.2 (Rows.not_lt_sub_of_part 1664 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 1664 j 0 1664 (by decide))).1 (Rows.lt_sub_of_part 1664 j 128 0 1792 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1664 j 0 1664 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link013 : ∀ j < 128, Good (1664 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part013.rows.length := by rw [len013]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨1664 + j, h⟩).property
  rw [dispatch013 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound013.2 j hj')

theorem dispatch014 (j : ℕ) (hc : j < 128) (h : 1792 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨1792 + j, h⟩).val = GibbsCertificateData.Part014.rows[j]'(by rw [len014]; exact hc) := by
  have p : 1792 + j - 0 < 4096 := Rows.sub_lt_of_part 1792 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (1792 + j) h _ rfl
  have e := sel_gibbsGroup0 (1792 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1792 j 128 4096 hc (by decide))) p)
  have e1 := (((((((((((((((e.2 (Rows.not_lt_sub_of_part 1792 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 1792 j 0 1792 (by decide))).1 (Rows.lt_sub_of_part 1792 j 128 0 1920 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1792 j 0 1792 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link014 : ∀ j < 128, Good (1792 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part014.rows.length := by rw [len014]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨1792 + j, h⟩).property
  rw [dispatch014 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound014.2 j hj')

theorem dispatch015 (j : ℕ) (hc : j < 128) (h : 1920 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨1920 + j, h⟩).val = GibbsCertificateData.Part015.rows[j]'(by rw [len015]; exact hc) := by
  have p : 1920 + j - 0 < 4096 := Rows.sub_lt_of_part 1920 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (1920 + j) h _ rfl
  have e := sel_gibbsGroup0 (1920 + j - 0) p _ ((e0.1 (Rows.lt_of_part 1920 j 128 4096 hc (by decide))) p)
  have e1 := ((((((((((((((((e.2 (Rows.not_lt_sub_of_part 1920 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 1920 j 0 1920 (by decide))).1 (Rows.lt_sub_of_part 1920 j 128 0 2048 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 1920 j 0 1920 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link015 : ∀ j < 128, Good (1920 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part015.rows.length := by rw [len015]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨1920 + j, h⟩).property
  rw [dispatch015 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound015.2 j hj')

theorem dispatch016 (j : ℕ) (hc : j < 128) (h : 2048 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨2048 + j, h⟩).val = GibbsCertificateData.Part016.rows[j]'(by rw [len016]; exact hc) := by
  have p : 2048 + j - 0 < 4096 := Rows.sub_lt_of_part 2048 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (2048 + j) h _ rfl
  have e := sel_gibbsGroup0 (2048 + j - 0) p _ ((e0.1 (Rows.lt_of_part 2048 j 128 4096 hc (by decide))) p)
  have e1 := (((((((((((((((((e.2 (Rows.not_lt_sub_of_part 2048 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 2048 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 2048 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 2048 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 2048 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 2048 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 2048 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 2048 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 2048 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 2048 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 2048 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 2048 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 2048 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 2048 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 2048 j 0 1920 (by decide))).2 (Rows.not_lt_sub_of_part 2048 j 0 2048 (by decide))).1 (Rows.lt_sub_of_part 2048 j 128 0 2176 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2048 j 0 2048 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link016 : ∀ j < 128, Good (2048 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part016.rows.length := by rw [len016]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨2048 + j, h⟩).property
  rw [dispatch016 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound016.2 j hj')

theorem dispatch017 (j : ℕ) (hc : j < 128) (h : 2176 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨2176 + j, h⟩).val = GibbsCertificateData.Part017.rows[j]'(by rw [len017]; exact hc) := by
  have p : 2176 + j - 0 < 4096 := Rows.sub_lt_of_part 2176 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (2176 + j) h _ rfl
  have e := sel_gibbsGroup0 (2176 + j - 0) p _ ((e0.1 (Rows.lt_of_part 2176 j 128 4096 hc (by decide))) p)
  have e1 := ((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 2176 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 2176 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 2176 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 2176 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 2176 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 2176 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 2176 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 2176 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 2176 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 2176 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 2176 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 2176 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 2176 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 2176 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 2176 j 0 1920 (by decide))).2 (Rows.not_lt_sub_of_part 2176 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 2176 j 0 2176 (by decide))).1 (Rows.lt_sub_of_part 2176 j 128 0 2304 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2176 j 0 2176 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link017 : ∀ j < 128, Good (2176 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part017.rows.length := by rw [len017]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨2176 + j, h⟩).property
  rw [dispatch017 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound017.2 j hj')

theorem dispatch018 (j : ℕ) (hc : j < 128) (h : 2304 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨2304 + j, h⟩).val = GibbsCertificateData.Part018.rows[j]'(by rw [len018]; exact hc) := by
  have p : 2304 + j - 0 < 4096 := Rows.sub_lt_of_part 2304 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (2304 + j) h _ rfl
  have e := sel_gibbsGroup0 (2304 + j - 0) p _ ((e0.1 (Rows.lt_of_part 2304 j 128 4096 hc (by decide))) p)
  have e1 := (((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 2304 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 1920 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 2176 (by decide))).2 (Rows.not_lt_sub_of_part 2304 j 0 2304 (by decide))).1 (Rows.lt_sub_of_part 2304 j 128 0 2432 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2304 j 0 2304 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link018 : ∀ j < 128, Good (2304 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part018.rows.length := by rw [len018]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨2304 + j, h⟩).property
  rw [dispatch018 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound018.2 j hj')

theorem dispatch019 (j : ℕ) (hc : j < 128) (h : 2432 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨2432 + j, h⟩).val = GibbsCertificateData.Part019.rows[j]'(by rw [len019]; exact hc) := by
  have p : 2432 + j - 0 < 4096 := Rows.sub_lt_of_part 2432 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (2432 + j) h _ rfl
  have e := sel_gibbsGroup0 (2432 + j - 0) p _ ((e0.1 (Rows.lt_of_part 2432 j 128 4096 hc (by decide))) p)
  have e1 := ((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 2432 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 0 1920 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 0 2176 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 2432 j 0 2432 (by decide))).1 (Rows.lt_sub_of_part 2432 j 128 0 2560 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 2432 j 0 2432 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link019 : ∀ j < 128, Good (2432 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part019.rows.length := by rw [len019]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨2432 + j, h⟩).property
  rw [dispatch019 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound019.2 j hj')


end FKLBridge.Gibbs
