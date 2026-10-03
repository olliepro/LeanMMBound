module

public import FKLBridge.IndexTable
public import ParameterIndexData.DyadicZero3

@[expose] public section

namespace FKLBridge.Idx.DyadicZero3

open FKLBridge MatrixBounds.Numeric
set_option maxRecDepth 100000

/-- Packed lanes 0…127 (width 14). -/
def chunk000 : ℕ := 0xe697965e6939a3e5979a2e6879a0e67f99ee597964e677965e67399be66b999e597964e663965e65f996e657965e593994e597993e64b965e593991e597990e597964e63f965e597964e597964e5eb965e59397ae63b965e59397ae63798ce597964e5eb98be62b989e597964e5eb988e61f986e617965e59397ae613983e60b981e603965e597964e5eb97fe5fb97de5f397be597965e59797ae5e7978e5df976e5d7965e593965e5d3973e5cb971e5c3965e593965e5bf96ee5b796ce597964e59796be5ab969e597964e597968e59f965e593965e59b965e593965e597964
/-- Packed lanes 128…255 (width 14). -/
def chunk001 : ℕ := 0xe5eb9f6e7d79f4e7cf965e59397ae7cb9f1e7c39efe7bb9ede597964e5eb9ece7af9eae7a79e8e79f9e6e797965e5eb9e4e78f9e2e7879e0e77f9dee7779dce5979dbe76b9d9e7639d7e5979d6e7579d4e5979d3e74b9d1e743965e5939cfe73b965e7379cce72f965e5939cae727965e7239c7e597964e71b9c5e5979c4e597964e70f9c2e597965e5939c1e597964e5eb9c0e597964e5eb9bfe6fb965e59397ae6f79bce6ef965e59397ae6eb9b9e6e39b7e597964e5eb9b6e6d79b4e6cf9b2e6c7965e59397ae6c39afe6bb9ade6b39abe6ab965e59797ae6a79a8e69f9a6
/-- Packed lanes 256…383 (width 14). -/
def chunk002 : ℕ := 0xe92b965e593a49e923a47e91b965e917965e593a44e90fa42e907965e597964e903a3fe8fb965e59397ae8f7a3ce8ef965e59397ae8eba39e8e3a37e597964e5eba36e8d7a34e8cfa32e8c7965e59397ae8c3a2fe8bba2de8b3a2be8aba29e59797ae8a3a27e89ba25e893a23e88ba21e883a1fe87ba1de873a1be86ba19e863a17e85ba15e597a14e84fa12e847965e843a0fe83ba0de597a0ce82fa0ae597964e827a08e81f965e81ba05e597964e813a03e80b965e807965e593a00e7ff9fee597965e5939fde7f3965e59397ae7ef9fae597964e5eb9f9e7e39f7e597964
/-- Packed lanes 384…511 (width 14). -/
def chunk003 : ℕ := 0xead3ab3eacbab1eac3aafeabbaadeab3aabeaabaa9eaa3aa7ea9baa5ea93aa3ea8baa1ea83a9fea7ba9dea73a9bea6ba99ea63a97e597a96ea57965ea53a93ea4ba91ea43a8fe597a8ee597964ea37a8cea2fa8aea27965e597964ea23a87ea1ba85e597964e5eba84ea0fa82ea07965e59397aea03a7fe9fba7de9f3a7be597964e5eba7ae9e7a78e9dfa76e9d7a74e9cf965e5eba72e9c7a70e9bfa6ee9b7a6ce9afa6ae9a7a68e99fa66e997a64e98fa62e987a60e97fa5ee977a5ce96fa5ae967a58e95fa56e957a54e597a53e94ba51e597a50e93fa4ee937a4ce597a4b
/-- Packed lanes 512…639 (width 14). -/
def chunk004 : ℕ := 0xec43965e59797ae5ebb0fec3bb0dec33b0be597964e5eb97ae5ebb0aec27b08ec1fb06ec17965e5ebb04e5eb97aec0fb02ec07b00ebffafeebf7afcebef97ae5ebafaebe7af8ebdfaf6ebd7af4ebcfaf2e5eb97aebc7af0ebbfaeeebb7aecebafaeaeba797ae5ebae8eb9fae6eb97ae4eb8fae2eb87ae0e5eb97aeb7fadeeb77adceb6fadae597ad9e59797ae5ebad8eb5fad6eb57ad4e597965e593ad3eb4bad1eb43acfe597964e5ebaceeb37acceb2facaeb27965e59397aeb23ac7eb1bac5eb13ac3eb0bac1e59797aeb03abfeafbabdeaf3abbeaebab9eae3ab7eadbab5
/-- Packed lanes 640…767 (width 14). -/
def chunk005 : ℕ := 0xe5eb97aed8bb61ed83b5fe59397ae5ebb5eed77b5ced6f964e5eb97aed6bb59ed63b57ed5b964e5eb97aed57b54ed4fb52ed47964e5eb97aed43b4fed3bb4ded33964e5eb97aed2fb4aed27b48ed1f964e5eb97aed1bb45ed13b43ed0b964e5eb97aed07b40ecffb3eecf7964e5eb97aecf3b3becebb39ece3965e5eb964e5eb97aecdfb36ecd7b34eccfb32ecc7964e5eb97aecc3b2fecbbb2decb3b2becab964e5eb97aeca7b28ec9fb26ec97b24ec8f964e5eb97aec8bb21ec83b1fec7bb1dec73964e5eb97aec6fb1aec67b18ec5fb16ec57964e5eb97aec53b13ec4bb11
/-- Packed lanes 768…895 (width 14). -/
def chunk006 : ℕ := 0xe59397ae5eb964e5eb97aee0b964e5eb97aee07964e5eb97aee03b7fe59397ae5ebb7eedf7964e5eb97aedf3b7be59397ae5ebb7aede7b78e59397ae5ebb77eddbb75e59397ae5ebb74edcfb72e59397ae5ebb71edc3b6fe59397ae5ebb6eedb7b6cedaf964e5eb97aedabb69eda3b67e59397ae5ebb66ed97b64ed8f964

