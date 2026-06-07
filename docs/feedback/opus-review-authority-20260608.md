# Feedback: Opus Review Authority - 2026-06-08

## Type
[ ] Spec ambiguity   [ ] Suspected design error   [ ] Conflicting requirement
[ ] Godot/runtime error   [ ] Proposed change   [x] Other

## Context
- Task: project collaboration rules
- Spec: AGENT.md, docs/AGENT_COLLABORATION.md
- Branch: feature/card-deck
- Files/lines: AGENT.md role/workflow section; docs/AGENT_COLLABORATION.md agent definitions/review protocol

## What's blocking / unclear
The user explicitly instructed Codex to change the collaboration rules so Claude Opus has code review authority as well as design/spec authority. The user then expanded that instruction: Sonnet's project participation authority should be transferred to Opus across the whole project.

## Evidence (errors, conflicting lines, repro)
User instruction on 2026-06-08:

```text
리뷰어를 sonnet에게 맡기는 것은 굉장히 불안정한 것 같아. opus에게 코드 리뷰 권한도 opus에게 준다고 수정하고, 이는 내가 지시했다는 것도 그에게 꼭 보고할 수 있도록 해.
```

Additional user instruction on 2026-06-08:

```text
claude.md도 수정해도 돼. 그리고 그걸 피드백 채널에 남겨. 나의 지시로 수정했다고. 이 프로젝트 전체에 sonnet의 참여 권한을 opus로 넘겨. 그리고 그가 확인하고 중복되는 내용이 있으면 그가 스스로 삭제하도록 해.
```

## My question for Opus
Please treat code review approval / changes-requested decisions, infra delegation, merge authorization, and project participation authority as Opus-owned from now on. Sonnet should not act unless Opus or the user explicitly delegates a specific task.

The user also explicitly authorized updating `CLAUDE.md` and asked that this feedback note tell Opus the change was made by user instruction. After Opus confirms the new authority model, Opus may remove duplicate policy text wherever it finds redundant wording.

---
### Resolution (filled by Opus)
- Decision:
- Spec updated: docs/modules/<module>.md section
- Date / by:
