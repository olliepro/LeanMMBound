module

public import FKLCoarseData.L4Blocks00
public import FKLCoarseData.L4Blocks01

@[expose] public section

namespace MatrixBounds.Numeric.FKLCoarseData.L4

open FKL FKLCoarse
open scoped BigOperators

def chunk0Keys : Nat := 0x8180000000000000000000000000000000000000040000000000000000000000000000000000000000000000001fffffffffffd6000000000000000000000000000000000000
def chunk0Hash : Nat := 0x50000
def sum0 : List Raw := []
def chunk0 : List (List Raw) := [corr000, corr001, corr002, corr003, corr004, corr005, corr006, corr007, corr008, corr009, corr010, corr011, corr012, corr013, corr014]
theorem chunk0_check : check2H 129 chunk0Keys 198 5 chunk0Hash 1 chunk0.flatten sum0 = true := by decide +kernel

def topKeys : Nat := 0x1
def topHash : Nat := 0x10000
def sums : List (List Raw) := [sum0]
theorem top_check : check2H 1 topKeys 2 1 topHash 1 sums.flatten [] = true := by decide +kernel

def corrs : List (List Raw) := [chunk0].flatten
theorem corr_sum : (corrs.map (rawValue 197 132)).sum = 0 :=
  cancel_chunks 197 132 [chunk0] sums (List.Forall₂.cons (check2H_sound 197 132 129 chunk0Keys 198 5 chunk0Hash 1 _ _ chunk0_check) List.Forall₂.nil)
    ((check2H_sound 197 132 1 topKeys 2 1 topHash 1 _ _ top_check).trans (rawValue_nil 197 132))

end MatrixBounds.Numeric.FKLCoarseData.L4
