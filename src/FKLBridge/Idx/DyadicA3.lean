module

public import FKLBridge.IndexTable
public import ParameterIndexData.DyadicA3

@[expose] public section

namespace FKLBridge.Idx.DyadicA3

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000

/-- Packed lanes 0…127 (width 10). -/
def chunk000 : ℕ := 0x1fc7e1f47c1dc4a1ec7a1e4781dc761d4741cc721c4701bc6e1b46c1ac6a1a46819c661946418c621846017c5e1745c16c5a1645815c561545414c521445013c4e1344c12c4a1244811c461144410c42104400fc3e0f43c0ec3a0e4380dc360d4340cc320c4300bc2e0b42c0ac2a0a42809c260942408c220842007c1e0741c06c1a0641805c160541404c120441003c0e0340c02c0a0240801c060140400c02
/-- Packed lanes 128…255 (width 10). -/
def chunk001 : ℕ := 0x3f8fd3f0fb3e8f93e0f73d8f53d0f3128f23c4f03bcee3b4ec3acea3a4e839ce6394e438ce2384e037cde374dc36cda364d835cd6354d434cd2344d033cce334cc32cca324c831cc6314c430cc2304c02fcbe2f4bc2ecba2e4b82dcb62d4b42ccb22c4b02bcae2b4ac2acaa2a4a829ca6294a428ca2284a027c9e2749c26c9a2649825c962549424c922449023c8e2348c22c8a2248821c862148420c8220480
/-- Packed lanes 256…383 (width 10). -/
def chunk002 : ℕ := 0x5f97d5f17b5e9795e1775d9755d1735c9715c16f5b96d5b16b5a9695a1675996559163589615815f5795d5715b56959561575595555153549515414f5394d5314b52949521475194551143509415013f4f93d4f13b4e9394e1374d9354d1334c9314c12f4b92d4b12b4a9294a1274992549123489214811f4791d4711b46919461174591545113449114410f4390d4310b4290942107419054110340901400ff
/-- Packed lanes 384…511 (width 10). -/
def chunk003 : ℕ := 0x7f5fc7edfa7e5f87ddf67d5f47cdf27c5f07bdee7b5ec7adea7a5e879de6795e478de2785e077dde775dc76dda765d875dd6755d474dd2745d073dce735cc72dca725c871dc6715c470dc2705c06fdbe6f5bc6edba6e5b86ddb66d5b46cdb26c5b06bdae6b5ac6adaa6a5a869da6695a468da2685a067d9e6759c66d9a6659865d966559464d926459063d8e1dd8d6318b62989621876198561183609816017f
/-- Packed lanes 512…639 (width 10). -/
def chunk004 : ℕ := 0x9f27b9ea799e2779da759d2739ca719c26f9ba6d9b26b9aa699a26799a659926398a619825f97a5d9725b96a599625795a559525394a519424f93a4d9324b92a499224791a459124390a419023f8fa3d8f23b8ea398e2378da358d2338ca318c22f8ba2d8b22b8aa298a22789a258922388a218821f87a1d8721b86a198621785a158521384a118420f83a0d8320b82a098220781a058107780e02806007fdfe
/-- Packed lanes 640…767 (width 10). -/
def chunk005 : ℕ := 0xbf2fbbeaf9be2f7bdaf5bd2f3bcaf1bc2efbbaedbb2ebbaae9ba2e7b9ae5b92e3b8ae1b82dfb7addb72dbb6ad9b62d7b5ad5b52d3b4ad1b42cfb3acdb32cbb2ac9b22c7b1ac5b12c3b0ac1b02bfafabdaf2bbaeab9ae2b7adab5ad2b3acab1ac2afabaadab2abaaaa9aa2a7a9aa5a92a3a8aa1a829fa7a9da729ba6a99a6297a5a95a5293a4a91a428fa3a8da328ba2a89a2287a1a85a1283a0a81a027f9fa7d
/-- Packed lanes 768…895 (width 10). -/
def chunk006 : ℕ := 0xdeb79de377ddb75dd373dcb71dc36fdbb6ddb36bdab69da04ad9f66d9764d8f62d8760d7f5ed775cd6f5ad6758d5f56d5754d4f52d4750d3f4ed374cd2f4ad2748d1f46d1744d0c0bd0b41d033fcfb3dcf33bceb39ce337cdb35cd333ccb31cc32fcbb2dcb32bcab29ca327c9b25c9323c8b21c831fc7b1dc731bc6b19c6317c5b15c5313c4b11c430fc3b0dc330bc2b09c2307c1b05c1303c0b01c02ffbfafd
/-- Packed lanes 896…1023 (width 10). -/
def chunk007 : ℕ := 0x3abeaba9ea3a7e9ba5e93a3e8ba1e839fe7b9de739be6b99e6397e5b95e5393e4b91e438fe3b8de338be2b89e2387e1b85e1383e0b81e037fdfb7ddf37b

/-- Chunk tree: bit `l` of the chunk number selects the branch at depth `l`. -/
def tree : FKL.Tree :=
  (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk000)
    (FKL.Tree.leaf chunk004)) (FKL.Tree.node
    (FKL.Tree.leaf chunk002)
    (FKL.Tree.leaf chunk006))) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk001)
    (FKL.Tree.leaf chunk005)) (FKL.Tree.node
    (FKL.Tree.leaf chunk003)
    (FKL.Tree.leaf chunk007))))

