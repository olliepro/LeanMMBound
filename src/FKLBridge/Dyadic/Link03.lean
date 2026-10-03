module

public import FKLBridge.Dyadic.Sel

@[expose] public section

namespace FKLBridge.Dyadic

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

theorem dispatch030 (j : ℕ) (hc : j < 256) (h : 7680 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨7680 + j, h⟩).val = CertificateData.Part030.rows[j]'(by rw [len030]; exact hc) := by
  have p : 7680 + j - 0 < 8192 := Rows.sub_lt_of_part 7680 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (7680 + j) h _ rfl
  have e := sel_dyadicGroup0 (7680 + j - 0) p _ ((e0.1 (Rows.lt_of_part 7680 j 256 8192 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 7680 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 3584 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 3840 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 4096 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 4352 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 4608 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 4864 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 5120 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 5376 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 5632 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 5888 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 6144 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 6400 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 6656 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 6912 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 7168 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 7424 (by decide))).2 (Rows.not_lt_sub_of_part 7680 j 0 7680 (by decide))).1 (Rows.lt_sub_of_part 7680 j 256 0 7936 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 7680 j 0 7680 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link030 : ∀ j < 256, Good (7680 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part030.rows.length := by rw [len030]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨7680 + j, h⟩).property
  rw [dispatch030 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound030.2 j hj')

theorem dispatch031 (j : ℕ) (hc : j < 256) (h : 7936 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨7936 + j, h⟩).val = CertificateData.Part031.rows[j]'(by rw [len031]; exact hc) := by
  have p : 7936 + j - 0 < 8192 := Rows.sub_lt_of_part 7936 j 256 0 8192 hc (by decide) (by decide)
  have e0 := sel_top (7936 + j) h _ rfl
  have e := sel_dyadicGroup0 (7936 + j - 0) p _ ((e0.1 (Rows.lt_of_part 7936 j 256 8192 hc (by decide))) p)
  have e1 := (((((((((((((((((((((((((((((((e.2 (Rows.not_lt_sub_of_part 7936 j 0 256 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 512 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 768 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 1024 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 1280 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 1536 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 1792 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 2048 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 2304 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 2560 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 2816 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 3072 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 3328 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 3584 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 3840 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 4096 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 4352 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 4608 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 4864 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 5120 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 5376 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 5632 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 5888 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 6144 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 6400 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 6656 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 6912 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 7168 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 7424 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 7680 (by decide))).2 (Rows.not_lt_sub_of_part 7936 j 0 7936 (by decide)))
  rw [Rows.sub_sub_part 7936 j 0 7936 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link031 : ∀ j < 256, Good (7936 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part031.rows.length := by rw [len031]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨7936 + j, h⟩).property
  rw [dispatch031 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound031.2 j hj')

theorem dispatch032 (j : ℕ) (hc : j < 256) (h : 8192 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨8192 + j, h⟩).val = CertificateData.Part032.rows[j]'(by rw [len032]; exact hc) := by
  have p : 8192 + j - 8192 < 7087 := Rows.sub_lt_of_part 8192 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (8192 + j) h _ rfl
  have e := sel_dyadicGroup1 (8192 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 8192 j 8192 (by decide))) p)
  have e1 := (e.1 (Rows.lt_sub_of_part 8192 j 256 8192 256 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 8192 j 8192 0 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link032 : ∀ j < 256, Good (8192 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part032.rows.length := by rw [len032]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨8192 + j, h⟩).property
  rw [dispatch032 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound032.2 j hj')

theorem dispatch033 (j : ℕ) (hc : j < 256) (h : 8448 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨8448 + j, h⟩).val = CertificateData.Part033.rows[j]'(by rw [len033]; exact hc) := by
  have p : 8448 + j - 8192 < 7087 := Rows.sub_lt_of_part 8448 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (8448 + j) h _ rfl
  have e := sel_dyadicGroup1 (8448 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 8448 j 8192 (by decide))) p)
  have e1 := ((e.2 (Rows.not_lt_sub_of_part 8448 j 8192 256 (by decide))).1 (Rows.lt_sub_of_part 8448 j 256 8192 512 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 8448 j 8192 256 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link033 : ∀ j < 256, Good (8448 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part033.rows.length := by rw [len033]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨8448 + j, h⟩).property
  rw [dispatch033 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound033.2 j hj')

theorem dispatch034 (j : ℕ) (hc : j < 256) (h : 8704 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨8704 + j, h⟩).val = CertificateData.Part034.rows[j]'(by rw [len034]; exact hc) := by
  have p : 8704 + j - 8192 < 7087 := Rows.sub_lt_of_part 8704 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (8704 + j) h _ rfl
  have e := sel_dyadicGroup1 (8704 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 8704 j 8192 (by decide))) p)
  have e1 := (((e.2 (Rows.not_lt_sub_of_part 8704 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 8704 j 8192 512 (by decide))).1 (Rows.lt_sub_of_part 8704 j 256 8192 768 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 8704 j 8192 512 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link034 : ∀ j < 256, Good (8704 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part034.rows.length := by rw [len034]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨8704 + j, h⟩).property
  rw [dispatch034 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound034.2 j hj')

theorem dispatch035 (j : ℕ) (hc : j < 256) (h : 8960 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨8960 + j, h⟩).val = CertificateData.Part035.rows[j]'(by rw [len035]; exact hc) := by
  have p : 8960 + j - 8192 < 7087 := Rows.sub_lt_of_part 8960 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (8960 + j) h _ rfl
  have e := sel_dyadicGroup1 (8960 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 8960 j 8192 (by decide))) p)
  have e1 := ((((e.2 (Rows.not_lt_sub_of_part 8960 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 8960 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 8960 j 8192 768 (by decide))).1 (Rows.lt_sub_of_part 8960 j 256 8192 1024 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 8960 j 8192 768 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link035 : ∀ j < 256, Good (8960 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part035.rows.length := by rw [len035]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨8960 + j, h⟩).property
  rw [dispatch035 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound035.2 j hj')

theorem dispatch036 (j : ℕ) (hc : j < 256) (h : 9216 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨9216 + j, h⟩).val = CertificateData.Part036.rows[j]'(by rw [len036]; exact hc) := by
  have p : 9216 + j - 8192 < 7087 := Rows.sub_lt_of_part 9216 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (9216 + j) h _ rfl
  have e := sel_dyadicGroup1 (9216 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 9216 j 8192 (by decide))) p)
  have e1 := (((((e.2 (Rows.not_lt_sub_of_part 9216 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 9216 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 9216 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 9216 j 8192 1024 (by decide))).1 (Rows.lt_sub_of_part 9216 j 256 8192 1280 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 9216 j 8192 1024 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link036 : ∀ j < 256, Good (9216 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part036.rows.length := by rw [len036]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨9216 + j, h⟩).property
  rw [dispatch036 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound036.2 j hj')

theorem dispatch037 (j : ℕ) (hc : j < 256) (h : 9472 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨9472 + j, h⟩).val = CertificateData.Part037.rows[j]'(by rw [len037]; exact hc) := by
  have p : 9472 + j - 8192 < 7087 := Rows.sub_lt_of_part 9472 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (9472 + j) h _ rfl
  have e := sel_dyadicGroup1 (9472 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 9472 j 8192 (by decide))) p)
  have e1 := ((((((e.2 (Rows.not_lt_sub_of_part 9472 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 9472 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 9472 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 9472 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 9472 j 8192 1280 (by decide))).1 (Rows.lt_sub_of_part 9472 j 256 8192 1536 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 9472 j 8192 1280 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link037 : ∀ j < 256, Good (9472 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part037.rows.length := by rw [len037]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨9472 + j, h⟩).property
  rw [dispatch037 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound037.2 j hj')

theorem dispatch038 (j : ℕ) (hc : j < 256) (h : 9728 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨9728 + j, h⟩).val = CertificateData.Part038.rows[j]'(by rw [len038]; exact hc) := by
  have p : 9728 + j - 8192 < 7087 := Rows.sub_lt_of_part 9728 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (9728 + j) h _ rfl
  have e := sel_dyadicGroup1 (9728 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 9728 j 8192 (by decide))) p)
  have e1 := (((((((e.2 (Rows.not_lt_sub_of_part 9728 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 9728 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 9728 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 9728 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 9728 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 9728 j 8192 1536 (by decide))).1 (Rows.lt_sub_of_part 9728 j 256 8192 1792 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 9728 j 8192 1536 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link038 : ∀ j < 256, Good (9728 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part038.rows.length := by rw [len038]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨9728 + j, h⟩).property
  rw [dispatch038 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound038.2 j hj')

theorem dispatch039 (j : ℕ) (hc : j < 256) (h : 9984 + j < 15279) :
    (IndexedCertificateRows.dyadic ⟨9984 + j, h⟩).val = CertificateData.Part039.rows[j]'(by rw [len039]; exact hc) := by
  have p : 9984 + j - 8192 < 7087 := Rows.sub_lt_of_part 9984 j 256 8192 7087 hc (by decide) (by decide)
  have e0 := sel_top (9984 + j) h _ rfl
  have e := sel_dyadicGroup1 (9984 + j - 8192) p _ ((e0.2 (Rows.not_lt_of_part 9984 j 8192 (by decide))) p)
  have e1 := ((((((((e.2 (Rows.not_lt_sub_of_part 9984 j 8192 256 (by decide))).2 (Rows.not_lt_sub_of_part 9984 j 8192 512 (by decide))).2 (Rows.not_lt_sub_of_part 9984 j 8192 768 (by decide))).2 (Rows.not_lt_sub_of_part 9984 j 8192 1024 (by decide))).2 (Rows.not_lt_sub_of_part 9984 j 8192 1280 (by decide))).2 (Rows.not_lt_sub_of_part 9984 j 8192 1536 (by decide))).2 (Rows.not_lt_sub_of_part 9984 j 8192 1792 (by decide))).1 (Rows.lt_sub_of_part 9984 j 256 8192 2048 hc (by decide) (by decide)))
  rw [Rows.sub_sub_part 9984 j 8192 1792 rfl] at e1
  exact Option.some.inj (e1.trans (List.getElem?_eq_getElem _))

theorem link039 : ∀ j < 256, Good (9984 + j) := by
  intro j hj h
  have hj' : j < CertificateData.Part039.rows.length := by rw [len039]; exact hj
  have hchk := (IndexedCertificateRows.dyadic ⟨9984 + j, h⟩).property
  rw [dispatch039 j hj h] at hchk ⊢
  exact Rows.dyOk_sound _ _ _ hchk (sound039.2 j hj')


end FKLBridge.Dyadic
