# Asset Workflow (image generation)

> **Status**: process reference (Opus-owned). **Art _direction_ — mood, palette, card design — is the
> user's decision** (`docs/KO_설계도.md` §8). This file only defines *how* assets get produced once a
> direction is chosen. Source: Codex feedback `image-asset-workflow-20260608.md` (user-requested).

## Capability (Codex)
Codex can generate raster image assets usable directly in the Godot project:
- card frames / borders, card backs, central card illustrations
- UI panels, buttons, slot frames, icons, backgrounds
- enemy / boss concept art, style-exploration sheets
- transparent-background PNG/WebP (generate on a flat chroma-key background, key it out locally) when the subject extracts cleanly

## Hard rule — keep dynamic content out of images
Do **not** bake gameplay text or frequently-changing values into generated images:
card names, weights, values, golden-coin counts, costs, and localized (KO/EN) UI strings are
rendered **in Godot** with fonts/Labels. Images provide only the static visual layer (frame, art,
panel). Prefer repo-native vector/code UI for simple deterministic shapes/icons.

## Workflow
1. **Direction first** — the user decides art direction; Opus records it in the GDD §8 (mood, palette,
   card proportions, UI density, readability needs, references). No bulk generation before this.
2. **Style exploration** — Codex makes a small set: 3–5 card faces, 2–3 card backs, 2–3 UI panel/button/slot concepts.
3. **User picks/adjusts** one direction; Opus records the chosen style as source of truth.
4. **Base assets** — Codex produces reusable pieces: card frame layers, card back, slot/frame/panel pieces, icon samples, optional enemy/boss thumbnails.
5. **Store with stable names** in the repo:
   - `assets/cards/card_frame_<variant>.png`
   - `assets/cards/card_back_<variant>.png`
   - `assets/cards/art/<card_id>.png`
   - `assets/ui/<component>.png`
   - `assets/concepts/<subject>_<variant>.png`
6. **Compose in Godot** — frame image + central art + Godot `Label` for weight/value/name; nine-patch panels + Label/Button text. No rasterized gameplay text unless explicitly approved.
7. **Record per batch** — final prompt, saved paths, and status (final / placeholder / concept-only / needs polish).
8. **Graph** — after structural asset additions, run `graphify update .`; after art-direction doc changes, note that semantic refresh may need an LLM key.

## Boundary
This is process only. Art direction, card visual identity, and which assets are "final" are user/design
decisions recorded in the GDD — not chosen by Codex.