theorem check000 : lanesEq 10 1023 MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf000.entries (tree.get 0) = true := by decide +kernel
theorem check001 : lanesEq 10 1023 MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf001.entries (tree.get 1) = true := by decide +kernel
theorem check002 : lanesEq 10 1023 MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf002.entries (tree.get 2) = true := by decide +kernel
theorem check003 : lanesEq 10 1023 MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf003.entries (tree.get 3) = true := by decide +kernel
theorem check004 : lanesEq 10 1023 MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf004.entries (tree.get 4) = true := by decide +kernel
theorem check005 : lanesEq 10 1023 MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf005.entries (tree.get 5) = true := by decide +kernel
theorem check006 : lanesEq 10 1023 MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf006.entries (tree.get 6) = true := by decide +kernel
theorem check007 : lanesEq 10 1023 MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf007.entries (tree.get 7) = true := by decide +kernel

theorem reads_ParameterIndexData_DyadicA3Part000_leaf000 : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf000 (FKL.ptGet tree 7 10) 0 :=
  reads_chunk tree 7 10 1023 0 MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf000 0 (by rfl) (by decide) (by decide) check000
theorem reads_ParameterIndexData_DyadicA3Part000_leaf001 : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf001 (FKL.ptGet tree 7 10) 128 :=
  reads_chunk tree 7 10 1023 1 MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf001 128 (by rfl) (by decide) (by decide) check001
theorem reads_ParameterIndexData_DyadicA3Part000_leaf002 : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf002 (FKL.ptGet tree 7 10) 256 :=
  reads_chunk tree 7 10 1023 2 MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf002 256 (by rfl) (by decide) (by decide) check002
theorem reads_ParameterIndexData_DyadicA3Part000_leaf003 : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf003 (FKL.ptGet tree 7 10) 384 :=
  reads_chunk tree 7 10 1023 3 MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf003 384 (by rfl) (by decide) (by decide) check003
theorem reads_ParameterIndexData_DyadicA3Part000_leaf004 : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf004 (FKL.ptGet tree 7 10) 512 :=
  reads_chunk tree 7 10 1023 4 MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf004 512 (by rfl) (by decide) (by decide) check004
theorem reads_ParameterIndexData_DyadicA3Part000_leaf005 : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf005 (FKL.ptGet tree 7 10) 640 :=
  reads_chunk tree 7 10 1023 5 MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf005 640 (by rfl) (by decide) (by decide) check005
theorem reads_ParameterIndexData_DyadicA3Part000_leaf006 : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf006 (FKL.ptGet tree 7 10) 768 :=
  reads_chunk tree 7 10 1023 6 MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf006 768 (by rfl) (by decide) (by decide) check006
theorem reads_ParameterIndexData_DyadicA3Part000_leaf007 : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf007 (FKL.ptGet tree 7 10) 896 :=
  reads_chunk tree 7 10 1023 7 MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf007 896 (by rfl) (by decide) (by decide) check007

theorem reads_ParameterIndexData_DyadicA3Part000_table : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.table (FKL.ptGet tree 7 10) 0 :=
  (reads_append (A := ((((((MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf000).append (MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf001)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf002)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf003)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf004)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf005)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf006)) (B := MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf007) _ 0 896 (by rfl) (reads_append (A := (((((MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf000).append (MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf001)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf002)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf003)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf004)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf005)) (B := MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf006) _ 0 768 (by rfl) (reads_append (A := ((((MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf000).append (MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf001)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf002)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf003)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf004)) (B := MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf005) _ 0 640 (by rfl) (reads_append (A := (((MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf000).append (MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf001)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf002)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf003)) (B := MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf004) _ 0 512 (by rfl) (reads_append (A := ((MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf000).append (MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf001)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf002)) (B := MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf003) _ 0 384 (by rfl) (reads_append (A := (MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf000).append (MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf001)) (B := MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf002) _ 0 256 (by rfl) (reads_append (A := MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf000) (B := MatrixBounds.Numeric.ParameterIndexData.DyadicA3Part000.leaf001) _ 0 128 (by rfl) FKLBridge.Idx.DyadicA3.reads_ParameterIndexData_DyadicA3Part000_leaf000 FKLBridge.Idx.DyadicA3.reads_ParameterIndexData_DyadicA3Part000_leaf001) FKLBridge.Idx.DyadicA3.reads_ParameterIndexData_DyadicA3Part000_leaf002) FKLBridge.Idx.DyadicA3.reads_ParameterIndexData_DyadicA3Part000_leaf003) FKLBridge.Idx.DyadicA3.reads_ParameterIndexData_DyadicA3Part000_leaf004) FKLBridge.Idx.DyadicA3.reads_ParameterIndexData_DyadicA3Part000_leaf005) FKLBridge.Idx.DyadicA3.reads_ParameterIndexData_DyadicA3Part000_leaf006) FKLBridge.Idx.DyadicA3.reads_ParameterIndexData_DyadicA3Part000_leaf007)

theorem reads_ParameterIndexData_DyadicA3_table : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicA3.table (FKL.ptGet tree 7 10) 0 :=
  FKLBridge.Idx.DyadicA3.reads_ParameterIndexData_DyadicA3Part000_table

/-- Every lookup of `ParameterIndexData.DyadicA3.table` is lane `i` of the packed chunk tree. -/
theorem get_eq : ∀ i : Fin 945, (MatrixBounds.Numeric.ParameterIndexData.DyadicA3.table.get i).val = FKL.ptGet tree 7 10 i.val :=
  reads_get FKLBridge.Idx.DyadicA3.reads_ParameterIndexData_DyadicA3_table

end FKLBridge.Idx.DyadicA3