/-- Chunk tree: bit `l` of the chunk number selects the branch at depth `l`. -/
def tree : FKL.Tree :=
  (FKL.Tree.node (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk000)
    (FKL.Tree.leaf chunk004)) (FKL.Tree.node
    (FKL.Tree.leaf chunk002)
    (FKL.Tree.leaf chunk006))) (FKL.Tree.node (FKL.Tree.node
    (FKL.Tree.leaf chunk001)
    (FKL.Tree.leaf chunk005))
    (FKL.Tree.leaf chunk003)))

theorem check000 : lanesEq 14 16383 MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf000.entries (tree.get 0) = true := by decide +kernel
theorem check001 : lanesEq 14 16383 MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf001.entries (tree.get 1) = true := by decide +kernel
theorem check002 : lanesEq 14 16383 MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf002.entries (tree.get 2) = true := by decide +kernel
theorem check003 : lanesEq 14 16383 MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf003.entries (tree.get 3) = true := by decide +kernel
theorem check004 : lanesEq 14 16383 MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf004.entries (tree.get 4) = true := by decide +kernel
theorem check005 : lanesEq 14 16383 MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf005.entries (tree.get 5) = true := by decide +kernel
theorem check006 : lanesEq 14 16383 MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf006.entries (tree.get 6) = true := by decide +kernel

theorem reads_ParameterIndexData_DyadicZero3Part000_leaf000 : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf000 (FKL.ptGet tree 7 14) 0 :=
  reads_chunk tree 7 14 16383 0 MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf000 0 (by rfl) (by decide) (by decide) check000
theorem reads_ParameterIndexData_DyadicZero3Part000_leaf001 : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf001 (FKL.ptGet tree 7 14) 128 :=
  reads_chunk tree 7 14 16383 1 MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf001 128 (by rfl) (by decide) (by decide) check001
