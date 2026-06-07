# Agent Collaboration Protocol

**Project**: Closejack  
**Language**: English (optimized for AI agent token efficiency)  
**Audience**: Claude Opus, OpenAI Codex, Claude Sonnet

---

## Agent Definitions

| ID | Agent | Primary Input | Primary Output |
|----|-------|--------------|----------------|
| A1 | Claude Opus | User intent, GDD | Design docs, module specs, task files |
| A2 | OpenAI Codex | Module spec (`docs/modules/*.md`) | GDScript files on `feature/*` branch |
| A3 | Claude Sonnet | Codex PR, infra requests | Review comments, merged code, git ops |

---

## Communication Channels

```
User ──────────► A1 (Opus)
                   │  writes
                   ▼
           docs/modules/<module>.md        ← spec Codex reads
           docs/tasks/pending/<task>.md    ← task Codex executes
                   │
                   │ (Codex reads, implements)
                   ▼
           scripts/<system>/<module>.gd    ← on branch feature/<module>
                   │
                   │ (Sonnet reviews PR)
                   ▼
                 main branch
```

---

## Module Spec Format (Opus → Codex)

Every file in `docs/modules/` must follow this exact structure.  
Codex reads this file before writing any code.

```markdown
# Module: <ModuleName>

## Purpose
One sentence. What problem does this module solve?

## Class
- **class_name**: `PascalCase`
- **file**: `scripts/<system>/<snake_case>.gd`
- **type**: Autoload | Node | Resource | RefCounted

## Dependencies
- `ClassName` — reason

## Signals
| Signal | Args | When emitted |
|--------|------|-------------|
| `signal_name` | `(arg: Type)` | description |

## Public API
| Member | Type | Description |
|--------|------|-------------|
| `func_name(arg: Type) -> ReturnType` | method | description |
| `var_name: Type` | property | description |

## State Machine (if applicable)
States: `IDLE → DEALING → PLAYER_TURN → DEALER_TURN → RESULT`

## Implementation Notes
- Bullet points of non-obvious constraints or invariants Codex must respect.
- E.g., "Deck must be shuffled before first deal, never mid-round."

## Acceptance Criteria
- [ ] Criterion Codex must satisfy for Sonnet to approve the PR.
- [ ] ...
```

---

## Task File Format (Opus → Codex)

Every file in `docs/tasks/pending/` is a single atomic work order for Codex.

```markdown
# Task: <TASK-ID> — <Short Title>

## Assigned to: Codex
## Spec: docs/modules/<module>.md
## Branch: feature/<module-or-task-name>

## Objective
One paragraph. What must be true when this task is done?

## Files to create / modify
- `scripts/<system>/<file>.gd` — create
- `scenes/<dir>/<scene>.tscn` — create (if needed)

## Do NOT
- Do not change files outside the listed paths.
- Do not introduce new autoloads without Opus approval.

## Definition of Done
- [ ] All Acceptance Criteria in the spec pass.
- [ ] No GDScript errors or warnings in Godot editor.
- [ ] PR opened against `main`; title format: `feat: <module> — <summary>`
```

---

## Review Protocol (Codex → Sonnet)

When Codex opens a PR, Sonnet reviews against these criteria in order:

1. **Spec compliance** — does the code match `docs/modules/<module>.md` public API exactly?
2. **Typing** — all variables and return types statically typed?
3. **Naming** — snake_case vars/funcs, PascalCase class/node, ALL_CAPS constants?
4. **No print()** — use Logger autoload only
5. **Signal hygiene** — signals emitted at correct state transitions?
6. **No orphan nodes** — `queue_free()` called where needed?
7. **Acceptance criteria** — every checkbox in the spec ticked?

Sonnet outputs one of:
- `APPROVED` — merge immediately
- `CHANGES REQUESTED: <bullet list>` — Codex must fix before re-review

---

## Godot 4 Quick Reference for Codex

```gdscript
# Class declaration
class_name MyClass
extends Node

# Typed variables
var health: int = 100
var cards: Array[Card] = []

# Signals (past tense, snake_case)
signal card_dealt(card: Card)
signal round_ended(winner: String)

# Typed functions
func deal_card(deck: Deck) -> Card:
    var card: Card = deck.draw()
    card_dealt.emit(card)
    return card

# Constants
const MAX_HAND_SIZE: int = 11

# Autoload access (registered in project.godot)
GameManager.change_state(GameManager.State.DEALING)
```

### Autoloads (pre-registered)
| Name | Script | Access |
|------|--------|--------|
| `GameManager` | `scripts/core/game_manager.gd` | global |
| `AudioManager` | `scripts/systems/audio_manager.gd` | global |
| `SaveSystem` | `scripts/systems/save_system.gd` | global |

### Scene conventions
- Each module that needs a visual owns its `.tscn` in `scenes/<category>/`
- Root node name == class_name (e.g., `CardSystem` node)
- Use `@export` for inspector-tunable values

---

## Forbidden Patterns

Codex must never produce these; Sonnet will reject the PR:

| Pattern | Instead use |
|---------|------------|
| `get_node("../../SomeNode")` | `@onready var` or signals |
| `print("debug")` | `Logger.debug("msg")` |
| Untyped `var x = ...` | `var x: Type = ...` |
| Godot 3 API (`yield`, `connect("sig", self, "method")`) | `await`, `signal.connect(callable)` |
| Hardcoded magic numbers | Named constants |
| Direct autoload mutation from UI scripts | Emit signal → autoload handles state |

---

## Branch & Commit Naming

| Prefix | Use case |
|--------|----------|
| `feature/<module>` | New module implementation |
| `fix/<module>-<issue>` | Bug fix in existing module |
| `docs/<topic>` | Documentation only |
| `chore/<task>` | Tooling, config, gitkeep |

Commit message: `feat: CardSystem — implement Deck shuffle and draw`

---

## Escalation

If Codex encounters an ambiguity not covered by the spec:
1. Do not guess architectural decisions.
2. Leave a `# TODO(Opus): <question>` comment in the code.
3. Open the PR anyway with a note in the PR description listing all TODOs.
4. Sonnet will flag these for Opus to resolve before merge.
