# 에이스(Ace) 생성 문법 · 설계도 — v3 ✅ APPROVED

> **작성**: Claude Fable 5 (A0) · **확정 권한**: 사용자
> **상태**: ✅ **사용자 approved (2026-06-11)** — 항목 생성 단계 진입. Codex 태스크 = `docs/tasks/pending/TASK-003-ace-list-batch1.md`.
> 단, Q17~Q21(말미)은 미해결로 남음 — 해당 질문에 의존하는 아키타입은 1차 배치에서 제외(태스크 참조).
> **지위**: 개별 에이스를 나열하지 않는다. 에이스를 **대량 생성하기 위한 문법(축·조합 규칙·금지 조합·평가 기준)** 을 정의한다. 이 문법의 변경은 사용자 재승인 필요.
> **v3 (2026-06-11)**: 사용자가 Q9~Q16 전부 답변 → 파이프라인 v2 **확정**, 군 크기 3~5·군 단위 해금, 귀속 = 전면 면역, 칩×버스트·음수 데미지 규칙 확정, 방어도 방향 신설, **아키타입 13종 → 25종 확장** (사용자 지시).
> **수치 원칙**: 절대 수치는 적지 않는다. 모든 수치는 파라미터 기호(`Vp`/`Wp`) 또는 **칩 등가(CE)** 로 두고, 플레잉 카드 풀(#2) 견적 확정 후 앵커를 채운다.
> 근거 룰: `docs/KO_설계도.md` (GDD §2-1-1 포함). GDD와 충돌하는 항목은 생성 금지.

---

## 구조

### 0. 설계 철학 (발라트로 / 슬레이 더 스파이어 방식)

에이스는 "범용 스탯 증가 아이템"이 아니라 **덱빌딩 방향(아키타입)을 선언하고 강화하는 장치**다.

1. **모든 에이스는 아키타입 태그를 1~2개 가진다.** 태그 없는 에이스는 생성 금지.
2. **조건 없는 평면 강화는 common에만 허용**하고 수를 제한한다. 상위 희귀도일수록 조건부 설계.
3. **에이스는 질문을 던져야 한다.** 좋은 에이스 = 덱 구성·히트 판단·여정 선택을 바꾸게 만드는 에이스.
4. **기축 통화 = 황금 칩.** 칩 1개 = 최종 데미지 ×1.5 (GDD 2-6). 모든 효과 세기는 **칩 등가(CE)** 로 추정 기입. CE는 로그 스케일이라 **합산 = 배수 곱** (CE 합 n ⇒ 최종 ×1.5ⁿ).
5. **'정해(正解) 조합' 방지 3중 장치**: ① 영구 성장 = **선형 + 적용 조건 필수**, ② **군 단위 MP 예산** 상한, ③ **런별 군 로테이션 + 군 단위 해금**.

### 1. 에이스 기본 골격 (확정 룰 — GDD §2-1-1)

| 항목 | 확정 내용 |
|------|----------|
| 가치(value) | **없음.** Card 리소스의 `value`는 0 고정·미사용 |
| 무게(weight) | 에이스 영역(좌측 세로)의 **무게 한도 = 5**, 기본 무게 = **1**, 특수 에이스 = **2** (매우 강력해야 함) |
| 획득(만재 시) | (기존 + 신규) 중 **1장 방출**(FTL 선원 방식) 또는 **획득 스킵** |
| 귀속(binding) | 절대 버리지 못하는 에이스 존재 — **방출·소각(모닥불)·포식 등 모든 제거 수단에 면역** (Q10 확정) |
| 희귀도 | **common / rare / epic / legendary**. 확률·가격은 여정 경우의 수·확률(#6) 확정 → 런당 기대 등장량 계산 후 책정 |
| 변형 허용 | 자기파괴 에이스, 포식(다른 에이스를 잡아먹는) 에이스 허용 |
| 직접 데미지 | 스탠드 외 직접 데미지 허용. **과잉 처치 잔여량 소멸**, 과잉 보상 없음. 적은 항상 단일(부활형 적은 구상 중) (Q13 확정) |
| 군·해금 | 군 크기 **3~5장**(그 이상도 가능). **군 단위로 플레이 해금** — 스팀 메타 진행(#9)과 연동 (Q9 확정) |
| 미션 | **에이스 카드에 귀속** — 적재 중일 때만 진행·발현. "런 끝까지"는 장착 유지 시의 관대한 상한 (Q15 확정) |

### 2. 아키타입 (덱빌딩 방향) — 25종 (v3 확장)

> 군은 아키타입에 의존한다(사용자 확정). 아키타입이 많아야 군이 많아진다. 각 아키타입은 확정 룰에서 직접 도출.

**무게·슬롯 계열**

| 태그 | 이름 | 권장하는 플레이 | 근거 룰 |
|------|------|----------------|---------|
| `EXACT` | 정밀 21 | 핸드 무게를 정확히 한계치에 맞춘다 | 2-5-7 최대 무게 칩 |
| `FULL` | 만석 | 5슬롯을 가득 채운다 | 2-5-7 만석 칩 |
| `LIGHT` | 경량 | 무게를 줄이고 히트 횟수를 늘린다 | 2-1 무게·가치 분리 |
| `HEAVY` | 중량 | 고무게·고가치 소수 카드로 **21 직전**을 노린다 | 2-1, 2-5-2 |
| `WRECK` | 고의 버스트 | 일부러 버스트시키고 3번 슬롯 거물로 수습한다 — **유효 무게(3번 슬롯)가 한계치면 최대 무게 칩 인정** | **Q11 확정** |
| `PARITY` | 홀짝 | 핸드를 홀수(또는 짝수) 무게로 통일한다 | S3 카드 속성 |
| `PAIR` | 페어 | 같은 무게/가치 카드를 짝지어 보상받는다 (스플릿 모티프) | S3, 카지노 용어 |

**데미지 공식 계열**

| 태그 | 이름 | 권장하는 플레이 | 근거 룰 |
|------|------|----------------|---------|
| `CHIP` | 칩 엔진 | 황금 칩 개수·배수를 키운다 (칩은 스탠드마다 리셋 — 매 스탠드 재달성 엔진) | 2-6, Q11 확정 |
| `TWIN` | 쌍둥이 | 레드·블루를 대칭으로 키우거나 편중을 보정한다 | 2-6 곱셈 구조 |
| `NEGATIVE` | 음수 도박 | **양 핸드를 모두 음수로** 만들어 곱을 양수로 터뜨린다 (한쪽만 음수면 0 데미지) | **Q12 확정** — 음수 공급원은 #2 연동 (Q20) |
| `STRIKE` | 직접 타격 | 스탠드 없이 직접 데미지로 끝낸다 — 과잉량 소멸이므로 **정밀한 마무리** 계산이 핵심 | E17 (Q7·Q13 확정) |

**자원·순환 계열**

| 태그 | 이름 | 권장하는 플레이 | 근거 룰 |
|------|------|----------------|---------|
| `CYCLE` | 압축 순환 | 덱을 얇게, 버린 더미·보충을 자원으로 쓴다 | 2-3 보충 비용 |
| `COUNT` | 카운팅 | 덱 정보를 확보해 히트 확률을 지배한다 (블랙잭 카드 카운팅 모티프) | E8, 2-5 무작위 드로우 |
| `HOLE` | 홀 카드 기술자 | 홀 카드를 자주, 더 강하게 쓴다 | 2-5-4 |
| `GOLD` | 자산가 | 금화를 모으고, 금화로 강해진다 | 3-1, 3-2-2 |
| `PICTURE` | 그림 공명 | 그림(효과) 카드를 모으고 증폭한다 | 2-1, 화가 여정 |
| `PLAIN` | 무지(無地) | **그림 없는 카드만** 모아 보상받는다 (화가 여정을 거르는 빌드) | 2-1 그림 없는 카드 존재 |

**리스크·생존 계열**

| 태그 | 이름 | 권장하는 플레이 | 근거 룰 |
|------|------|----------------|---------|
| `FLIP` | 판 엎기 도박사 | 판 엎기를 비용이 아닌 무기로 쓴다 | 2-5-5 |
| `BLOOD` | 출혈 | 체력을 자원으로 지불하고 보상받는다 | 2-8 패배 = HP 0 |
| `GUARD` | 철벽 | **방어도·피해 경감**을 쌓아 장기전을 채비한다 | **Q16 확정** (방어도 방향) |
| `SLOW` | 장기전 | 턴을 끌수록 강해진다 | T5/T6, G1 |
| `CONTRACT` | 계약 | **귀속(전면 제거 면역) 에이스**의 저주를 보상으로 바꾼다 | **Q10 확정** |
| `DEVOUR` | 포식 | 에이스를 잡아먹거나 스스로 불태워 도약한다 | Q4 확정 (E15·G3) |

**메타 구조 계열**

| 태그 | 이름 | 권장하는 플레이 | 근거 룰 |
|------|------|----------------|---------|
| `ORDER` | 서열 | 에이스 적재 순서·무게 구성을 활용한다 | 2-5 위→아래 발동, 무게 한도 5 |
| `WANDER` | 여정꾼 | 전투 밖 **여정 선택·스킵**에 반응해 성장한다 | 3-2 여정·스킵 규칙 |

> 긴장 관계(빌드 다양성의 원천): `EXACT`↔`HEAVY`↔`WRECK`(21 직전에 멈출까·맞출까·넘길까), `FULL`↔`CYCLE`, `PICTURE`↔`PLAIN`(화가 여정의 양극), `TWIN`↔`NEGATIVE`, `STRIKE`↔`SLOW`, `GUARD`↔`BLOOD`, `FLIP`↔`GUARD`(적 공격 ×2 감당), `ORDER`↔무게 2 에이스(칸 압박).

### 3. 군(시너지 그룹) 시스템 + 런 로테이션 + 해금

1. **군 크기 = 3~5장** (그 이상도 가능 — 사용자 확정, Q9).
2. **군은 아키타입에 의존**한다: 군마다 중심 아키타입 1~2개. **같은 아키타입에 메커니즘이 다른 군 여러 개** 허용 — 군 수는 효과 아이디어에 따라 늘린다(많은 군 필요, 사용자 확정).
3. **군 단위 해금**: 플레이를 통해 군 단위로 해금된다(스팀 메타 진행 #9 연동). 해금 트리 설계는 별도(#9).
4. **군 내부 역할**: 시동 / 가속 / 마무리 / 보험. 군 크기 3~5면 역할 일부 겸직.
5. **시너지 참조 규칙**: 군 시너지 조건은 **자기 군 소속만 참조** (F13). 교차 군 명시 시너지 금지 → 로테이션·해금과 결합해 고정 '정해' 차단.
6. **무소속(범용) 풀**: 항상 등장 가능. CE 상한 낮게 (≤ 0.75 [제안]).
7. **로테이션**: 런 시작 시 (해금된 군 중) 등장 군 부분집합 선정. **런당 군 수는 보류** — 총 카드 수와 여정을 통한 에이스 노출량 확정 후 결정 (Q17).
8. **규모 추정**: 25 아키타입 × 군 1~2개 = **군 25~50개** × 3~5장 = **에이스 75~250장** + 무소속. "풀 대형화" 요구와 부합 — 실제 총량은 군 아이디어 수로 결정.

#### 3-1. 곱배수 포텐셜(MP) 산정 — 방법과 예산 [제안]

**MP(군)** = 그 군에서 **무게 한도 5 이내로 최적 적재**했을 때 **이상적 플레이 조건**에서 동시에 나오는 **CE 총합**. (군 크기 3~5장이면 풀콤보 = 사실상 군 전체일 수 있음 — 예산은 동일하게 적용.)

환산표: MP 4 ≈ ×5.1 · MP 5 ≈ ×7.6 · MP 5.5 ≈ ×9.3 · MP 6 ≈ ×11.4 · MP 6.5 ≈ ×14 · MP 7 ≈ ×17 · MP 7.5 ≈ ×21

**단일 에이스 CE 상한** (이상 상태 기준):

| 구분 | CE 상한 | 비고 |
|------|---------|------|
| common | 0.5 | 무조건부 허용 구간 |
| rare | 1.0 | 조건부 |
| epic | 1.5 | 강한 조건 / 빌드 의존 |
| legendary | 2.5 | 키스톤·룰브레이커 |
| **무게 2 에이스** | **동급 희귀도 상한 ×2.0** | 같은 무게의 동급 2장 몫. **희귀도 제한 없음** (Q14 확정 — 군 설계에 따라 결정) |
| 리스크-리턴형(P2) 보정 | 동급 상한 ×1.5 | 페널티가 상쇄 |

**군 풀콤보 MP 예산**: 안정형 5.0~5.5 (≈×8~9) / 표준형 5.5~6.5 (≈×9~14) / 도박형(P2 중심) 6.5~7.5 (≈×14~21)

**산정 절차**: Codex가 항목마다 `chip_equiv` 기입 → 군별 무게 합 ≤ 5 적재 조합의 CE 합 최댓값 = MP(군) 기록 → 예산 초과 시 Fable 2차 검수에서 하향. 가산(+Vp) 효과의 CE는 "표준 핸드" 기준 추정치, #2 확정 후 보정.

### 4. 발동축 T (언제) — 전 트리거 승인 (2026-06-11)

| 코드 | 시점 | 코드 | 시점 |
|------|------|------|------|
| `T0` | 상시 (패시브) | `T7` | 라운드(전투) 시작 시 |
| `T1` | 히트 시 (레드/블루/공통) | `T8` | 라운드 승리 시 |
| `T2` | 스탠드 시 (데미지 계산 단계) | `T9` | 홀 카드 사용 시 |
| `T3` | 버스트 발생 시 (레드/블루/공통) | `T10` | 판 엎기 사용 시 |
| `T4` | 황금 칩 획득 시 | `T11` | 덱 보충(리셔플) 시 |
| `T5` | 턴 시작 시 | `T12` | 덱 소진(0장) 시 |
| `T6` | 턴 종료 시 | | |

### 5. 구조축 P (이득의 형태 — 필수 지정)

| 코드 | 구조 | 정의 | CE 규칙 |
|------|------|------|---------|
| `P1` | 순이득형 | 해당 플레이를 하면 이득, 아니면 그냥 무효(0) | 희귀도 기본 상한 |
| `P2` | 리스크-리턴형 | 해당 플레이 시 더 큰 이득, 이탈·실패 시 손해 | 기본 상한 ×1.5 — 페널티로 상쇄 |

같은 컨셉에서 P1/P2 변형을 쌍으로 뽑는 것이 풀 확장의 기본 레버.

### 6. 미션축 M (달성 기반 발현)

**미션은 에이스 카드에 귀속된다** (Q15 확정): 그 에이스가 **적재 중일 때만** 미션이 진행되고 효과가 발현된다. "런 끝까지"(M1)는 장착을 유지했을 때의 관대한 상한이다.

| 코드 | 패턴 | 정의 |
|------|------|------|
| `M0` | 없음 | 기본 |
| `M1` | 달성-영구 발현 | 달성 후 → (장착 유지 시) 런 끝까지 상시 발현 |
| `M2` | 달성-일시 발현 | 달성 후 → 일시 기간(이번 라운드 / n턴)만 발현 |
| `M3` | 달성-조건부 영구 성장 | 달성마다 성장 +1단계(**선형**). **성장치는 적용 조건을 만족하는 플레이에서만 반영** |

**M3 철칙 (F12)**: 성장치가 조건 밖에서도 적용되는 설계(발라트로 투페어 조커식) 금지. 수치가 커지더라도 특정 플레이를 강화한다.

**문법 예시 프레임** (항목 아님):
- `M3 × EXACT`: "레드·블루 모두 정확히 21 스탠드" 달성마다 성장 +1. 성장치는 **무게가 정확히 21인 핸드의 가치**에만 반영.
- `M2 × FULL`: "5슬롯 만석 스탠드" → 다음 라운드 동안 효과 발현.
- `M1 × CYCLE`: "한 라운드에 덱 보충 2회" → 이후 (장착 중) 보충할 때마다 효과.

### 7. 조건축 S (어떤 상태일 때 — 0~2개 부착)

| 코드 | 조건군 | 예시 패턴 |
|------|--------|----------|
| `S1` | 무게 상태 | 핸드 무게 = 한계치 정확히 / 임계 / 레드·블루 비교 / **유효 무게(버스트 후 3번 슬롯)** |
| `S2` | 슬롯 상태 | n장 배치 / 3번 슬롯 점유 / 양 핸드 카드 수 동일 |
| `S3` | 카드 속성 | 그림 유·무 / 무게 홀·짝 / 가치·무게 임계 / 특정 무게 / **음수 가치** / 동일 무게 페어 |
| `S4` | 에이스 적재 | 맨 위·맨 아래 / 인접 에이스 / 적재 총 무게·무게 2 보유 / 같은 군 에이스 수 / **귀속 에이스 보유** |
| `S5` | 자원 상태 | 금화 임계 / HP 비율 / 홀 카드 보유 수 / **방어도 보유** |
| `S6` | 덱 상태 | 덱 잔량 / 버린 더미 장수 / 보충 횟수 |
| `S7` | 진행 상태 | n번째 턴 / 버스트·판 엎기 발생 여부 / 이번 라운드 스탠드 횟수 |
| `S8` | 적 상태 | **[보류]** 적/보스(#5, #11) 미설계 — 생성 금지 |

> 에이스는 가치가 없으므로 "자기 가치 참조"는 죽은 조건. 대신 자기/적재 **무게** 참조(S4)가 열려 있다.

### 8. 효과축 E (무엇을)

| 코드 | 효과군 | 내용 | 제한 |
|------|--------|------|------|
| `E1` | 가치 가산 | 카드/핸드 가치 +Vp (**음수화 −Vp 포함** — `NEGATIVE` 소재) | 기본 효과군 |
| `E2` | 가치 배수 | 한 핸드의 가치 ×k | 양 핸드 동시 배수 금지 (F1) |
| `E3` | 무게 조작 | 카드 무게 ±Wp / 이전 / 무게↔가치 교환 | |
| `E4` | 무게 한계 변경 | 핸드 한계(기본 21) ±Wp | 무상한 영구 성장 금지 (F9) |
| `E5` | 황금 칩 부여 | 조건 달성 시 칩 +n (칩은 스탠드 시 리셋 — Q11) | 1턴 내 발동 유한 보장 (F8) |
| `E6` | 칩 배수 변경 | 기본 ×1.5 → ×k | 극소수·비중첩·성장 결합 금지 (F2) |
| `E7` | 버스트 변형 | 라운드당 1회 완화 / 생존 슬롯 변경 / 버스트 시 보상 (`WRECK` 핵심) | 상시 면역 금지 (F5) |
| `E8` | 드로우·정보 | 덱 맨 위 n장 확인 / 다음 드로우 예지 (`COUNT` 핵심) | 드로우는 무작위 — 정보까지만 |
| `E9` | 홀 카드 경제 | 홀 슬롯 +n / 재사용 / 사용 시 보너스 | |
| `E10` | 판 엎기 경제 | 횟수 +n / 페널티 완화 / 사용 시 보너스 | 페널티 완전 제거 = 룰브레이커 전용 |
| `E11` | 금화 | 획득 / 조건부 이자 / 자원 변환 | |
| `E12` | 생존·방어 | HP 회복 / **받는 피해 경감 / 방어도 부여** (Q16 확정 — 그림·홀 카드에도 적용될 방향, 세부 Q18) | |
| `E13` | 그림 상호작용 | 그림 효과 재발동·복사·강화 | 에이스 재발동 루프 금지 (F7) |
| `E14` | 일시 카드 변형 | 전투 덱 한정 가치·무게·그림 임시 부여 | 일시/영구 구분(2-3-1) 준수 |
| `E15` | 에이스 상호작용 | 인접·하위 강화 / 포식 / 자기파괴 | 루프 금지 (F7). **귀속 에이스는 포식 불가** (Q10) |
| `E16` | 적 상호작용 | **[보류]** 적 시스템 미설계 — 생성 금지 | |
| `E17` | 직접 데미지 | 스탠드 외 적 HP 직접 타격. **과잉량 소멸·과잉 보상 없음** (Q13) | 독립 채널(§9). 수치는 적 HP(#8) 후 |
| `E18` | 메타 효과 | 입력 절제(조작 수 반응) / 실제 시간 / UI 행동 / 런 통계 | **Signature 전용·극소수** (F14) |

### 9. 데미지 파이프라인 v2 — **확정 (사용자, 2026-06-11)**

**발동층** (GDD 2-5-1 / 2-6): 레드 좌→우 → 블루 좌→우 → 에이스 위→아래. 조건 충족 시만. 각 효과는 적용 단계(D#)를 스키마에 명시.

**적용층** (스탠드 데미지 계산):

| 단계 | 내용 | 효과군 |
|------|------|--------|
| `D0` | **유효 카드 확정** — 버스트 핸드는 3번 슬롯만 (히트 시점 판정·턴 내 미복구, GDD 2-5-2) | — |
| `D1` | 카드 단위 수정 (가치·무게) | E1(카드)·E3·E14 |
| `D2` | 핸드 가치 합산 (유효·앞면 카드만) | — |
| `D3` | 핸드 단위 가산 | E1(핸드) |
| `D4` | 핸드 단위 배수 (핸드별 독립, 동종 다중 = 곱) | E2 |
| `D5` | **부호 판정 (확정, Q12)**: 레드×블루 곱이 **음수**(한쪽만 음수) → 기본 데미지 **0**. **둘 다 음수 → 곱은 양수로 정상 인정** | — |
| `D6` | **황금 칩 확정 (확정, Q11)**: 기본 조건 판정 + 효과 칩(E5) 가산. **버스트 핸드는 만석 칩 절대 불인정**, **유효 무게 = 한계치면 최대 무게 칩 인정**(예: 한계 21에 무게 21 카드가 3번 슬롯). **칩은 스탠드 시 리셋**(해당 스탠드 계산에만 사용) | E5 |
| `D7` | 칩 배수 결정 (기본 1.5, E6은 대체·비중첩) | E6 |
| `D8` | 기본 데미지 = 레드 × 블루 × (배수)^칩 — 중간 반올림 없음 | — |
| `D9` | **소수점 버림** → 적 HP 적용. 0 이하 = 처치, 적 계획 취소 (GDD 2-7) | — |

**별도 채널 2종**:
- **직접 데미지 채널** (E17, 확정): 발동 즉시 적 HP 적용. 핸드 가치·칩 배수와 독립(파이프라인 미경유). 건별 버림. **과잉 처치 잔여량 소멸**. 처치 시 즉시 라운드 승리.
- **피격 파이프라인** (뼈대 — 적 시스템 미설계): 적 공격력 → 판 엎기 페널티 ×2 (라운드 지속) → **받는 피해 경감 → 방어도 차감** (Q16 방향, 세부 Q18) → 플레이어 HP.

### 10. 성장축 G (시간에 따라)

| 코드 | 패턴 | 비고 |
|------|------|------|
| `G0` | 고정 | 기본 |
| `G1` | 라운드 내 누적 | 라운드 종료 시 리셋 |
| `G2` | 런 누적 (영구 성장) | **선형 가산만** (F3). **적용 조건 필수** (F12) — 보통 `M3`와 결합 |
| `G3` | 소모·차지 | n회 후 약화/자기파괴 (`DEVOUR` 소재) |
| `G4` | 조건 토글 | 조건 만족 동안만 |

### 11. 수치축 (파라미터)

| 기호 | 의미 | 앵커 시점 |
|------|------|----------|
| `Vp` | 가치 변동 기준 단위 | 플레잉 풀(#2) 확정 후 |
| `Wp` | 무게 변동 기준 단위 | 동일 |
| `CE` | 칩 등가 — 칩 1개 = ×1.5 = CE 1.0 | 지금 사용 가능 (확정 앵커) |
| 희귀도 | common / rare / epic / legendary | 확률 = 여정(#6) 확정 → 런당 기대 등장량 계산 후 책정 |

CE 상한·P2 보정·군 MP 예산 = §3-1.

### 12. 생성 문법 (조합 규칙)

```
에이스 1개 = [군|무소속] × [구조 P] × [발동 T] × [조건 S 0~2개] × [효과 E 1~2개]
             × [성장 G] × [미션 M] × [아키타입 1~2개] × [희귀도] × [무게 1|2] × [귀속 여부]
```

생성 제약:
1. **태그 정합**: 효과가 실제로 그 아키타입의 플레이를 강화해야 한다.
2. **텍스트 상한**: 한국어·영어 모두 2문장 이내.
3. **발동·적용 명시**: 발동층에서 결정적 + 적용 단계(D#) 명시.
4. **조건 수 상한**: S 최대 2개.
5. **중복 금지**: T·S·E 3축 동일 항목 금지.
6. **P1/P2 페어 권장**: 같은 컨셉의 쌍으로 풀 확장.
7. **무게 2 에이스**: 희귀도 제한 없음 (Q14 확정). CE 상한 = 동급 ×2.0. 군 설계에 따라 비중 결정 (작지만 강한 군 / 가볍게 섞어 쓰는 군 모두 허용).
8. **귀속(binding)**: 주로 `CONTRACT`·P2·룰브레이커와 결합 — "강하지만 영원히 떼어낼 수 없는" 계약 설계.

### 13. 생성 유형 구성 — 군 단위 배분

**군 1개(3~5장)의 표준 구성** [제안]:

| 역할 | 수 | 유형 |
|------|-----|------|
| Keystone | 1 | 군의 플레이 루프를 성립시키는 중심 (epic~legendary) |
| Coverage | 1~3 | 군 아키타입의 T×E 기본 조합 (P1/P2 페어 포함) |
| Twist / 양념 | 0~2 | 변형 연산자(ⓐ조건 반전 ⓑ리스크 ⓒ지연 ⓓ누적 ⓔ전이 ⓕ대체 비용 ⓖ실패 보상 ⓗ행동 금지 계약) 또는 귀속·자기파괴·포식·미션형 |

**무소속 풀**: Signature(카지노 모티프·'ace' 말장난·메타 효과 E18) + Rule-Breaker(룰 1개 제한적 파괴, legendary 전용, 횟수·비용 명시) + common 범용(CE ≤ 0.75).

### 14. 금지 조합 (Forbidden)

| 코드 | 금지 내용 | 이유 |
|------|----------|------|
| `F1` | 단일 에이스의 양 핸드 동시 가치 배수 | 곱셈 구조라 제곱 강화 |
| `F2` | `E6` 중첩 / 곱연산 | 지수 밑 성장 통제 불능 |
| `F3` | 배수(`E2`/`E6`)의 영구 성장 | 성장은 선형 가산만 |
| `F4` | 적 계획 스킵·무효 (상시) | 비용 설계 훼손. 룰브레이커 1회성만 |
| `F5` | 상시 버스트 면역 | 무게 시스템 무력화 |
| `F6` | 턴 포기 없는 덱 보충 | 덱 압축 견제 훼손 |
| `F7` | 에이스 → 에이스 발동 재귀 루프 | `E13`·`E15` 금지 |
| `F8` | 1턴 내 무한 칩 루프 | 칩 상한 없음 → 유한 보장 필수 |
| `F9` | 무게 한계 무상한 영구 성장 | 21 기준점 붕괴 |
| `F10` | 미설계 시스템 의존 (위치 교환 홀카드·타로·적 패턴·시작 덱) | `status: blocked`로만 기록 |
| `F11` | 칩 기본 획득 조건의 무조건 자동 달성 | 핵심 퍼즐 파괴. 룰브레이커 전용 |
| `F12` | 적용 조건 없는 영구 성장 | 사용자 철칙 (§6 M3) |
| `F13` | 교차 군 명시 시너지 / 군 MP 예산 초과 | '정해' 방지 + 로테이션·해금 보호 |
| `F14` | 메타 효과(`E18`)의 Signature 외 생성·다수 생성 | 희소성 보호, 접근성 리스크 |
| `F15` | 귀속 에이스의 제거를 전제·우회하는 효과 | 귀속 = 전면 면역 (Q10 확정) |

### 15. 데이터 스키마 v3 (Codex 항목 작성 포맷)

`Card` Resource(`kind: ACE`)와 정합. **`value` = 0 고정(미사용)**, `weight` = 1 또는 2.

```yaml
- id: ace_<slug>
  name_ko: ""               # 의미·분위기 우선
  name_en: ""               # 'ace' 말장난 권장 (§16)
  rarity: common|rare|epic|legendary
  weight: 1                 # 1 기본 | 2 특수 (희귀도 제한 없음, CE 상한 동급 ×2.0)
  binding: false            # true = 모든 제거 수단 면역 (방출·소각·포식)
  group: <group_id>|none    # 군 (none = 무소속). 군은 해금 단위
  gen_type: coverage|twist|signature|keystone|rulebreaker
  structure: P1|P2
  archetypes: [EXACT]       # 1~2개 (§2의 25종)
  trigger: T0
  conditions: [S1]          # 0~2개
  effects:
    - family: E1
      stage: D3             # 적용 단계 (§9) — 필수
      params: { amount: Vp }
  scaling: G0
  mission:                  # M0이면 생략. 미션은 이 에이스 적재 중에만 진행·발현
    type: M1|M2|M3
    condition: ""
    duration: run|round|turns_n
    growth_apply: ""        # M3 필수 (F12)
  twist_ops: []
  chip_equiv: 1.0           # 이상 상태 CE (§3-1 상한 준수)
  text_ko: ""               # 2문장 이내
  text_en: ""
  status: proposed          # proposed | approved | blocked
  blocked_on: ""
```

### 16. 네이밍 규칙 (Codex용)

- **영문명 'ace' 말장난 우선**: Space, Race, Place, Palace, Grace, Face, Trace, Brace, Lace, Embrace, Surface, Necklace, Menace, Furnace… 또는 "Ace of ___".
- 한국어명은 의미·분위기 우선 (현지화 키 분리, #12).
- 카지노·블랙잭 용어(딜러, 베팅, 인슈어런스, 더블다운, 스플릿, 카운팅, 페어)는 Signature·`PAIR`·`COUNT` 소재 풀.

### 17. 평가 루브릭 (Fable 2차 검수)

| # | 기준 | 불합격 조건 |
|---|------|------------|
| 1 | 룰 정합 | GDD 확정 룰(§2-1-1, 파이프라인 v2 포함)과 충돌 |
| 2 | 발동·적용 명확성 | T 매핑 불가 / D# 누락 / 비결정적 |
| 3 | 아키타입 기여 | 태그가 플레이 변화를 만들지 못함 |
| 4 | 텍스트 | 한/영 2문장 초과, 현지화 불가 |
| 5 | 금지 조합 | F1~F15 위반 |
| 6 | 중복 | T·S·E 3축 동일 |
| 7 | 데드 조건 | 도달 불가·무의미 (예: 에이스 가치 참조, 버스트 핸드 만석 칩) |
| 8 | CE·MP | chip_equiv 누락 / 상한 초과 / 군 MP 예산 초과 |
| 9 | 성장·미션 철칙 | F12 위반 / 미션 비귀속 설계 |

2차 검수 추가: 아키타입·군별 분포 균형(25종 공백 점검), P1/P2 비율, 죽은 효과군, Twist 편중, Signature 독창성, 군별 MP 계산표 갱신, **해금 트리 배치 적합성**(#9 연동).

---

## 미해결 질문 (사용자 확정 필요 — v3)

> Q1~Q16은 사용자 답변으로 전부 해소 (v2~v3 반영).

| # | 질문 | 영향 |
|---|------|------|
| Q17 | **런당 등장 군 수** — 총 카드 수 + 여정을 통한 에이스 노출량 확정 후 결정 (사용자: "아직 조심스러움") | 로테이션 |
| Q18 | **방어도 세부 규칙** — 지속(턴/라운드/소모), 피해 경감과의 구분, 에이스·그림·홀 카드별 적용 형태 | E12, 피격 파이프라인, #2·#4 풀 |
| Q19 | **부활형 적** 도입 여부 (구상 중) — `STRIKE`·과잉 처치 규칙과 상호작용 | #5 적 설계 |
| Q20 | **음수 가치 공급원** — `NEGATIVE` 아키타입 성립을 위해 플레잉 풀(#2)에 음수 가치 카드(또는 음수화 효과)가 필요 | #2 플레잉 풀 |
| Q21 | **군 해금 트리** — 해금 조건·순서 (스팀 메타 진행 #9에서 설계) | #9 |

---

## 항목

> **Codex 영역.** 문법 v3 = ✅ approved (2026-06-11) → **작성 가능.** 태스크: `docs/tasks/pending/TASK-003-ace-list-batch1.md`.
> §15 스키마 준수, §13 배분·§14 금지 조합·§3-1 CE/MP 예산 준수.
> 군별로 항목을 묶고, 군마다 MP 계산표(최적 적재 CE 합)를 함께 기록한다.
> 파일이 비대해지면 `docs/design/aces_items.md`로 분리하고 여기서 링크한다.

### batch1_group_soft_balance — 연착 균형군 (`LIGHT`)

정확한 최대 무게를 요구하지 않고, 버스트하지 않은 낮은 쪽 핸드를 보정해 스탠드 품질을 올린다. 군 내부는 "가벼운 히트 → 낮은 핸드 보정 → 균형 스탠드 칩"으로 이어진다.

**MP 계산표**

| 최적 적재 | 총 무게 | CE 합 | 예산 판정 |
|---|---:|---:|---|
| `ace_soft_space` + `ace_lower_ace` + `ace_even_ace` + `ace_cushion_ace` | 4 | 4.0 | 안정형 예산(5.0~5.5) 이하 |

```yaml
- id: ace_soft_space
  name_ko: "부드러운 틈"
  name_en: "Soft Space Ace"
  rarity: common
  weight: 1
  binding: false
  group: batch1_group_soft_balance
  gen_type: coverage
  structure: P1
  archetypes: [LIGHT]
  trigger: T1
  conditions: [S1]
  effects:
    - family: E3
      stage: D1
      params: { target: "hit_card_in_non_bust_hand", weight_delta: "-Wp", duration: "this_turn", when: "hand_is_below_pressure_band" }
  scaling: G4
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: [early_hit_smoothing]
  chip_equiv: 0.5
  text_ko: "아직 압박 구간 아래인 핸드에 히트한 카드는 이번 턴 동안 무게 -Wp."
  text_en: "A card hit into a hand below the pressure band gets -Wp weight for this turn."
  status: proposed
  blocked_on: ""

- id: ace_lower_ace
  name_ko: "낮은 쪽의 에이스"
  name_en: "Lower Ace"
  rarity: rare
  weight: 1
  binding: false
  group: batch1_group_soft_balance
  gen_type: coverage
  structure: P1
  archetypes: [LIGHT, TWIN]
  trigger: T2
  conditions: [S1]
  effects:
    - family: E1
      stage: D3
      params: { target: "lower_value_non_bust_hand", amount: "+Vp" }
  scaling: G0
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: [lower_hand_support]
  chip_equiv: 1.0
  text_ko: "스탠드 시 버스트하지 않은 낮은 가치 핸드 하나에 가치 +Vp."
  text_en: "On stand, the lower-value non-busted hand gets +Vp."
  status: proposed
  blocked_on: ""

- id: ace_even_ace
  name_ko: "고른 에이스"
  name_en: "Even Ace"
  rarity: epic
  weight: 1
  binding: false
  group: batch1_group_soft_balance
  gen_type: keystone
  structure: P1
  archetypes: [LIGHT, TWIN]
  trigger: T2
  conditions: [S1, S4]
  effects:
    - family: E1
      stage: D3
      params: { target: "both_non_bust_hands", amount: "+Vp", when: "hand_values_are_close_and_same_group_pair_loaded" }
  scaling: G4
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: [same_group_balance_payoff]
  chip_equiv: 1.5
  text_ko: "같은 군 에이스가 복수이고 양 핸드 가치가 가까우면, 두 핸드에 각각 가치 +Vp."
  text_en: "If multiple aces from this group are loaded and the hand values are close, both hands get +Vp."
  status: proposed
  blocked_on: ""

- id: ace_cushion_ace
  name_ko: "완충 에이스"
  name_en: "Cushion Ace"
  rarity: rare
  weight: 1
  binding: false
  group: batch1_group_soft_balance
  gen_type: twist
  structure: P2
  archetypes: [LIGHT]
  trigger: T2
  conditions: [S1, S4]
  effects:
    - family: E5
      stage: D6
      params: { chip_delta: 1, when: "both_hands_non_bust_and_same_group_core_loaded" }
  scaling: G0
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: [group_load_chip]
  chip_equiv: 1.0
  text_ko: "같은 군 에이스가 여러 장이고 양 핸드가 모두 버스트하지 않았다면 칩 +1."
  text_en: "If several aces from this group are loaded and neither hand is busted, gain +1 chip."
  status: proposed
  blocked_on: ""
```

### batch1_group_twin_ledger — 쌍장부군 (`TWIN`)

레드와 블루의 곱셈 구조를 직접 보완한다. 한쪽만 키우지 않고 낮은 핸드, 높은 핸드, 균형 상태가 서로 다른 보상을 만든다.

**MP 계산표**

| 최적 적재 | 총 무게 | CE 합 | 예산 판정 |
|---|---:|---:|---|
| `ace_red_blue_ace` + `ace_short_side_ace` + `ace_matching_ace` + `ace_double_entry_ace` | 4 | 4.5 | 안정형 예산(5.0~5.5) 이하 |

```yaml
- id: ace_red_blue_ace
  name_ko: "적청 에이스"
  name_en: "Red Blue Ace"
  rarity: common
  weight: 1
  binding: false
  group: batch1_group_twin_ledger
  gen_type: coverage
  structure: P1
  archetypes: [TWIN]
  trigger: T2
  conditions: []
  effects:
    - family: E1
      stage: D3
      params: { target: "lower_value_hand", amount: "+Vp" }
  scaling: G0
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: [low_side_baseline]
  chip_equiv: 0.5
  text_ko: "스탠드 시 더 낮은 가치의 핸드 하나에 가치 +Vp."
  text_en: "On stand, the lower-value hand gets +Vp."
  status: proposed
  blocked_on: ""

- id: ace_short_side_ace
  name_ko: "짧은 쪽 에이스"
  name_en: "Short Side Ace"
  rarity: rare
  weight: 1
  binding: false
  group: batch1_group_twin_ledger
  gen_type: coverage
  structure: P1
  archetypes: [TWIN]
  trigger: T1
  conditions: [S1]
  effects:
    - family: E1
      stage: D1
      params: { target: "hit_card_in_currently_lower_value_hand", amount: "+Vp", duration: "this_turn" }
  scaling: G4
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: [hit_low_side]
  chip_equiv: 1.0
  text_ko: "현재 더 낮은 가치의 핸드에 히트한 카드는 이번 턴 동안 가치 +Vp."
  text_en: "A card hit into the currently lower-value hand gets +Vp value for this turn."
  status: proposed
  blocked_on: ""

- id: ace_matching_ace
  name_ko: "맞물림 에이스"
  name_en: "Matching Ace"
  rarity: epic
  weight: 1
  binding: false
  group: batch1_group_twin_ledger
  gen_type: keystone
  structure: P1
  archetypes: [TWIN]
  trigger: T2
  conditions: [S1, S4]
  effects:
    - family: E2
      stage: D4
      params: { target: "lower_value_hand_only", multiplier: "CE_scaled", when: "hand_values_are_close_and_same_group_pair_loaded" }
  scaling: G0
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: [single_hand_multiplier_after_balance]
  chip_equiv: 1.5
  text_ko: "같은 군 에이스가 복수이고 양 핸드 가치가 가까우면, 더 낮은 가치 핸드 하나에만 CE 기준 배수를 적용한다."
  text_en: "If multiple aces from this group are loaded and the hand values are close, apply a CE-scaled multiplier only to the lower-value hand."
  status: proposed
  blocked_on: ""

- id: ace_double_entry_ace
  name_ko: "복식장부 에이스"
  name_en: "Double Entry Ace"
  rarity: rare
  weight: 1
  binding: false
  group: batch1_group_twin_ledger
  gen_type: twist
  structure: P2
  archetypes: [TWIN, CHIP]
  trigger: T2
  conditions: [S1, S4]
  effects:
    - family: E5
      stage: D6
      params: { chip_delta: 1, when: "lower_hand_was_modified_by_this_group_this_stand" }
  scaling: G0
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: [reward_completed_balance]
  chip_equiv: 1.5
  text_ko: "이번 스탠드에서 이 군이 낮은 핸드를 보정했다면 칩 +1."
  text_en: "If this group corrected the lower hand during this stand, gain +1 chip."
  status: proposed
  blocked_on: ""
```

### batch1_group_count_pulse — 카운트 맥박군 (`COUNT`)

덱 정보를 이용해 안전한 히트와 균형 스탠드를 만든다. 정보만으로 끝나지 않고 낮은 핸드 보정과 칩 보상으로 연결된다.

**MP 계산표**

| 최적 적재 | 총 무게 | CE 합 | 예산 판정 |
|---|---:|---:|---|
| `ace_peek_ace` + `ace_next_ace` + `ace_pulse_ace` + `ace_counting_ace` | 4 | 4.0 | 안정형 예산(5.0~5.5) 이하 |

```yaml
- id: ace_peek_ace
  name_ko: "엿보기 에이스"
  name_en: "Peek Ace"
  rarity: common
  weight: 1
  binding: false
  group: batch1_group_count_pulse
  gen_type: coverage
  structure: P1
  archetypes: [COUNT]
  trigger: T5
  conditions: [S6]
  effects:
    - family: E8
      stage: D0
      params: { reveal: "top_draw_hint", scope: "information_only" }
  scaling: G0
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: [low_cost_information]
  chip_equiv: 0.5
  text_ko: "턴 시작 시 다음 드로우의 정보를 일부 확인한다."
  text_en: "At turn start, reveal partial information about the next draw."
  status: proposed
  blocked_on: ""

- id: ace_next_ace
  name_ko: "다음 수 에이스"
  name_en: "Next Ace"
  rarity: rare
  weight: 1
  binding: false
  group: batch1_group_count_pulse
  gen_type: coverage
  structure: P1
  archetypes: [COUNT, LIGHT]
  trigger: T1
  conditions: [S6]
  effects:
    - family: E3
      stage: D1
      params: { target: "hit_card", weight_delta: "-Wp", duration: "this_turn", when: "revealed_draw_would_keep_hand_non_bust" }
  scaling: G4
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: [information_to_safety]
  chip_equiv: 1.0
  text_ko: "확인한 드로우가 히트할 핸드를 버스트시키지 않는다면, 그 카드 무게 -Wp."
  text_en: "If the revealed draw would keep the hit hand from busting, that card gets -Wp weight."
  status: proposed
  blocked_on: ""

- id: ace_pulse_ace
  name_ko: "맥박 에이스"
  name_en: "Pulse Ace"
  rarity: epic
  weight: 1
  binding: false
  group: batch1_group_count_pulse
  gen_type: keystone
  structure: P1
  archetypes: [COUNT, TWIN]
  trigger: T2
  conditions: [S6, S4]
  effects:
    - family: E1
      stage: D3
      params: { target: "lower_value_hand", amount: "+Vp_per_safe_counted_hit", cap: "same_group_ce_budget" }
  scaling: G1
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: [counted_hits_feed_lower_hand]
  chip_equiv: 1.5
  text_ko: "이번 라운드에 정보를 보고 안전하게 히트한 횟수만큼, 스탠드 시 낮은 핸드에 가치 +Vp."
  text_en: "On stand, the lower hand gets +Vp for each safe hit made with revealed information this round."
  status: proposed
  blocked_on: ""

- id: ace_counting_ace
  name_ko: "카운팅 에이스"
  name_en: "Counting Ace"
  rarity: rare
  weight: 1
  binding: false
  group: batch1_group_count_pulse
  gen_type: twist
  structure: P2
  archetypes: [COUNT, CHIP]
  trigger: T2
  conditions: [S4, S7]
  effects:
    - family: E5
      stage: D6
      params: { chip_delta: 1, when: "stood_after_counted_safe_hits_and_same_group_pair_loaded" }
  scaling: G0
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: [information_to_chip]
  chip_equiv: 1.0
  text_ko: "같은 군 에이스가 복수이고 정보를 보고 안전하게 히트한 뒤 스탠드했다면 칩 +1."
  text_en: "If multiple aces from this group are loaded and you stand after safe hits guided by information, gain +1 chip."
  status: proposed
  blocked_on: ""
```

### batch1_group_flip_recover — 판 회복군 (`FLIP`)

판 엎기 후 무리하게 최대 무게를 노리는 대신, 다음 스탠드를 균형 잡힌 회복 턴으로 만든다. 피해/방어도 세부 규칙에는 의존하지 않는다.

**MP 계산표**

| 최적 적재 | 총 무게 | CE 합 | 예산 판정 |
|---|---:|---:|---|
| `ace_reset_ace` + `ace_rebound_ace` + `ace_second_table_ace` + `ace_comeback_ace` | 4 | 4.5 | 안정형 예산(5.0~5.5) 이하 |

```yaml
- id: ace_reset_ace
  name_ko: "초기화 에이스"
  name_en: "Reset Ace"
  rarity: common
  weight: 1
  binding: false
  group: batch1_group_flip_recover
  gen_type: coverage
  structure: P1
  archetypes: [FLIP]
  trigger: T10
  conditions: []
  effects:
    - family: E1
      stage: D3
      params: { target: "lower_value_hand_on_next_stand", amount: "+Vp", duration: "next_stand_this_round" }
  scaling: G3
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: [flip_recovery_bank]
  chip_equiv: 0.5
  text_ko: "판 엎기 후 이번 라운드 다음 스탠드에서 낮은 핸드 가치 +Vp."
  text_en: "After table flip, the lower hand gets +Vp on your next stand this round."
  status: proposed
  blocked_on: ""

- id: ace_rebound_ace
  name_ko: "반동 에이스"
  name_en: "Rebound Ace"
  rarity: rare
  weight: 1
  binding: false
  group: batch1_group_flip_recover
  gen_type: coverage
  structure: P2
  archetypes: [FLIP, TWIN]
  trigger: T2
  conditions: [S7]
  effects:
    - family: E1
      stage: D3
      params: { target: "both_hands", amount: "+Vp", when: "stand_after_table_flip_and_both_hands_non_bust" }
  scaling: G0
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: [flip_non_bust_pair]
  chip_equiv: 1.0
  text_ko: "판 엎기 후 양 핸드가 모두 버스트하지 않고 스탠드하면 두 핸드에 가치 +Vp."
  text_en: "After table flip, if both hands stand without busting, both hands get +Vp."
  status: proposed
  blocked_on: ""

- id: ace_second_table_ace
  name_ko: "두 번째 판 에이스"
  name_en: "Second Table Ace"
  rarity: epic
  weight: 1
  binding: false
  group: batch1_group_flip_recover
  gen_type: keystone
  structure: P2
  archetypes: [FLIP]
  trigger: T10
  conditions: [S4]
  effects:
    - family: E10
      stage: D0
      params: { table_flip_uses_delta: 1, timing: "round_start", penalty_rule: "unchanged", when: "same_group_pair_loaded" }
    - family: E1
      stage: D3
      params: { target: "lower_value_hand_on_next_stand", amount: "+Vp" }
  scaling: G0
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: [group_unlocked_extra_flip]
  chip_equiv: 1.5
  text_ko: "같은 군 에이스가 복수이면 라운드마다 판 엎기 횟수 +1. 판 엎기 후 다음 스탠드에서 낮은 핸드 가치 +Vp."
  text_en: "If multiple aces from this group are loaded, gain +1 table flip each round. After table flip, the lower hand gets +Vp on your next stand."
  status: proposed
  blocked_on: ""

- id: ace_comeback_ace
  name_ko: "역전 에이스"
  name_en: "Comeback Ace"
  rarity: rare
  weight: 1
  binding: false
  group: batch1_group_flip_recover
  gen_type: twist
  structure: P2
  archetypes: [FLIP, CHIP]
  trigger: T2
  conditions: [S7, S4]
  effects:
    - family: E5
      stage: D6
      params: { chip_delta: 1, when: "stand_after_table_flip_with_close_hand_values" }
  scaling: G0
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: [flip_to_balanced_chip]
  chip_equiv: 1.5
  text_ko: "판 엎기 후 양 핸드 가치가 가까운 상태로 스탠드하면 칩 +1."
  text_en: "After table flip, if you stand with close hand values, gain +1 chip."
  status: proposed
  blocked_on: ""
```

### batch1_group_order_duet — 서열 이중주군 (`ORDER`)

에이스 적재 위치가 역할을 나누며, 위쪽은 낮은 핸드 보정, 아래쪽은 칩/마무리 보상으로 작동한다. 같은 군만 참조한다.

**MP 계산표**

| 최적 적재 | 총 무게 | CE 합 | 예산 판정 |
|---|---:|---:|---|
| `ace_top_ace` + `ace_bottom_ace` + `ace_middle_ace` + `ace_duet_ace` | 4 | 4.5 | 안정형 예산(5.0~5.5) 이하 |

```yaml
- id: ace_top_ace
  name_ko: "윗줄 에이스"
  name_en: "Top Ace"
  rarity: common
  weight: 1
  binding: false
  group: batch1_group_order_duet
  gen_type: coverage
  structure: P1
  archetypes: [ORDER]
  trigger: T2
  conditions: [S4]
  effects:
    - family: E1
      stage: D3
      params: { target: "lower_value_hand", amount: "+Vp", when: "this_ace_is_topmost_loaded_ace" }
  scaling: G0
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: [top_supports_lower_hand]
  chip_equiv: 0.5
  text_ko: "이 에이스가 맨 위라면, 스탠드 시 낮은 핸드 가치 +Vp."
  text_en: "If this ace is topmost, the lower hand gets +Vp on stand."
  status: proposed
  blocked_on: ""

- id: ace_bottom_ace
  name_ko: "아랫줄 에이스"
  name_en: "Bottom Ace"
  rarity: rare
  weight: 1
  binding: false
  group: batch1_group_order_duet
  gen_type: coverage
  structure: P1
  archetypes: [ORDER, CHIP]
  trigger: T2
  conditions: [S4]
  effects:
    - family: E5
      stage: D6
      params: { chip_delta: 1, when: "this_ace_is_bottommost_and_lower_hand_was_modified" }
  scaling: G0
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: [bottom_cashout]
  chip_equiv: 1.0
  text_ko: "이 에이스가 맨 아래이고 이번 스탠드에서 낮은 핸드가 보정됐다면 칩 +1."
  text_en: "If this ace is bottommost and the lower hand was corrected this stand, gain +1 chip."
  status: proposed
  blocked_on: ""

- id: ace_middle_ace
  name_ko: "가운데 에이스"
  name_en: "Middle Ace"
  rarity: rare
  weight: 1
  binding: false
  group: batch1_group_order_duet
  gen_type: twist
  structure: P1
  archetypes: [ORDER, TWIN]
  trigger: T2
  conditions: [S4]
  effects:
    - family: E1
      stage: D3
      params: { target: "higher_value_hand", amount: "+Vp", when: "adjacent_to_same_group_ace_and_lower_hand_was_modified" }
  scaling: G4
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: [adjacent_pair_complement]
  chip_equiv: 1.0
  text_ko: "같은 군 에이스와 인접하고 낮은 핸드가 보정됐다면, 높은 핸드에도 가치 +Vp."
  text_en: "If adjacent to an ace from this group and the lower hand was corrected, the higher hand also gets +Vp."
  status: proposed
  blocked_on: ""

- id: ace_duet_ace
  name_ko: "이중주 에이스"
  name_en: "Duet Ace"
  rarity: epic
  weight: 1
  binding: false
  group: batch1_group_order_duet
  gen_type: keystone
  structure: P1
  archetypes: [ORDER, TWIN]
  trigger: T2
  conditions: [S4]
  effects:
    - family: E2
      stage: D4
      params: { target: "lower_value_hand_only", multiplier: "CE_scaled", when: "same_group_top_and_bottom_loaded" }
  scaling: G0
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: [top_bottom_group_frame]
  chip_equiv: 2.0
  text_ko: "같은 군 에이스가 맨 위와 맨 아래를 잡고 있다면, 낮은 핸드 하나에만 CE 기준 배수를 적용한다."
  text_en: "If aces from this group hold the top and bottom positions, apply a CE-scaled multiplier only to the lower hand."
  status: proposed
  blocked_on: ""
```

### 무소속 common 에이스 (`group: none`)

항상 등장 가능한 낮은 CE 범용 풀이다. 모두 아키타입 태그를 가지며, CE는 0.75 이하로 제한한다.

```yaml
- id: ace_small_space
  name_ko: "작은 틈"
  name_en: "Small Space Ace"
  rarity: common
  weight: 1
  binding: false
  group: none
  gen_type: coverage
  structure: P1
  archetypes: [LIGHT]
  trigger: T2
  conditions: [S1]
  effects:
    - family: E1
      stage: D3
      params: { target: "lower_value_non_bust_hand", amount: "+Vp" }
  scaling: G0
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: []
  chip_equiv: 0.5
  text_ko: "버스트하지 않은 낮은 핸드 하나는 스탠드 시 가치 +Vp."
  text_en: "One non-busted lower hand gets +Vp on stand."
  status: proposed
  blocked_on: ""

- id: ace_pair_ace
  name_ko: "짝 에이스"
  name_en: "Pair Ace"
  rarity: common
  weight: 1
  binding: false
  group: none
  gen_type: coverage
  structure: P1
  archetypes: [PAIR]
  trigger: T2
  conditions: [S3]
  effects:
    - family: E1
      stage: D3
      params: { target: "hand_with_same_weight_pair", amount: "+Vp" }
  scaling: G0
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: []
  chip_equiv: 0.5
  text_ko: "같은 무게 카드 페어가 있는 핸드는 스탠드 시 가치 +Vp."
  text_en: "A hand with a same-weight pair gets +Vp on stand."
  status: proposed
  blocked_on: ""

- id: ace_cycle_trace
  name_ko: "순환의 흔적"
  name_en: "Cycle Trace Ace"
  rarity: common
  weight: 1
  binding: false
  group: none
  gen_type: coverage
  structure: P1
  archetypes: [CYCLE, COUNT]
  trigger: T11
  conditions: [S6]
  effects:
    - family: E8
      stage: D0
      params: { reveal: "top_draw_after_reshuffle", scope: "information_only" }
  scaling: G0
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: []
  chip_equiv: 0.5
  text_ko: "덱 보충 후 다음 드로우의 맨 위 정보를 확인한다."
  text_en: "After reshuffling, reveal information about the top of the next draw."
  status: proposed
  blocked_on: ""

- id: ace_gold_grace
  name_ko: "금빛 품위"
  name_en: "Gold Grace Ace"
  rarity: common
  weight: 1
  binding: false
  group: none
  gen_type: coverage
  structure: P1
  archetypes: [GOLD, CHIP]
  trigger: T8
  conditions: [S5]
  effects:
    - family: E11
      stage: D0
      params: { reward: "gold", when: "round_won_after_gaining_any_chip" }
  scaling: G0
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: []
  chip_equiv: 0.5
  text_ko: "칩을 얻은 라운드에서 승리하면 금화를 얻는다."
  text_en: "When you win a round in which you gained any chip, gain gold."
  status: proposed
  blocked_on: ""

- id: ace_balance_brace
  name_ko: "균형 버팀목"
  name_en: "Balance Brace Ace"
  rarity: common
  weight: 1
  binding: false
  group: none
  gen_type: coverage
  structure: P1
  archetypes: [TWIN]
  trigger: T2
  conditions: [S1]
  effects:
    - family: E1
      stage: D3
      params: { target: "lower_value_hand", amount: "+Vp", when: "hand_values_are_close" }
  scaling: G0
  mission:
    type: M0
    condition: ""
    duration: ""
    growth_apply: ""
  twist_ops: []
  chip_equiv: 0.5
  text_ko: "양 핸드 가치가 가까우면, 더 낮은 핸드 가치 +Vp."
  text_en: "If the hand values are close, the lower hand gets +Vp."
  status: proposed
  blocked_on: ""
```
## 변경 이력

| 날짜 | 내용 | 작성자 |
|------|------|--------|
| 2026-06-11 | v1: 아키타입 13종, T/S/E/G 축, CE 체계, 유형 5종, 금지 조합, 스키마, Q1~Q8. | Claude Fable 5 |
| 2026-06-11 | v2: Q1~Q8 답변 반영 — 무게 체계, 희귀도 4단계, 군+로테이션+MP, 구조축 P, 미션축 M, E17/E18, 파이프라인 v2, Q9~Q16. | Claude Fable 5 |
| 2026-06-11 | **v3**: Q9~Q16 답변 반영 — 파이프라인 v2 **확정**(D5 부호 판정·D6 칩×버스트·칩 스탠드 리셋), 군 3~5장+**군 단위 해금**, 귀속 = 전면 면역(F15), 무게 2 희귀도 제한 해제(CE 동급 ×2.0), 직접 데미지 과잉 소멸, 미션 = 에이스 귀속, 방어도 방향(E12 확장). **아키타입 13→25종 확장**: `WRECK`·`NEGATIVE`·`GUARD`·`STRIKE`·`CONTRACT`·`DEVOUR`·`COUNT`·`PLAIN`·`PAIR`·`PARITY`·`SLOW`·`WANDER` 신설. 규모 추정(군 25~50개, 에이스 75~250장). 새 질문 Q17~Q21. | Claude Fable 5 |

