# Card generation rules — v2 (mandatory workflow + full rules briefing)

> **Priority**: mandatory for ALL card naming/listing/generation work (Ace, Playing, Hole,
> item pools, candidate pools, names, groups). Read this WHOLE file before writing candidates.
> **v2 (2026-06-11)**: rewritten by Fable on the user's order. v1 lacked the game rules entirely;
> §1 below is now the authoritative crash course. If this file conflicts with an older task draft
> or a generated example, follow this file; if still unclear, ask the user.
> Precedence: **user > GDD (`docs/KO_설계도.md`) > grammar (`docs/design/aces.md`) > this file > task drafts.**

## 0. Authority and approval gate

- **The user owns all game design.** Candidates are proposals, never decisions.
- Do not commit, amend, push, open a PR, or update a PR for card generation work until the user
  explicitly approves the current draft.
- Work in draft files first — for Ace items, `docs/design/aces_items.md`.
- `docs/design/aces.md` is the **approved grammar**. Never edit it unless the user explicitly asks.
- Do not convert candidates into final YAML until the user has selected which candidates survive.

## 1. The game — rules you MUST know before writing a single card

Source of truth: `docs/KO_설계도.md` (Korean GDD). This section is a faithful condensation.

### 1.1 Board and cards
- Two hands: **Red hand** (top) and **Blue hand** (bottom). Each has **5 slots**, filled
  **left to right**; slot 3 is the **center**.
- Every playing card has two independent numbers: **weight** and **value**. Low weight + high
  value, high weight + low value — all combinations exist by design. Some cards carry a center
  **picture** (= an effect); some have **no picture**.
- Each hand has a **weight limit, default 21** (changeable by play).
- Three card kinds: **Playing** (deck → hands), **Hole** (consumable item, 3 slots bottom-right,
  some reusable per round/turn by rarity), **Ace** (permanent enhancer, left column).

### 1.2 Aces specifically
- **Aces have NO value.** Their `value` is always 0. Their **weight matters**: the ace area holds
  a total of **5 weight**; a normal ace weighs **1**, a rare special ace weighs **2** (and must be
  proportionally very strong).
- Activation order each trigger window: Red hand left→right → Blue hand left→right →
  **aces top→bottom**. The player can reorder aces by dragging, so ace order is a real resource.
- **Binding aces** exist: once acquired they are immune to **every** removal — release, campfire
  burning, and devouring by other aces.
- Acquiring an ace while the ace area is full: the player releases one of (existing + new), or
  skips the acquisition.
- **Missions attach to the ace card**: mission progress and its effect exist only while that ace
  is equipped.

### 1.3 Turn flow — the part v1 got wrong most often
- Player actions: **Red hit, Blue hit, stand, use hole card, table flip, deck replenish**
  (+ ace reordering).
- A **hit** moves the top deck card (random; the player cannot see it in advance) into a hand.
  **Hitting does NOT advance the turn.** A player turn is the whole sequence of hits/actions that
  ends at **stand**, **deck replenish**, or **table flip** resolution.
- **After a stand, both hands start the next turn EMPTY.** Never write conditions that assume
  cards persist in hands across turns.
- Stand requires **at least 1 card in each hand**.
- **Bust**: if a hand's weight exceeds the limit after a hit, that hand collapses — only the
  **3rd (center) slot** stays effective. It does NOT recover this turn even if weight is later
  reduced. A bust hand effectively has **one** card slot; effects that count cards in a bust hand
  count **1** (unless an explicitly approved ace changes surviving bust slots).
- **Deck replenish**: allowed only if 0 cards were drawn this turn; it **forfeits the turn**
  (the enemy executes its plan), then the discard pile is shuffled back into the deck. This cost
  is deliberate anti-deck-compression design — never erase it.
- **Table flip**: base once per round; voids the current turn, the enemy plan still executes, and
  the **enemy's attack is ×2 for the rest of the round**.
- The enemy telegraphs its plan each turn; if it survives the stand, it executes the plan.
  Player HP 0 = the run ends.

### 1.4 Golden chips — UPDATED 2026-06-11, learn these names
Chip conditions are judged at stand:

