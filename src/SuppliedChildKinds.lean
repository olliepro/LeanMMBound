import SuppliedShapeIndices

/-! The full source shape alphabets split into their original positive and zero
subarrays, with a checked inverse column binding at every shape. -/
namespace MatrixBounds.Numeric.SuppliedChildKinds
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

/-- Original zero/positive child labels for every complete level-2 shape column. -/
def kinds2 : Array (Fin 12 ⊕ Fin 3) := #[
  Sum.inl 0,Sum.inl 1,Sum.inl 2,Sum.inl 3,Sum.inl 4,Sum.inl 5,Sum.inr 0,Sum.inr 1,
  Sum.inl 6,Sum.inl 7,Sum.inr 2,Sum.inl 8,Sum.inl 9,Sum.inl 10,Sum.inl 11
]

/-- The source child kind at a complete, bounded shape column. -/
def kind2 (column : Fin 15) : Fin 12 ⊕ Fin 3 :=
  kinds2[column.val]'(by change column.val < 15; exact column.isLt)

/-- Explicit finite decision procedure for the source column classification. -/
instance kind2Decidable (column : Fin 15) : Decidable (
    match kind2 column with
    | Sum.inl zero => (SuppliedShapeIndices.childColumns 4 false)[zero.val]? = some column.val
    | Sum.inr positive => (SuppliedShapeIndices.childColumns 4 true)[positive.val]? = some column.val) := by
  cases kind2 column <;> infer_instance

/-- Zero and positive labels name exactly the original complete shape column. -/
theorem kind2_correct : ∀ column : Fin 15,
    match kind2 column with
    | Sum.inl zero => (SuppliedShapeIndices.childColumns 4 false)[zero.val]? = some column.val
    | Sum.inr positive => (SuppliedShapeIndices.childColumns 4 true)[positive.val]? = some column.val := by decide +kernel

/-- Original zero/positive child labels for every complete level-3 shape column. -/
def kinds3 : Array (Fin 24 ⊕ Fin 21) := #[
  Sum.inl 0,Sum.inl 1,Sum.inl 2,Sum.inl 3,Sum.inl 4,Sum.inl 5,Sum.inl 6,Sum.inl 7,
  Sum.inl 8,Sum.inl 9,Sum.inr 0,Sum.inr 1,Sum.inr 2,Sum.inr 3,Sum.inr 4,Sum.inr 5,
  Sum.inl 10,Sum.inl 11,Sum.inr 6,Sum.inr 7,Sum.inr 8,Sum.inr 9,Sum.inr 10,Sum.inl 12,
  Sum.inl 13,Sum.inr 11,Sum.inr 12,Sum.inr 13,Sum.inr 14,Sum.inl 14,Sum.inl 15,Sum.inr 15,
  Sum.inr 16,Sum.inr 17,Sum.inl 16,Sum.inl 17,Sum.inr 18,Sum.inr 19,Sum.inl 18,Sum.inl 19,
  Sum.inr 20,Sum.inl 20,Sum.inl 21,Sum.inl 22,Sum.inl 23
]

/-- The source child kind at a complete, bounded shape column. -/
def kind3 (column : Fin 45) : Fin 24 ⊕ Fin 21 :=
  kinds3[column.val]'(by change column.val < 45; exact column.isLt)

/-- Explicit finite decision procedure for the source column classification. -/
instance kind3Decidable (column : Fin 45) : Decidable (
    match kind3 column with
    | Sum.inl zero => (SuppliedShapeIndices.childColumns 8 false)[zero.val]? = some column.val
    | Sum.inr positive => (SuppliedShapeIndices.childColumns 8 true)[positive.val]? = some column.val) := by
  cases kind3 column <;> infer_instance

/-- Zero and positive labels name exactly the original complete shape column. -/
theorem kind3_correct : ∀ column : Fin 45,
    match kind3 column with
    | Sum.inl zero => (SuppliedShapeIndices.childColumns 8 false)[zero.val]? = some column.val
    | Sum.inr positive => (SuppliedShapeIndices.childColumns 8 true)[positive.val]? = some column.val := by decide +kernel

