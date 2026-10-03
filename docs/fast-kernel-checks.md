# Fast kernel checks

The numerical identification proves that each rate of the constructed pipeline equals an exact
rational combination of logarithms, and that the certified tables (hierarchy laws, fine and
coarse pool entropies, dimension and terminal rates) are the ones the construction produces. In
the Lean 4.24 release these facts were checked node by node with per-node certificate, cache,
boundary and correction modules, and kernel checking of the closure took about 77,000 s. The
modules under `src/FKL*` replace them with a small number of generic checkers, each proved sound
once, which the kernel then evaluates on packed data. Kernel time for the closure of
`exponent_lt` is now about 1,040 s, and `src/` shrank from 6,534 files (1.24 M lines) to 2,170
files (453 k lines).

## Building blocks (`src/FKL`)

* **Kernel-friendly arithmetic.** Checkers are written with raw `Nat` operations (`Nat.add`,
  `Nat.mul`, `Nat.land`, `Nat.shiftRight`, `Nat.beq`, …), `cond` and `Nat.rec`, which the Lean
  kernel evaluates with GMP-backed big integers and without unfolding type-class instances.
* **Packed lanes (`Lane`, `Pack`).** A table of small numbers is stored as one natural number;
  `lane d w i` reads the `i`-th `w`-bit field. `lane_lane` reads a field of a field, and
  `packN_mul` proves that multiplying two packed vectors computes all pairwise products at once
  (SWAR outer products).
* **Chunk trees (`Table`, `Build`).** Long tables are split into chunks held in a balanced tree,
  so a lookup touches a logarithmic number of nodes.
* **Balanced loops (`Range`).** `allRange f d lo len` tests `f` on `[lo, lo + len)` by halving
  `d` times, and `allRange_sound` turns acceptance into `∀ i < len, f (lo + i) = true`. The
  kernel's recursion depth stays logarithmic in the table size.
* **Bucketed log identities (`Kron`, `Search`).** A rational log expression is a list of raw
  terms `(key, mag, neg)`, with value `± mag / 2^T · log (key / 2^S)`. `check2` sorts the terms of
  both sides into the buckets of a packed, ascending key array (binary search) and accumulates
  each side's magnitudes as base-`2^L` digits of one natural number. `kron_sound`/`check2_sound`
  prove that equal accumulators, with every key found in the array and no digit overflow, imply
  equal real values. The search only chooses the bucket, so its correctness is never assumed.

## Families

| Directory | What it checks |
|---|---|
| `FKLBridge`, `FKLMeta` | Fast accessors for the certificate rows, index tables and metadata, each proved equal to the semantic definition it replaces |
| `FKLCert`, `FKLCertData`, `FKLLog` | Rate-certificate windows and the fixed logarithm grid |
| `FKLHier3`, `FKLHier4` | Level-three and level-four hierarchy laws: per-node leaf, parent and child tables, checked in 5-node declarations against packed chunk trees |
| `FKLFine3`, `FKLFine3Data`, `FKLFine4`, `FKLFine4Data` | Paired fine stage rates (`level3_rate1/2`, `level4_rate1/2`) |
| `FKLCoarse`, `FKLCoarseData` | Paired coarse rates and the root coarse expression |
| `FKLDim`, `FKLDimData` | Dimension rates, volume and the waiting-zero target certificates |
| `FKLTerm`, `FKLTermData` | The three terminal-rate axes |
| `FKLRoot`, `FKLRootData` | The root fine rates `value_eq1`/`value_eq2` |

Each family exports the same statements as the modules it replaced (for example
`FKLTermData.A0.rate_eq` or `FKLRoot.value_eq1`), so the assembly modules
(`SuppliedTerminalRateBinding`, `SuppliedRootFineRate1`, `SuppliedPairedFineCertified`, …) only
changed their imports.

## Engineering notes

* Data declarations are split so that each declaration's export stays small. Comparator replays
  the export through con-ron and nanoda, whose memory grows with the largest single declaration;
  5-node `leafRange`/`parRange` declarations keep the whole run near 20 GB.
* Loop indices are literals wherever possible, so that the kernel can cache repeated
  subterms.
* Every check uses `decide +kernel`; nothing uses `native_decide`.