| Name | Condition | Chips |
|------|-----------|-------|
| **redjack** | Red hand weight exactly equals the max weight (default 21) | 1 |
| **bluejack** | same for Blue | 1 |
| **red guys** | Red hand has all 5 slots filled | 1 |
| **blue guys** | same for Blue | 1 |
| **closejack** | redjack + bluejack at the same time (the game's title) | **+1 bonus** |
| **full guys** | red guys + blue guys at the same time (both hands full) | **+1 bonus** |

- **Base maximum = 6 chips** (4 singles + 2 combo bonuses). Ace/picture effects can add more —
  no cap, but infinite same-turn chip loops are forbidden.
- **Chips reset on every stand** — chip engines must re-earn each stand.
- A **bust hand can NEVER score red guys / blue guys.** A bust hand whose effective weight (the
  3rd-slot card) exactly equals the max weight still earns the max-weight chip (user ruling).
  Whether that bust case counts as "redjack" by name is **pending (Q22)** — in card text, use the
  stricter `aces_items.md` definition (**non-bust** + exact match) until the user unifies it.

### 1.5 Damage — the heart of every design decision
- On stand: **damage = Red value × Blue value × 1.5^(chips)**, decimals floored **only at the end**.
- It is **MULTIPLICATIVE**. A set that only buffs Red is a trap: 100 × 3 loses to 40 × 20.
  Every set needs the other hand playable.
- **Sign rule**: hand value may go negative. If exactly **one** hand is negative → damage **0**.
  If **both** are negative → the product is positive and counts (an intended exotic build; its
  negative-value sources are not designed yet — see §1.7).
- Effects resolve in the activation order (§1.2) but each effect lands on a fixed **pipeline
  stage** (`docs/design/aces.md` §9): D0 effective cards (bust) → D1 per-card mods → D2 hand sum →
  D3 hand add → D4 hand multiply → D5 sign check → D6 chips → D7 chip multiplier (base 1.5,
  replace-only) → D8 product → D9 floor & apply. **Every candidate must say which stage it touches.**
- **Direct damage** (allowed for some aces): hits enemy HP immediately, bypassing the pipeline.
  Overkill evaporates — no overkill rewards. Killing the enemy ends the round instantly.

### 1.6 Out of combat (for conditions and economy)
- A run = **8 acts**; one act = fight → journeys → fight → journeys → boss → journeys. Enemy
  choice is 2 options; the ~30% harder one pays more journeys + gold.
- Journey types: ace/playing/hole **merchants** (pay gold, buy exactly 1), **patrons** (free, one
  option), **treasure** (gold), **hot spring** (heal), **campfire** (burn 1–3 cards),
  **painter** (paint a picture effect onto 1 of 7 random playing cards), **arcana** (tarot
  transforms), **cave** (random). All skippable except treasure/hot spring.
- Rarity: **common / rare / epic / legendary**. Ace **groups unlock through play** (Steam meta
  progression); each run only some unlocked groups appear.

### 1.7 NOT designed yet — never reference these in card text or conditions
- Enemy attack patterns / any enemy-state condition (`S8`, `E16`)
- Tarot (arcana) effects · starting deck differences · the slot-swap hole card
- Armor / damage-reduction details (direction approved; rules pending Q18)
- Negative-value card sources (pending Q20) · reviving enemies (pondering, Q19)
If a great idea needs one of these, record it as `status: blocked` and move on.

## 2. Authoritative documents
- `docs/KO_설계도.md` — rules (Korean). When §1 above seems insufficient, this wins.
- `docs/design/aces.md` — **approved generation grammar**: axes (T trigger / S condition /
  E effect / G scaling / P pure-gain-vs-risk-return / M mission), forbidden combos **F1–F15**,
  CE caps per rarity, group MP budgets, lane-branch rules (`RED-`/`BLUE-` archetype forks).
  Every candidate must be expressible in this grammar.
- This file — workflow + rules briefing.

## 3. Candidate workflow
- Work **only** on the archetype the user names. If the user says `RED-EXACT`, do not generate
  other archetypes. Archetypes may be lane-forked: `RED-EXACT` targets only the Red hand.
- First produce many **unnamed** candidates with temporary IDs (`EXACT-C01`, …).
- Separately propose ~5 naming families/motifs for the archetype.
- After the user selects survivors, assign names. Move rejected-but-plausible candidates into an
  archive section for that archetype.
- Simulate when feasible (the Redjack set did: 100k-run draw simulations) and report baseline vs
  with-enabler achievement rates.

## 4. The exemplary pattern — Redjack case study (REQUIRED design shape)

The user designated the Redjack set (`docs/design/aces_items.md`) as the model for all future
sets. Internalize **why** it works:

1. **A hard but legible identity goal**: Red hand exactly at max weight (Redjack). Baseline
   chance ~16% — real, but a prayer.
2. **Enabler lowers the hurdle** (C01): if a Red hit leaves the hand within `3Wp` of max weight,
   fold the deficit into the just-hit card. Simulation: P(Red exactly 21) **16.2% → 59.6%**.
   The goal became a plan.
3. **Payoff rewards the achieved state** (C02): while Redjack, Red hand value `+Vp` — at the hand
   calculation layer, never rewriting a card's printed value.
4. **Cross-lane stabilizer converts the win into the other hand** (C03): while Redjack, Blue
   cards weigh `-Wp`. Damage is Red × Blue, so the set must open Blue up instead of stopping at Red.
5. **Secondary payoff turns that safety into ambition** (C04): standing on Redjack pays chips per
   Blue card — now the player wants Blue full, not just safe.

Principles to reproduce for every set:
- **Goal → Enabler → Payoff → cross-lane Stabilizer → (optional) secondary Payoff.**
- Each card is modest alone; together they form an engine **visible from the card text alone**.
- Hard achievements need enabler support **before** payoff cards reward them; don't anchor many
  cards on rare outcomes without enablers.
- Synergy must come from effects, never labels (§5).

## 5. Group and synergy rules
- **Groups are invisible internal labels.** The player can never see or reason about `group`
  membership. Card text/conditions must never say "same group", "this group", or any hidden-label
  equivalent — including the card's own group.
- Synergy must emerge from **visible mechanical linkage**: one card makes a condition easier,
  another rewards that condition, another stabilizes the opposite hand.
- A 3–5 card set shares a **naming motif** (suffix, common word, phrase structure) so the player
  *feels* the family without a label.
- Within-set ideal-condition power must respect the group **MP budget** (`aces.md` §3-1).

## 6. Naming rules
- Prefer names where `ace` appears naturally inside one word: `Space`, `Place`, `Brace`,
  `Surface`, `Interface`, `Replace`, `Embrace`. Two-word or phrase names are allowed when
  one-word names run out.
- Avoid plain descriptive labels (`Red Trace`, `Blue Trace`). Don't append `Ace` to words that
  already contain it unless the user asks.
- **Reserved rule terms** — `redjack`, `bluejack`, `closejack`, `red guys`, `blue guys`,
  `full guys` — must be used **verbatim in card text** when meaning those conditions, and must
  **not** be used as card names.
- Korean names prioritize meaning/mood; localization keys are separate (backlog #12).

## 7. Rules-literacy pitfalls (every one of these has burned a draft)
- Red and Blue are concrete hands — name them. No abstract "lower hand" / "higher-value hand".
- Don't default support to both hands. A `RED-` lane card targets Red explicitly; touching the
  other hand is only for deliberate cross-lane support.
- "Increase a hand's value" = hand calculation layer (D3). Never rewrite a card's printed `value`
  unless the card itself is meant to change (D1).
- A bust hand counts **1** effective card/slot.
- Hitting doesn't advance turns; hands are **empty** after stand (no "turn start and Blue is not
  empty" conditions).
- `EXACT` support must move the hand **toward** max weight with explicit direction; overshoot is
  a bust under current rules — fixing it after the fact requires an explicitly approved bust
  transformation, never a default assumption.
- Hit-triggered effects need a clear limit ("first Red hit before this stand", "once per stand") —
  no unintended per-hit stacking.
- Chips are integers and the most explosive lever (1 chip = ×1.5 = CE 1.0). Per-card chip payoffs
  (like "per Blue card") need a cap or ratio so the ideal case stays inside CE/MP budgets.

## 8. Draft strength notation
- No absolute balance numbers while drafting. Use `Vp` (value unit), `Wp` (weight unit), and
  **CE** (chip-equivalent: CE 1.0 = ×1.5 final damage; CE sums = multiplied multipliers).
- In candidate tables a rough `CE 감각` column is welcome; the final `chip_equiv` goes into the
  YAML only after user selection.
- CE caps by rarity, P2 (risk-return) ×1.5 allowance, weight-2 ×2.0, and group MP budgets:
  `docs/design/aces.md` §3-1.

## 9. Review posture
- The user owns design. Candidate generation is proposal, not implementation.
- If the user corrects a rule, update this file (or flag it for Fable) before continuing.
- When unsure whether a condition is valid under turn/hand rules, **stop and ask** instead of
  generating around it.
