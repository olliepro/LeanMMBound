module

public import FKLBridge.Gibbs.Sel

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch090 (j : ℕ) (hc : j < 128) (h : 11520 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨11520 + j, h⟩).val = GibbsCertificateData.Part090.rows[j]'(by rw [len090]; exact hc) := by
  have p : 11520 + j - 8192 < 4096 := Rows.sub_lt_of_part 11520 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (11520 + j) h _ rfl
  have e := sel_gibbsGroup2 (11520 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 11520 j 4096 (by decide))).2 (Rows.not_lt_of_part 11520 j 8192 (by decide))).1 (Rows.lt_of_part 11520 j 128 12288 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 11520 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 1152 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 1408 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 1664 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 1920 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 2176 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 2432 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 2688 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 2944 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 3072 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 3200 (by decide))).2 (Rows.not_lt_sub_of_part 11520 j 8192 3328 (by decide))).1 (Rows.lt_sub_of_part 11520 j 128 8192 3456 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 11520 j 8192 3328 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link090 : ∀ j < 128, Good (11520 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part090.rows.length := by rw [len090]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨11520 + j, h⟩).property
  rw [dispatch090 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound090.2 j hj')

theorem dispatch091 (j : ℕ) (hc : j < 128) (h : 11648 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨11648 + j, h⟩).val = GibbsCertificateData.Part091.rows[j]'(by rw [len091]; exact hc) := by
  have p : 11648 + j - 8192 < 4096 := Rows.sub_lt_of_part 11648 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (11648 + j) h _ rfl
  have e := sel_gibbsGroup2 (11648 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 11648 j 4096 (by decide))).2 (Rows.not_lt_of_part 11648 j 8192 (by decide))).1 (Rows.lt_of_part 11648 j 128 12288 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 11648 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 1152 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 1408 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 1664 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 1920 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 2176 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 2432 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 2688 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 2944 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 3072 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 3200 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 3328 (by decide))).2 (Rows.not_lt_sub_of_part 11648 j 8192 3456 (by decide))).1 (Rows.lt_sub_of_part 11648 j 128 8192 3584 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 11648 j 8192 3456 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link091 : ∀ j < 128, Good (11648 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part091.rows.length := by rw [len091]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨11648 + j, h⟩).property
  rw [dispatch091 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound091.2 j hj')

theorem dispatch092 (j : ℕ) (hc : j < 128) (h : 11776 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨11776 + j, h⟩).val = GibbsCertificateData.Part092.rows[j]'(by rw [len092]; exact hc) := by
  have p : 11776 + j - 8192 < 4096 := Rows.sub_lt_of_part 11776 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (11776 + j) h _ rfl
  have e := sel_gibbsGroup2 (11776 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 11776 j 4096 (by decide))).2 (Rows.not_lt_of_part 11776 j 8192 (by decide))).1 (Rows.lt_of_part 11776 j 128 12288 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 11776 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 1152 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 1408 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 1664 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 1920 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 2176 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 2432 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 2688 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 2944 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 3072 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 3200 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 3328 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 3456 (by decide))).2 (Rows.not_lt_sub_of_part 11776 j 8192 3584 (by decide))).1 (Rows.lt_sub_of_part 11776 j 128 8192 3712 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 11776 j 8192 3584 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link092 : ∀ j < 128, Good (11776 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part092.rows.length := by rw [len092]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨11776 + j, h⟩).property
  rw [dispatch092 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound092.2 j hj')

theorem dispatch093 (j : ℕ) (hc : j < 128) (h : 11904 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨11904 + j, h⟩).val = GibbsCertificateData.Part093.rows[j]'(by rw [len093]; exact hc) := by
  have p : 11904 + j - 8192 < 4096 := Rows.sub_lt_of_part 11904 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (11904 + j) h _ rfl
  have e := sel_gibbsGroup2 (11904 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 11904 j 4096 (by decide))).2 (Rows.not_lt_of_part 11904 j 8192 (by decide))).1 (Rows.lt_of_part 11904 j 128 12288 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 11904 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 1152 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 1408 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 1664 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 1920 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 2176 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 2432 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 2688 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 2944 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 3072 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 3200 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 3328 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 3456 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 3584 (by decide))).2 (Rows.not_lt_sub_of_part 11904 j 8192 3712 (by decide))).1 (Rows.lt_sub_of_part 11904 j 128 8192 3840 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 11904 j 8192 3712 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link093 : ∀ j < 128, Good (11904 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part093.rows.length := by rw [len093]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨11904 + j, h⟩).property
  rw [dispatch093 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound093.2 j hj')

theorem dispatch094 (j : ℕ) (hc : j < 128) (h : 12032 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨12032 + j, h⟩).val = GibbsCertificateData.Part094.rows[j]'(by rw [len094]; exact hc) := by
  have p : 12032 + j - 8192 < 4096 := Rows.sub_lt_of_part 12032 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (12032 + j) h _ rfl
  have e := sel_gibbsGroup2 (12032 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 12032 j 4096 (by decide))).2 (Rows.not_lt_of_part 12032 j 8192 (by decide))).1 (Rows.lt_of_part 12032 j 128 12288 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 12032 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 1152 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 1408 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 1664 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 1920 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 2176 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 2432 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 2688 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 2944 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 3072 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 3200 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 3328 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 3456 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 3584 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 3712 (by decide))).2 (Rows.not_lt_sub_of_part 12032 j 8192 3840 (by decide))).1 (Rows.lt_sub_of_part 12032 j 128 8192 3968 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 12032 j 8192 3840 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link094 : ∀ j < 128, Good (12032 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part094.rows.length := by rw [len094]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨12032 + j, h⟩).property
  rw [dispatch094 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound094.2 j hj')

theorem dispatch095 (j : ℕ) (hc : j < 128) (h : 12160 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨12160 + j, h⟩).val = GibbsCertificateData.Part095.rows[j]'(by rw [len095]; exact hc) := by
  have p : 12160 + j - 8192 < 4096 := Rows.sub_lt_of_part 12160 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (12160 + j) h _ rfl
  have e := sel_gibbsGroup2 (12160 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 12160 j 4096 (by decide))).2 (Rows.not_lt_of_part 12160 j 8192 (by decide))).1 (Rows.lt_of_part 12160 j 128 12288 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 12160 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 1152 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 1408 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 1664 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 1920 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 2176 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 2432 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 2688 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 2944 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 3072 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 3200 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 3328 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 3456 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 3584 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 3712 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 3840 (by decide))).2 (Rows.not_lt_sub_of_part 12160 j 8192 3968 (by decide)))
  rw [Rows.sub_sub_part 12160 j 8192 3968 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link095 : ∀ j < 128, Good (12160 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part095.rows.length := by rw [len095]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨12160 + j, h⟩).property
  rw [dispatch095 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound095.2 j hj')

theorem dispatch096 (j : ℕ) (hc : j < 128) (h : 12288 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨12288 + j, h⟩).val = GibbsCertificateData.Part096.rows[j]'(by rw [len096]; exact hc) := by
  have p : 12288 + j - 12288 < 4096 := Rows.sub_lt_of_part 12288 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (12288 + j) h _ rfl
  have e := sel_gibbsGroup3 (12288 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 12288 j 4096 (by decide))).2 (Rows.not_lt_of_part 12288 j 8192 (by decide))).2 (Rows.not_lt_of_part 12288 j 12288 (by decide))).1 (Rows.lt_of_part 12288 j 128 16384 hc (by decide))) p)
  have e1 := (e.1 (Rows.lt_sub_of_part 12288 j 128 12288 128 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 12288 j 12288 0 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link096 : ∀ j < 128, Good (12288 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part096.rows.length := by rw [len096]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨12288 + j, h⟩).property
  rw [dispatch096 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound096.2 j hj')

theorem dispatch097 (j : ℕ) (hc : j < 128) (h : 12416 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨12416 + j, h⟩).val = GibbsCertificateData.Part097.rows[j]'(by rw [len097]; exact hc) := by
  have p : 12416 + j - 12288 < 4096 := Rows.sub_lt_of_part 12416 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (12416 + j) h _ rfl
  have e := sel_gibbsGroup3 (12416 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 12416 j 4096 (by decide))).2 (Rows.not_lt_of_part 12416 j 8192 (by decide))).2 (Rows.not_lt_of_part 12416 j 12288 (by decide))).1 (Rows.lt_of_part 12416 j 128 16384 hc (by decide))) p)
  have e1 := ((e.2 (Rows.not_lt_sub_of_part 12416 j 12288 128 (by decide))).1 (Rows.lt_sub_of_part 12416 j 128 12288 256 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 12416 j 12288 128 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link097 : ∀ j < 128, Good (12416 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part097.rows.length := by rw [len097]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨12416 + j, h⟩).property
  rw [dispatch097 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound097.2 j hj')

theorem dispatch098 (j : ℕ) (hc : j < 128) (h : 12544 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨12544 + j, h⟩).val = GibbsCertificateData.Part098.rows[j]'(by rw [len098]; exact hc) := by
  have p : 12544 + j - 12288 < 4096 := Rows.sub_lt_of_part 12544 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (12544 + j) h _ rfl
  have e := sel_gibbsGroup3 (12544 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 12544 j 4096 (by decide))).2 (Rows.not_lt_of_part 12544 j 8192 (by decide))).2 (Rows.not_lt_of_part 12544 j 12288 (by decide))).1 (Rows.lt_of_part 12544 j 128 16384 hc (by decide))) p)
  have e1 := (((e.2 (Rows.not_lt_sub_of_part 12544 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 12544 j 12288 256 (by decide))).1 (Rows.lt_sub_of_part 12544 j 128 12288 384 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 12544 j 12288 256 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link098 : ∀ j < 128, Good (12544 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part098.rows.length := by rw [len098]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨12544 + j, h⟩).property
  rw [dispatch098 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound098.2 j hj')

theorem dispatch099 (j : ℕ) (hc : j < 128) (h : 12672 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨12672 + j, h⟩).val = GibbsCertificateData.Part099.rows[j]'(by rw [len099]; exact hc) := by
  have p : 12672 + j - 12288 < 4096 := Rows.sub_lt_of_part 12672 j 128 12288 4096 hc (by decide) (by decide)
  have e0 := sel_top (12672 + j) h _ rfl
  have e := sel_gibbsGroup3 (12672 + j - 12288) p _ (((((e0.2 (Rows.not_lt_of_part 12672 j 4096 (by decide))).2 (Rows.not_lt_of_part 12672 j 8192 (by decide))).2 (Rows.not_lt_of_part 12672 j 12288 (by decide))).1 (Rows.lt_of_part 12672 j 128 16384 hc (by decide))) p)
  have e1 := ((((e.2 (Rows.not_lt_sub_of_part 12672 j 12288 128 (by decide))).2 (Rows.not_lt_sub_of_part 12672 j 12288 256 (by decide))).2 (Rows.not_lt_sub_of_part 12672 j 12288 384 (by decide))).1 (Rows.lt_sub_of_part 12672 j 128 12288 512 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 12672 j 12288 384 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link099 : ∀ j < 128, Good (12672 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part099.rows.length := by rw [len099]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨12672 + j, h⟩).property
  rw [dispatch099 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound099.2 j hj')


end FKLBridge.Gibbs