/-- Original zero/positive child labels for every complete level-4 shape column. -/
def kinds4 : Array (Fin 48 ⊕ Fin 105) := #[
  Sum.inl 0,Sum.inl 1,Sum.inl 2,Sum.inl 3,Sum.inl 4,Sum.inl 5,Sum.inl 6,Sum.inl 7,
  Sum.inl 8,Sum.inl 9,Sum.inl 10,Sum.inl 11,Sum.inl 12,Sum.inl 13,Sum.inl 14,Sum.inl 15,
  Sum.inl 16,Sum.inl 17,Sum.inr 0,Sum.inr 1,Sum.inr 2,Sum.inr 3,Sum.inr 4,Sum.inr 5,
  Sum.inr 6,Sum.inr 7,Sum.inr 8,Sum.inr 9,Sum.inr 10,Sum.inr 11,Sum.inr 12,Sum.inr 13,
  Sum.inl 18,Sum.inl 19,Sum.inr 14,Sum.inr 15,Sum.inr 16,Sum.inr 17,Sum.inr 18,Sum.inr 19,
  Sum.inr 20,Sum.inr 21,Sum.inr 22,Sum.inr 23,Sum.inr 24,Sum.inr 25,Sum.inr 26,Sum.inl 20,
  Sum.inl 21,Sum.inr 27,Sum.inr 28,Sum.inr 29,Sum.inr 30,Sum.inr 31,Sum.inr 32,Sum.inr 33,
  Sum.inr 34,Sum.inr 35,Sum.inr 36,Sum.inr 37,Sum.inr 38,Sum.inl 22,Sum.inl 23,Sum.inr 39,
  Sum.inr 40,Sum.inr 41,Sum.inr 42,Sum.inr 43,Sum.inr 44,Sum.inr 45,Sum.inr 46,Sum.inr 47,
  Sum.inr 48,Sum.inr 49,Sum.inl 24,Sum.inl 25,Sum.inr 50,Sum.inr 51,Sum.inr 52,Sum.inr 53,
  Sum.inr 54,Sum.inr 55,Sum.inr 56,Sum.inr 57,Sum.inr 58,Sum.inr 59,Sum.inl 26,Sum.inl 27,
  Sum.inr 60,Sum.inr 61,Sum.inr 62,Sum.inr 63,Sum.inr 64,Sum.inr 65,Sum.inr 66,Sum.inr 67,
  Sum.inr 68,Sum.inl 28,Sum.inl 29,Sum.inr 69,Sum.inr 70,Sum.inr 71,Sum.inr 72,Sum.inr 73,
  Sum.inr 74,Sum.inr 75,Sum.inr 76,Sum.inl 30,Sum.inl 31,Sum.inr 77,Sum.inr 78,Sum.inr 79,
  Sum.inr 80,Sum.inr 81,Sum.inr 82,Sum.inr 83,Sum.inl 32,Sum.inl 33,Sum.inr 84,Sum.inr 85,
  Sum.inr 86,Sum.inr 87,Sum.inr 88,Sum.inr 89,Sum.inl 34,Sum.inl 35,Sum.inr 90,Sum.inr 91,
  Sum.inr 92,Sum.inr 93,Sum.inr 94,Sum.inl 36,Sum.inl 37,Sum.inr 95,Sum.inr 96,Sum.inr 97,
  Sum.inr 98,Sum.inl 38,Sum.inl 39,Sum.inr 99,Sum.inr 100,Sum.inr 101,Sum.inl 40,Sum.inl 41,
  Sum.inr 102,Sum.inr 103,Sum.inl 42,Sum.inl 43,Sum.inr 104,Sum.inl 44,Sum.inl 45,Sum.inl 46,
  Sum.inl 47
]

/-- The source child kind at a complete, bounded shape column. -/
def kind4 (column : Fin 153) : Fin 48 ⊕ Fin 105 :=
  kinds4[column.val]'(by change column.val < 153; exact column.isLt)

/-- Explicit finite decision procedure for the source column classification. -/
instance kind4Decidable (column : Fin 153) : Decidable (
    match kind4 column with
    | Sum.inl zero => (SuppliedShapeIndices.childColumns 16 false)[zero.val]? = some column.val
    | Sum.inr positive => (SuppliedShapeIndices.childColumns 16 true)[positive.val]? = some column.val) := by
  cases kind4 column <;> infer_instance

/-- Zero and positive labels name exactly the original complete shape column. -/
theorem kind4_correct : ∀ column : Fin 153,
    match kind4 column with
    | Sum.inl zero => (SuppliedShapeIndices.childColumns 16 false)[zero.val]? = some column.val
    | Sum.inr positive => (SuppliedShapeIndices.childColumns 16 true)[positive.val]? = some column.val := by decide +kernel

end MatrixBounds.Numeric.SuppliedChildKinds
