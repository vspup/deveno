#!/usr/bin/env bash
# init-hub.sh — bootstrap a new Engineering Hub following Deveno.
#
# Creates the day-zero Hub skeleton: three entry points, an empty vault
# with only 00-home.md, a session log, and (optionally) the Deveno
# standard pinned as a git submodule at a tagged release.
#
# Deliberately minimal (DVN-R2): no workspace/, output/, tools/,
# 00-duplicates.md, or numbered vault folders — each appears only with
# its first real content.
#
# Usage:
#   init-hub.sh <project-name> [deveno-git-url] [deveno-tag]
#
#   project-name    lowercase, digits, hyphens (e.g. mps3, relay-ctrl)
#   deveno-git-url  optional; if given, added as submodule ./deveno
#   deveno-tag      optional; tag to pin the submodule to (default v0.4)

set -euo pipefail

err() { echo "error: $*" >&2; exit 1; }

[ $# -ge 1 ] || err "usage: $0 <project-name> [deveno-git-url] [deveno-tag]"

NAME="$1"
DEVENO_URL="${2:-}"
DEVENO_TAG="${3:-v0.4}"
TODAY="$(date +%F)"
HUB="${NAME}-hub"

# Name policy mirrors the vault naming convention: hyphens, lowercase.
[[ "$NAME" =~ ^[a-z][a-z0-9-]*[a-z0-9]$ || "$NAME" =~ ^[a-z]$ ]] \
  || err "project name must be lowercase letters, digits, hyphens: got '$NAME'"
[ ! -e "$HUB" ] || err "'$HUB' already exists"

command -v git >/dev/null || err "git is required"

mkdir -p "$HUB/${NAME}-vault"
cd "$HUB"
git init -q

# --- README.md — entry point: outside visitor -------------------------
cat > README.md <<EOF
# ${NAME}

Engineering Hub for the ${NAME} project.

This Hub is the central engineering entry point: it brings together
knowledge, linked repositories, engineering analysis, and AI
collaboration. It is not the project's source code and not its
documentation; its goal is that an engineer quickly and correctly
understands the system.

The Hub follows the Deveno standard (see \`deveno/\` if present, or the
Deveno repository). Rules are referenced by id (DVN-R0..R8) and are
never restated here.

Entry points (DVN-R3):
- \`README.md\` — outside visitor (this file)
- \`CLAUDE.md\` — AI assistant
- \`${NAME}-vault/00-home.md\` — engineer
EOF

# --- CLAUDE.md — entry point: AI assistant ----------------------------
cat > CLAUDE.md <<EOF
# CLAUDE.md — ${NAME} Hub

AI entry point for the ${NAME} engineering hub.
Read this first, before touching anything else in the repository.

This Hub follows **Deveno ${DEVENO_TAG}** — the authoritative rule
register is \`deveno/deveno.rules.yaml\` (ids DVN-R0..R8). Rules are
referenced, never copied, edited, or forked here.

---

HARD RULES (violations are worse than no work at all):

1. Never resolve a CONFLICT silently (DVN-R1) — record the fact, every
   location (repo/file:line), every value, and surface it.
2. Never present unconfirmed facts as true (DVN-R4) — mark them UNKNOWN;
   a recorded open question is a deliverable, not a failure.
3. Never create a second home for an existing fact or document role
   (DVN-R0). Machine-readable facts are defined only in *.facts.yaml;
   prose references facts, never redefines them.
4. Never create structure ahead of content (DVN-R2) — a folder, file,
   or tool appears only with its first real content.
5. Append 3-5 lines to \`00-session-log.md\` during every work session
   (DVN-R6): what was done, what was found (UNKNOWN / CONFLICT), what
   was deferred.

---

## Current phase

TODO(engineer): state the phase (e.g. recovery / active development)
and what is read-only during it.

## Where things live

- \`README.md\`            — entry point: outside visitor
- \`CLAUDE.md\`            — this file, instructions for AI
- \`${NAME}-vault/\`       — long-term engineering knowledge
- \`${NAME}-vault/00-home.md\` — human entry point + layout convention
- \`00-session-log.md\`    — append-only session log (DVN-R6)
- \`deveno/\`              — the Deveno standard, pinned at ${DEVENO_TAG}

Everything else appears only with its first real content (DVN-R2).

## Feedback to the standard

Divergence from Deveno observed in this Hub is data for evolution
(DVN-R5): report it back to the Deveno repository as an evidence entry
or a question — never patch normative statements locally. This project
can be an independent confirmation source for rule promotion; document
the pain when a rule earns it.

## Language policy

- Chat / discussion with the engineer: Russian
- Long-term documentation, code, comments, commits, file names: English
- During recovery phases prose may carry \`lang: ru\` frontmatter as
  visible translation debt (DVN-R8)
EOF

# --- vault/00-home.md — entry point: engineer --------------------------
cat > "${NAME}-vault/00-home.md" <<EOF
---
updated: ${TODAY}
---

# 00-home — ${NAME} vault

Human entry point of the vault and the home of its layout convention.

Day zero: this is the only file in the vault. Folders appear with their
first real content (DVN-R2). Reserved number ranges (a written
convention, not directories):

    00  operational files at vault root (00-session-log lives at hub
        root; 00-duplicates.md is created with the first duplicate)
    10  architecture
    20  repositories (one note per repo, internal view only)
    30  interfaces (everything cross-repo; *.facts.yaml live here)
    40  decisions (only decisions made now, affecting architecture)
    90  open questions (UNKNOWN + facts tagged needs-home)
    99  reference (not a source of truth)

Naming: hyphens, lowercase. No numbers inside folders. The 20/30
boundary: a repo note may name the interfaces it participates in but
may not state a single fact about them — anything involving two or
more repos lives only in 30.
EOF

# --- 00-session-log.md --------------------------------------------------
cat > 00-session-log.md <<EOF
# Session log — ${NAME} Hub

Append-only. 3-5 lines per session: done / found / deferred (DVN-R6).

## ${TODAY} — Bootstrap

- Done: Hub skeleton created by deveno init-hub.sh; Deveno pinned at
  ${DEVENO_TAG}$( [ -z "$DEVENO_URL" ] && echo " (submodule pending — no URL provided)" ).
- Found: nothing yet.
- Deferred: fill "Current phase" in CLAUDE.md; link source repositories
  when work begins.
EOF

# --- .gitignore ---------------------------------------------------------
cat > .gitignore <<'EOF'
# OS / editor noise
.DS_Store
Thumbs.db
*.swp
.obsidian/workspace*
EOF

# --- Deveno as a pinned submodule (the reference, not a copy) -----------
if [ -n "$DEVENO_URL" ]; then
  git submodule add -q "$DEVENO_URL" deveno
  git -C deveno checkout -q "$DEVENO_TAG" \
    || err "tag '$DEVENO_TAG' not found in $DEVENO_URL"
  git add .gitmodules deveno
else
  echo "note: no Deveno URL given — add later with:"
  echo "  git submodule add <deveno-git-url> deveno && git -C deveno checkout ${DEVENO_TAG}"
fi

git add -A
git commit -qm "Bootstrap ${NAME} Hub (Deveno ${DEVENO_TAG})"

echo "created: $(pwd)"
git ls-files | sed 's/^/  /'
