# Paired fine rate identities: design notes

These notes document the mathematical form and module design of the paired-fine identification
stream (`SuppliedPairedFine*`, `PairedFine3*`, `PairedFine4*`). The generator scripts mentioned
below belong to the development tree and are not part of this package; every generated module is
checked by Lean independently of them. The per-node `PairedFine3*`/`PairedFine4*` cache and block modules
described here belong to the Lean 4.24 release (commit `884a354`); the current release checks the same
identities with the fast kernel checks in `src/FKLFine3*` and `src/FKLFine4*`
(see [`fast-kernel-checks.md`](fast-kernel-checks.md)).

## 1. The exact fine expression (Lean vs Python) -- RESOLVED
Lean `sourceExpression{3,4} source role axis` = splitFineRetentionExpression ... = parent orbit entropy
minus, for EVERY compatibility sector (45+9 resp. 15+5 sectors), orbitMassEntropyExpression of the
sector pool `splitPoolMass`.  For a *singleton* sector (isolated child c) the pool is 2*w_c*p_c and the
symbolic terms are log(2 w_c p_c,i), log(2 w_c) -- NOT the certificate's terms log(p_c,i).
Python `RetentionInputs.add_fine` (= the certificate) uses for isolated children the *normalized* child
entropy scaled by 2 w_c: terms log(p_c,i), log(size_i).  Values agree (massEntropy_scaled), forms differ.

Therefore the kernel-normalized node form used here is (per source, physical role r, fine axis a,
coefficient m = sourceMass):
   m * [ orbitEntropyExpression(parent law at physical axis perm_r(a+1))
         - sum_{isolated columns c, w_c != 0} (2 w_c) * orbitMassEntropyExpression(p_c)        (Σp_c = 1 so the
                                                                                          total-mass logAtom vanishes)
         - sum_{coordinate sectors v} orbitMassEntropyExpression(pool_v) ]
   pool_v(i) = sum_{c not isolated, coord(c)=v} 2 w_c p_c(i)   (integer numerator at 2^(44+childPower))
isolated(c) : axis 0 -> permuted shape z = 0 ; axis 1 -> permuted x = 0 or y = 0  (SingletonLabels.isolatedColumn)
coord(c)    : axis 0 -> permuted y ; axis 1 -> permuted z                        (SingletonLabels.poolCoordinate)
permuted shape coordinate k = original coordinate ORDERS[r][k]; ORDERS = itertools.permutations(range(3))
= SuppliedRoleIndex.order (xyz,xzy,yxz,yzx,zxy,zyx), AxisOrder.permutation (order r) k = ORDERS[r][k].
Level 4: parent at 2^406 (SuppliedRootFineParent4Block{k}.table), children child3 at 2^178
  (RootFineCachedParent4.child through a parent3 window), weights alpha4 (RootFineCachedParent4.weight).
Level 3: parent at 2^134 (SuppliedRootFineParent3Block{n}.table), children leaf at 2^44
  (SuppliedRootFineParent3Columns.leaf), weights alpha3 (SuppliedRootFineParent3Columns.weight).

Python model: work/generate_paired_fine_sources.py (PairedFineData.role_expression / node_expression,
FinePartition.prepare). `uv run --with numpy python work/generate_paired_fine_sources.py` verified:
  - node form == add_fine form for all 105 (level 4) and 945 (level 3) nodes, both axes (0 mismatches);
  - global sums == certificate term lists for both levels/axes; first-owner block order is monotone.
  Sizes (report work/paired-fine-node-form-report.json): level 4 max role summary 86 terms, node 122,
  7-source block 327 (axis 0) / 543 (axis 1) terms, windows <= 536, corrections <= 7 terms per block;
  level 3 max role summary 15, node 75, 7-node block 361/369, corrections <= 3 per block.

## 2. Module design
Shared (hand-written, pending):
  SuppliedPairedFineSingletonLabels   (fixed proof; compiled clean)
  SuppliedPairedFineSplitPools        coordinatePoolNumerator, isolatedExpression, splitPoolsExpression and
                                      splitPoolsExpression_value (= sum over all labelled sectors of columnPool)
  SuppliedPairedFineNodes             parent4Window, nodeExpression3/4 (+ _value = sourceExpression3/4 value)
  SuppliedPairedFineBlocks            supportedScale, sourceSum3/4, cachedSum lemmas, expression3/4 block sums
Generated (work/generate_paired_fine_level4.py, work/generate_paired_fine_level3.py):
  see sections below.

## 3. Shared modules (all compiled clean in pending mode, exit 0, empty logs)
- SuppliedPairedFineSingletonLabels: isolatedColumn, poolCoordinate, physicalLabel_eq.
- SuppliedPairedFineSplitPools: coordinatePoolNumerator (ℤ pools skipping isolated / zero-weight columns),
  isolatedExpression (scale (2 w_c) (orbitMassEntropyExpression p_c)), splitPoolsExpression,
  splitPoolsExpression_value (= Σ over all columns+coordinates sectors of columnPool with label
  finSumFinEquiv ∘ singletonPoolLabel).  Uses RootFineSingletonPools.singletonPool_value / coordinatePool_value.
