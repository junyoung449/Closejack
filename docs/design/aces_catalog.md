# 에이스 항목 카탈로그 (확정 YAML 누적)

> **지위**: `docs/design/aces.md`(승인 문법)의 `## 항목` 섹션에서 **2026-06-11 분리**된 항목 누적 파일.
> 스키마·문법의 출처는 변함없이 `aces.md` §15 — 이 파일은 **항목 데이터만** 담는다.
> **작성 주체**: 카드 생성 에이전트(Claude Sonnet — `docs/roles/card_generation.md`).
> 워크플로우(초안 → 사용자 선별 → 네이밍 → 확정 YAML)는 `docs/design/card_generation_rules.md` 준수.
> **사용자 승인 전 커밋 금지** 게이트는 이 파일에도 동일하게 적용된다.

**초안 근거**: `docs/design/aces_items.md` — `RED-EXACT` **Redjack 군** (후보 4종 + 시뮬레이션)

## RED-EXACT — Redjack / facet 계열

### 항목

```yaml
- id: ace_crimson_facet
  name_ko: "진홍 절면"
  name_en: "Crimson Facet"
  rarity: rare
  weight: 1
  binding: false
  group: redjack_facet
  gen_type: coverage
  structure: P1
  archetypes: [RED-EXACT]
  trigger: T1
  conditions: [S1]
  effects:
    - family: E3
      stage: D1
      params:
        target: just_hit_red_card
        condition: red_hand_deficit_to_max_weight_between_1_and_3Wp
        amount: deficit_to_red_max_weight
        direction: increase_only
  scaling: G0
  twist_ops: []
  chip_equiv: 1.0
  text_ko: "레드 히트 후 레드 핸드의 무게가 최대 무게보다 3Wp 이하로 부족하면, 모자란 만큼 방금 히트한 카드의 무게를 더해 redjack을 만든다."
  text_en: "After a Red hit, if the Red hand is within 3Wp below max weight, add the missing weight to the just-hit card to make redjack."
  status: proposed
  blocked_on: ""

- id: ace_ruby_facet
  name_ko: "홍옥 절면"
  name_en: "Ruby Facet"
  rarity: rare
  weight: 1
  binding: false
  group: redjack_facet
  gen_type: coverage
  structure: P1
  archetypes: [RED-EXACT]
  trigger: T2
  conditions: [S1]
  effects:
    - family: E1
      stage: D3
      params:
        target: red_hand_value
        condition: redjack
        amount: growth_times_Vp
  scaling: G2
  mission:
    type: M3
    condition: stand_with_redjack
    duration: run
    growth_apply: while_redjack_add_growth_times_Vp_to_red_hand_value
  twist_ops: []
  chip_equiv: 1.0
  text_ko: "redjack으로 스탠드할 때마다 성장 +1. redjack이면 레드 핸드 가치 +(성장×Vp)."
  text_en: "Each time you stand with redjack, this grows +1. While you have redjack, Red hand value +(growth x Vp)."
  status: proposed
  blocked_on: ""

- id: ace_garnet_facet
  name_ko: "석류석 절면"
  name_en: "Garnet Facet"
  rarity: rare
  weight: 1
  binding: false
  group: redjack_facet
  gen_type: coverage
  structure: P1
  archetypes: [RED-EXACT]
  trigger: T0
  conditions: [S1]
  effects:
    - family: E3
      stage: D1
      params:
        target: blue_hand_cards
        condition: redjack
        amount: -Wp
  scaling: G0
  twist_ops: []
  chip_equiv: 0.5
  text_ko: "redjack이면 블루 핸드의 모든 카드 무게 -Wp."
  text_en: "While you have redjack, all cards in the Blue hand have weight -Wp."
  status: proposed
  blocked_on: ""

- id: ace_scarlet_facet
  name_ko: "선홍 절면"
  name_en: "Scarlet Facet"
  rarity: epic
  weight: 1
  binding: false
  group: redjack_facet
  gen_type: keystone
  structure: P1
  archetypes: [RED-EXACT, CHIP]
  trigger: T2
  conditions: [S1, S2]
  effects:
    - family: E5
      stage: D6
      params:
        condition: redjack
        chips_per_effective_blue_card: 1
        bust_blue_counts_as: surviving_bust_slots
  scaling: G0
  twist_ops: []
  chip_equiv: 5.0
  text_ko: "redjack인 상태로 스탠드하면, 블루 핸드의 유효 카드 한 장당 황금 칩 +1. 기본 룰에서 버스트된 블루 핸드는 유효 카드 1장으로 센다."
  text_en: "When you stand with redjack, gain +1 golden chip for each effective card in the Blue hand. By default, a busted Blue hand counts as 1 effective card."
  status: proposed
  blocked_on: ""
```

### MP 계산표

| 조합 | 적재 무게 | 이상 상태 CE 합 | 달성 난도 평가 |
|------|-----------|-----------------|----------------|
| Crimson Facet + Ruby Facet + Garnet Facet + Scarlet Facet | 4 | 7.50+ | 기준 밴드를 크게 넘지만, Redjack 달성 후 Blue를 채워야 하는 조건 달성형 엔진이다. Ruby Facet은 redjack 미션으로 무한 선형 성장하며, Scarlet Facet의 폭발력은 수치 캡이 아니라 Redjack 유지와 Blue 유효 카드 수 확보 난도로 통제한다. |

### 자체 검수

- 스키마: §15 필드 사용, `value` 필드 없음.
- 발동/적용: 모든 효과에 `stage: D#` 명시.
- 예약어: `redjack`은 카드명이 아니라 조건 텍스트에만 사용.
- 숨은 군 참조: 카드 텍스트는 `group`을 참조하지 않음.
- 레인 분기: `RED-EXACT` 중심이며 Blue 접촉은 deliberate cross-lane stabilizer/payoff.
- 성장/미션: Ruby Facet은 `M3`이며 성장치는 redjack 상태에서만 적용됨.
- CE/MP: 이상 상태 CE와 군 MP 기록. 조건 달성형·성장형 초과분은 달성 난도와 함께 보고.
