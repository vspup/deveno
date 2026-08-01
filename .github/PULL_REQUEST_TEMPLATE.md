<!-- One proposal — one PR (DVN-R9). A PR is not a home of knowledge:
after the decision the result moves to its single home; the branch
dies, the trace stays (session-log line + this PR thread). -->

## 1. Problem (pain)

<!-- What engineering pain was observed? Where is it recorded
(repo/file:line, date)? A hypothesis without pain is allowed (DVN-R5)
but must state its basis explicitly. -->

## 2. Proposal

<!-- What changes? For a rule: draft normative_text (English, DVN-R8).
Do NOT pre-assign DVN-* ids — ids are assigned at application time
onto main (DVN-R9). Write `id: unassigned` in the draft. -->

## 3. Affected homes

<!-- Tick every home the decision will touch: -->

- [ ] `deveno.rules.yaml` — rules / evidence / questions / conflicts
- [ ] `Deveno.md` — motivating prose
- [ ] `tools/` (adopt-hub.md, init-hub.sh) / templates
- [ ] consumer hubs (which ones; tag re-pin needed?)

## 4. Review

- [ ] DVN-R0: no second home is created; overlaps with existing rules
      and questions are named
- [ ] DVN-R5: ladder position stated (hypothesis / candidate / core);
      every evidence entry documents pain and points to a recorded
      artifact (the DVN-C2 lesson)
- [ ] DVN-C1: no status is declared anywhere — status is computed
      from evidence
- [ ] Review may be AI-prepared; the merge decision is the engineer's
      (the DVN-R1 division)

## 5. Decision

<!-- Filled by the engineer before merge/close: -->

- [ ] Merge — entries land in their homes; status computes from
      evidence
- [ ] Observation only — evidence/basis recorded, no rule change
- [ ] Open question — recorded in `questions` (id at application
      time)
- [ ] Local rule — the home is the consuming hub; this register gets
      at most an observation
- [ ] Deferred — wake condition recorded
- [ ] Rejected — reason goes into the session-log line

## After closing

- [ ] Result moved to its single home; no knowledge remains only in
      this PR
- [ ] One session-log line: PR number, decision, where the result
      lives now
- [ ] If the normative layer changed: decide on a new tag; consumer
      hubs re-pin deliberately