theorem reads_ParameterIndexData_DyadicZero3Part000_leaf002 : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf002 (FKL.ptGet tree 7 14) 256 :=
  reads_chunk tree 7 14 16383 2 MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf002 256 (by rfl) (by decide) (by decide) check002
theorem reads_ParameterIndexData_DyadicZero3Part000_leaf003 : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf003 (FKL.ptGet tree 7 14) 384 :=
  reads_chunk tree 7 14 16383 3 MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf003 384 (by rfl) (by decide) (by decide) check003
theorem reads_ParameterIndexData_DyadicZero3Part000_leaf004 : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf004 (FKL.ptGet tree 7 14) 512 :=
  reads_chunk tree 7 14 16383 4 MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf004 512 (by rfl) (by decide) (by decide) check004
theorem reads_ParameterIndexData_DyadicZero3Part000_leaf005 : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf005 (FKL.ptGet tree 7 14) 640 :=
  reads_chunk tree 7 14 16383 5 MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf005 640 (by rfl) (by decide) (by decide) check005
theorem reads_ParameterIndexData_DyadicZero3Part000_leaf006 : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf006 (FKL.ptGet tree 7 14) 768 :=
  reads_chunk tree 7 14 16383 6 MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf006 768 (by rfl) (by decide) (by decide) check006

theorem reads_ParameterIndexData_DyadicZero3Part000_table : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.table (FKL.ptGet tree 7 14) 0 :=
  (reads_append (A := (((((MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf000).append (MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf001)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf002)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf003)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf004)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf005)) (B := MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf006) _ 0 768 (by rfl) (reads_append (A := ((((MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf000).append (MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf001)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf002)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf003)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf004)) (B := MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf005) _ 0 640 (by rfl) (reads_append (A := (((MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf000).append (MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf001)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf002)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf003)) (B := MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf004) _ 0 512 (by rfl) (reads_append (A := ((MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf000).append (MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf001)).append (MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf002)) (B := MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf003) _ 0 384 (by rfl) (reads_append (A := (MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf000).append (MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf001)) (B := MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf002) _ 0 256 (by rfl) (reads_append (A := MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf000) (B := MatrixBounds.Numeric.ParameterIndexData.DyadicZero3Part000.leaf001) _ 0 128 (by rfl) FKLBridge.Idx.DyadicZero3.reads_ParameterIndexData_DyadicZero3Part000_leaf000 FKLBridge.Idx.DyadicZero3.reads_ParameterIndexData_DyadicZero3Part000_leaf001) FKLBridge.Idx.DyadicZero3.reads_ParameterIndexData_DyadicZero3Part000_leaf002) FKLBridge.Idx.DyadicZero3.reads_ParameterIndexData_DyadicZero3Part000_leaf003) FKLBridge.Idx.DyadicZero3.reads_ParameterIndexData_DyadicZero3Part000_leaf004) FKLBridge.Idx.DyadicZero3.reads_ParameterIndexData_DyadicZero3Part000_leaf005) FKLBridge.Idx.DyadicZero3.reads_ParameterIndexData_DyadicZero3Part000_leaf006)

theorem reads_ParameterIndexData_DyadicZero3_table : Reads MatrixBounds.Numeric.ParameterIndexData.DyadicZero3.table (FKL.ptGet tree 7 14) 0 :=
  FKLBridge.Idx.DyadicZero3.reads_ParameterIndexData_DyadicZero3Part000_table

/-- Every lookup of `ParameterIndexData.DyadicZero3.table` is lane `i` of the packed chunk tree. -/
theorem get_eq : ∀ i : Fin 840, (MatrixBounds.Numeric.ParameterIndexData.DyadicZero3.table.get i).val = FKL.ptGet tree 7 14 i.val :=
  reads_get FKLBridge.Idx.DyadicZero3.reads_ParameterIndexData_DyadicZero3_table

end FKLBridge.Idx.DyadicZero3
