# PR: [feat/fix/docs/chore] Module — Short summary

## Agent
- [ ] OpenAI Codex
- [ ] Claude Opus
- [ ] Claude Sonnet (only if explicitly delegated by Opus/user)
- [ ] Human

## Spec reference
`docs/modules/<module_name>.md`

## Task reference
`docs/tasks/pending/<task_id>.md`

---

## Changes
<!-- List files created or modified -->
- `scripts/<system>/<file>.gd` — created / modified
- `scenes/<dir>/<scene>.tscn` — created / modified

## Acceptance criteria checklist
<!-- Copy from the spec and tick each item -->
- [ ] ...
- [ ] ...

## GDScript checklist (Opus reviews this)
- [ ] Static typing on all variables and return types
- [ ] No `print()` — uses `Logger` autoload only
- [ ] Signals use past-tense snake_case names
- [ ] No orphan nodes (queue_free called where needed)
- [ ] Godot 4.x API only (no deprecated 3.x patterns)
- [ ] No hardcoded magic numbers — named constants used
- [ ] No cross-node coupling via path strings (`../../Node`) — signals or @onready used

## TODOs for Opus (unresolved ambiguities)
<!-- If Codex left # TODO(Opus): comments, list them here -->
- None

## Test steps
1. Open scene `res://scenes/...`
2. Run and verify ...
