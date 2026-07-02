# CLAUDE.md — Deveno repository

AI entry point for the Deveno repository — the single home of the
standard. Deveno is applied to itself here.

---

HARD RULES (violations are worse than no work at all):

1. A rule is defined only in `deveno.rules.yaml` (DVN-R0 applied to the
   standard). `Deveno.md` is prose: it explains rules by id and never
   redefines a normative_text. No status labels anywhere in prose.
2. Rule status is computed, never stored or declared: distinct projects
   in evidence, each with a described pain — 2+ -> core, 1 -> candidate,
   0 -> hypothesis. Self-application of the standard to this repository
   is not evidence; its findings go to the session log, `questions`, or
   `conflicts`.
3. UNKNOWN and CONFLICT have separate homes (DVN-R1): an open question
   goes to `questions`; incompatible definitions go to `conflicts` with
   subject, every location, every value, and resolution status. Never
   resolve a conflict silently. Resolved conflicts stay recorded — the
   resolution is part of the trace.
4. A hypothesis may be recorded with a stated basis and empty evidence.
   A rule may not be promoted without documented pain from each
   confirming project (DVN-R5).
5. Machine layers of this repository (`deveno.rules.yaml`) are English,
   always (DVN-R8). Every work session appends 3-5 lines to
   `00-session-log.md` (DVN-R6).

---

## Responsibility map

```
README.md          -> what this repo is and where to look
Deveno.md           -> why a rule exists and how to understand it
deveno.rules.yaml   -> exact statement, applicability, evidence,
                      questions, conflicts; the only home of rules
Git tags / history -> version evolution; no draft files, no CHANGELOG
00-session-log.md  -> continuity between sessions; project decisions
                      are recorded here until a decisions home is earned
```

Nothing else exists yet. A folder or file appears with its first real
artifact (DVN-R2). A linter appears in Deveno only with the first real
shared artifact that needs it. This repository is **not a Hub**: only
rules with `standard-repository` in `applies_to` bind here; the
asymmetry itself is recorded as DVN-Q1.

## Relation to projects

Hubs reference a tagged Deveno release. They do not copy, edit, or fork
normative statements. Divergence observed in a Hub is data for evolution
(DVN-R5), reported back as evidence or a question — never silently
patched locally.

## Language policy

- Chat / discussion: Russian
- `deveno.rules.yaml`, commits, file names: English, always
- `Deveno.md`: currently a Russian working draft, tagged `lang: ru` in
  frontmatter — visible translation debt (DVN-R8). Promotion to
  English per section as it stabilizes.
