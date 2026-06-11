# Graph Report - .  (2026-06-11)

## Corpus Check
- 16 files · ~25,985 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 90 nodes · 290 edges · 9 communities (8 shown, 1 thin omitted)
- Extraction: 97% EXTRACTED · 3% INFERRED · 0% AMBIGUOUS · INFERRED: 8 edges (avg confidence: 0.88)
- Token cost: 141,388 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Ace Grammar & Card Sets|Ace Grammar & Card Sets]]
- [[_COMMUNITY_Game Design & Combat Rules|Game Design & Combat Rules]]
- [[_COMMUNITY_Card Kinds & Chip Conditions|Card Kinds & Chip Conditions]]
- [[_COMMUNITY_Module Implementation Process|Module Implementation Process]]
- [[_COMMUNITY_Harness Entry & Agent Tracks|Harness Entry & Agent Tracks]]
- [[_COMMUNITY_Card Generation Track (Sonnet)|Card Generation Track (Sonnet)]]
- [[_COMMUNITY_Claude Hooks|Claude Hooks]]
- [[_COMMUNITY_Codex Hooks|Codex Hooks]]
- [[_COMMUNITY_Project Overview|Project Overview]]

## God Nodes (most connected - your core abstractions)
1. `KO_설계도.md — Korean GDD (design source of truth)` - 31 edges
2. `aces.md — Approved Ace Generation Grammar v3 (user-locked)` - 26 edges
3. `Planning To-Do (Design Backlog)` - 21 edges
4. `card_generation_rules.md — Card Generation Workflow + Rules Briefing v2` - 21 edges
5. `CLAUDE.md — Project Facts, Role Routing & Authority Table` - 19 edges
6. `aces_items.md — Ace Draft Candidates & Simulations (working file)` - 19 edges
7. `Closejack Korean GDD (설계도)` - 18 edges
8. `Claude Sonnet (A3) — Delegated-Only` - 15 edges
9. `card_generation.md — Sonnet Entry Doc (card generation role)` - 15 edges
10. `Agent Collaboration Protocol` - 13 edges

## Surprising Connections (you probably didn't know these)
- `App Icon (Godot Robot Logo)` --references--> `Closejack (Roguelike Deckbuilding Blackjack)`  [INFERRED]
  icon.svg → docs/KO_설계도.md
- `Claude Fable 5 (A0) — Full-Authority Agent` --shares_data_with--> `aces.md — Approved Ace Generation Grammar v3 (user-locked)`  [INFERRED]
  CLAUDE.md → docs/design/aces.md
- `PR Template` --references--> `OpenAI Codex (A2) — Implementer`  [EXTRACTED]
  .github/pull_request_template.md → docs/AGENT_COLLABORATION.md
- `PR Template` --references--> `Spec → Task → PR → Review → Done Lifecycle`  [EXTRACTED]
  .github/pull_request_template.md → docs/AGENT_COLLABORATION.md
- `AGENT.md — Codex Base Guide` --references--> `Graphify Shared Project Map`  [EXTRACTED]
  AGENT.md → CLAUDE.md

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Redjack Facet Set — Enabler/Payoff/Stabilizer/Keystone engine** — design_aces_catalog_ace_crimson_facet, design_aces_catalog_ace_ruby_facet, design_aces_catalog_ace_garnet_facet, design_aces_catalog_ace_scarlet_facet, concept_redjack_facet_set [EXTRACTED 1.00]
- **Card Generation Track pipeline (Sonnet: rules → grammar → drafts → catalog)** — concept_sonnet_a3, roles_card_generation, design_card_generation_rules, design_aces, design_aces_items, design_aces_catalog [EXTRACTED 1.00]
- **AI Agent Roles & Authority table (user owns design; A0–A3 scopes)** — concept_design_authority, concept_fable_a0, concept_opus_a1, concept_codex_a2, concept_sonnet_a3 [EXTRACTED 1.00]

## Communities (9 total, 1 thin omitted)

### Community 0 - "Ace Grammar & Card Sets"
Cohesion: 0.25
Nodes (22): Ace Archetypes (26: EXACT, FULL, WRECK, LACE, NEGATIVE, CHIP, ...), Ace Group / 군 (synergy group, hidden label), bluejack (Blue hand effective weight == max weight), Bluejack Undertow Set (BLUE-EXACT draft group), Bust (Center 3rd-Slot Collapse), CE/MP System (chip-equivalent strength + group multiplier potential), Damage Formula (Red value × Blue value × 1.5^chips), Damage Pipeline v2 (D0–D9 + direct-damage & incoming channels) (+14 more)

