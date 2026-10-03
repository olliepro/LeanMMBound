module

public import FKLBridge.Dyadic.Check00
public import FKLBridge.Dyadic.Check01
public import FKLBridge.Dyadic.Check02
public import FKLBridge.Dyadic.Check03
public import FKLBridge.Dyadic.Check04
public import FKLBridge.Dyadic.Check05

@[expose] public section

namespace FKLBridge.Dyadic

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- One pass over the dispatch chain of `dyadicGroup0`, nested by its own conditions. -/
theorem sel_dyadicGroup0 (i : ℕ) (h : i < 8192) : ∀ v, (IndexedCertificateRows.dyadicGroup0 ⟨i, h⟩).val = v →
    (i < 256 → some v = CertificateData.Part000.rows[i - 0]?) ∧ (¬ i < 256 → (i < 512 → some v = CertificateData.Part001.rows[i - 256]?) ∧ (¬ i < 512 → (i < 768 → some v = CertificateData.Part002.rows[i - 512]?) ∧ (¬ i < 768 → (i < 1024 → some v = CertificateData.Part003.rows[i - 768]?) ∧ (¬ i < 1024 → (i < 1280 → some v = CertificateData.Part004.rows[i - 1024]?) ∧ (¬ i < 1280 → (i < 1536 → some v = CertificateData.Part005.rows[i - 1280]?) ∧ (¬ i < 1536 → (i < 1792 → some v = CertificateData.Part006.rows[i - 1536]?) ∧ (¬ i < 1792 → (i < 2048 → some v = CertificateData.Part007.rows[i - 1792]?) ∧ (¬ i < 2048 → (i < 2304 → some v = CertificateData.Part008.rows[i - 2048]?) ∧ (¬ i < 2304 → (i < 2560 → some v = CertificateData.Part009.rows[i - 2304]?) ∧ (¬ i < 2560 → (i < 2816 → some v = CertificateData.Part010.rows[i - 2560]?) ∧ (¬ i < 2816 → (i < 3072 → some v = CertificateData.Part011.rows[i - 2816]?) ∧ (¬ i < 3072 → (i < 3328 → some v = CertificateData.Part012.rows[i - 3072]?) ∧ (¬ i < 3328 → (i < 3584 → some v = CertificateData.Part013.rows[i - 3328]?) ∧ (¬ i < 3584 → (i < 3840 → some v = CertificateData.Part014.rows[i - 3584]?) ∧ (¬ i < 3840 → (i < 4096 → some v = CertificateData.Part015.rows[i - 3840]?) ∧ (¬ i < 4096 → (i < 4352 → some v = CertificateData.Part016.rows[i - 4096]?) ∧ (¬ i < 4352 → (i < 4608 → some v = CertificateData.Part017.rows[i - 4352]?) ∧ (¬ i < 4608 → (i < 4864 → some v = CertificateData.Part018.rows[i - 4608]?) ∧ (¬ i < 4864 → (i < 5120 → some v = CertificateData.Part019.rows[i - 4864]?) ∧ (¬ i < 5120 → (i < 5376 → some v = CertificateData.Part020.rows[i - 5120]?) ∧ (¬ i < 5376 → (i < 5632 → some v = CertificateData.Part021.rows[i - 5376]?) ∧ (¬ i < 5632 → (i < 5888 → some v = CertificateData.Part022.rows[i - 5632]?) ∧ (¬ i < 5888 → (i < 6144 → some v = CertificateData.Part023.rows[i - 5888]?) ∧ (¬ i < 6144 → (i < 6400 → some v = CertificateData.Part024.rows[i - 6144]?) ∧ (¬ i < 6400 → (i < 6656 → some v = CertificateData.Part025.rows[i - 6400]?) ∧ (¬ i < 6656 → (i < 6912 → some v = CertificateData.Part026.rows[i - 6656]?) ∧ (¬ i < 6912 → (i < 7168 → some v = CertificateData.Part027.rows[i - 6912]?) ∧ (¬ i < 7168 → (i < 7424 → some v = CertificateData.Part028.rows[i - 7168]?) ∧ (¬ i < 7424 → (i < 7680 → some v = CertificateData.Part029.rows[i - 7424]?) ∧ (¬ i < 7680 → (i < 7936 → some v = CertificateData.Part030.rows[i - 7680]?) ∧ (¬ i < 7936 → some v = CertificateData.Part031.rows[i - 7936]?))))))))))))))))))))))))))))))) := by
  intro v hv
  unfold IndexedCertificateRows.dyadicGroup0 at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part000.rows (i - 0) (Rows.idx_lt_len _ 256 i 0 256 len000 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part001.rows (i - 256) (Rows.idx_lt_len _ 256 i 256 512 len001 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part002.rows (i - 512) (Rows.idx_lt_len _ 256 i 512 768 len002 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part003.rows (i - 768) (Rows.idx_lt_len _ 256 i 768 1024 len003 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part004.rows (i - 1024) (Rows.idx_lt_len _ 256 i 1024 1280 len004 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part005.rows (i - 1280) (Rows.idx_lt_len _ 256 i 1280 1536 len005 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part006.rows (i - 1536) (Rows.idx_lt_len _ 256 i 1536 1792 len006 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part007.rows (i - 1792) (Rows.idx_lt_len _ 256 i 1792 2048 len007 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part008.rows (i - 2048) (Rows.idx_lt_len _ 256 i 2048 2304 len008 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part009.rows (i - 2304) (Rows.idx_lt_len _ 256 i 2304 2560 len009 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part010.rows (i - 2560) (Rows.idx_lt_len _ 256 i 2560 2816 len010 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part011.rows (i - 2816) (Rows.idx_lt_len _ 256 i 2816 3072 len011 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part012.rows (i - 3072) (Rows.idx_lt_len _ 256 i 3072 3328 len012 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part013.rows (i - 3328) (Rows.idx_lt_len _ 256 i 3328 3584 len013 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part014.rows (i - 3584) (Rows.idx_lt_len _ 256 i 3584 3840 len014 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part015.rows (i - 3840) (Rows.idx_lt_len _ 256 i 3840 4096 len015 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part016.rows (i - 4096) (Rows.idx_lt_len _ 256 i 4096 4352 len016 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part017.rows (i - 4352) (Rows.idx_lt_len _ 256 i 4352 4608 len017 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part018.rows (i - 4608) (Rows.idx_lt_len _ 256 i 4608 4864 len018 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part019.rows (i - 4864) (Rows.idx_lt_len _ 256 i 4864 5120 len019 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part020.rows (i - 5120) (Rows.idx_lt_len _ 256 i 5120 5376 len020 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part021.rows (i - 5376) (Rows.idx_lt_len _ 256 i 5376 5632 len021 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part022.rows (i - 5632) (Rows.idx_lt_len _ 256 i 5632 5888 len022 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part023.rows (i - 5888) (Rows.idx_lt_len _ 256 i 5888 6144 len023 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part024.rows (i - 6144) (Rows.idx_lt_len _ 256 i 6144 6400 len024 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part025.rows (i - 6400) (Rows.idx_lt_len _ 256 i 6400 6656 len025 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part026.rows (i - 6656) (Rows.idx_lt_len _ 256 i 6656 6912 len026 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part027.rows (i - 6912) (Rows.idx_lt_len _ 256 i 6912 7168 len027 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part028.rows (i - 7168) (Rows.idx_lt_len _ 256 i 7168 7424 len028 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part029.rows (i - 7424) (Rows.idx_lt_len _ 256 i 7424 7680 len029 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part030.rows (i - 7680) (Rows.idx_lt_len _ 256 i 7680 7936 len030 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  exact Rows.last_val v hv CertificateData.Part031.rows (i - 7936) (Rows.idx_lt_len _ 256 i 7936 8192 len031 h (by decide) (by decide)) rfl

/-- One pass over the dispatch chain of `dyadicGroup1`, nested by its own conditions. -/
theorem sel_dyadicGroup1 (i : ℕ) (h : i < 7087) : ∀ v, (IndexedCertificateRows.dyadicGroup1 ⟨i, h⟩).val = v →
    (i < 256 → some v = CertificateData.Part032.rows[i - 0]?) ∧ (¬ i < 256 → (i < 512 → some v = CertificateData.Part033.rows[i - 256]?) ∧ (¬ i < 512 → (i < 768 → some v = CertificateData.Part034.rows[i - 512]?) ∧ (¬ i < 768 → (i < 1024 → some v = CertificateData.Part035.rows[i - 768]?) ∧ (¬ i < 1024 → (i < 1280 → some v = CertificateData.Part036.rows[i - 1024]?) ∧ (¬ i < 1280 → (i < 1536 → some v = CertificateData.Part037.rows[i - 1280]?) ∧ (¬ i < 1536 → (i < 1792 → some v = CertificateData.Part038.rows[i - 1536]?) ∧ (¬ i < 1792 → (i < 2048 → some v = CertificateData.Part039.rows[i - 1792]?) ∧ (¬ i < 2048 → (i < 2304 → some v = CertificateData.Part040.rows[i - 2048]?) ∧ (¬ i < 2304 → (i < 2560 → some v = CertificateData.Part041.rows[i - 2304]?) ∧ (¬ i < 2560 → (i < 2816 → some v = CertificateData.Part042.rows[i - 2560]?) ∧ (¬ i < 2816 → (i < 3072 → some v = CertificateData.Part043.rows[i - 2816]?) ∧ (¬ i < 3072 → (i < 3328 → some v = CertificateData.Part044.rows[i - 3072]?) ∧ (¬ i < 3328 → (i < 3584 → some v = CertificateData.Part045.rows[i - 3328]?) ∧ (¬ i < 3584 → (i < 3840 → some v = CertificateData.Part046.rows[i - 3584]?) ∧ (¬ i < 3840 → (i < 4096 → some v = CertificateData.Part047.rows[i - 3840]?) ∧ (¬ i < 4096 → (i < 4352 → some v = CertificateData.Part048.rows[i - 4096]?) ∧ (¬ i < 4352 → (i < 4608 → some v = CertificateData.Part049.rows[i - 4352]?) ∧ (¬ i < 4608 → (i < 4864 → some v = CertificateData.Part050.rows[i - 4608]?) ∧ (¬ i < 4864 → (i < 5120 → some v = CertificateData.Part051.rows[i - 4864]?) ∧ (¬ i < 5120 → (i < 5376 → some v = CertificateData.Part052.rows[i - 5120]?) ∧ (¬ i < 5376 → (i < 5632 → some v = CertificateData.Part053.rows[i - 5376]?) ∧ (¬ i < 5632 → (i < 5888 → some v = CertificateData.Part054.rows[i - 5632]?) ∧ (¬ i < 5888 → (i < 6144 → some v = CertificateData.Part055.rows[i - 5888]?) ∧ (¬ i < 6144 → (i < 6400 → some v = CertificateData.Part056.rows[i - 6144]?) ∧ (¬ i < 6400 → (i < 6656 → some v = CertificateData.Part057.rows[i - 6400]?) ∧ (¬ i < 6656 → (i < 6912 → some v = CertificateData.Part058.rows[i - 6656]?) ∧ (¬ i < 6912 → some v = CertificateData.Part059.rows[i - 6912]?))))))))))))))))))))))))))) := by
  intro v hv
  unfold IndexedCertificateRows.dyadicGroup1 at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part032.rows (i - 0) (Rows.idx_lt_len _ 256 i 0 256 len032 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part033.rows (i - 256) (Rows.idx_lt_len _ 256 i 256 512 len033 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part034.rows (i - 512) (Rows.idx_lt_len _ 256 i 512 768 len034 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part035.rows (i - 768) (Rows.idx_lt_len _ 256 i 768 1024 len035 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part036.rows (i - 1024) (Rows.idx_lt_len _ 256 i 1024 1280 len036 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part037.rows (i - 1280) (Rows.idx_lt_len _ 256 i 1280 1536 len037 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part038.rows (i - 1536) (Rows.idx_lt_len _ 256 i 1536 1792 len038 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part039.rows (i - 1792) (Rows.idx_lt_len _ 256 i 1792 2048 len039 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part040.rows (i - 2048) (Rows.idx_lt_len _ 256 i 2048 2304 len040 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part041.rows (i - 2304) (Rows.idx_lt_len _ 256 i 2304 2560 len041 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part042.rows (i - 2560) (Rows.idx_lt_len _ 256 i 2560 2816 len042 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part043.rows (i - 2816) (Rows.idx_lt_len _ 256 i 2816 3072 len043 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part044.rows (i - 3072) (Rows.idx_lt_len _ 256 i 3072 3328 len044 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part045.rows (i - 3328) (Rows.idx_lt_len _ 256 i 3328 3584 len045 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part046.rows (i - 3584) (Rows.idx_lt_len _ 256 i 3584 3840 len046 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part047.rows (i - 3840) (Rows.idx_lt_len _ 256 i 3840 4096 len047 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part048.rows (i - 4096) (Rows.idx_lt_len _ 256 i 4096 4352 len048 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part049.rows (i - 4352) (Rows.idx_lt_len _ 256 i 4352 4608 len049 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part050.rows (i - 4608) (Rows.idx_lt_len _ 256 i 4608 4864 len050 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part051.rows (i - 4864) (Rows.idx_lt_len _ 256 i 4864 5120 len051 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part052.rows (i - 5120) (Rows.idx_lt_len _ 256 i 5120 5376 len052 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part053.rows (i - 5376) (Rows.idx_lt_len _ 256 i 5376 5632 len053 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part054.rows (i - 5632) (Rows.idx_lt_len _ 256 i 5632 5888 len054 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part055.rows (i - 5888) (Rows.idx_lt_len _ 256 i 5888 6144 len055 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part056.rows (i - 6144) (Rows.idx_lt_len _ 256 i 6144 6400 len056 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part057.rows (i - 6400) (Rows.idx_lt_len _ 256 i 6400 6656 len057 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk CertificateData.Part058.rows (i - 6656) (Rows.idx_lt_len _ 256 i 6656 6912 len058 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  exact Rows.last_val v hv CertificateData.Part059.rows (i - 6912) (Rows.idx_lt_len _ 175 i 6912 7087 len059 h (by decide) (by decide)) rfl

/-- One pass over the top-level dispatch of `dyadic`. -/
theorem sel_top (r : ℕ) (h : r < 15279) : ∀ v, (IndexedCertificateRows.dyadic ⟨r, h⟩).val = v →
    (r < 8192 → ∀ p : r - 0 < 8192, (IndexedCertificateRows.dyadicGroup0 ⟨r - 0, p⟩).val = v) ∧ (¬ r < 8192 → ∀ p : r - 8192 < 7087, (IndexedCertificateRows.dyadicGroup1 ⟨r - 8192, p⟩).val = v) := by
  intro v hv
  unfold IndexedCertificateRows.dyadic at hv
  refine ⟨fun hk p => by rw [dif_pos hk] at hv; exact hv, fun hk => ?_⟩
  rw [dif_neg hk] at hv
  exact fun p => hv


end FKLBridge.Dyadic
