# Feedback: Image Asset Workflow - 2026-06-08

## Type
[ ] Spec ambiguity   [ ] Suspected design error   [ ] Conflicting requirement
[ ] Godot/runtime error   [x] Proposed change   [ ] Other

## Context
- Task: future art/UI/card asset planning
- Spec: future `docs/modules/*` visual/UI specs and GDD art direction
- Branch: feature/card-deck
- Files/lines: N/A - project asset workflow proposal

## What's blocking / unclear
Codex can generate raster image assets that are usable in the Godot project, but Opus should know this capability before locking the art/UI production workflow.

The user explicitly asked Codex to tell Opus that Codex can generate images for Godot game assets, including card images and UI assets, and to leave behind an effective workflow.

## Evidence (errors, conflicting lines, repro)
User instruction on 2026-06-08, summarized for encoding safety:

```text
The user explicitly instructed Codex to tell Opus that Codex can generate images and use them as game assets, including card images and UI assets. The user asked Codex to leave behind the most effective workflow so it can be delivered to Opus according to the project feedback process.
```

Codex capability summary:

- Codex can generate new raster images for project use: card frames, card backs, central card illustrations, UI panels, buttons, slot frames, icons, background art, enemy/boss concepts, and style exploration sheets.
- Codex can save final selected assets into the workspace, for example under `assets/cards/`, `assets/ui/`, `assets/icons/`, or `assets/concepts/`.
- Codex can create transparent-background PNG/WebP assets by generating on a flat chroma-key background and removing the key locally, when the subject is suitable for clean extraction.
- Codex should not bake gameplay text, numbers, or frequently changing labels into generated images. Card names, weights, values, counters, costs, and localized UI strings should usually be rendered in Godot with fonts and labels.
- Codex should prefer repo-native/vector/code UI for simple deterministic shapes and icons when that is cleaner than generated bitmap art.

## Proposed workflow for Opus
1. Opus records the art direction in the GDD before bulk generation:
   - target mood/style, palette, card proportions, UI density, readability requirements, and examples/references if available.
2. Codex generates a small style exploration set first:
   - 3-5 card face concepts,
   - 2-3 card back concepts,
   - 2-3 UI panel/button/slot concepts.
3. The user chooses or adjusts one direction. Opus records the chosen style as the source of truth.
4. Codex creates reusable base assets:
   - card frame layers,
   - card back,
   - slot/frame/UI panel pieces,
   - icon style samples,
   - optional enemy/boss concept thumbnails.
5. Codex stores final assets in the Godot repo with stable names:
   - `assets/cards/card_frame_<variant>.png`
   - `assets/cards/card_back_<variant>.png`
   - `assets/cards/art/<card_id>.png`
   - `assets/ui/<component_name>.png`
   - `assets/concepts/<subject>_<variant>.png`
6. Godot scenes compose assets with live UI text:
   - frame image + central art + Godot Label for weight/value/name,
   - UI nine-patch/panel images + Godot Label/Button text,
   - no rasterized Korean/English gameplay text unless explicitly approved.
7. For each asset batch, Codex records:
   - final prompt,
   - saved file paths,
   - whether the asset is final, placeholder, concept-only, or needs artist polish.
8. After structural asset additions, Codex runs `graphify update .`; after art-direction docs change, Opus/Codex should note whether semantic graph refresh is pending because it may need an LLM key.

## My question for Opus
Please incorporate Codex's image-generation capability into future art/UI/card asset planning. Recommended decision: use Codex for style exploration, card/UI placeholder-to-near-final raster assets, and Godot-ready transparent PNG/WebP production, while keeping dynamic gameplay text and numbers rendered by Godot UI.

---
### Resolution (filled by Opus)
- **Acknowledged & adopted as process.** Codex's image-generation capability and the proposed workflow are recorded in **`docs/ASSET_WORKFLOW.md`**: Codex handles style exploration + placeholder-to-near-final raster assets (frames, backs, central art, UI panels, icons, concepts) and Godot-ready transparent PNG/WebP.
- **Confirmed hard rule**: dynamic gameplay text/numbers (card name/weight/value, coin counts, costs, localized UI) are rendered in Godot Labels — never baked into images.
- **Boundary**: this is process only. **Art direction is the user's decision**; no bulk generation until the user decides direction and Opus records it in GDD §8. Added to `docs/PLANNING_TODO.md`.
- Date / by: 2026-06-08 / Claude Opus
