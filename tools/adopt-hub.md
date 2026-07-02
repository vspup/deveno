# adopt-hub.md — adopt Deveno in an existing Hub

Adopting the standard in an existing project is a different operation
from bootstrapping a new one — `init-hub.sh` deliberately does not
apply here (and will refuse: the directory exists). The difference is
principal: a new project receives a structure; an existing one receives
a **reference and a reconciliation**. A live project is not rebuilt to
match the reference layout — the layout is informative; only the rules
bind.

Provenance note: this procedure was written before its first real
pass (MPS2 pending) and will be revised after it.

## 1. Reference the standard

Pin the tagged release as a submodule in the Hub root:

```bash
cd <project>-hub
git submodule add <deveno-git-url> deveno
git -C deveno checkout <tag>          # e.g. v0.4
git add .gitmodules deveno
git commit -m "Adopt Deveno <tag> as the referenced standard"
```

## 2. Audit for a second canon (DVN-R0)

The main risk of adoption: existing documents already *retell* the
rules — fine while the standard lived as a draft, but from the moment
the submodule exists every retelling is a second home of a normative
text. Walk CLAUDE.md and the vault, find every place where a rule is
redefined (rather than referenced by id), and decide each one's fate:
reduce to a `DVN-Rn` reference plus the project-specific part.

Where a local text *contradicts* the register, that is an honest
CONFLICT (DVN-R1): record the subject, every location, every value;
resolution is the engineer's decision, never silent. The Hub's home
for conflicts is a project convention (MPS2 uses `00-duplicates.md`);
DVN-R1 fixes the separation of homes, not the file name.

## 3. Rewrite the CLAUDE.md hard contract to references

Hard rules stay short imperatives, but authority moves: "Never resolve
a CONFLICT silently (DVN-R1)" instead of a full paragraph with
definitions. Rationale and definitions are read from
`deveno/deveno.rules.yaml` and `deveno/Deveno.md` — they now physically
sit next to the project; the agent does not have to go anywhere.

## 4. Record the adoption as a decision (DVN-R6, DVN-R5)

Session log lines: adopted Deveno <tag>, what was changed, what remains
divergent. Divergences are **not fixed on the spot**: an existing
project may legitimately differ from the reference layout. Each
divergence is either recorded as deliberate or goes back to Deveno as
a question.

## 5. Open the reverse evidence flow (DVN-R5)

From adoption on, the project is a source of evidence: where a rule
actually worked, or where its absence hurt, a record with the pain and
the date goes back to the register.

Counting note: `project` is the identity key of evidence. A project
already present in a rule's evidence (as MPS2 is, from the recovery
phase) adds new *phases*, not new confirmations — its adoption promotes
nothing by itself. Promotion to core requires a distinct second
project. What an already-counted project does contribute: stress-tests
of wording against real history, questions, and conflicts.
