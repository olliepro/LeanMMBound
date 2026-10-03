module

public import FKLBridge.Gibbs.Sel

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch080 (j : ℕ) (hc : j < 128) (h : 10240 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨10240 + j, h⟩).val = GibbsCertificateData.Part080.rows[j]'(by rw [len080]; exact hc) := by
  have p : 10240 + j - 8192 < 4096 := Rows.sub_lt_of_part 10240 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (10240 + j) h _ rfl
  have e := sel_gibbsGroup2 (10240 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 10240 j 4096 (by decide))).2 (Rows.not_lt_of_part 10240 j 8192 (by decide))).1 (Rows.lt_of_part 10240 j 128 12288 hc (by decide))) p)
  have e1 := (((((((((((((((((e.2 (Rows.not_lt_sub_of_part 10240 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 10240 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 10240 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 10240 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 10240 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 10240 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 10240 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 10240 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 10240 j 8192 1152 (by decide))).2 (Rows.not_lt_sub_of_part 10240 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 10240 j 8192 1408 (by decide))).2 (Rows.not_lt_sub_of_part 10240 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 10240 j 8192 1664 (by decide))).2 (Rows.not_lt_sub_of_part 10240 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 10240 j 8192 1920 (by decide))).2 (Rows.not_lt_sub_of_part 10240 j 8192 2048 (by decide))).1 (Rows.lt_sub_of_part 10240 j 128 8192 2176 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 10240 j 8192 2048 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link080 : ∀ j < 128, Good (10240 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part080.rows.length := by rw [len080]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨10240 + j, h⟩).property
  rw [dispatch080 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound080.2 j hj')

theorem dispatch081 (j : ℕ) (hc : j < 128) (h : 10368 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨10368 + j, h⟩).val = GibbsCertificateData.Part081.rows[j]'(by rw [len081]; exact hc) := by
  have p : 10368 + j - 8192 < 4096 := Rows.sub_lt_of_part 10368 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (10368 + j) h _ rfl
  have e := sel_gibbsGroup2 (10368 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 10368 j 4096 (by decide))).2 (Rows.not_lt_of_part 10368 j 8192 (by decide))).1 (Rows.lt_of_part 10368 j 128 12288 hc (by decide))) p)
  have e1 := ((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 10368 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 10368 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 10368 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 10368 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 10368 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 10368 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 10368 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 10368 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 10368 j 8192 1152 (by decide))).2 (Rows.not_lt_sub_of_part 10368 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 10368 j 8192 1408 (by decide))).2 (Rows.not_lt_sub_of_part 10368 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 10368 j 8192 1664 (by decide))).2 (Rows.not_lt_sub_of_part 10368 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 10368 j 8192 1920 (by decide))).2 (Rows.not_lt_sub_of_part 10368 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 10368 j 8192 2176 (by decide))).1 (Rows.lt_sub_of_part 10368 j 128 8192 2304 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 10368 j 8192 2176 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link081 : ∀ j < 128, Good (10368 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part081.rows.length := by rw [len081]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨10368 + j, h⟩).property
  rw [dispatch081 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound081.2 j hj')

theorem dispatch082 (j : ℕ) (hc : j < 128) (h : 10496 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨10496 + j, h⟩).val = GibbsCertificateData.Part082.rows[j]'(by rw [len082]; exact hc) := by
  have p : 10496 + j - 8192 < 4096 := Rows.sub_lt_of_part 10496 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (10496 + j) h _ rfl
  have e := sel_gibbsGroup2 (10496 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 10496 j 4096 (by decide))).2 (Rows.not_lt_of_part 10496 j 8192 (by decide))).1 (Rows.lt_of_part 10496 j 128 12288 hc (by decide))) p)
  have e1 := (((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 10496 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 1152 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 1408 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 1664 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 1920 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 2176 (by decide))).2 (Rows.not_lt_sub_of_part 10496 j 8192 2304 (by decide))).1 (Rows.lt_sub_of_part 10496 j 128 8192 2432 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 10496 j 8192 2304 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link082 : ∀ j < 128, Good (10496 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part082.rows.length := by rw [len082]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨10496 + j, h⟩).property
  rw [dispatch082 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound082.2 j hj')

theorem dispatch083 (j : ℕ) (hc : j < 128) (h : 10624 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨10624 + j, h⟩).val = GibbsCertificateData.Part083.rows[j]'(by rw [len083]; exact hc) := by
  have p : 10624 + j - 8192 < 4096 := Rows.sub_lt_of_part 10624 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (10624 + j) h _ rfl
  have e := sel_gibbsGroup2 (10624 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 10624 j 4096 (by decide))).2 (Rows.not_lt_of_part 10624 j 8192 (by decide))).1 (Rows.lt_of_part 10624 j 128 12288 hc (by decide))) p)
  have e1 := ((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 10624 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 10624 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 10624 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 10624 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 10624 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 10624 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 10624 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 10624 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 10624 j 8192 1152 (by decide))).2 (Rows.not_lt_sub_of_part 10624 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 10624 j 8192 1408 (by decide))).2 (Rows.not_lt_sub_of_part 10624 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 10624 j 8192 1664 (by decide))).2 (Rows.not_lt_sub_of_part 10624 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 10624 j 8192 1920 (by decide))).2 (Rows.not_lt_sub_of_part 10624 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 10624 j 8192 2176 (by decide))).2 (Rows.not_lt_sub_of_part 10624 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 10624 j 8192 2432 (by decide))).1 (Rows.lt_sub_of_part 10624 j 128 8192 2560 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 10624 j 8192 2432 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link083 : ∀ j < 128, Good (10624 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part083.rows.length := by rw [len083]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨10624 + j, h⟩).property
  rw [dispatch083 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound083.2 j hj')

theorem dispatch084 (j : ℕ) (hc : j < 128) (h : 10752 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨10752 + j, h⟩).val = GibbsCertificateData.Part084.rows[j]'(by rw [len084]; exact hc) := by
  have p : 10752 + j - 8192 < 4096 := Rows.sub_lt_of_part 10752 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (10752 + j) h _ rfl
  have e := sel_gibbsGroup2 (10752 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 10752 j 4096 (by decide))).2 (Rows.not_lt_of_part 10752 j 8192 (by decide))).1 (Rows.lt_of_part 10752 j 128 12288 hc (by decide))) p)
  have e1 := (((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 10752 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 1152 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 1408 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 1664 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 1920 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 2176 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 2432 (by decide))).2 (Rows.not_lt_sub_of_part 10752 j 8192 2560 (by decide))).1 (Rows.lt_sub_of_part 10752 j 128 8192 2688 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 10752 j 8192 2560 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link084 : ∀ j < 128, Good (10752 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part084.rows.length := by rw [len084]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨10752 + j, h⟩).property
  rw [dispatch084 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound084.2 j hj')

theorem dispatch085 (j : ℕ) (hc : j < 128) (h : 10880 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨10880 + j, h⟩).val = GibbsCertificateData.Part085.rows[j]'(by rw [len085]; exact hc) := by
  have p : 10880 + j - 8192 < 4096 := Rows.sub_lt_of_part 10880 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (10880 + j) h _ rfl
  have e := sel_gibbsGroup2 (10880 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 10880 j 4096 (by decide))).2 (Rows.not_lt_of_part 10880 j 8192 (by decide))).1 (Rows.lt_of_part 10880 j 128 12288 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 10880 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 10880 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 10880 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 10880 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 10880 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 10880 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 10880 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 10880 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 10880 j 8192 1152 (by decide))).2 (Rows.not_lt_sub_of_part 10880 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 10880 j 8192 1408 (by decide))).2 (Rows.not_lt_sub_of_part 10880 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 10880 j 8192 1664 (by decide))).2 (Rows.not_lt_sub_of_part 10880 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 10880 j 8192 1920 (by decide))).2 (Rows.not_lt_sub_of_part 10880 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 10880 j 8192 2176 (by decide))).2 (Rows.not_lt_sub_of_part 10880 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 10880 j 8192 2432 (by decide))).2 (Rows.not_lt_sub_of_part 10880 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 10880 j 8192 2688 (by decide))).1 (Rows.lt_sub_of_part 10880 j 128 8192 2816 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 10880 j 8192 2688 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link085 : ∀ j < 128, Good (10880 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part085.rows.length := by rw [len085]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨10880 + j, h⟩).property
  rw [dispatch085 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound085.2 j hj')

theorem dispatch086 (j : ℕ) (hc : j < 128) (h : 11008 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨11008 + j, h⟩).val = GibbsCertificateData.Part086.rows[j]'(by rw [len086]; exact hc) := by
  have p : 11008 + j - 8192 < 4096 := Rows.sub_lt_of_part 11008 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (11008 + j) h _ rfl
  have e := sel_gibbsGroup2 (11008 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 11008 j 4096 (by decide))).2 (Rows.not_lt_of_part 11008 j 8192 (by decide))).1 (Rows.lt_of_part 11008 j 128 12288 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 11008 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 1152 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 1408 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 1664 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 1920 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 2176 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 2432 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 2688 (by decide))).2 (Rows.not_lt_sub_of_part 11008 j 8192 2816 (by decide))).1 (Rows.lt_sub_of_part 11008 j 128 8192 2944 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 11008 j 8192 2816 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link086 : ∀ j < 128, Good (11008 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part086.rows.length := by rw [len086]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨11008 + j, h⟩).property
  rw [dispatch086 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound086.2 j hj')

theorem dispatch087 (j : ℕ) (hc : j < 128) (h : 11136 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨11136 + j, h⟩).val = GibbsCertificateData.Part087.rows[j]'(by rw [len087]; exact hc) := by
  have p : 11136 + j - 8192 < 4096 := Rows.sub_lt_of_part 11136 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (11136 + j) h _ rfl
  have e := sel_gibbsGroup2 (11136 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 11136 j 4096 (by decide))).2 (Rows.not_lt_of_part 11136 j 8192 (by decide))).1 (Rows.lt_of_part 11136 j 128 12288 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 11136 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 11136 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 11136 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 11136 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 11136 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 11136 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 11136 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 11136 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 11136 j 8192 1152 (by decide))).2 (Rows.not_lt_sub_of_part 11136 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 11136 j 8192 1408 (by decide))).2 (Rows.not_lt_sub_of_part 11136 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 11136 j 8192 1664 (by decide))).2 (Rows.not_lt_sub_of_part 11136 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 11136 j 8192 1920 (by decide))).2 (Rows.not_lt_sub_of_part 11136 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 11136 j 8192 2176 (by decide))).2 (Rows.not_lt_sub_of_part 11136 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 11136 j 8192 2432 (by decide))).2 (Rows.not_lt_sub_of_part 11136 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 11136 j 8192 2688 (by decide))).2 (Rows.not_lt_sub_of_part 11136 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 11136 j 8192 2944 (by decide))).1 (Rows.lt_sub_of_part 11136 j 128 8192 3072 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 11136 j 8192 2944 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link087 : ∀ j < 128, Good (11136 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part087.rows.length := by rw [len087]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨11136 + j, h⟩).property
  rw [dispatch087 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound087.2 j hj')

theorem dispatch088 (j : ℕ) (hc : j < 128) (h : 11264 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨11264 + j, h⟩).val = GibbsCertificateData.Part088.rows[j]'(by rw [len088]; exact hc) := by
  have p : 11264 + j - 8192 < 4096 := Rows.sub_lt_of_part 11264 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (11264 + j) h _ rfl
  have e := sel_gibbsGroup2 (11264 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 11264 j 4096 (by decide))).2 (Rows.not_lt_of_part 11264 j 8192 (by decide))).1 (Rows.lt_of_part 11264 j 128 12288 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 11264 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 1152 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 1408 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 1664 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 1920 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 2176 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 2432 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 2688 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 2944 (by decide))).2 (Rows.not_lt_sub_of_part 11264 j 8192 3072 (by decide))).1 (Rows.lt_sub_of_part 11264 j 128 8192 3200 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 11264 j 8192 3072 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link088 : ∀ j < 128, Good (11264 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part088.rows.length := by rw [len088]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨11264 + j, h⟩).property
  rw [dispatch088 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound088.2 j hj')

theorem dispatch089 (j : ℕ) (hc : j < 128) (h : 11392 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨11392 + j, h⟩).val = GibbsCertificateData.Part089.rows[j]'(by rw [len089]; exact hc) := by
  have p : 11392 + j - 8192 < 4096 := Rows.sub_lt_of_part 11392 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (11392 + j) h _ rfl
  have e := sel_gibbsGroup2 (11392 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 11392 j 4096 (by decide))).2 (Rows.not_lt_of_part 11392 j 8192 (by decide))).1 (Rows.lt_of_part 11392 j 128 12288 hc (by decide))) p)
  have e1 := ((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 11392 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 1152 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 1408 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 1664 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 1920 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 2048 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 2176 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 2304 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 2432 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 2560 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 2688 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 2816 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 2944 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 3072 (by decide))).2 (Rows.not_lt_sub_of_part 11392 j 8192 3200 (by decide))).1 (Rows.lt_sub_of_part 11392 j 128 8192 3328 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 11392 j 8192 3200 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link089 : ∀ j < 128, Good (11392 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part089.rows.length := by rw [len089]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨11392 + j, h⟩).property
  rw [dispatch089 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound089.2 j hj')


end FKLBridge.Gibbs