### Community 1 - "Game Design & Combat Rules"
Cohesion: 0.17
Nodes (22): Attack = Upper.value × Lower.value × 1.5^coins, Combat Deck = Copy of Original (Temp vs Permanent), Deck + Discard + Reshuffle, Enemy (Health, Attack Telegraph), Golden Coins (×1.5 Multiplier Resource), Hand (Upper/Lower, 5 Slots, Weight Limit 21), Journey / Shop Events, Reshuffle / Deck-Compression Check (+14 more)

### Community 2 - "Card Kinds & Chip Conditions"
Cohesion: 0.31
Nodes (11): Ace (Permanent Upgrade Card), blue guys (Blue hand all 5 slots filled), Card (Weight + Value + Kind), full guys (red guys + blue guys combo), Hole Card (One-shot Item), Mission Keyword (M1/M2/M3, ace-bound), Playing Card, red guys (Red hand all 5 slots filled) (+3 more)

### Community 3 - "Module Implementation Process"
Cohesion: 0.42
Nodes (10): AGENT.md — Codex Base Guide, CLAUDE.md — Project Facts & Standards, OpenAI Codex (A2) — Implementer, Graphify Shared Project Map, Spec → Task → PR → Review → Done Lifecycle, Claude Opus (A1) — Design/Spec/Review Authority, Agent Collaboration Protocol, Feedback Channel README (+2 more)

### Community 4 - "Harness Entry & Agent Tracks"
Cohesion: 0.46
Nodes (8): AGENT.md — Codex Base Guide (module implementation only), AGENTS.md — Codex Entry Pointer, CLAUDE.md — Project Facts, Role Routing & Authority Table, Card Generation Track (user ↔ Sonnet workflow), User Design Authority, Feedback Channel (Codex → Opus), Graphify Knowledge Graph (graphify-out/), Module Implementation Track (Opus ↔ Codex workflow)

### Community 5 - "Card Generation Track (Sonnet)"
Cohesion: 0.71
Nodes (7): Claude Fable 5 (A0) — Full-Authority Agent, Claude Sonnet (A3) — Delegated-Only, aces_catalog.md — Accumulated Final Ace YAML Catalog, aces_items.md — Ace Draft Candidates & Simulations (working file), docs/design README — Fable Data-Design Structure Channel, docs/feedback README — Feedback Channel Template, card_generation.md — Sonnet Entry Doc (card generation role)

### Community 6 - "Claude Hooks"
Cohesion: 0.50
Nodes (3): hooks, PreToolUse, SessionStart

### Community 8 - "Project Overview"
Cohesion: 0.67
Nodes (3): Closejack (Roguelike Deckbuilding Blackjack), README, App Icon (Godot Robot Logo)

## Knowledge Gaps
- **6 isolated node(s):** `PreToolUse`, `SessionStart`, `README`, `App Icon (Godot Robot Logo)`, `User — Design Authority` (+1 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **1 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `KO_설계도.md — Korean GDD (design source of truth)` connect `Card Kinds & Chip Conditions` to `Ace Grammar & Card Sets`, `Game Design & Combat Rules`, `Module Implementation Process`, `Harness Entry & Agent Tracks`, `Card Generation Track (Sonnet)`, `Project Overview`?**
  _High betweenness centrality (0.261) - this node is a cross-community bridge._
- **Why does `Planning To-Do (Design Backlog)` connect `Game Design & Combat Rules` to `Ace Grammar & Card Sets`, `Card Kinds & Chip Conditions`, `Module Implementation Process`, `Harness Entry & Agent Tracks`, `Card Generation Track (Sonnet)`?**
  _High betweenness centrality (0.155) - this node is a cross-community bridge._
- **Why does `Closejack Korean GDD (설계도)` connect `Game Design & Combat Rules` to `Project Overview`, `Card Kinds & Chip Conditions`, `Module Implementation Process`?**
  _High betweenness centrality (0.139) - this node is a cross-community bridge._
- **What connects `PreToolUse`, `SessionStart`, `README` to the rest of the system?**
  _8 weakly-connected nodes found - possible documentation gaps or missing edges._