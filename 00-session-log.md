# Session log — Deveno repository

Append-only. 3-5 lines per session: done / found / deferred.
Project decisions are recorded here until a decisions home is earned.

## 2026-07-02 — Bootstrap: rules extracted from prose

- Done: repository bootstrapped from EHS Draft 0.3-1; rules extracted
  from prose into a machine-readable register; rule status made
  computable from evidence instead of declared labels.
- Found (CONFLICT, resolved): "[Core] = proven, copied unchanged" in
  prose contradicted "nothing final until a second project" — the Core
  label was declared trust. Resolution: all status labels removed from
  prose; status computed from distinct evidence projects.
- Found (UNKNOWN -> Q1): this repository is not a Hub; rules split by
  applies_to profiles (hub / standard-repository).

## 2026-07-02 — Review round

- Done: register renamed facts -> rules (a rule prescribes, a fact
  describes — different entities, different homes); UNKNOWN and
  CONFLICT given separate homes in the register (questions / conflicts,
  the latter created lazily); recording a hypothesis separated from
  promoting a rule (hypotheses allowed with stated basis; promotion
  requires pain per confirming project); pain required in each evidence
  entry.
- Rejected: project_id-per-episode as identity key — episodes of one
  project must not count as separate confirmations; `project` stays the
  identity key, `phase` added as information.
- Found: the register itself violated its own "no rule without pain"
  hard rule (H1 with empty evidence) — the softened wording resolves it.

## 2026-07-02 — Project identity (final upon first commit)

- Decision: the project is named **Deveno** (Esperanto: origin,
  provenance).
- Reason: the name states the central formula of the system directly —
  trust is derived from provenance, never declared. Engineering
  knowledge is trusted through traceable origin: evidence, source
  locations, verification records, Git history, recorded conflicts —
  never through declared authority.
- Rejected alternatives: **Spuro** (strong metaphor of a verifiable
  trace, but Deveno names the principle itself — the origin of trust —
  rather than the mechanism of following it); Etalono, Fundamento
  (overstated authority); Kamertono, Kvarco (narrowed scope; Kvarco
  also technically inaccurate for CAN); Grajno, Kajero (described only
  one part of the system); Fonto (leans toward declaring a single
  correct source); Origino (too generic); Aiperanto, Camerton,
  Partitura, Koine, EKD, Indico, Fadeno (collisions or weaker fit).
- Canonical names from this point: `Deveno.md`, `deveno.rules.yaml`,
  DVN-R* (rules), DVN-Q* (questions),
  DVN-C* (conflicts). The DVN prefix keeps rule references globally
  unambiguous across Hubs; DEV was rejected for its development
  association.
- The decision takes effect with the first commit; after it the name is
  closed until a real external reason (collision, legal issue) appears.
- Deferred: first Git tag (v0.4 proposed — new structure, renamed);
  English promotion of Deveno.md; linter relocation (waits for a second
  Hub); prose realignment review by the engineer.

## 2026-07-02 — Pre-commit review round 2

- Done: status leaked back through the id namespace (H prefix declared
  "hypothesis" while DVN-H2 computed as candidate) — ids renumbered to a
  status-neutral single sequence DVN-R0..R8; the bootstrap conflict
  recorded in the register as DVN-C1 (resolved) — resolved conflicts
  stay as part of the trace; Part 1 of Deveno.md rewritten to pure
  rationale — prose no longer restates normative texts in Russian (a
  translated restatement is a second canon that drifts).
- Found and fixed: prose called DVN-R7 a "candidate" while its empty
  evidence computes to hypothesis — casual use of a computed-status term.
- Amended from review: P-prefix proposal declined — R names the entity
  kind (rule), only H encoded a status; CLAUDE.md now says Hubs
  reference a tagged release (never copy/fork) and drops the premature
  claim that a linter "moves here from a project".
- Deferred: engineer's read-through of normative_text (canon approval);
  first commit and tag.

## 2026-07-02 — First shared artifact: tools/init-hub.sh

- Done: tools/ earned by its first real content — init-hub.sh bootstraps
  a day-zero Hub (three entry points, empty vault with 00-home only,
  session log) and pins Deveno as a git submodule at a tagged release;
  tested: name validation, run without URL, run with URL + tag pinning.
- Rationale: "a tool appears in Deveno only with the first real shared
  artifact that needs it" — the second project needed a way to start.
- Deferred: the script assumes tag v0.4 exists — first commit and tag of
  this repository remain the engineer's action.

## 2026-07-02 — Fix: tools/ was created as fools/

- Done: the directory holding init-hub.sh was accidentally created as
  `fools/` (typo, never committed); renamed to `tools/`. The previous
  session's pending log entry (First shared artifact) appended to this
  file.
- Found: the repository already has commits (init), but tag v0.4 does
  not exist yet — init-hub.sh's default pin still points to nothing.
- Deferred: committing tools/ and tagging v0.4 remain the engineer's
  action.

## 2026-07-02 — Review: adoption procedure for an existing Hub (MPS2)

- Done: reviewed the proposed integrate-into-existing-Hub procedure
  (submodule pin, second-canon audit, CLAUDE.md rewritten to rule
  references, divergences recorded not fixed, reverse evidence flow) —
  consistent with DVN-R0/R1/R5/R6.
- Found: MPS2 integration adds phases, not confirmations — `project` is
  the identity key and MPS2 is already the sole evidence project, so
  this integration promotes nothing; a second confirming project must
  be distinct. Also: the Hub home for conflicts (00-duplicates.md) is
  an MPS2 convention, not fixed by DVN-R1 — potential future question.
- Deferred: no adoption artifact created here (DVN-R2 — it earns a home
  after the first real pass); MPS2 CLAUDE.md migration happens in the
  MPS2 repository, after v0.4 is tagged.

## 2026-07-02 — Adoption procedure recorded; tools/ committed

- Done: engineer's decision — record the adoption procedure now and
  revise it after the first real pass; written as tools/adopt-hub.md
  (English, provenance note "written before first pass", promotion
  claim corrected: an already-counted project adds phases, not
  confirmations); README "Where things are" now points to tools/.
- Done: tools/ (init-hub.sh, adopt-hub.md), README, and this log
  committed.
- Deferred: tag v0.4; first real adoption pass on MPS2, then revision
  of adopt-hub.md.
- Update: v0.4 tagged (annotated, on 3025bf6). Remaining deferred: the
  MPS2 adoption pass and the adopt-hub.md revision after it.
