module

public import FKLBridge.Gibbs.Check00
public import FKLBridge.Gibbs.Check01
public import FKLBridge.Gibbs.Check02
public import FKLBridge.Gibbs.Check03
public import FKLBridge.Gibbs.Check04
public import FKLBridge.Gibbs.Check05
public import FKLBridge.Gibbs.Check06
public import FKLBridge.Gibbs.Check07
public import FKLBridge.Gibbs.Check08
public import FKLBridge.Gibbs.Check09
public import FKLBridge.Gibbs.Check10
public import FKLBridge.Gibbs.Check11
public import FKLBridge.Gibbs.Check12

@[expose] public section

namespace FKLBridge.Gibbs

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000
set_option linter.deprecated false
set_option linter.unusedVariables false

/-- One pass over the dispatch chain of `gibbsGroup0`, nested by its own conditions. -/
theorem sel_gibbsGroup0 (i : ℕ) (h : i < 4096) : ∀ v, (IndexedCertificateRows.gibbsGroup0 ⟨i, h⟩).val = v →
    (i < 128 → some v = GibbsCertificateData.Part000.rows[i - 0]?) ∧ (¬ i < 128 → (i < 256 → some v = GibbsCertificateData.Part001.rows[i - 128]?) ∧ (¬ i < 256 → (i < 384 → some v = GibbsCertificateData.Part002.rows[i - 256]?) ∧ (¬ i < 384 → (i < 512 → some v = GibbsCertificateData.Part003.rows[i - 384]?) ∧ (¬ i < 512 → (i < 640 → some v = GibbsCertificateData.Part004.rows[i - 512]?) ∧ (¬ i < 640 → (i < 768 → some v = GibbsCertificateData.Part005.rows[i - 640]?) ∧ (¬ i < 768 → (i < 896 → some v = GibbsCertificateData.Part006.rows[i - 768]?) ∧ (¬ i < 896 → (i < 1024 → some v = GibbsCertificateData.Part007.rows[i - 896]?) ∧ (¬ i < 1024 → (i < 1152 → some v = GibbsCertificateData.Part008.rows[i - 1024]?) ∧ (¬ i < 1152 → (i < 1280 → some v = GibbsCertificateData.Part009.rows[i - 1152]?) ∧ (¬ i < 1280 → (i < 1408 → some v = GibbsCertificateData.Part010.rows[i - 1280]?) ∧ (¬ i < 1408 → (i < 1536 → some v = GibbsCertificateData.Part011.rows[i - 1408]?) ∧ (¬ i < 1536 → (i < 1664 → some v = GibbsCertificateData.Part012.rows[i - 1536]?) ∧ (¬ i < 1664 → (i < 1792 → some v = GibbsCertificateData.Part013.rows[i - 1664]?) ∧ (¬ i < 1792 → (i < 1920 → some v = GibbsCertificateData.Part014.rows[i - 1792]?) ∧ (¬ i < 1920 → (i < 2048 → some v = GibbsCertificateData.Part015.rows[i - 1920]?) ∧ (¬ i < 2048 → (i < 2176 → some v = GibbsCertificateData.Part016.rows[i - 2048]?) ∧ (¬ i < 2176 → (i < 2304 → some v = GibbsCertificateData.Part017.rows[i - 2176]?) ∧ (¬ i < 2304 → (i < 2432 → some v = GibbsCertificateData.Part018.rows[i - 2304]?) ∧ (¬ i < 2432 → (i < 2560 → some v = GibbsCertificateData.Part019.rows[i - 2432]?) ∧ (¬ i < 2560 → (i < 2688 → some v = GibbsCertificateData.Part020.rows[i - 2560]?) ∧ (¬ i < 2688 → (i < 2816 → some v = GibbsCertificateData.Part021.rows[i - 2688]?) ∧ (¬ i < 2816 → (i < 2944 → some v = GibbsCertificateData.Part022.rows[i - 2816]?) ∧ (¬ i < 2944 → (i < 3072 → some v = GibbsCertificateData.Part023.rows[i - 2944]?) ∧ (¬ i < 3072 → (i < 3200 → some v = GibbsCertificateData.Part024.rows[i - 3072]?) ∧ (¬ i < 3200 → (i < 3328 → some v = GibbsCertificateData.Part025.rows[i - 3200]?) ∧ (¬ i < 3328 → (i < 3456 → some v = GibbsCertificateData.Part026.rows[i - 3328]?) ∧ (¬ i < 3456 → (i < 3584 → some v = GibbsCertificateData.Part027.rows[i - 3456]?) ∧ (¬ i < 3584 → (i < 3712 → some v = GibbsCertificateData.Part028.rows[i - 3584]?) ∧ (¬ i < 3712 → (i < 3840 → some v = GibbsCertificateData.Part029.rows[i - 3712]?) ∧ (¬ i < 3840 → (i < 3968 → some v = GibbsCertificateData.Part030.rows[i - 3840]?) ∧ (¬ i < 3968 → some v = GibbsCertificateData.Part031.rows[i - 3968]?))))))))))))))))))))))))))))))) := by
  intro v hv
  unfold IndexedCertificateRows.gibbsGroup0 at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part000.rows (i - 0) (Rows.idx_lt_len _ 128 i 0 128 len000 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part001.rows (i - 128) (Rows.idx_lt_len _ 128 i 128 256 len001 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part002.rows (i - 256) (Rows.idx_lt_len _ 128 i 256 384 len002 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part003.rows (i - 384) (Rows.idx_lt_len _ 128 i 384 512 len003 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part004.rows (i - 512) (Rows.idx_lt_len _ 128 i 512 640 len004 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part005.rows (i - 640) (Rows.idx_lt_len _ 128 i 640 768 len005 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part006.rows (i - 768) (Rows.idx_lt_len _ 128 i 768 896 len006 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part007.rows (i - 896) (Rows.idx_lt_len _ 128 i 896 1024 len007 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part008.rows (i - 1024) (Rows.idx_lt_len _ 128 i 1024 1152 len008 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part009.rows (i - 1152) (Rows.idx_lt_len _ 128 i 1152 1280 len009 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part010.rows (i - 1280) (Rows.idx_lt_len _ 128 i 1280 1408 len010 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part011.rows (i - 1408) (Rows.idx_lt_len _ 128 i 1408 1536 len011 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part012.rows (i - 1536) (Rows.idx_lt_len _ 128 i 1536 1664 len012 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part013.rows (i - 1664) (Rows.idx_lt_len _ 128 i 1664 1792 len013 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part014.rows (i - 1792) (Rows.idx_lt_len _ 128 i 1792 1920 len014 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part015.rows (i - 1920) (Rows.idx_lt_len _ 128 i 1920 2048 len015 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part016.rows (i - 2048) (Rows.idx_lt_len _ 128 i 2048 2176 len016 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part017.rows (i - 2176) (Rows.idx_lt_len _ 128 i 2176 2304 len017 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part018.rows (i - 2304) (Rows.idx_lt_len _ 128 i 2304 2432 len018 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part019.rows (i - 2432) (Rows.idx_lt_len _ 128 i 2432 2560 len019 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part020.rows (i - 2560) (Rows.idx_lt_len _ 128 i 2560 2688 len020 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part021.rows (i - 2688) (Rows.idx_lt_len _ 128 i 2688 2816 len021 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part022.rows (i - 2816) (Rows.idx_lt_len _ 128 i 2816 2944 len022 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part023.rows (i - 2944) (Rows.idx_lt_len _ 128 i 2944 3072 len023 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part024.rows (i - 3072) (Rows.idx_lt_len _ 128 i 3072 3200 len024 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part025.rows (i - 3200) (Rows.idx_lt_len _ 128 i 3200 3328 len025 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part026.rows (i - 3328) (Rows.idx_lt_len _ 128 i 3328 3456 len026 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part027.rows (i - 3456) (Rows.idx_lt_len _ 128 i 3456 3584 len027 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part028.rows (i - 3584) (Rows.idx_lt_len _ 128 i 3584 3712 len028 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part029.rows (i - 3712) (Rows.idx_lt_len _ 128 i 3712 3840 len029 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part030.rows (i - 3840) (Rows.idx_lt_len _ 128 i 3840 3968 len030 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  exact Rows.last_val v hv GibbsCertificateData.Part031.rows (i - 3968) (Rows.idx_lt_len _ 128 i 3968 4096 len031 h (by decide) (by decide)) rfl

/-- One pass over the dispatch chain of `gibbsGroup1`, nested by its own conditions. -/
theorem sel_gibbsGroup1 (i : ℕ) (h : i < 4096) : ∀ v, (IndexedCertificateRows.gibbsGroup1 ⟨i, h⟩).val = v →
    (i < 128 → some v = GibbsCertificateData.Part032.rows[i - 0]?) ∧ (¬ i < 128 → (i < 256 → some v = GibbsCertificateData.Part033.rows[i - 128]?) ∧ (¬ i < 256 → (i < 384 → some v = GibbsCertificateData.Part034.rows[i - 256]?) ∧ (¬ i < 384 → (i < 512 → some v = GibbsCertificateData.Part035.rows[i - 384]?) ∧ (¬ i < 512 → (i < 640 → some v = GibbsCertificateData.Part036.rows[i - 512]?) ∧ (¬ i < 640 → (i < 768 → some v = GibbsCertificateData.Part037.rows[i - 640]?) ∧ (¬ i < 768 → (i < 896 → some v = GibbsCertificateData.Part038.rows[i - 768]?) ∧ (¬ i < 896 → (i < 1024 → some v = GibbsCertificateData.Part039.rows[i - 896]?) ∧ (¬ i < 1024 → (i < 1152 → some v = GibbsCertificateData.Part040.rows[i - 1024]?) ∧ (¬ i < 1152 → (i < 1280 → some v = GibbsCertificateData.Part041.rows[i - 1152]?) ∧ (¬ i < 1280 → (i < 1408 → some v = GibbsCertificateData.Part042.rows[i - 1280]?) ∧ (¬ i < 1408 → (i < 1536 → some v = GibbsCertificateData.Part043.rows[i - 1408]?) ∧ (¬ i < 1536 → (i < 1664 → some v = GibbsCertificateData.Part044.rows[i - 1536]?) ∧ (¬ i < 1664 → (i < 1792 → some v = GibbsCertificateData.Part045.rows[i - 1664]?) ∧ (¬ i < 1792 → (i < 1920 → some v = GibbsCertificateData.Part046.rows[i - 1792]?) ∧ (¬ i < 1920 → (i < 2048 → some v = GibbsCertificateData.Part047.rows[i - 1920]?) ∧ (¬ i < 2048 → (i < 2176 → some v = GibbsCertificateData.Part048.rows[i - 2048]?) ∧ (¬ i < 2176 → (i < 2304 → some v = GibbsCertificateData.Part049.rows[i - 2176]?) ∧ (¬ i < 2304 → (i < 2432 → some v = GibbsCertificateData.Part050.rows[i - 2304]?) ∧ (¬ i < 2432 → (i < 2560 → some v = GibbsCertificateData.Part051.rows[i - 2432]?) ∧ (¬ i < 2560 → (i < 2688 → some v = GibbsCertificateData.Part052.rows[i - 2560]?) ∧ (¬ i < 2688 → (i < 2816 → some v = GibbsCertificateData.Part053.rows[i - 2688]?) ∧ (¬ i < 2816 → (i < 2944 → some v = GibbsCertificateData.Part054.rows[i - 2816]?) ∧ (¬ i < 2944 → (i < 3072 → some v = GibbsCertificateData.Part055.rows[i - 2944]?) ∧ (¬ i < 3072 → (i < 3200 → some v = GibbsCertificateData.Part056.rows[i - 3072]?) ∧ (¬ i < 3200 → (i < 3328 → some v = GibbsCertificateData.Part057.rows[i - 3200]?) ∧ (¬ i < 3328 → (i < 3456 → some v = GibbsCertificateData.Part058.rows[i - 3328]?) ∧ (¬ i < 3456 → (i < 3584 → some v = GibbsCertificateData.Part059.rows[i - 3456]?) ∧ (¬ i < 3584 → (i < 3712 → some v = GibbsCertificateData.Part060.rows[i - 3584]?) ∧ (¬ i < 3712 → (i < 3840 → some v = GibbsCertificateData.Part061.rows[i - 3712]?) ∧ (¬ i < 3840 → (i < 3968 → some v = GibbsCertificateData.Part062.rows[i - 3840]?) ∧ (¬ i < 3968 → some v = GibbsCertificateData.Part063.rows[i - 3968]?))))))))))))))))))))))))))))))) := by
  intro v hv
  unfold IndexedCertificateRows.gibbsGroup1 at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part032.rows (i - 0) (Rows.idx_lt_len _ 128 i 0 128 len032 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part033.rows (i - 128) (Rows.idx_lt_len _ 128 i 128 256 len033 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part034.rows (i - 256) (Rows.idx_lt_len _ 128 i 256 384 len034 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part035.rows (i - 384) (Rows.idx_lt_len _ 128 i 384 512 len035 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part036.rows (i - 512) (Rows.idx_lt_len _ 128 i 512 640 len036 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part037.rows (i - 640) (Rows.idx_lt_len _ 128 i 640 768 len037 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part038.rows (i - 768) (Rows.idx_lt_len _ 128 i 768 896 len038 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part039.rows (i - 896) (Rows.idx_lt_len _ 128 i 896 1024 len039 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part040.rows (i - 1024) (Rows.idx_lt_len _ 128 i 1024 1152 len040 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part041.rows (i - 1152) (Rows.idx_lt_len _ 128 i 1152 1280 len041 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part042.rows (i - 1280) (Rows.idx_lt_len _ 128 i 1280 1408 len042 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part043.rows (i - 1408) (Rows.idx_lt_len _ 128 i 1408 1536 len043 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part044.rows (i - 1536) (Rows.idx_lt_len _ 128 i 1536 1664 len044 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part045.rows (i - 1664) (Rows.idx_lt_len _ 128 i 1664 1792 len045 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part046.rows (i - 1792) (Rows.idx_lt_len _ 128 i 1792 1920 len046 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part047.rows (i - 1920) (Rows.idx_lt_len _ 128 i 1920 2048 len047 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part048.rows (i - 2048) (Rows.idx_lt_len _ 128 i 2048 2176 len048 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part049.rows (i - 2176) (Rows.idx_lt_len _ 128 i 2176 2304 len049 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part050.rows (i - 2304) (Rows.idx_lt_len _ 128 i 2304 2432 len050 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part051.rows (i - 2432) (Rows.idx_lt_len _ 128 i 2432 2560 len051 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part052.rows (i - 2560) (Rows.idx_lt_len _ 128 i 2560 2688 len052 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part053.rows (i - 2688) (Rows.idx_lt_len _ 128 i 2688 2816 len053 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part054.rows (i - 2816) (Rows.idx_lt_len _ 128 i 2816 2944 len054 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part055.rows (i - 2944) (Rows.idx_lt_len _ 128 i 2944 3072 len055 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part056.rows (i - 3072) (Rows.idx_lt_len _ 128 i 3072 3200 len056 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part057.rows (i - 3200) (Rows.idx_lt_len _ 128 i 3200 3328 len057 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part058.rows (i - 3328) (Rows.idx_lt_len _ 128 i 3328 3456 len058 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part059.rows (i - 3456) (Rows.idx_lt_len _ 128 i 3456 3584 len059 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part060.rows (i - 3584) (Rows.idx_lt_len _ 128 i 3584 3712 len060 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part061.rows (i - 3712) (Rows.idx_lt_len _ 128 i 3712 3840 len061 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part062.rows (i - 3840) (Rows.idx_lt_len _ 128 i 3840 3968 len062 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  exact Rows.last_val v hv GibbsCertificateData.Part063.rows (i - 3968) (Rows.idx_lt_len _ 128 i 3968 4096 len063 h (by decide) (by decide)) rfl

/-- One pass over the dispatch chain of `gibbsGroup2`, nested by its own conditions. -/
theorem sel_gibbsGroup2 (i : ℕ) (h : i < 4096) : ∀ v, (IndexedCertificateRows.gibbsGroup2 ⟨i, h⟩).val = v →
    (i < 128 → some v = GibbsCertificateData.Part064.rows[i - 0]?) ∧ (¬ i < 128 → (i < 256 → some v = GibbsCertificateData.Part065.rows[i - 128]?) ∧ (¬ i < 256 → (i < 384 → some v = GibbsCertificateData.Part066.rows[i - 256]?) ∧ (¬ i < 384 → (i < 512 → some v = GibbsCertificateData.Part067.rows[i - 384]?) ∧ (¬ i < 512 → (i < 640 → some v = GibbsCertificateData.Part068.rows[i - 512]?) ∧ (¬ i < 640 → (i < 768 → some v = GibbsCertificateData.Part069.rows[i - 640]?) ∧ (¬ i < 768 → (i < 896 → some v = GibbsCertificateData.Part070.rows[i - 768]?) ∧ (¬ i < 896 → (i < 1024 → some v = GibbsCertificateData.Part071.rows[i - 896]?) ∧ (¬ i < 1024 → (i < 1152 → some v = GibbsCertificateData.Part072.rows[i - 1024]?) ∧ (¬ i < 1152 → (i < 1280 → some v = GibbsCertificateData.Part073.rows[i - 1152]?) ∧ (¬ i < 1280 → (i < 1408 → some v = GibbsCertificateData.Part074.rows[i - 1280]?) ∧ (¬ i < 1408 → (i < 1536 → some v = GibbsCertificateData.Part075.rows[i - 1408]?) ∧ (¬ i < 1536 → (i < 1664 → some v = GibbsCertificateData.Part076.rows[i - 1536]?) ∧ (¬ i < 1664 → (i < 1792 → some v = GibbsCertificateData.Part077.rows[i - 1664]?) ∧ (¬ i < 1792 → (i < 1920 → some v = GibbsCertificateData.Part078.rows[i - 1792]?) ∧ (¬ i < 1920 → (i < 2048 → some v = GibbsCertificateData.Part079.rows[i - 1920]?) ∧ (¬ i < 2048 → (i < 2176 → some v = GibbsCertificateData.Part080.rows[i - 2048]?) ∧ (¬ i < 2176 → (i < 2304 → some v = GibbsCertificateData.Part081.rows[i - 2176]?) ∧ (¬ i < 2304 → (i < 2432 → some v = GibbsCertificateData.Part082.rows[i - 2304]?) ∧ (¬ i < 2432 → (i < 2560 → some v = GibbsCertificateData.Part083.rows[i - 2432]?) ∧ (¬ i < 2560 → (i < 2688 → some v = GibbsCertificateData.Part084.rows[i - 2560]?) ∧ (¬ i < 2688 → (i < 2816 → some v = GibbsCertificateData.Part085.rows[i - 2688]?) ∧ (¬ i < 2816 → (i < 2944 → some v = GibbsCertificateData.Part086.rows[i - 2816]?) ∧ (¬ i < 2944 → (i < 3072 → some v = GibbsCertificateData.Part087.rows[i - 2944]?) ∧ (¬ i < 3072 → (i < 3200 → some v = GibbsCertificateData.Part088.rows[i - 3072]?) ∧ (¬ i < 3200 → (i < 3328 → some v = GibbsCertificateData.Part089.rows[i - 3200]?) ∧ (¬ i < 3328 → (i < 3456 → some v = GibbsCertificateData.Part090.rows[i - 3328]?) ∧ (¬ i < 3456 → (i < 3584 → some v = GibbsCertificateData.Part091.rows[i - 3456]?) ∧ (¬ i < 3584 → (i < 3712 → some v = GibbsCertificateData.Part092.rows[i - 3584]?) ∧ (¬ i < 3712 → (i < 3840 → some v = GibbsCertificateData.Part093.rows[i - 3712]?) ∧ (¬ i < 3840 → (i < 3968 → some v = GibbsCertificateData.Part094.rows[i - 3840]?) ∧ (¬ i < 3968 → some v = GibbsCertificateData.Part095.rows[i - 3968]?))))))))))))))))))))))))))))))) := by
  intro v hv
  unfold IndexedCertificateRows.gibbsGroup2 at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part064.rows (i - 0) (Rows.idx_lt_len _ 128 i 0 128 len064 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part065.rows (i - 128) (Rows.idx_lt_len _ 128 i 128 256 len065 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part066.rows (i - 256) (Rows.idx_lt_len _ 128 i 256 384 len066 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part067.rows (i - 384) (Rows.idx_lt_len _ 128 i 384 512 len067 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part068.rows (i - 512) (Rows.idx_lt_len _ 128 i 512 640 len068 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part069.rows (i - 640) (Rows.idx_lt_len _ 128 i 640 768 len069 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part070.rows (i - 768) (Rows.idx_lt_len _ 128 i 768 896 len070 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part071.rows (i - 896) (Rows.idx_lt_len _ 128 i 896 1024 len071 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part072.rows (i - 1024) (Rows.idx_lt_len _ 128 i 1024 1152 len072 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part073.rows (i - 1152) (Rows.idx_lt_len _ 128 i 1152 1280 len073 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part074.rows (i - 1280) (Rows.idx_lt_len _ 128 i 1280 1408 len074 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part075.rows (i - 1408) (Rows.idx_lt_len _ 128 i 1408 1536 len075 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part076.rows (i - 1536) (Rows.idx_lt_len _ 128 i 1536 1664 len076 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part077.rows (i - 1664) (Rows.idx_lt_len _ 128 i 1664 1792 len077 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part078.rows (i - 1792) (Rows.idx_lt_len _ 128 i 1792 1920 len078 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part079.rows (i - 1920) (Rows.idx_lt_len _ 128 i 1920 2048 len079 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part080.rows (i - 2048) (Rows.idx_lt_len _ 128 i 2048 2176 len080 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part081.rows (i - 2176) (Rows.idx_lt_len _ 128 i 2176 2304 len081 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part082.rows (i - 2304) (Rows.idx_lt_len _ 128 i 2304 2432 len082 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part083.rows (i - 2432) (Rows.idx_lt_len _ 128 i 2432 2560 len083 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part084.rows (i - 2560) (Rows.idx_lt_len _ 128 i 2560 2688 len084 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part085.rows (i - 2688) (Rows.idx_lt_len _ 128 i 2688 2816 len085 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part086.rows (i - 2816) (Rows.idx_lt_len _ 128 i 2816 2944 len086 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part087.rows (i - 2944) (Rows.idx_lt_len _ 128 i 2944 3072 len087 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part088.rows (i - 3072) (Rows.idx_lt_len _ 128 i 3072 3200 len088 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part089.rows (i - 3200) (Rows.idx_lt_len _ 128 i 3200 3328 len089 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part090.rows (i - 3328) (Rows.idx_lt_len _ 128 i 3328 3456 len090 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part091.rows (i - 3456) (Rows.idx_lt_len _ 128 i 3456 3584 len091 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part092.rows (i - 3584) (Rows.idx_lt_len _ 128 i 3584 3712 len092 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part093.rows (i - 3712) (Rows.idx_lt_len _ 128 i 3712 3840 len093 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part094.rows (i - 3840) (Rows.idx_lt_len _ 128 i 3840 3968 len094 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  exact Rows.last_val v hv GibbsCertificateData.Part095.rows (i - 3968) (Rows.idx_lt_len _ 128 i 3968 4096 len095 h (by decide) (by decide)) rfl

/-- One pass over the dispatch chain of `gibbsGroup3`, nested by its own conditions. -/
theorem sel_gibbsGroup3 (i : ℕ) (h : i < 4096) : ∀ v, (IndexedCertificateRows.gibbsGroup3 ⟨i, h⟩).val = v →
    (i < 128 → some v = GibbsCertificateData.Part096.rows[i - 0]?) ∧ (¬ i < 128 → (i < 256 → some v = GibbsCertificateData.Part097.rows[i - 128]?) ∧ (¬ i < 256 → (i < 384 → some v = GibbsCertificateData.Part098.rows[i - 256]?) ∧ (¬ i < 384 → (i < 512 → some v = GibbsCertificateData.Part099.rows[i - 384]?) ∧ (¬ i < 512 → (i < 640 → some v = GibbsCertificateData.Part100.rows[i - 512]?) ∧ (¬ i < 640 → (i < 768 → some v = GibbsCertificateData.Part101.rows[i - 640]?) ∧ (¬ i < 768 → (i < 896 → some v = GibbsCertificateData.Part102.rows[i - 768]?) ∧ (¬ i < 896 → (i < 1024 → some v = GibbsCertificateData.Part103.rows[i - 896]?) ∧ (¬ i < 1024 → (i < 1152 → some v = GibbsCertificateData.Part104.rows[i - 1024]?) ∧ (¬ i < 1152 → (i < 1280 → some v = GibbsCertificateData.Part105.rows[i - 1152]?) ∧ (¬ i < 1280 → (i < 1408 → some v = GibbsCertificateData.Part106.rows[i - 1280]?) ∧ (¬ i < 1408 → (i < 1536 → some v = GibbsCertificateData.Part107.rows[i - 1408]?) ∧ (¬ i < 1536 → (i < 1664 → some v = GibbsCertificateData.Part108.rows[i - 1536]?) ∧ (¬ i < 1664 → (i < 1792 → some v = GibbsCertificateData.Part109.rows[i - 1664]?) ∧ (¬ i < 1792 → (i < 1920 → some v = GibbsCertificateData.Part110.rows[i - 1792]?) ∧ (¬ i < 1920 → (i < 2048 → some v = GibbsCertificateData.Part111.rows[i - 1920]?) ∧ (¬ i < 2048 → (i < 2176 → some v = GibbsCertificateData.Part112.rows[i - 2048]?) ∧ (¬ i < 2176 → (i < 2304 → some v = GibbsCertificateData.Part113.rows[i - 2176]?) ∧ (¬ i < 2304 → (i < 2432 → some v = GibbsCertificateData.Part114.rows[i - 2304]?) ∧ (¬ i < 2432 → (i < 2560 → some v = GibbsCertificateData.Part115.rows[i - 2432]?) ∧ (¬ i < 2560 → (i < 2688 → some v = GibbsCertificateData.Part116.rows[i - 2560]?) ∧ (¬ i < 2688 → (i < 2816 → some v = GibbsCertificateData.Part117.rows[i - 2688]?) ∧ (¬ i < 2816 → (i < 2944 → some v = GibbsCertificateData.Part118.rows[i - 2816]?) ∧ (¬ i < 2944 → (i < 3072 → some v = GibbsCertificateData.Part119.rows[i - 2944]?) ∧ (¬ i < 3072 → (i < 3200 → some v = GibbsCertificateData.Part120.rows[i - 3072]?) ∧ (¬ i < 3200 → (i < 3328 → some v = GibbsCertificateData.Part121.rows[i - 3200]?) ∧ (¬ i < 3328 → (i < 3456 → some v = GibbsCertificateData.Part122.rows[i - 3328]?) ∧ (¬ i < 3456 → (i < 3584 → some v = GibbsCertificateData.Part123.rows[i - 3456]?) ∧ (¬ i < 3584 → (i < 3712 → some v = GibbsCertificateData.Part124.rows[i - 3584]?) ∧ (¬ i < 3712 → (i < 3840 → some v = GibbsCertificateData.Part125.rows[i - 3712]?) ∧ (¬ i < 3840 → (i < 3968 → some v = GibbsCertificateData.Part126.rows[i - 3840]?) ∧ (¬ i < 3968 → some v = GibbsCertificateData.Part127.rows[i - 3968]?))))))))))))))))))))))))))))))) := by
  intro v hv
  unfold IndexedCertificateRows.gibbsGroup3 at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part096.rows (i - 0) (Rows.idx_lt_len _ 128 i 0 128 len096 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part097.rows (i - 128) (Rows.idx_lt_len _ 128 i 128 256 len097 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part098.rows (i - 256) (Rows.idx_lt_len _ 128 i 256 384 len098 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part099.rows (i - 384) (Rows.idx_lt_len _ 128 i 384 512 len099 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part100.rows (i - 512) (Rows.idx_lt_len _ 128 i 512 640 len100 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part101.rows (i - 640) (Rows.idx_lt_len _ 128 i 640 768 len101 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part102.rows (i - 768) (Rows.idx_lt_len _ 128 i 768 896 len102 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part103.rows (i - 896) (Rows.idx_lt_len _ 128 i 896 1024 len103 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part104.rows (i - 1024) (Rows.idx_lt_len _ 128 i 1024 1152 len104 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part105.rows (i - 1152) (Rows.idx_lt_len _ 128 i 1152 1280 len105 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part106.rows (i - 1280) (Rows.idx_lt_len _ 128 i 1280 1408 len106 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part107.rows (i - 1408) (Rows.idx_lt_len _ 128 i 1408 1536 len107 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part108.rows (i - 1536) (Rows.idx_lt_len _ 128 i 1536 1664 len108 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part109.rows (i - 1664) (Rows.idx_lt_len _ 128 i 1664 1792 len109 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part110.rows (i - 1792) (Rows.idx_lt_len _ 128 i 1792 1920 len110 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part111.rows (i - 1920) (Rows.idx_lt_len _ 128 i 1920 2048 len111 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part112.rows (i - 2048) (Rows.idx_lt_len _ 128 i 2048 2176 len112 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part113.rows (i - 2176) (Rows.idx_lt_len _ 128 i 2176 2304 len113 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part114.rows (i - 2304) (Rows.idx_lt_len _ 128 i 2304 2432 len114 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part115.rows (i - 2432) (Rows.idx_lt_len _ 128 i 2432 2560 len115 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part116.rows (i - 2560) (Rows.idx_lt_len _ 128 i 2560 2688 len116 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part117.rows (i - 2688) (Rows.idx_lt_len _ 128 i 2688 2816 len117 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part118.rows (i - 2816) (Rows.idx_lt_len _ 128 i 2816 2944 len118 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part119.rows (i - 2944) (Rows.idx_lt_len _ 128 i 2944 3072 len119 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part120.rows (i - 3072) (Rows.idx_lt_len _ 128 i 3072 3200 len120 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part121.rows (i - 3200) (Rows.idx_lt_len _ 128 i 3200 3328 len121 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part122.rows (i - 3328) (Rows.idx_lt_len _ 128 i 3328 3456 len122 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part123.rows (i - 3456) (Rows.idx_lt_len _ 128 i 3456 3584 len123 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part124.rows (i - 3584) (Rows.idx_lt_len _ 128 i 3584 3712 len124 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part125.rows (i - 3712) (Rows.idx_lt_len _ 128 i 3712 3840 len125 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part126.rows (i - 3840) (Rows.idx_lt_len _ 128 i 3840 3968 len126 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  exact Rows.last_val v hv GibbsCertificateData.Part127.rows (i - 3968) (Rows.idx_lt_len _ 128 i 3968 4096 len127 h (by decide) (by decide)) rfl

/-- One pass over the dispatch chain of `gibbsGroup4`, nested by its own conditions. -/
theorem sel_gibbsGroup4 (i : ℕ) (h : i < 245) : ∀ v, (IndexedCertificateRows.gibbsGroup4 ⟨i, h⟩).val = v →
    (i < 128 → some v = GibbsCertificateData.Part128.rows[i - 0]?) ∧ (¬ i < 128 → some v = GibbsCertificateData.Part129.rows[i - 128]?) := by
  intro v hv
  unfold IndexedCertificateRows.gibbsGroup4 at hv
  refine ⟨fun hk => Rows.dite_val v hv hk GibbsCertificateData.Part128.rows (i - 0) (Rows.idx_lt_len _ 128 i 0 128 len128 hk (by decide) (by decide)) (fun _ => rfl), fun hk => ?_⟩
  rw [dif_neg hk] at hv
  exact Rows.last_val v hv GibbsCertificateData.Part129.rows (i - 128) (Rows.idx_lt_len _ 117 i 128 245 len129 h (by decide) (by decide)) rfl

/-- One pass over the top-level dispatch of `gibbs`. -/
theorem sel_top (r : ℕ) (h : r < 16629) : ∀ v, (IndexedCertificateRows.gibbs ⟨r, h⟩).val = v →
    (r < 4096 → ∀ p : r - 0 < 4096, (IndexedCertificateRows.gibbsGroup0 ⟨r - 0, p⟩).val = v) ∧ (¬ r < 4096 → (r < 8192 → ∀ p : r - 4096 < 4096, (IndexedCertificateRows.gibbsGroup1 ⟨r - 4096, p⟩).val = v) ∧ (¬ r < 8192 → (r < 12288 → ∀ p : r - 8192 < 4096, (IndexedCertificateRows.gibbsGroup2 ⟨r - 8192, p⟩).val = v) ∧ (¬ r < 12288 → (r < 16384 → ∀ p : r - 12288 < 4096, (IndexedCertificateRows.gibbsGroup3 ⟨r - 12288, p⟩).val = v) ∧ (¬ r < 16384 → ∀ p : r - 16384 < 245, (IndexedCertificateRows.gibbsGroup4 ⟨r - 16384, p⟩).val = v)))) := by
  intro v hv
  unfold IndexedCertificateRows.gibbs at hv
  refine ⟨fun hk p => by rw [dif_pos hk] at hv; exact hv, fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk p => by rw [dif_pos hk] at hv; exact hv, fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk p => by rw [dif_pos hk] at hv; exact hv, fun hk => ?_⟩
  rw [dif_neg hk] at hv
  refine ⟨fun hk p => by rw [dif_pos hk] at hv; exact hv, fun hk => ?_⟩
  rw [dif_neg hk] at hv
  exact fun p => hv


end FKLBridge.Gibbs
