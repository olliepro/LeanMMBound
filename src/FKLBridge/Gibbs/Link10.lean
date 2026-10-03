module

public import FKLBridge.Gibbs.Sel

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch100 (j : ℕ) (hc : j < 128) (h : 12800 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨12800 + j, h⟩).val = GibbsCertificateData.Part100.rows[j]'(by rw [len100]; exact hc) := by
  have p : 12800 + j - 12288 < 4096 := Rows.sub_lt_of_part 12800 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (12800 + j) h _ rfl
  have e := sel_gibbsGroup3 (12800 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 12800 j 4096 (by decide))).2 (Rows.not_lt_of_part 12800 j 8192 (by decide))).2 (Rows.not_lt_of_part 12800 j 12288 (by decide))).1 (Rows.lt_of_part 12800 j 128 16384 hc (by decide))) p)
  have e1 := (((((e.2 (Rows.not_lt_sub_of_part 12800 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 12800 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 12800 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 12800 j 12288 512 (by decide))).1 (Rows.lt_sub_of_part 12800 j 128 12288 640 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 12800 j 12288 512 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link100 : ∀ j < 128, Good (12800 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part100.rows.length := by rw [len100]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨12800 + j, h⟩).property
  rw [dispatch100 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound100.2 j hj')

theorem dispatch101 (j : ℕ) (hc : j < 128) (h : 12928 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨12928 + j, h⟩).val = GibbsCertificateData.Part101.rows[j]'(by rw [len101]; exact hc) := by
  have p : 12928 + j - 12288 < 4096 := Rows.sub_lt_of_part 12928 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (12928 + j) h _ rfl
  have e := sel_gibbsGroup3 (12928 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 12928 j 4096 (by decide))).2 (Rows.not_lt_of_part 12928 j 8192 (by decide))).2 (Rows.not_lt_of_part 12928 j 12288 (by decide))).1 (Rows.lt_of_part 12928 j 128 16384 hc (by decide))) p)
  have e1 := ((((((e.2 (Rows.not_lt_sub_of_part 12928 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 12928 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 12928 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 12928 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 12928 j 12288 640 (by decide))).1 (Rows.lt_sub_of_part 12928 j 128 12288 768 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 12928 j 12288 640 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link101 : ∀ j < 128, Good (12928 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part101.rows.length := by rw [len101]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨12928 + j, h⟩).property
  rw [dispatch101 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound101.2 j hj')

theorem dispatch102 (j : ℕ) (hc : j < 128) (h : 13056 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨13056 + j, h⟩).val = GibbsCertificateData.Part102.rows[j]'(by rw [len102]; exact hc) := by
  have p : 13056 + j - 12288 < 4096 := Rows.sub_lt_of_part 13056 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (13056 + j) h _ rfl
  have e := sel_gibbsGroup3 (13056 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 13056 j 4096 (by decide))).2 (Rows.not_lt_of_part 13056 j 8192 (by decide))).2 (Rows.not_lt_of_part 13056 j 12288 (by decide))).1 (Rows.lt_of_part 13056 j 128 16384 hc (by decide))) p)
  have e1 := (((((((e.2 (Rows.not_lt_sub_of_part 13056 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 13056 j 12288 768 (by decide))).1 (Rows.lt_sub_of_part 13056 j 128 12288 896 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 13056 j 12288 768 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link102 : ∀ j < 128, Good (13056 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part102.rows.length := by rw [len102]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨13056 + j, h⟩).property
  rw [dispatch102 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound102.2 j hj')

theorem dispatch103 (j : ℕ) (hc : j < 128) (h : 13184 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨13184 + j, h⟩).val = GibbsCertificateData.Part103.rows[j]'(by rw [len103]; exact hc) := by
  have p : 13184 + j - 12288 < 4096 := Rows.sub_lt_of_part 13184 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (13184 + j) h _ rfl
  have e := sel_gibbsGroup3 (13184 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 13184 j 4096 (by decide))).2 (Rows.not_lt_of_part 13184 j 8192 (by decide))).2 (Rows.not_lt_of_part 13184 j 12288 (by decide))).1 (Rows.lt_of_part 13184 j 128 16384 hc (by decide))) p)
  have e1 := ((((((((e.2 (Rows.not_lt_sub_of_part 13184 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 13184 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 13184 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 13184 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 13184 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 13184 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 13184 j 12288 896 (by decide))).1 (Rows.lt_sub_of_part 13184 j 128 12288 1024 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 13184 j 12288 896 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link103 : ∀ j < 128, Good (13184 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part103.rows.length := by rw [len103]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨13184 + j, h⟩).property
  rw [dispatch103 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound103.2 j hj')

theorem dispatch104 (j : ℕ) (hc : j < 128) (h : 13312 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨13312 + j, h⟩).val = GibbsCertificateData.Part104.rows[j]'(by rw [len104]; exact hc) := by
  have p : 13312 + j - 12288 < 4096 := Rows.sub_lt_of_part 13312 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (13312 + j) h _ rfl
  have e := sel_gibbsGroup3 (13312 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 13312 j 4096 (by decide))).2 (Rows.not_lt_of_part 13312 j 8192 (by decide))).2 (Rows.not_lt_of_part 13312 j 12288 (by decide))).1 (Rows.lt_of_part 13312 j 128 16384 hc (by decide))) p)
  have e1 := (((((((((e.2 (Rows.not_lt_sub_of_part 13312 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 13312 j 12288 1024 (by decide))).1 (Rows.lt_sub_of_part 13312 j 128 12288 1152 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 13312 j 12288 1024 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link104 : ∀ j < 128, Good (13312 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part104.rows.length := by rw [len104]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨13312 + j, h⟩).property
  rw [dispatch104 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound104.2 j hj')

theorem dispatch105 (j : ℕ) (hc : j < 128) (h : 13440 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨13440 + j, h⟩).val = GibbsCertificateData.Part105.rows[j]'(by rw [len105]; exact hc) := by
  have p : 13440 + j - 12288 < 4096 := Rows.sub_lt_of_part 13440 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (13440 + j) h _ rfl
  have e := sel_gibbsGroup3 (13440 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 13440 j 4096 (by decide))).2 (Rows.not_lt_of_part 13440 j 8192 (by decide))).2 (Rows.not_lt_of_part 13440 j 12288 (by decide))).1 (Rows.lt_of_part 13440 j 128 16384 hc (by decide))) p)
  have e1 := ((((((((((e.2 (Rows.not_lt_sub_of_part 13440 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 13440 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 13440 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 13440 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 13440 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 13440 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 13440 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 13440 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 13440 j 12288 1152 (by decide))).1 (Rows.lt_sub_of_part 13440 j 128 12288 1280 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 13440 j 12288 1152 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link105 : ∀ j < 128, Good (13440 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part105.rows.length := by rw [len105]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨13440 + j, h⟩).property
  rw [dispatch105 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound105.2 j hj')

theorem dispatch106 (j : ℕ) (hc : j < 128) (h : 13568 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨13568 + j, h⟩).val = GibbsCertificateData.Part106.rows[j]'(by rw [len106]; exact hc) := by
  have p : 13568 + j - 12288 < 4096 := Rows.sub_lt_of_part 13568 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (13568 + j) h _ rfl
  have e := sel_gibbsGroup3 (13568 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 13568 j 4096 (by decide))).2 (Rows.not_lt_of_part 13568 j 8192 (by decide))).2 (Rows.not_lt_of_part 13568 j 12288 (by decide))).1 (Rows.lt_of_part 13568 j 128 16384 hc (by decide))) p)
  have e1 := (((((((((((e.2 (Rows.not_lt_sub_of_part 13568 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 12288 1152 (by decide))).2 (Rows.not_lt_sub_of_part 13568 j 12288 1280 (by decide))).1 (Rows.lt_sub_of_part 13568 j 128 12288 1408 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 13568 j 12288 1280 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link106 : ∀ j < 128, Good (13568 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part106.rows.length := by rw [len106]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨13568 + j, h⟩).property
  rw [dispatch106 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound106.2 j hj')

theorem dispatch107 (j : ℕ) (hc : j < 128) (h : 13696 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨13696 + j, h⟩).val = GibbsCertificateData.Part107.rows[j]'(by rw [len107]; exact hc) := by
  have p : 13696 + j - 12288 < 4096 := Rows.sub_lt_of_part 13696 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (13696 + j) h _ rfl
  have e := sel_gibbsGroup3 (13696 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 13696 j 4096 (by decide))).2 (Rows.not_lt_of_part 13696 j 8192 (by decide))).2 (Rows.not_lt_of_part 13696 j 12288 (by decide))).1 (Rows.lt_of_part 13696 j 128 16384 hc (by decide))) p)
  have e1 := ((((((((((((e.2 (Rows.not_lt_sub_of_part 13696 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 13696 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 13696 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 13696 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 13696 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 13696 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 13696 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 13696 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 13696 j 12288 1152 (by decide))).2 (Rows.not_lt_sub_of_part 13696 j 12288 1280 (by decide))).2 (Rows.not_lt_sub_of_part 13696 j 12288 1408 (by decide))).1 (Rows.lt_sub_of_part 13696 j 128 12288 1536 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 13696 j 12288 1408 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link107 : ∀ j < 128, Good (13696 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part107.rows.length := by rw [len107]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨13696 + j, h⟩).property
  rw [dispatch107 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound107.2 j hj')

theorem dispatch108 (j : ℕ) (hc : j < 128) (h : 13824 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨13824 + j, h⟩).val = GibbsCertificateData.Part108.rows[j]'(by rw [len108]; exact hc) := by
  have p : 13824 + j - 12288 < 4096 := Rows.sub_lt_of_part 13824 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (13824 + j) h _ rfl
  have e := sel_gibbsGroup3 (13824 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 13824 j 4096 (by decide))).2 (Rows.not_lt_of_part 13824 j 8192 (by decide))).2 (Rows.not_lt_of_part 13824 j 12288 (by decide))).1 (Rows.lt_of_part 13824 j 128 16384 hc (by decide))) p)
  have e1 := (((((((((((((e.2 (Rows.not_lt_sub_of_part 13824 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 12288 1152 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 12288 1280 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 12288 1408 (by decide))).2 (Rows.not_lt_sub_of_part 13824 j 12288 1536 (by decide))).1 (Rows.lt_sub_of_part 13824 j 128 12288 1664 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 13824 j 12288 1536 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link108 : ∀ j < 128, Good (13824 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part108.rows.length := by rw [len108]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨13824 + j, h⟩).property
  rw [dispatch108 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound108.2 j hj')

theorem dispatch109 (j : ℕ) (hc : j < 128) (h : 13952 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨13952 + j, h⟩).val = GibbsCertificateData.Part109.rows[j]'(by rw [len109]; exact hc) := by
  have p : 13952 + j - 12288 < 4096 := Rows.sub_lt_of_part 13952 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (13952 + j) h _ rfl
  have e := sel_gibbsGroup3 (13952 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 13952 j 4096 (by decide))).2 (Rows.not_lt_of_part 13952 j 8192 (by decide))).2 (Rows.not_lt_of_part 13952 j 12288 (by decide))).1 (Rows.lt_of_part 13952 j 128 16384 hc (by decide))) p)
  have e1 := ((((((((((((((e.2 (Rows.not_lt_sub_of_part 13952 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 13952 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 13952 j 12288 384 (by decide))).2 (Rows.not_lt_sub_of_part 13952 j 12288 512 (by decide))).2 (Rows.not_lt_sub_of_part 13952 j 12288 640 (by decide))).2 (Rows.not_lt_sub_of_part 13952 j 12288 768 (by decide))).2 (Rows.not_lt_sub_of_part 13952 j 12288 896 (by decide))).2 (Rows.not_lt_sub_of_part 13952 j 12288 1024 (by decide))).2 (Rows.not_lt_sub_of_part 13952 j 12288 1152 (by decide))).2 (Rows.not_lt_sub_of_part 13952 j 12288 1280 (by decide))).2 (Rows.not_lt_sub_of_part 13952 j 12288 1408 (by decide))).2 (Rows.not_lt_sub_of_part 13952 j 12288 1536 (by decide))).2 (Rows.not_lt_sub_of_part 13952 j 12288 1664 (by decide))).1 (Rows.lt_sub_of_part 13952 j 128 12288 1792 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 13952 j 12288 1664 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link109 : ∀ j < 128, Good (13952 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part109.rows.length := by rw [len109]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨13952 + j, h⟩).property
  rw [dispatch109 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound109.2 j hj')


end FKLBridge.Gibbs
