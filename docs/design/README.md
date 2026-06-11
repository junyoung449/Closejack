# docs/design/ — Fable 데이터 설계 구조 채널

이 디렉터리는 **Claude Fable 5 (A0)** 가 기획 단계에서 뽑아낸 **데이터 설계 구조**를 쓰는
곳이다. 특히 에이스 카드 · 홀 카드 · 플레잉 카드처럼 **수가 많은 항목 집합의 구조(스키마)**
를 여기에 정리한다.

> ⚠️ 게임 룰·로직·데미지 계산·게임 흐름은 여기서 정하지 않는다. 그건 유저가 확정하고
> Opus가 GDD(`docs/KO_설계도.md`)에 기록한다. 이 디렉터리는 그 확정된 룰 **위에서** 카드
> 데이터가 어떤 필드/구조를 갖는지의 **뼈대**만 다룬다.

## 누가 / 무엇을
- **작성: Fable (A0)** — 데이터의 설계 구조(필드, 타입, 카테고리, 관계)를 추출해 작성.
- **읽고 채우기: Sonnet (A3, 카드 생성 에이전트)** — Fable이 잡은 구조를 보고 **개별 항목을
  네이밍하고 리스트화**. (2026-06-11 사용자 지시로 Codex → Sonnet 이관. 진입 문서:
  `docs/roles/card_generation.md`, 워크플로우: `card_generation_rules.md`.)
- **확정: Opus (A1)** — 구조가 안정되면 구현용 모듈 스펙(`docs/modules/`)으로 옮긴다.

## 흐름
```
[유저+Opus] 룰/로직/데미지/흐름 확정 (docs/KO_설계도.md)
        ↓
[Fable]  데이터 설계 구조 추출        → docs/design/<주제>.md   (예: aces.md)
        ↓
[Sonnet] 항목 후보 초안 + 시뮬레이션   → <주제>_items.md (예: aces_items.md)
        ↓ (사용자 선별·승인)
[Sonnet] 네이밍 + 확정 YAML 누적      → <주제>_catalog.md (예: aces_catalog.md)
        ↓
[Opus]   구현용 모듈 스펙으로 확정      → docs/modules/<module>.md
```

## 파일 규칙 (주제당 3파일)
- **`<주제>.md`** — 문법/스키마 (사용자 승인 후 수정 금지, 예: `aces.md`).
- **`<주제>_items.md`** — 작업 중 초안·후보·시뮬레이션 (예: `aces_items.md`).
- **`<주제>_catalog.md`** — 사용자 선별을 통과한 확정 YAML 누적 (예: `aces_catalog.md`).
- 막히거나 룰과 충돌하면 발명하지 말고 [docs/feedback/](../feedback/) 채널로 올린다.
