# PM 작업지시서 — frontend 세션

> 발행: PM · 2026-06-02 · 트랙 A (모바일 계약 정렬)

## 배경

통합 1순위(트랙 A)는 **백엔드가 모바일 계약에 맞추는** 작업입니다. 모바일은 이미 해당 화면/호출이 구현돼 있으므로, 이 트랙에서 프론트 신규 구현은 없습니다. 대신 검증과 대기, 그리고 독립 병행 작업만 진행하세요.

## 작업 항목

### 1) 계약 자기검증 (필수, 즉시)
아래 호출이 실제 코드와 일치하는지 재확인하고, 어긋나면 PM에 보고:
- `POST /auth/register` — `consent_data_storage`, `date_of_birth` 전송 여부
- `GET/PATCH /users/me` — `guardians[]`, `session_count`, `consent_data_storage` 파싱
- `POST/PATCH/DELETE /users/me/guardians[/{id}]`
- `DELETE /sessions/{id}`
- `POST /sessions/{id}/notify-guardians` — 응답 `{notifications:[{guardian_name,phone,status}]}`
- 모든 필드 **snake_case**, base prefix **`/api/v1`** 확인

### 2) E2E 수동 검증 (백엔드 완료 후)
백엔드 준비되면 `--dart-define=BACKEND_URL=...` 지정해 다음 플로우 점검:
회원가입(동의 체크) → 프로필 조회 → 가디언 추가/수정/삭제 → 세션 삭제 → (응급 시) 가디언 알림

### 3) 병행 가능 작업 (트랙 A와 독립, 여유 시에만 / 착수 전 PM에 보고)
- **FR-006**: 상담 화면 진입 시 인사말 **자동 TTS 재생** (현재 텍스트만 표시, `ttsText` 미설정)
- **FR-007**: `lib/core/services/voice_flow_controller.dart`가 작성됐으나 **어디서도 사용 안 됨** → 실제 연결해 TTS 종료 후 마이크 자동 활성화

## 완료 기준
- [ ] 계약 자기검증 결과 PM 보고 (일치/불일치 목록)
- [ ] 백엔드 완료 후 E2E 플로우 통과 스크린샷/로그
