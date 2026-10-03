module

public import FKLBridge.Gibbs.Sel

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch070 (j : ℕ) (hc : j < 128) (h : 8960 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨8960 + j, h⟩).val = GibbsCertificateData.Part070.rows[j]'(by rw [len070]; exact hc) := by
  have p : 8960 + j - 8192 < 4096 := Rows.sub_lt_of_part 8960 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (8960 + j) h _ rfl
  have e := sel_gibbsGroup2 (8960 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 8960 j 4096 (by decide))).2 (Rows.not_lt_of_part 8960 j 8192 (by decide))).1 (Rows.lt_of_part 8960 j 128 12288 hc (by decide))) p)
  have e1 := (((((((e.2 (Rows.not_lt_sub_of_part 8960 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 8960 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 8960 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 8960 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 8960 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 8960 j 8192 768 (by decide))).1 (Rows.lt_sub_of_part 8960 j 128 8192 896 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 8960 j 8192 768 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link070 : ∀ j < 128, Good (8960 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part070.rows.length := by rw [len070]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨8960 + j, h⟩).property
  rw [dispatch070 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound070.2 j hj')

theorem dispatch071 (j : ℕ) (hc : j < 128) (h : 9088 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨9088 + j, h⟩).val = GibbsCertificateData.Part071.rows[j]'(by rw [len071]; exact hc) := by
  have p : 9088 + j - 8192 < 4096 := Rows.sub_lt_of_part 9088 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (9088 + j) h _ rfl
  have e := sel_gibbsGroup2 (9088 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 9088 j 4096 (by decide))).2 (Rows.not_lt_of_part 9088 j 8192 (by decide))).1 (Rows.lt_of_part 9088 j 128 12288 hc (by decide))) p)
  have e1 := ((((((((e.2 (Rows.not_lt_sub_of_part 9088 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 9088 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 9088 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 9088 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 9088 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 9088 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 9088 j 8192 896 (by decide))).1 (Rows.lt_sub_of_part 9088 j 128 8192 1024 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 9088 j 8192 896 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link071 : ∀ j < 128, Good (9088 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part071.rows.length := by rw [len071]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨9088 + j, h⟩).property
  rw [dispatch071 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound071.2 j hj')

theorem dispatch072 (j : ℕ) (hc : j < 128) (h : 9216 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨9216 + j, h⟩).val = GibbsCertificateData.Part072.rows[j]'(by rw [len072]; exact hc) := by
  have p : 9216 + j - 8192 < 4096 := Rows.sub_lt_of_part 9216 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (9216 + j) h _ rfl
  have e := sel_gibbsGroup2 (9216 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 9216 j 4096 (by decide))).2 (Rows.not_lt_of_part 9216 j 8192 (by decide))).1 (Rows.lt_of_part 9216 j 128 12288 hc (by decide))) p)
  have e1 := (((((((((e.2 (Rows.not_lt_sub_of_part 9216 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 9216 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 9216 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 9216 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 9216 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 9216 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 9216 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 9216 j 8192 1024 (by decide))).1 (Rows.lt_sub_of_part 9216 j 128 8192 1152 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 9216 j 8192 1024 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link072 : ∀ j < 128, Good (9216 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part072.rows.length := by rw [len072]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨9216 + j, h⟩).property
  rw [dispatch072 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound072.2 j hj')

theorem dispatch073 (j : ℕ) (hc : j < 128) (h : 9344 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨9344 + j, h⟩).val = GibbsCertificateData.Part073.rows[j]'(by rw [len073]; exact hc) := by
  have p : 9344 + j - 8192 < 4096 := Rows.sub_lt_of_part 9344 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (9344 + j) h _ rfl
  have e := sel_gibbsGroup2 (9344 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 9344 j 4096 (by decide))).2 (Rows.not_lt_of_part 9344 j 8192 (by decide))).1 (Rows.lt_of_part 9344 j 128 12288 hc (by decide))) p)
  have e1 := ((((((((((e.2 (Rows.not_lt_sub_of_part 9344 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 9344 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 9344 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 9344 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 9344 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 9344 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 9344 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 9344 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 9344 j 8192 1152 (by decide))).1 (Rows.lt_sub_of_part 9344 j 128 8192 1280 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 9344 j 8192 1152 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link073 : ∀ j < 128, Good (9344 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part073.rows.length := by rw [len073]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨9344 + j, h⟩).property
  rw [dispatch073 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound073.2 j hj')

theorem dispatch074 (j : ℕ) (hc : j < 128) (h : 9472 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨9472 + j, h⟩).val = GibbsCertificateData.Part074.rows[j]'(by rw [len074]; exact hc) := by
  have p : 9472 + j - 8192 < 4096 := Rows.sub_lt_of_part 9472 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (9472 + j) h _ rfl
  have e := sel_gibbsGroup2 (9472 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 9472 j 4096 (by decide))).2 (Rows.not_lt_of_part 9472 j 8192 (by decide))).1 (Rows.lt_of_part 9472 j 128 12288 hc (by decide))) p)
  have e1 := (((((((((((e.2 (Rows.not_lt_sub_of_part 9472 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 9472 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 9472 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 9472 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 9472 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 9472 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 9472 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 9472 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 9472 j 8192 1152 (by decide))).2 (Rows.not_lt_sub_of_part 9472 j 8192 1280 (by decide))).1 (Rows.lt_sub_of_part 9472 j 128 8192 1408 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 9472 j 8192 1280 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link074 : ∀ j < 128, Good (9472 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part074.rows.length := by rw [len074]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨9472 + j, h⟩).property
  rw [dispatch074 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound074.2 j hj')

theorem dispatch075 (j : ℕ) (hc : j < 128) (h : 9600 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨9600 + j, h⟩).val = GibbsCertificateData.Part075.rows[j]'(by rw [len075]; exact hc) := by
  have p : 9600 + j - 8192 < 4096 := Rows.sub_lt_of_part 9600 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (9600 + j) h _ rfl
  have e := sel_gibbsGroup2 (9600 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 9600 j 4096 (by decide))).2 (Rows.not_lt_of_part 9600 j 8192 (by decide))).1 (Rows.lt_of_part 9600 j 128 12288 hc (by decide))) p)
  have e1 := ((((((((((((e.2 (Rows.not_lt_sub_of_part 9600 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 9600 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 9600 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 9600 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 9600 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 9600 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 9600 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 9600 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 9600 j 8192 1152 (by decide))).2 (Rows.not_lt_sub_of_part 9600 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 9600 j 8192 1408 (by decide))).1 (Rows.lt_sub_of_part 9600 j 128 8192 1536 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 9600 j 8192 1408 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link075 : ∀ j < 128, Good (9600 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part075.rows.length := by rw [len075]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨9600 + j, h⟩).property
  rw [dispatch075 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound075.2 j hj')

theorem dispatch076 (j : ℕ) (hc : j < 128) (h : 9728 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨9728 + j, h⟩).val = GibbsCertificateData.Part076.rows[j]'(by rw [len076]; exact hc) := by
  have p : 9728 + j - 8192 < 4096 := Rows.sub_lt_of_part 9728 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (9728 + j) h _ rfl
  have e := sel_gibbsGroup2 (9728 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 9728 j 4096 (by decide))).2 (Rows.not_lt_of_part 9728 j 8192 (by decide))).1 (Rows.lt_of_part 9728 j 128 12288 hc (by decide))) p)
  have e1 := (((((((((((((e.2 (Rows.not_lt_sub_of_part 9728 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 9728 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 9728 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 9728 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 9728 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 9728 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 9728 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 9728 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 9728 j 8192 1152 (by decide))).2 (Rows.not_lt_sub_of_part 9728 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 9728 j 8192 1408 (by decide))).2 (Rows.not_lt_sub_of_part 9728 j 8192 1536 (by decide))).1 (Rows.lt_sub_of_part 9728 j 128 8192 1664 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 9728 j 8192 1536 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link076 : ∀ j < 128, Good (9728 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part076.rows.length := by rw [len076]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨9728 + j, h⟩).property
  rw [dispatch076 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound076.2 j hj')

theorem dispatch077 (j : ℕ) (hc : j < 128) (h : 9856 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨9856 + j, h⟩).val = GibbsCertificateData.Part077.rows[j]'(by rw [len077]; exact hc) := by
  have p : 9856 + j - 8192 < 4096 := Rows.sub_lt_of_part 9856 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (9856 + j) h _ rfl
  have e := sel_gibbsGroup2 (9856 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 9856 j 4096 (by decide))).2 (Rows.not_lt_of_part 9856 j 8192 (by decide))).1 (Rows.lt_of_part 9856 j 128 12288 hc (by decide))) p)
  have e1 := ((((((((((((((e.2 (Rows.not_lt_sub_of_part 9856 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 9856 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 9856 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 9856 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 9856 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 9856 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 9856 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 9856 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 9856 j 8192 1152 (by decide))).2 (Rows.not_lt_sub_of_part 9856 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 9856 j 8192 1408 (by decide))).2 (Rows.not_lt_sub_of_part 9856 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 9856 j 8192 1664 (by decide))).1 (Rows.lt_sub_of_part 9856 j 128 8192 1792 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 9856 j 8192 1664 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link077 : ∀ j < 128, Good (9856 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part077.rows.length := by rw [len077]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨9856 + j, h⟩).property
  rw [dispatch077 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound077.2 j hj')

theorem dispatch078 (j : ℕ) (hc : j < 128) (h : 9984 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨9984 + j, h⟩).val = GibbsCertificateData.Part078.rows[j]'(by rw [len078]; exact hc) := by
  have p : 9984 + j - 8192 < 4096 := Rows.sub_lt_of_part 9984 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (9984 + j) h _ rfl
  have e := sel_gibbsGroup2 (9984 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 9984 j 4096 (by decide))).2 (Rows.not_lt_of_part 9984 j 8192 (by decide))).1 (Rows.lt_of_part 9984 j 128 12288 hc (by decide))) p)
  have e1 := (((((((((((((((e.2 (Rows.not_lt_sub_of_part 9984 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 9984 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 9984 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 9984 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 9984 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 9984 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 9984 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 9984 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 9984 j 8192 1152 (by decide))).2 (Rows.not_lt_sub_of_part 9984 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 9984 j 8192 1408 (by decide))).2 (Rows.not_lt_sub_of_part 9984 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 9984 j 8192 1664 (by decide))).2 (Rows.not_lt_sub_of_part 9984 j 8192 1792 (by decide))).1 (Rows.lt_sub_of_part 9984 j 128 8192 1920 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 9984 j 8192 1792 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link078 : ∀ j < 128, Good (9984 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part078.rows.length := by rw [len078]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨9984 + j, h⟩).property
  rw [dispatch078 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound078.2 j hj')

theorem dispatch079 (j : ℕ) (hc : j < 128) (h : 10112 + j < 16629) :
    (IndexedCertificateRows.gibbs ⟨10112 + j, h⟩).val = GibbsCertificateData.Part079.rows[j]'(by rw [len079]; exact hc) := by
  have p : 10112 + j - 8192 < 4096 := Rows.sub_lt_of_part 10112 j 128 8192 4096 hc (by decide) (by decide)
  have e0 := sel_top (10112 + j) h _ rfl
  have e := sel_gibbsGroup2 (10112 + j - 8192) p _ ((((e0.2 (Rows.not_lt_of_part 10112 j 4096 (by decide))).2 (Rows.not_lt_of_part 10112 j 8192 (by decide))).1 (Rows.lt_of_part 10112 j 128 12288 hc (by decide))) p)
  have e1 := ((((((((((((((((e.2 (Rows.not_lt_sub_of_part 10112 j 8192 128 (by decide))).2 (Rows.not_lt_sub_of_part 10112 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 10112 j 8192 384 (by decide))).2 (Rows.not_lt_sub_of_part 10112 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 10112 j 8192 640 (by decide))).2 (Rows.not_lt_sub_of_part 10112 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 10112 j 8192 896 (by decide))).2 (Rows.not_lt_sub_of_part 10112 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 10112 j 8192 1152 (by decide))).2 (Rows.not_lt_sub_of_part 10112 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 10112 j 8192 1408 (by decide))).2 (Rows.not_lt_sub_of_part 10112 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 10112 j 8192 1664 (by decide))).2 (Rows.not_lt_sub_of_part 10112 j 8192 1792 (by decide))).2 (Rows.not_lt_sub_of_part 10112 j 8192 1920 (by decide))).1 (Rows.lt_sub_of_part 10112 j 128 8192 2048 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 10112 j 8192 1920 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link079 : ∀ j < 128, Good (10112 + j) := by
  intro j hj h
  have hj' : j < GibbsCertificateData.Part079.rows.length := by rw [len079]; exact hj
  have hchk := (IndexedCertificateRows.gibbs ⟨10112 + j, h⟩).property
  rw [dispatch079 j hj h] at hchk ⊢
  exact Rows.gibbsOk_sound _ _ _ (sound079.2 j hj')


end FKLBridge.Gibbs