- SuppliedPairedFineNodes: parent4Window (+_eq), ChildValues4 (Fin 45 → Fin 3 → Fin 21 → ℤ), windowChildren
  (children via RootFineCachedParent4.child through a parent3 table) + windowChildren_eq, childMass4, poolExpression4,
  parentEntropy4 (natural denominator (2^406 : ℕ), _eq to IntegerParents.parentExpression4), nodeExpression4,
  poolExpression4_value, nodeExpression4_value (parents, sourceEq4, children, source, childrenEq, role, axis);
  level 3 analogues childMass3 (SuppliedRootFineParent3Columns.leaf), poolExpression3, parentEntropy3,
  nodeExpression3, nodeExpression3_value (parents, sourceEq, source, role, axis).
- SuppliedPairedFineBlocks: supportedScale, sourceSum4/sourceSum3 (inner sums of expression4/expression3),
  expression4_blocks/expression3_blocks (15 x 7 / 135 x 7 via finProdFinEquiv), cachedRole4 + roles4_value
  (six independently checked role summaries give the source value), cachedStrategy3, cachedNode3, node3_value,
  strategies3_value, block3_value, block4_value.
Proof tricks that mattered: pass `(columns := 45) (children := 21) (coordinates := 9)` explicitly to
splitPoolsExpression so `Fin 45` and `Fin (shapes 8).length` stay syntactically aligned; state sector sums over
`Fin ((shapes 8).length + (8+1))` (the type of physicalSectors) so `exact` closes by rfl; finish the pool identity
with `simp only [weight_eq, childMass4, childrenEq, numerator_value, child3_eq, child3_eq]; exact physicalIdentity`
(defeq absorbs `2*4` vs `8`, casts, physicalLabel/mass4/SuppliedStage4.split unfolding); for level 4 rewrite the
goal and the parent value with `← decoded` (child3_decode) before expressionWithParent_value; rw uses
`instances` transparency, so never rely on unfolding regular defs inside `rw` patterns.

## 6. Generated module families and exact commands
Generator: work/generate_paired_fine_modules.py (imports work/generate_paired_fine_sources.py).
  uv run --with numpy python work/generate_paired_fine_modules.py --level 4            # everything for level 4
  uv run --with numpy python work/generate_paired_fine_modules.py --level 4 --nodes 4-4 --blocks none --no-windows
  uv run --with numpy python work/generate_paired_fine_modules.py --level 3            # everything for level 3
  uv run --with numpy python work/generate_paired_fine_modules.py --level 3 --blocks 0-1 --no-windows
  (--parents root would instead import SuppliedRootFineParent4Block{k}; default own.)
Every run also rewrites work/compile-queues/pairedfine4.list, pairedfine3.list, pairedfine-final.list
(unless --no-windows).  Modules are written to work/pending-lean.

Level 4 (per parent k = 0..104; block b = k // 7; axis a = 0,1):
  PairedFine4Children{k}   imports SuppliedRootFineParent3Block{n} for k's positive children n; read{n}, parent3
                           (extendParent3 chain), rows (45x3x21 literal), checked{c} (45 decides, ∀ axis),
                           numerator / numerator_eq
  PairedFine4Parent{k}     source (convolution over literal children), row0/1/2 sparse literals, checked0/1/2,
                           table : RootFineParent4CacheTable k 1
  PairedFine4Node{k}       parents := parent4Window Parent{k}.table, children := Children{k}.numerator,
                           roleExpression r a := cachedRole4 ..., summary{r}{a} + checked{r}{a} (12 decides),
                           summaries{a}, expression{a}, value{a} : rationalLogValue expression{a} = value (sourceSum4 k a)
  PairedFine4Block{b}A{a}  summaries := ![Node{7b}.expression{a}, ...], expression, summary literal, checked (decide),
                           value : Σ offset value(sourceSum4 (finProdFinEquiv (b, offset)) a) = value summary
  PairedFine4TableA{a}     parts from RateCertificateData.Level4{a+1}Block*, table, cuts (per 7-source block), window,
                           windows_value = CertifiedLevel4Rate{a+1}.value
  PairedFine4CorrectionsA{a}  corrections : Fin 15 → RationalLogExpression, checked (cancellation), cancelled
  PairedFine4Boundary{b}A{a}  checked : mergeNormalize (difference summary window) = correction; value
  SuppliedPairedFine4Certified  boundaries{a} (fin_cases), expression_eq{a}, level4_rate1, level4_rate2
Level 3 (block b = 0..134, nodes 7b..7b+6):
  PairedFine3Cache{b}A{a}  read{n}, parents{offset} (extendParent3), summary{offset} + checked{offset} (7 node decides,
                           each cachedNode3 = 6 strategies x 6 roles), summaries, checked, expression, value
  PairedFine3Block{b}A{a}, PairedFine3TableA{a} (53/65 parts), PairedFine3CorrectionsA{a} (Fin 135),
  PairedFine3Boundary{b}A{a}, SuppliedPairedFine3Certified (level3_rate1, level3_rate2)
Final: SuppliedPairedFineCertified (level3_rate1, level3_rate2, level4_rate1, level4_rate2) imports both certified modules.

