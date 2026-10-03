module

public import FKLBridge.Gibbs.Sel

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch050 (j : ℕ) (hc : j < 128) (h : 6400 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨6400 + j, h⟩).val = GibbsCertificateData.Part050.rows[j]'(by rw [len050]; exact hc) := by
  have p : 6400 + j - 4096 < 4096 := Rows.sub_lt_of_part 6400 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (6400 + j) h _ rfl
  have e := sel_gibbsGroup1 (6400 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 6400 j 4096 (by decide))).1 (Rows.lt_of_part 6400 j 128 8192 hc (by decide))) p)
  have e1 := (((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 6400 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 4096 1408 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 4096 1536 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 4096 1664 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 4096 1792 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 4096 1920 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 4096 2048 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 4096 2176 (by decide))).2 (Rows.not_lt_sub_of_part 6400 j 4096 2304 (by decide))).1 (Rows.lt_sub_of_part 6400 j 128 4096 2432 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 6400 j 4096 2304 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link050 : ∀ j < 128, Good (6400 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part050.rows.length := by rw [len050]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨6400 + j, h⟩).property
  rw [dispatch050 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound050.2 j hj')

theorem dispatch051 (j : ℕ) (hc : j < 128) (h : 6528 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨6528 + j, h⟩).val = GibbsCertificateData.Part051.rows[j]'(by rw [len051]; exact hc) := by
  have p : 6528 + j - 4096 < 4096 := Rows.sub_lt_of_part 6528 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (6528 + j) h _ rfl
  have e := sel_gibbsGroup1 (6528 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 6528 j 4096 (by decide))).1 (Rows.lt_of_part 6528 j 128 8192 hc (by decide))) p)
  have e1 := ((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 6528 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 6528 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 6528 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 6528 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 6528 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 6528 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 6528 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 6528 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 6528 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 6528 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 6528 j 4096 1408 (by decide))).2 (Rows.not_lt_sub_of_part 6528 j 4096 1536 (by decide))).2 (Rows.not_lt_sub_of_part 6528 j 4096 1664 (by decide))).2 (Rows.not_lt_sub_of_part 6528 j 4096 1792 (by decide))).2 (Rows.not_lt_sub_of_part 6528 j 4096 1920 (by decide))).2 (Rows.not_lt_sub_of_part 6528 j 4096 2048 (by decide))).2 (Rows.not_lt_sub_of_part 6528 j 4096 2176 (by decide))).2 (Rows.not_lt_sub_of_part 6528 j 4096 2304 (by decide))).2 (Rows.not_lt_sub_of_part 6528 j 4096 2432 (by decide))).1 (Rows.lt_sub_of_part 6528 j 128 4096 2560 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 6528 j 4096 2432 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link051 : ∀ j < 128, Good (6528 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part051.rows.length := by rw [len051]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨6528 + j, h⟩).property
  rw [dispatch051 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound051.2 j hj')

theorem dispatch052 (j : ℕ) (hc : j < 128) (h : 6656 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨6656 + j, h⟩).val = GibbsCertificateData.Part052.rows[j]'(by rw [len052]; exact hc) := by
  have p : 6656 + j - 4096 < 4096 := Rows.sub_lt_of_part 6656 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (6656 + j) h _ rfl
  have e := sel_gibbsGroup1 (6656 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 6656 j 4096 (by decide))).1 (Rows.lt_of_part 6656 j 128 8192 hc (by decide))) p)
  have e1 := (((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 6656 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 4096 1408 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 4096 1536 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 4096 1664 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 4096 1792 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 4096 1920 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 4096 2048 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 4096 2176 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 4096 2304 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 4096 2432 (by decide))).2 (Rows.not_lt_sub_of_part 6656 j 4096 2560 (by decide))).1 (Rows.lt_sub_of_part 6656 j 128 4096 2688 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 6656 j 4096 2560 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link052 : ∀ j < 128, Good (6656 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part052.rows.length := by rw [len052]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨6656 + j, h⟩).property
  rw [dispatch052 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound052.2 j hj')

theorem dispatch053 (j : ℕ) (hc : j < 128) (h : 6784 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨6784 + j, h⟩).val = GibbsCertificateData.Part053.rows[j]'(by rw [len053]; exact hc) := by
  have p : 6784 + j - 4096 < 4096 := Rows.sub_lt_of_part 6784 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (6784 + j) h _ rfl
  have e := sel_gibbsGroup1 (6784 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 6784 j 4096 (by decide))).1 (Rows.lt_of_part 6784 j 128 8192 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 6784 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 6784 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 6784 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 6784 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 6784 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 6784 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 6784 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 6784 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 6784 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 6784 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 6784 j 4096 1408 (by decide))).2 (Rows.not_lt_sub_of_part 6784 j 4096 1536 (by decide))).2 (Rows.not_lt_sub_of_part 6784 j 4096 1664 (by decide))).2 (Rows.not_lt_sub_of_part 6784 j 4096 1792 (by decide))).2 (Rows.not_lt_sub_of_part 6784 j 4096 1920 (by decide))).2 (Rows.not_lt_sub_of_part 6784 j 4096 2048 (by decide))).2 (Rows.not_lt_sub_of_part 6784 j 4096 2176 (by decide))).2 (Rows.not_lt_sub_of_part 6784 j 4096 2304 (by decide))).2 (Rows.not_lt_sub_of_part 6784 j 4096 2432 (by decide))).2 (Rows.not_lt_sub_of_part 6784 j 4096 2560 (by decide))).2 (Rows.not_lt_sub_of_part 6784 j 4096 2688 (by decide))).1 (Rows.lt_sub_of_part 6784 j 128 4096 2816 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 6784 j 4096 2688 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link053 : ∀ j < 128, Good (6784 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part053.rows.length := by rw [len053]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨6784 + j, h⟩).property
  rw [dispatch053 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound053.2 j hj')

theorem dispatch054 (j : ℕ) (hc : j < 128) (h : 6912 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨6912 + j, h⟩).val = GibbsCertificateData.Part054.rows[j]'(by rw [len054]; exact hc) := by
  have p : 6912 + j - 4096 < 4096 := Rows.sub_lt_of_part 6912 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (6912 + j) h _ rfl
  have e := sel_gibbsGroup1 (6912 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 6912 j 4096 (by decide))).1 (Rows.lt_of_part 6912 j 128 8192 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 6912 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 4096 1408 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 4096 1536 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 4096 1664 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 4096 1792 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 4096 1920 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 4096 2048 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 4096 2176 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 4096 2304 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 4096 2432 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 4096 2560 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 4096 2688 (by decide))).2 (Rows.not_lt_sub_of_part 6912 j 4096 2816 (by decide))).1 (Rows.lt_sub_of_part 6912 j 128 4096 2944 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 6912 j 4096 2816 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link054 : ∀ j < 128, Good (6912 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part054.rows.length := by rw [len054]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨6912 + j, h⟩).property
  rw [dispatch054 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound054.2 j hj')

theorem dispatch055 (j : ℕ) (hc : j < 128) (h : 7040 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨7040 + j, h⟩).val = GibbsCertificateData.Part055.rows[j]'(by rw [len055]; exact hc) := by
  have p : 7040 + j - 4096 < 4096 := Rows.sub_lt_of_part 7040 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (7040 + j) h _ rfl
  have e := sel_gibbsGroup1 (7040 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 7040 j 4096 (by decide))).1 (Rows.lt_of_part 7040 j 128 8192 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 7040 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 7040 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 7040 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 7040 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 7040 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 7040 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 7040 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 7040 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 7040 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 7040 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 7040 j 4096 1408 (by decide))).2 (Rows.not_lt_sub_of_part 7040 j 4096 1536 (by decide))).2 (Rows.not_lt_sub_of_part 7040 j 4096 1664 (by decide))).2 (Rows.not_lt_sub_of_part 7040 j 4096 1792 (by decide))).2 (Rows.not_lt_sub_of_part 7040 j 4096 1920 (by decide))).2 (Rows.not_lt_sub_of_part 7040 j 4096 2048 (by decide))).2 (Rows.not_lt_sub_of_part 7040 j 4096 2176 (by decide))).2 (Rows.not_lt_sub_of_part 7040 j 4096 2304 (by decide))).2 (Rows.not_lt_sub_of_part 7040 j 4096 2432 (by decide))).2 (Rows.not_lt_sub_of_part 7040 j 4096 2560 (by decide))).2 (Rows.not_lt_sub_of_part 7040 j 4096 2688 (by decide))).2 (Rows.not_lt_sub_of_part 7040 j 4096 2816 (by decide))).2 (Rows.not_lt_sub_of_part 7040 j 4096 2944 (by decide))).1 (Rows.lt_sub_of_part 7040 j 128 4096 3072 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 7040 j 4096 2944 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link055 : ∀ j < 128, Good (7040 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part055.rows.length := by rw [len055]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨7040 + j, h⟩).property
  rw [dispatch055 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound055.2 j hj')

theorem dispatch056 (j : ℕ) (hc : j < 128) (h : 7168 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨7168 + j, h⟩).val = GibbsCertificateData.Part056.rows[j]'(by rw [len056]; exact hc) := by
  have p : 7168 + j - 4096 < 4096 := Rows.sub_lt_of_part 7168 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (7168 + j) h _ rfl
  have e := sel_gibbsGroup1 (7168 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 7168 j 4096 (by decide))).1 (Rows.lt_of_part 7168 j 128 8192 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 7168 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 1408 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 1536 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 1664 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 1792 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 1920 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 2048 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 2176 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 2304 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 2432 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 2560 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 2688 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 2816 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 2944 (by decide))).2 (Rows.not_lt_sub_of_part 7168 j 4096 3072 (by decide))).1 (Rows.lt_sub_of_part 7168 j 128 4096 3200 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 7168 j 4096 3072 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link056 : ∀ j < 128, Good (7168 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part056.rows.length := by rw [len056]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨7168 + j, h⟩).property
  rw [dispatch056 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound056.2 j hj')

theorem dispatch057 (j : ℕ) (hc : j < 128) (h : 7296 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨7296 + j, h⟩).val = GibbsCertificateData.Part057.rows[j]'(by rw [len057]; exact hc) := by
  have p : 7296 + j - 4096 < 4096 := Rows.sub_lt_of_part 7296 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (7296 + j) h _ rfl
  have e := sel_gibbsGroup1 (7296 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 7296 j 4096 (by decide))).1 (Rows.lt_of_part 7296 j 128 8192 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 7296 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 1408 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 1536 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 1664 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 1792 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 1920 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 2048 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 2176 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 2304 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 2432 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 2560 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 2688 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 2816 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 2944 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 3072 (by decide))).2 (Rows.not_lt_sub_of_part 7296 j 4096 3200 (by decide))).1 (Rows.lt_sub_of_part 7296 j 128 4096 3328 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 7296 j 4096 3200 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link057 : ∀ j < 128, Good (7296 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part057.rows.length := by rw [len057]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨7296 + j, h⟩).property
  rw [dispatch057 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound057.2 j hj')

theorem dispatch058 (j : ℕ) (hc : j < 128) (h : 7424 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨7424 + j, h⟩).val = GibbsCertificateData.Part058.rows[j]'(by rw [len058]; exact hc) := by
  have p : 7424 + j - 4096 < 4096 := Rows.sub_lt_of_part 7424 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (7424 + j) h _ rfl
  have e := sel_gibbsGroup1 (7424 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 7424 j 4096 (by decide))).1 (Rows.lt_of_part 7424 j 128 8192 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 7424 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 1408 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 1536 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 1664 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 1792 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 1920 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 2048 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 2176 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 2304 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 2432 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 2560 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 2688 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 2816 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 2944 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 3072 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 3200 (by decide))).2 (Rows.not_lt_sub_of_part 7424 j 4096 3328 (by decide))).1 (Rows.lt_sub_of_part 7424 j 128 4096 3456 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 7424 j 4096 3328 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link058 : ∀ j < 128, Good (7424 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part058.rows.length := by rw [len058]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨7424 + j, h⟩).property
  rw [dispatch058 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound058.2 j hj')

theorem dispatch059 (j : ℕ) (hc : j < 128) (h : 7552 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨7552 + j, h⟩).val = GibbsCertificateData.Part059.rows[j]'(by rw [len059]; exact hc) := by
  have p : 7552 + j - 4096 < 4096 := Rows.sub_lt_of_part 7552 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (7552 + j) h _ rfl
  have e := sel_gibbsGroup1 (7552 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 7552 j 4096 (by decide))).1 (Rows.lt_of_part 7552 j 128 8192 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 7552 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 896 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 1024 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 1152 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 1280 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 1408 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 1536 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 1664 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 1792 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 1920 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 2048 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 2176 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 2304 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 2432 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 2560 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 2688 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 2816 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 2944 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 3072 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 3200 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 3328 (by decide))).2 (Rows.not_lt_sub_of_part 7552 j 4096 3456 (by decide))).1 (Rows.lt_sub_of_part 7552 j 128 4096 3584 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 7552 j 4096 3456 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link059 : ∀ j < 128, Good (7552 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part059.rows.length := by rw [len059]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨7552 + j, h⟩).property
  rw [dispatch059 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound059.2 j hj')


end FKLBridge.Gibbs
