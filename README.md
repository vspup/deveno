# Deveno

Engineering knowledge trusted through its origin — for humans and machines.

Deveno is a discipline for gradually turning chaotic engineering
information into reliable collective knowledge — across multiple
repositories, engineers, and AI agent sessions. It is not a standard
for organizing files or writing documentation. Its single goal: an
engineer quickly and correctly understands a system, even years after
it was built.

## The name

*Deveno* is Esperanto for "origin, provenance". It names the central
formula of the whole system directly: trust is derived from provenance,
never declared. The system never claims "this is the truth" — it shows
where every claim comes from: source locations, evidence records,
verification provenance, Git history, recorded conflicts.

## Where things are

- `deveno.rules.yaml` — the authoritative register: exact rule
  statements, applicability, evidence, open questions, and conflicts.
  The status of any rule is computed from its evidence, never declared
  or stored.
- `Deveno.md` — the prose of the standard: purpose, rationale, reference
  layout. It explains rules by id and never redefines them.
- `00-session-log.md` — append-only log of work sessions and project
  decisions.
- Version history lives in Git history and tags. Old drafts are not
  kept as files.
