# Feedback channel (Codex → Opus)

This folder is how **Codex** reports problems back to **Opus** (and the user) during module
development: spec ambiguities, suspected design errors, impossible/conflicting requirements,
Godot/runtime errors that can't be resolved within the spec, or proposed changes.

**Codex must not silently work around a problem by inventing a decision.** File it here and wait.

## How to file
1. Copy the template below into `docs/feedback/<MODULE>-<YYYYMMDD>.md`
   (e.g. `card_system-20260608.md`). If a file for that module/day exists, append a new entry.
2. Add an inline `# TODO(Opus): <question>` at the exact code location, if applicable.
3. List the feedback file + all TODOs in the PR description.

## How it's resolved
Opus reads this folder, updates the relevant `docs/modules/<module>.md` spec (the user decides
any game-design point), writes a short resolution at the bottom of the entry, and moves the file
to `docs/feedback/resolved/`. Then Codex re-reads the updated spec and continues.

---

## Template

```markdown
# Feedback: <MODULE> — <YYYY-MM-DD>

## Type
[ ] Spec ambiguity   [ ] Suspected design error   [ ] Conflicting requirement
[ ] Godot/runtime error   [ ] Proposed change   [ ] Other

## Context
- Task: docs/tasks/pending/<task>.md
- Spec: docs/modules/<module>.md
- Branch: feature/<module>
- Files/lines: scripts/<...>.gd:NN

## What's blocking / unclear
One or two sentences. Be specific.

## Evidence (errors, conflicting lines, repro)
<paste exact error output or quote the conflicting spec lines>

## My question for Opus
The single decision needed to proceed. (Codex proposes options but does NOT pick.)

---
### Resolution (filled by Opus)
- Decision:
- Spec updated: docs/modules/<module>.md section
- Date / by:
```
