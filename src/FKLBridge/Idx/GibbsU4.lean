module

public import FKLBridge.IndexTable
public import ParameterIndexData.GibbsU4

@[expose] public section

namespace FKLBridge.Idx.GibbsU4

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000

/-- Packed lanes 0…127 (width 15). -/
def chunk000 : ℕ := 0x806d00d601a4033806500c6018402f805d00b6016402b805500a60144027804d0096012402380450086010401f803d007600e401b8035006600c4017802d005600a401380250046008400f801d0036006400b801500260044007800d00160024003800500060003fff7ffcfff5ffe3ffb7ff4ffe5ffc3ff77fecffd5ffa3ff37fe4ffc5ff83fef7fdcffb5ff63feb7fd4ffa5ff43fe77fccff95ff23fe37fc4ff85ff03fdf7fbcff75fee3fdb7fb4ff65fec3fd77facff55fea3fd37fa4ff45fe83fcf7f9cff35fe63fcb7f94ff25fe43fc77f8cff15fe23fc37f84ff05fe03fbf7f7cfef5fde3fbb7f74fee5fdc3fb7
/-- Packed lanes 128…255 (width 15). -/
def chunk001 : ℕ := 0x816d02d605a40b3816502c605840af815d02b605640ab815502a605440a7814d029605240a381450286050409f813d027604e409b8135026604c4097812d025604a409381250246048408f811d0236046408b811502260444087810d0216042408381050206040407f80fd01f603e407b80f501e603c407780ed01d603a407380e501c6038406f80dd01b6036406b80d501a6034406780cd0196032406380c50186030405f80bd017602e405b80b5016602c405780ad015602a405380a50146028404f809d0136026404b809501260244047808d0116022404380850106020403f807d00f601e403b807500e601c4037
/-- Packed lanes 256…383 (width 15). -/
def chunk002 : ℕ := 0x103c607840ef81dd03b607640eb81d503a607440e781cd039607240e381c5038607040df81bd037606e40db81b5036606c40d781ad035606a40d381a5034606840cf819d033606640cb8195032606440c7818d031606240c38185030606040bf817d02f605e40bb817502e605c40b7

/-- Chunk tree: bit `l` of the chunk number selects the branch at depth `l`. -/
def tree : FKL.Tree :=
  (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk000)
    (FKL.Tree.leaf chunk002))
    (FKL.Tree.leaf chunk001))

theorem check000 : lanesEq 15 32767 MatrixBounds.Numeric.ParameterIndexData.GibbsU4Part000.leaf000.entries (tree.get 0) = true := by decide +kernel
theorem check001 : lanesEq 15 32767 MatrixBounds.Numeric.ParameterIndexData.GibbsU4Part000.leaf001.entries (tree.get 1) = true := by decide +kernel
theorem check002 : lanesEq 15 32767 MatrixBounds.Numeric.ParameterIndexData.GibbsU4Part000.leaf002.entries (tree.get 2) = true := by decide +kernel

theorem reads_ParameterIndexData_GibbsU4Part000_leaf000 : Reads MatrixBounds.Numeric.ParameterIndexData.GibbsU4Part000.leaf000 (FKL.ptGet tree 7 15) 0 :=
  reads_chunk tree 7 15 32767 0 MatrixBounds.Numeric.ParameterIndexData.GibbsU4Part000.leaf000 0 (by rfl) (by decide) (by decide) check000
theorem reads_ParameterIndexData_GibbsU4Part000_leaf001 : Reads MatrixBounds.Numeric.ParameterIndexData.GibbsU4Part000.leaf001 (FKL.ptGet tree 7 15) 128 :=
  reads_chunk tree 7 15 32767 1 MatrixBounds.Numeric.ParameterIndexData.GibbsU4Part000.leaf001 128 (by rfl) (by decide) (by decide) check001
theorem reads_ParameterIndexData_GibbsU4Part000_leaf002 : Reads MatrixBounds.Numeric.ParameterIndexData.GibbsU4Part000.leaf002 (FKL.ptGet tree 7 15) 256 :=
  reads_chunk tree 7 15 32767 2 MatrixBounds.Numeric.ParameterIndexData.GibbsU4Part000.leaf002 256 (by rfl) (by decide) (by decide) check002

theorem reads_ParameterIndexData_GibbsU4Part000_table : Reads MatrixBounds.Numeric.ParameterIndexData.GibbsU4Part000.table (FKL.ptGet tree 7 15) 0 :=
  (reads_append (A := (MatrixBounds.Numeric.ParameterIndexData.GibbsU4Part000.leaf000).append (MatrixBounds.Numeric.ParameterIndexData.GibbsU4Part000.leaf001)) (B := MatrixBounds.Numeric.ParameterIndexData.GibbsU4Part000.leaf002) _ 0 256 (by rfl) (reads_append (A := MatrixBounds.Numeric.ParameterIndexData.GibbsU4Part000.leaf000) (B := MatrixBounds.Numeric.ParameterIndexData.GibbsU4Part000.leaf001) _ 0 128 (by rfl) FKLBridge.Idx.GibbsU4.reads_ParameterIndexData_GibbsU4Part000_leaf000 FKLBridge.Idx.GibbsU4.reads_ParameterIndexData_GibbsU4Part000_leaf001) FKLBridge.Idx.GibbsU4.reads_ParameterIndexData_GibbsU4Part000_leaf002)

theorem reads_ParameterIndexData_GibbsU4_table : Reads MatrixBounds.Numeric.ParameterIndexData.GibbsU4.table (FKL.ptGet tree 7 15) 0 :=
  FKLBridge.Idx.GibbsU4.reads_ParameterIndexData_GibbsU4Part000_table

/-- Every lookup of `ParameterIndexData.GibbsU4.table` is lane `i` of the packed chunk tree. -/
theorem get_eq : ∀ i : Fin 315, (MatrixBounds.Numeric.ParameterIndexData.GibbsU4.table.get i).val = FKL.ptGet tree 7 15 i.val :=
  reads_get FKLBridge.Idx.GibbsU4.reads_ParameterIndexData_GibbsU4_table

end FKLBridge.Idx.GibbsU4
