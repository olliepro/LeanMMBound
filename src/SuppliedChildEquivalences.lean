module

public import SuppliedChildKinds
public import ShapeAlphabet
public import FKLMeta.Kinds

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact original positive/zero classifications are finite bijections, so all
child tensor factors can be regrouped without loss or duplication. -/
namespace MatrixBounds.Numeric.SuppliedChildKinds

noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 8000000

/-- Packed codes of `kinds2` and their inverse (FKLMeta). -/
def fkl_k2 : ℕ := 0xb0a09080e07060d0c050403020100

def fkl_i2 : ℕ := 0xa07060e0d0c0b0908050403020100

theorem fkl_k2_walk : FKLMeta.walk (fun i v => Nat.beq (FKLMeta.Kinds.codeOf v) (FKL.lane fkl_k2 8 i))
    kinds2.toList 0 = true := by decide +kernel

theorem fkl_i2_checked : FKLMeta.allN (fun v => Bool.and (Nat.blt (FKL.lane fkl_i2 8 v) 15)
    (Nat.beq (FKL.lane fkl_k2 8 (FKL.lane fkl_i2 8 v)) v)) 15 = true := by decide +kernel

/-- Original complete level-two columns enumerate each zero or terminal child exactly once. -/
theorem kind2_bijective : Function.Bijective kind2 :=
  FKLMeta.Kinds.bijective_of_codes (m := 12) (n := 3) (N := 15) rfl kind2 fkl_k2 fkl_i2
    (fun c => FKLMeta.Kinds.code_of_walk kinds2 fkl_k2 fkl_k2_walk c.val _) fkl_i2_checked

/-- Packed codes of `kinds3` and their inverse (FKLMeta). -/
def fkl_k3 : ℕ := 0x171615142c13122b2a11102928270f0e262524230d0c2221201f1e0b0a1d1c1b1a191809080706050403020100

def fkl_i3 : ℕ := 0x28252421201f1c1b1a1916151413120f0e0d0c0b0a2c2b2a29272623221e1d1817111009080706050403020100

theorem fkl_k3_walk : FKLMeta.walk (fun i v => Nat.beq (FKLMeta.Kinds.codeOf v) (FKL.lane fkl_k3 8 i))
    kinds3.toList 0 = true := by decide +kernel

theorem fkl_i3_checked : FKLMeta.allN (fun v => Bool.and (Nat.blt (FKL.lane fkl_i3 8 v) 45)
    (Nat.beq (FKL.lane fkl_k3 8 (FKL.lane fkl_i3 8 v)) v)) 45 = true := by decide +kernel

/-- Original complete level-three columns enumerate each zero or positive child exactly once. -/
theorem kind3_bijective : Function.Bijective kind3 :=
  FKLMeta.Kinds.bijective_of_codes (m := 24) (n := 21) (N := 45) rfl kind3 fkl_k3 fkl_i3
    (fun c => FKLMeta.Kinds.code_of_walk kinds3 fkl_k3 fkl_k3_walk c.val _) fkl_i3_checked

/-- Packed codes of `kinds4` and their inverse (FKLMeta). -/
def fkl_k4 : ℕ := 0x2f2e2d2c982b2a9796292895949327269291908f25248e8d8c8b8a23228988878685842120838281807f7e7d1f1e7c7b7a79787776751d1c74737271706f6e6d6c1b1a6b6a6968676665646362191861605f5e5d5c5b5a5958571716565554535251504f4e4d4c4b15144a494847464544434241403f3e13123d3c3b3a3938373635343332313011100f0e0d0c0b0a09080706050403020100

def fkl_i4 : ℕ := 0x9491908d8c8b888786858281807f7e7b7a79787776737271706f6e6d6a69686766656463605f5e5d5c5b5a59585554535251504f4e4d4c494847464544434241403f3c3b3a3938373635343332312e2d2c2b2a29282726252423221f1e1d1c1b1a19181716151413129897969593928f8e8a8984837d7c75746c6b626157564b4a3e3d302f212011100f0e0d0c0b0a09080706050403020100

theorem fkl_k4_walk : FKLMeta.walk (fun i v => Nat.beq (FKLMeta.Kinds.codeOf v) (FKL.lane fkl_k4 8 i))
    kinds4.toList 0 = true := by decide +kernel

theorem fkl_i4_checked : FKLMeta.allN (fun v => Bool.and (Nat.blt (FKL.lane fkl_i4 8 v) 153)
    (Nat.beq (FKL.lane fkl_k4 8 (FKL.lane fkl_i4 8 v)) v)) 153 = true := by decide +kernel

/-- Original complete level-four columns enumerate each zero or positive child exactly once. -/
theorem kind4_bijective : Function.Bijective kind4 :=
  FKLMeta.Kinds.bijective_of_codes (m := 48) (n := 105) (N := 153) rfl kind4 fkl_k4 fkl_i4
    (fun c => FKLMeta.Kinds.code_of_walk kinds4 fkl_k4 fkl_k4_walk c.val _) fkl_i4_checked

/-- Reindex actual level-two child shapes into their original zero and terminal labels. -/
def child2Equiv : ShapeAlphabet 4 ≃ Fin 12 ⊕ Fin 3 :=
  (shapeColumnEquiv 4).symm.trans (Equiv.ofBijective kind2 kind2_bijective)

/-- Reindex actual level-three child shapes into their original zero and positive labels. -/
def child3Equiv : ShapeAlphabet 8 ≃ Fin 24 ⊕ Fin 21 :=
  (shapeColumnEquiv 8).symm.trans (Equiv.ofBijective kind3 kind3_bijective)

/-- Reindex actual root-child shapes into their original zero and positive labels. -/
def child4Equiv : ShapeAlphabet 16 ≃ Fin 48 ⊕ Fin 105 :=
  (shapeColumnEquiv 16).symm.trans (Equiv.ofBijective kind4 kind4_bijective)

end
end MatrixBounds.Numeric.SuppliedChildKinds
