# Task: TASK-003 — Ace list, batch 1 (data/design listing — no code)

> ⚠️ **SUPERSEDED (2026-06-11)**: the user replaced the batch workflow with the per-archetype
> draft workflow in `docs/design/card_generation_rules.md` (v2 — read it FIRST; it contains the
> full rules briefing). Work one user-named archetype at a time in `docs/design/aces_items.md`,
> unnamed candidates → user selection → naming → final YAML. **No commits/PRs before user approval.**
> The scope/constraint lists below remain useful reference; where they conflict with
> card_generation_rules.md, that file wins. Current state: `RED-EXACT` Redjack set drafted,
> awaiting user selection.
>
> ⚠️ **OWNERSHIP TRANSFERRED (2026-06-11, later same day)**: card generation moved
> **Codex → Claude Sonnet** (user directive). "Assigned to: Codex" below is historical.
> Sonnet's entry doc: `docs/roles/card_generation.md`. File moved to `docs/tasks/superseded/`.

## Assigned to: Codex
## Spec: docs/design/aces.md (grammar **v3, user-approved 2026-06-11**) + docs/KO_설계도.md §2-1-1, §2-5-7, §2-6
## Branch: docs/ace-list-batch1
## Authored by: Claude Fable 5 (full-authority delegation, CLAUDE.md 2026-06-10)

## Objective
Generate the **first batch of concrete Ace cards** by expanding the approved generation grammar.
This is a **documentation/data task** — no GDScript, no scenes. You are naming and listing items
within a fixed grammar; you are NOT designing game rules. Anything the grammar does not permit
is out of bounds.

## Scope — batch 1
1. **5 groups (군)**, each anchored to a different archetype, **one from each 계열** of
   `aces.md` §2 (무게·슬롯 / 데미지 공식 / 자원·순환 / 리스크·생존 / 메타 구조).
   - **Excluded from batch 1** (blocked on open questions Q17~Q21 / undesigned systems):
     `NEGATIVE` (needs negative-value sources, Q20), `GUARD` (armor details, Q18),
     `STRIKE` (enemy HP scale undecided, #8), anything touching `S8`/`E16` (enemy state),
     and `E18` meta effects (Signature-only, later batch).
   - Group size **3~5 aces** per GDD §2-1-1. Group roles per §13 (Keystone 1 + Coverage 1~3 + Twist/양념 0~2).
2. **5 unaffiliated (무소속) common aces** — CE ≤ 0.75, generic but still archetype-tagged.
3. Per group, a **MP 계산표**: best loadout (weight ≤ 5) and its CE sum, checked against the §3-1 budget.

Total: ~20~30 items. Write them under `## 항목` in `docs/design/aces.md`
(split to `docs/design/aces_items.md` with a link if the file gets unwieldy).

## Hard rules (from the approved grammar — violations = rejected in review)
- **Schema**: every item uses the §15 YAML schema, every field. `value` is never present (aces have none).
  Every effect entry MUST name its pipeline stage (`stage: D#`, §9).
- **No absolute numbers**: amounts stay symbolic (`Vp`, `Wp`, chip counts as small integers,
  multipliers expressed as CE). `chip_equiv` (ideal-state CE) is mandatory per item.
- **Caps**: single-ace CE caps by rarity, P2 = ×1.5 allowance, weight-2 = ×2.0 of same rarity,
  group MP budget bands — all per §3-1.
- **Forbidden combos F1~F15** (§14). In particular: no cross-group synergy references (F13),
  no unconditional permanent growth (F12 — every M3/G2 item needs `growth_apply`),
  no ace-triggers-ace recursion (F7).
- **Text**: `text_ko` / `text_en` each ≤ 2 sentences, translatable. English names prefer 'ace'
  wordplay (§16); Korean names prioritize meaning/mood.
- **Self-check** each item against the §17 rubric before submitting; include the rubric pass
  as a checklist in the PR description.

## Do NOT
- Do not modify the grammar sections (`## 구조`) of `aces.md` — they are user-approved.
- Do not touch GDD, module specs, scripts, or scenes.
- Do not invent mechanics, triggers, conditions, or effect families beyond the T/S/E/G/P/M axes.
- If the grammar is ambiguous or a combination seems impossible, **file it in `docs/feedback/`
  and mark the item `status: blocked`** — do not guess (standing rule).

## Definition of Done
- [ ] 5 groups × (3~5 aces) + 5 unaffiliated commons, all schema-complete.
- [ ] Per-group MP table present and within §3-1 budget.
- [ ] No F1~F15 violations; rubric checklist in PR body.
- [ ] PR opened from `docs/ace-list-batch1`; PR body lists any feedback files / blocked items.
- [ ] PR waits in the open review queue (no automatic review — user commands Fable/Opus batch review).
