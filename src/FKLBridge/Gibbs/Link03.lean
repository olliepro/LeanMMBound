module

public import FKLBridge.Gibbs.Sel

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch030 (j : ℕ) (hc : j < 128) (h : 3840 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨3840 + j, h⟩).val = GibbsCertificateData.Part030.rows[j]'(by rw [len030]; exact hc) := by
  have p : 3840 + j - 0 < 4096 := Rows.sub_lt_of_part 3840 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (3840 + j) h _ rfl
  have e := sel_gibbsGroup0 (3840 + j - 0) p _ ((e0.1 (Rows.lt_of_part 3840 j 128 4096 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3840 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 1920 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 2176 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 2432 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 2688 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 2944 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 3200 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 3456 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 3584 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 3712 (by decide))).2 (Rows.not_lt_sub_of_part 3840 j 0 3840 (by decide))).1 (Rows.lt_sub_of_part 3840 j 128 0 3968 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 3840 j 0 3840 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link030 : ∀ j < 128, Good (3840 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part030.rows.length := by rw [len030]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨3840 + j, h⟩).property
  rw [dispatch030 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound030.2 j hj')

theorem dispatch031 (j : ℕ) (hc : j < 128) (h : 3968 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨3968 + j, h⟩).val = GibbsCertificateData.Part031.rows[j]'(by rw [len031]; exact hc) := by
  have p : 3968 + j - 0 < 4096 := Rows.sub_lt_of_part 3968 j 128 0 4096 hc (by decide) (by decide)
  have e0 := sel_top (3968 + j) h _ rfl
  have e := sel_gibbsGroup0 (3968 + j - 0) p _ ((e0.1 (Rows.lt_of_part 3968 j 128 4096 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 3968 j 0 128 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 384 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 640 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 896 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 1152 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 1408 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 1664 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 1920 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 2176 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 2432 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 2688 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 2944 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 3200 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 3456 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 3584 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 3712 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 3840 (by decide))).2 (Rows.not_lt_sub_of_part 3968 j 0 3968 (by decide)))
  rw [Rows.sub_sub_part 3968 j 0 3968 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link031 : ∀ j < 128, Good (3968 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part031.rows.length := by rw [len031]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨3968 + j, h⟩).property
  rw [dispatch031 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound031.2 j hj')

theorem dispatch032 (j : ℕ) (hc : j < 128) (h : 4096 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨4096 + j, h⟩).val = GibbsCertificateData.Part032.rows[j]'(by rw [len032]; exact hc) := by
  have p : 4096 + j - 4096 < 4096 := Rows.sub_lt_of_part 4096 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (4096 + j) h _ rfl
  have e := sel_gibbsGroup1 (4096 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4096 j 4096 (by decide))).1 (Rows.lt_of_part 4096 j 128 8192 hc (by decide))) p)
  have e1 := (e.1 (Rows.lt_sub_of_part 4096 j 128 4096 128 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4096 j 4096 0 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link032 : ∀ j < 128, Good (4096 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part032.rows.length := by rw [len032]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨4096 + j, h⟩).property
  rw [dispatch032 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound032.2 j hj')

theorem dispatch033 (j : ℕ) (hc : j < 128) (h : 4224 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨4224 + j, h⟩).val = GibbsCertificateData.Part033.rows[j]'(by rw [len033]; exact hc) := by
  have p : 4224 + j - 4096 < 4096 := Rows.sub_lt_of_part 4224 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (4224 + j) h _ rfl
  have e := sel_gibbsGroup1 (4224 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4224 j 4096 (by decide))).1 (Rows.lt_of_part 4224 j 128 8192 hc (by decide))) p)
  have e1 := ((e.2 (Rows.not_lt_sub_of_part 4224 j 4096 128 (by decide))).1 (Rows.lt_sub_of_part 4224 j 128 4096 256 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4224 j 4096 128 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link033 : ∀ j < 128, Good (4224 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part033.rows.length := by rw [len033]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨4224 + j, h⟩).property
  rw [dispatch033 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound033.2 j hj')

theorem dispatch034 (j : ℕ) (hc : j < 128) (h : 4352 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨4352 + j, h⟩).val = GibbsCertificateData.Part034.rows[j]'(by rw [len034]; exact hc) := by
  have p : 4352 + j - 4096 < 4096 := Rows.sub_lt_of_part 4352 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (4352 + j) h _ rfl
  have e := sel_gibbsGroup1 (4352 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4352 j 4096 (by decide))).1 (Rows.lt_of_part 4352 j 128 8192 hc (by decide))) p)
  have e1 := (((e.2 (Rows.not_lt_sub_of_part 4352 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 4352 j 4096 256 (by decide))).1 (Rows.lt_sub_of_part 4352 j 128 4096 384 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4352 j 4096 256 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link034 : ∀ j < 128, Good (4352 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part034.rows.length := by rw [len034]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨4352 + j, h⟩).property
  rw [dispatch034 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound034.2 j hj')

theorem dispatch035 (j : ℕ) (hc : j < 128) (h : 4480 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨4480 + j, h⟩).val = GibbsCertificateData.Part035.rows[j]'(by rw [len035]; exact hc) := by
  have p : 4480 + j - 4096 < 4096 := Rows.sub_lt_of_part 4480 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (4480 + j) h _ rfl
  have e := sel_gibbsGroup1 (4480 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4480 j 4096 (by decide))).1 (Rows.lt_of_part 4480 j 128 8192 hc (by decide))) p)
  have e1 := ((((e.2 (Rows.not_lt_sub_of_part 4480 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 4480 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 4480 j 4096 384 (by decide))).1 (Rows.lt_sub_of_part 4480 j 128 4096 512 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4480 j 4096 384 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link035 : ∀ j < 128, Good (4480 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part035.rows.length := by rw [len035]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨4480 + j, h⟩).property
  rw [dispatch035 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound035.2 j hj')

theorem dispatch036 (j : ℕ) (hc : j < 128) (h : 4608 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨4608 + j, h⟩).val = GibbsCertificateData.Part036.rows[j]'(by rw [len036]; exact hc) := by
  have p : 4608 + j - 4096 < 4096 := Rows.sub_lt_of_part 4608 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (4608 + j) h _ rfl
  have e := sel_gibbsGroup1 (4608 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4608 j 4096 (by decide))).1 (Rows.lt_of_part 4608 j 128 8192 hc (by decide))) p)
  have e1 := (((((e.2 (Rows.not_lt_sub_of_part 4608 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 4608 j 4096 512 (by decide))).1 (Rows.lt_sub_of_part 4608 j 128 4096 640 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4608 j 4096 512 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link036 : ∀ j < 128, Good (4608 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part036.rows.length := by rw [len036]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨4608 + j, h⟩).property
  rw [dispatch036 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound036.2 j hj')

theorem dispatch037 (j : ℕ) (hc : j < 128) (h : 4736 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨4736 + j, h⟩).val = GibbsCertificateData.Part037.rows[j]'(by rw [len037]; exact hc) := by
  have p : 4736 + j - 4096 < 4096 := Rows.sub_lt_of_part 4736 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (4736 + j) h _ rfl
  have e := sel_gibbsGroup1 (4736 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4736 j 4096 (by decide))).1 (Rows.lt_of_part 4736 j 128 8192 hc (by decide))) p)
  have e1 := ((((((e.2 (Rows.not_lt_sub_of_part 4736 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 4736 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 4736 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 4736 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 4736 j 4096 640 (by decide))).1 (Rows.lt_sub_of_part 4736 j 128 4096 768 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4736 j 4096 640 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link037 : ∀ j < 128, Good (4736 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part037.rows.length := by rw [len037]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨4736 + j, h⟩).property
  rw [dispatch037 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound037.2 j hj')

theorem dispatch038 (j : ℕ) (hc : j < 128) (h : 4864 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨4864 + j, h⟩).val = GibbsCertificateData.Part038.rows[j]'(by rw [len038]; exact hc) := by
  have p : 4864 + j - 4096 < 4096 := Rows.sub_lt_of_part 4864 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (4864 + j) h _ rfl
  have e := sel_gibbsGroup1 (4864 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4864 j 4096 (by decide))).1 (Rows.lt_of_part 4864 j 128 8192 hc (by decide))) p)
  have e1 := (((((((e.2 (Rows.not_lt_sub_of_part 4864 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 4864 j 4096 768 (by decide))).1 (Rows.lt_sub_of_part 4864 j 128 4096 896 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4864 j 4096 768 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link038 : ∀ j < 128, Good (4864 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part038.rows.length := by rw [len038]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨4864 + j, h⟩).property
  rw [dispatch038 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound038.2 j hj')

theorem dispatch039 (j : ℕ) (hc : j < 128) (h : 4992 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨4992 + j, h⟩).val = GibbsCertificateData.Part039.rows[j]'(by rw [len039]; exact hc) := by
  have p : 4992 + j - 4096 < 4096 := Rows.sub_lt_of_part 4992 j 128 4096 4096 hc (by decide) (by decide)
  have e0 := sel_top (4992 + j) h _ rfl
  have e := sel_gibbsGroup1 (4992 + j - 4096) p _ (((e0.2 (Rows.not_lt_of_part 4992 j 4096 (by decide))).1 (Rows.lt_of_part 4992 j 128 8192 hc (by decide))) p)
  have e1 := ((((((((e.2 (Rows.not_lt_sub_of_part 4992 j 4096 128 (by decide))).2 (Rows.not_lt_sub_of_part 4992 j 4096 256 (by decide))).2 (Rows.not_lt_sub_of_part 4992 j 4096 384 (by decide))).2 (Rows.not_lt_sub_of_part 4992 j 4096 512 (by decide))).2 (Rows.not_lt_sub_of_part 4992 j 4096 640 (by decide))).2 (Rows.not_lt_sub_of_part 4992 j 4096 768 (by decide))).2 (Rows.not_lt_sub_of_part 4992 j 4096 896 (by decide))).1 (Rows.lt_sub_of_part 4992 j 128 4096 1024 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 4992 j 4096 896 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link039 : ∀ j < 128, Good (4992 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part039.rows.length := by rw [len039]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨4992 + j, h⟩).property
  rw [dispatch039 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound039.2 j hj')


end FKLBridge.Gibbs
