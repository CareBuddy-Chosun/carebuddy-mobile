import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../services/emergency_detector.dart';
import '../../../shared/models/auth_models.dart';
import '../../../shared/models/hospital_models.dart';
import '../../../shared/models/notification_models.dart';
import '../../../shared/models/session_models.dart';
import '../../../shared/models/user_models.dart';
import '../auth_repository.dart';
import '../hospital_repository.dart';
import '../session_repository.dart';
import '../user_repository.dart';
import '../voice_repository.dart';

/// In-memory fake backend shared by every mock repository. Holds the demo
/// user, sessions, and messages so the UI behaves like it is talking to a
/// real persistent backend across screens.
class _MockStore {
  _MockStore._();
  static final _MockStore instance = _MockStore._();

  static const String demoUserId = 'mock-user-0001';
  static const String demoAccessToken = 'mock-access-token';
  static const String demoRefreshToken = 'mock-refresh-token';

  UserProfile profile = UserProfile(
    userId: demoUserId,
    email: 'demo@carebuddy.app',
    fullName: '김보호',
    dateOfBirth: '1990-01-01',
    consentDataStorage: true,
    guardians: const [
      Guardian(
        id: 'g-1',
        name: '이가족',
        phone: '010-1234-5678',
        relationship: 'spouse',
      ),
    ],
    createdAt: '2026-01-01T00:00:00Z',
    sessionCount: 2,
  );

  final List<SessionResponse> sessions = [
    SessionResponse(
      id: 'sess-demo-1',
      status: 'completed',
      triageLevel: 'HOME_CARE',
      triageExplanation: '경미한 두통으로 자가관리 권장',
      primarySymptomTag: 'headache',
      summary: '경미한 두통 호소, 휴식 권장',
      startedAt: '2026-05-10T09:00:00Z',
      completedAt: '2026-05-10T09:05:00Z',
      durationSeconds: 300,
      messages: const [
        MessageModel(
          id: 'm-1',
          role: 'assistant',
          content: '안녕하세요! CareBuddy입니다. 어떤 증상이 있으신가요?',
          createdAt: '2026-05-10T09:00:00Z',
        ),
        MessageModel(
          id: 'm-2',
          role: 'user',
          content: '머리가 좀 아파요.',
          createdAt: '2026-05-10T09:01:00Z',
        ),
        MessageModel(
          id: 'm-3',
          role: 'assistant',
          content: '충분히 쉬시고 수분을 섭취해보세요. 증상이 지속되면 병원을 방문하세요. TRIAGE: HOME_CARE',
          createdAt: '2026-05-10T09:02:00Z',
        ),
      ],
    ),
    SessionResponse(
      id: 'sess-demo-2',
      status: 'completed',
      triageLevel: 'VISIT_HOSPITAL',
      triageExplanation: '복통이 지속되어 병원 방문 권장',
      primarySymptomTag: 'abdominal_pain',
      summary: '지속되는 복통, 병원 진료 권장',
      startedAt: '2026-04-22T14:20:00Z',
      completedAt: '2026-04-22T14:28:00Z',
      durationSeconds: 480,
      messages: const [
        MessageModel(
          id: 'm-4',
          role: 'assistant',
          content: '어떤 증상이 있으신가요?',
          createdAt: '2026-04-22T14:20:00Z',
        ),
        MessageModel(
          id: 'm-5',
          role: 'user',
          content: '배가 계속 아픕니다.',
          createdAt: '2026-04-22T14:21:00Z',
        ),
      ],
    ),
  ];

  int _seq = 100;
  String nextId(String prefix) => '$prefix-${_seq++}';
}

/// Tiny rule-based "AI" that lets the consultation UI feel responsive
/// without a backend. The first reply asks a follow-up; the second reply
/// resolves to a triage decision based on keywords.
class _MockChatBrain {
  static ChatResponse reply({
    required String sessionId,
    required SessionResponse session,
    required String userMessage,
  }) {
    final userTurnCount =
        session.messages.where((m) => m.role == 'user').length;

    final emergencyHit = EmergencyDetector.check(userMessage);
    if (emergencyHit.isNotEmpty) {
      return ChatResponse(
        sessionId: sessionId,
        messageId: _MockStore.instance.nextId('msg'),
        reply:
            '말씀하신 증상은 즉시 응급실 진료가 필요합니다. 지금 바로 119에 신고하거나 가까운 응급실로 가세요. TRIAGE: EMERGENCY',
        ttsText: '말씀하신 증상은 즉시 응급실 진료가 필요합니다. 지금 바로 119에 신고하세요.',
        triageResult: TriageResult(
          level: 'EMERGENCY',
          explanation: '응급 키워드가 감지되었습니다.',
          nextSteps: const ['119에 전화', '가까운 응급실로 이동', '보호자에게 알리기'],
          emergencyKeywordsDetected: emergencyHit,
        ),
        isEmergency: true,
        sessionComplete: true,
        timestamp: DateTime.now().toIso8601String(),
      );
    }

    if (userTurnCount <= 1) {
      return ChatResponse(
        sessionId: sessionId,
        messageId: _MockStore.instance.nextId('msg'),
        reply: '말씀해 주셔서 감사합니다. 증상이 시작된 지 얼마나 되었고, 다른 동반 증상은 없는지 알려주실 수 있나요?',
        ttsText: '증상이 시작된 지 얼마나 되었나요? 다른 동반 증상은 없는지 알려주세요.',
        quickReplyOptions: const ['오늘 시작됨', '며칠 됐어요', '일주일 이상'],
        timestamp: DateTime.now().toIso8601String(),
      );
    }

    final lower = userMessage.toLowerCase();
    final visitKeywords = [
      '고열', '열', 'fever',
      '구토', '토',
      '심한', 'severe',
      '며칠', '지속',
      '피', '출혈',
    ];
    final needsVisit = visitKeywords.any(lower.contains);

    if (needsVisit) {
      return ChatResponse(
        sessionId: sessionId,
        messageId: _MockStore.instance.nextId('msg'),
        reply:
            '말씀하신 증상은 가까운 시일 내에 병원 진료를 받아보시는 것이 좋겠습니다. 오늘 중으로 외래 진료를 권장드립니다. TRIAGE: VISIT_HOSPITAL',
        ttsText: '오늘 중으로 가까운 병원에서 진료를 받아보시기를 권장드립니다.',
        triageResult: const TriageResult(
          level: 'VISIT_HOSPITAL',
          explanation: '지속되거나 동반 증상이 있어 의료진의 진료가 필요합니다.',
          nextSteps: ['가까운 외래 병원 검색', '가능한 한 빨리 진료 예약', '증상 일지 기록'],
        ),
        sessionComplete: true,
        timestamp: DateTime.now().toIso8601String(),
      );
    }

    return ChatResponse(
      sessionId: sessionId,
      messageId: _MockStore.instance.nextId('msg'),
      reply:
          '말씀하신 증상은 자가관리가 가능해 보입니다. 충분한 휴식과 수분 섭취를 권장드리며, 24~48시간 내에 호전되지 않으면 병원을 방문하세요. TRIAGE: HOME_CARE',
      ttsText: '충분한 휴식과 수분 섭취를 권장드립니다. 호전되지 않으면 병원을 방문하세요.',
      triageResult: const TriageResult(
        level: 'HOME_CARE',
        explanation: '경미한 증상으로 자가관리가 적절합니다.',
        nextSteps: ['충분한 수분 섭취', '휴식', '증상 악화 시 병원 방문'],
      ),
      sessionComplete: true,
      timestamp: DateTime.now().toIso8601String(),
    );
  }
}

class MockAuthRepository extends AuthRepository {
  MockAuthRepository() : super(Dio());

  @override
  Future<TokenResponse> login({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return const TokenResponse(
      accessToken: _MockStore.demoAccessToken,
      refreshToken: _MockStore.demoRefreshToken,
      userId: _MockStore.demoUserId,
    );
  }

  @override
  Future<TokenResponse> register({
    required String email,
    required String password,
    required String fullName,
    String? dateOfBirth,
    bool consentDataStorage = false,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    _MockStore.instance.profile = _MockStore.instance.profile.copyWith(
      email: email,
      fullName: fullName,
      dateOfBirth: dateOfBirth ?? _MockStore.instance.profile.dateOfBirth,
      consentDataStorage: consentDataStorage,
    );
    return const TokenResponse(
      accessToken: _MockStore.demoAccessToken,
      refreshToken: _MockStore.demoRefreshToken,
      userId: _MockStore.demoUserId,
    );
  }

  @override
  Future<TokenResponse> refresh(String refreshToken) async {
    return const TokenResponse(
      accessToken: _MockStore.demoAccessToken,
      refreshToken: _MockStore.demoRefreshToken,
      userId: _MockStore.demoUserId,
    );
  }

  @override
  Future<void> logout(String refreshToken) async {}
}

class MockSessionRepository extends SessionRepository {
  MockSessionRepository() : super(Dio());

  @override
  Future<SessionResponse> createSession({
    String? initialMessage,
    double? latitude,
    double? longitude,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    final id = _MockStore.instance.nextId('sess');
    final greeting = MessageModel(
      id: _MockStore.instance.nextId('msg'),
      role: 'assistant',
      content:
          '안녕하세요! 저는 CareBuddy입니다. 증상 상담을 도와드릴게요. '
          '저는 의료 전문가가 아니며 진단을 제공하지 않습니다. '
          '오늘 어떤 증상이 있으신가요?',
      createdAt: DateTime.now().toIso8601String(),
    );
    final session = SessionResponse(
      id: id,
      status: 'active',
      startedAt: DateTime.now().toIso8601String(),
      messages: [greeting],
    );
    _MockStore.instance.sessions.insert(0, session);
    return session;
  }

  @override
  Future<SessionResponse> getSession(String sessionId) async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    return _MockStore.instance.sessions.firstWhere(
      (s) => s.id == sessionId,
      orElse: () => SessionResponse(
        id: sessionId,
        startedAt: DateTime.now().toIso8601String(),
      ),
    );
  }

  @override
  Future<SessionListResponse> listSessions({
    int page = 1,
    int perPage = 20,
    String sort = 'started_at_desc',
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 150));
    final all = _MockStore.instance.sessions
        .map((s) => SessionSummary(
              id: s.id,
              status: s.status,
              primarySymptomTag: s.primarySymptomTag,
              triageLevel: s.triageLevel,
              startedAt: s.startedAt,
              durationSeconds: s.durationSeconds,
            ))
        .toList();

    final start = (page - 1) * perPage;
    final end = (start + perPage).clamp(0, all.length);
    final pageItems = start >= all.length ? <SessionSummary>[] : all.sublist(start, end);
    final totalPages = all.isEmpty ? 1 : (all.length / perPage).ceil();

    return SessionListResponse(
      sessions: pageItems,
      pagination: PaginationModel(
        page: page,
        perPage: perPage,
        totalCount: all.length,
        totalPages: totalPages,
      ),
    );
  }

  @override
  Future<ChatResponse> sendMessage(
    String sessionId, {
    required String content,
    String inputType = 'text',
    double? audioDurationSeconds,
    String? language,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 600));

    final idx =
        _MockStore.instance.sessions.indexWhere((s) => s.id == sessionId);
    if (idx == -1) {
      return ChatResponse(
        sessionId: sessionId,
        reply: '세션을 찾을 수 없습니다.',
        timestamp: DateTime.now().toIso8601String(),
      );
    }
    final session = _MockStore.instance.sessions[idx];

    final userMessage = MessageModel(
      id: _MockStore.instance.nextId('msg'),
      role: 'user',
      content: content,
      inputType: inputType,
      createdAt: DateTime.now().toIso8601String(),
    );

    final response = _MockChatBrain.reply(
      sessionId: sessionId,
      session: session,
      userMessage: content,
    );

    final assistantMessage = MessageModel(
      id: response.messageId ?? _MockStore.instance.nextId('msg'),
      role: 'assistant',
      content: response.reply,
      createdAt: response.timestamp ?? DateTime.now().toIso8601String(),
    );

    final updatedMessages = [...session.messages, userMessage, assistantMessage];
    _MockStore.instance.sessions[idx] = session.copyWith(
      messages: updatedMessages,
      status: response.sessionComplete ? 'completed' : session.status,
      triageLevel: response.triageResult?.level ?? session.triageLevel,
      triageExplanation:
          response.triageResult?.explanation ?? session.triageExplanation,
      completedAt: response.sessionComplete
          ? DateTime.now().toIso8601String()
          : session.completedAt,
    );

    return response;
  }

  @override
  Future<void> deleteSession(String sessionId) async {
    _MockStore.instance.sessions.removeWhere((s) => s.id == sessionId);
  }

  @override
  Future<NotificationResponse> notifyGuardians(String sessionId) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    final guardians = _MockStore.instance.profile.guardians;
    return NotificationResponse(
      notifications: guardians
          .map((g) => GuardianNotification(
                guardianName: g.name,
                phone: g.phone,
                status: 'sent',
              ))
          .toList(),
    );
  }
}

class MockUserRepository extends UserRepository {
  MockUserRepository() : super(Dio());

  @override
  Future<UserProfile> getProfile() async {
    await Future<void>.delayed(const Duration(milliseconds: 120));
    return _MockStore.instance.profile;
  }

  @override
  Future<UserProfile> updateProfile(UserProfileUpdate update) async {
    final p = _MockStore.instance.profile;
    _MockStore.instance.profile = p.copyWith(
      fullName: update.fullName ?? p.fullName,
      consentDataStorage: update.consentDataStorage ?? p.consentDataStorage,
    );
    return _MockStore.instance.profile;
  }

  @override
  Future<void> deleteAccount(String password) async {}

  @override
  Future<Guardian> addGuardian(GuardianCreate guardian) async {
    final newGuardian = Guardian(
      id: _MockStore.instance.nextId('g'),
      name: guardian.name,
      phone: guardian.phone,
      relationship: guardian.relationship,
    );
    final p = _MockStore.instance.profile;
    _MockStore.instance.profile =
        p.copyWith(guardians: [...p.guardians, newGuardian]);
    return newGuardian;
  }

  @override
  Future<Guardian> updateGuardian(String id, GuardianCreate guardian) async {
    final p = _MockStore.instance.profile;
    final updated = p.guardians
        .map((g) => g.id == id
            ? g.copyWith(
                name: guardian.name,
                phone: guardian.phone,
                relationship: guardian.relationship,
              )
            : g)
        .toList();
    _MockStore.instance.profile = p.copyWith(guardians: updated);
    return updated.firstWhere((g) => g.id == id);
  }

  @override
  Future<void> deleteGuardian(String id) async {
    final p = _MockStore.instance.profile;
    _MockStore.instance.profile = p.copyWith(
      guardians: p.guardians.where((g) => g.id != id).toList(),
    );
  }
}

class MockHospitalRepository extends HospitalRepository {
  MockHospitalRepository() : super(Dio());

  @override
  Future<HospitalSearchResponse> searchNearby({
    required double latitude,
    required double longitude,
    String? triageLevel,
    String? department,
    double radiusKm = 10.0,
    int limit = 5,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));

    final hasER = triageLevel == 'EMERGENCY';

    final all = <Hospital>[
      Hospital(
        placeId: 'mock-h-1',
        name: hasER ? '서울대학교병원 응급실' : '서울365의원',
        address: '서울특별시 종로구 대학로 101',
        distanceKm: 0.8,
        phone: '02-1234-5678',
        hasEmergencyRoom: hasER,
        specialties: hasER ? const ['응급의학과'] : const ['가정의학과', '내과'],
        operatingHours: hasER ? '24시간' : '09:00-18:00',
        latitude: latitude + 0.005,
        longitude: longitude + 0.003,
        mapsUrl: 'https://maps.google.com/?q=37.5665,126.9780',
      ),
      Hospital(
        placeId: 'mock-h-2',
        name: '연세세브란스병원',
        address: '서울특별시 서대문구 연세로 50-1',
        distanceKm: 2.3,
        phone: '02-2228-0000',
        hasEmergencyRoom: true,
        specialties: const ['응급의학과', '내과', '외과'],
        operatingHours: '24시간',
        latitude: latitude - 0.01,
        longitude: longitude + 0.008,
        mapsUrl: 'https://maps.google.com/?q=37.5611,126.9402',
      ),
      Hospital(
        placeId: 'mock-h-3',
        name: '강북삼성병원',
        address: '서울특별시 종로구 새문안로 29',
        distanceKm: 3.1,
        phone: '02-2001-2001',
        hasEmergencyRoom: true,
        specialties: const ['내과', '외과', '응급의학과'],
        operatingHours: '24시간',
        latitude: latitude + 0.012,
        longitude: longitude - 0.004,
        mapsUrl: 'https://maps.google.com/?q=37.5683,126.9682',
      ),
      Hospital(
        placeId: 'mock-h-4',
        name: '늘봄가정의학과의원',
        address: '서울특별시 중구 명동길 14',
        distanceKm: 4.0,
        phone: '02-9999-0000',
        hasEmergencyRoom: false,
        specialties: const ['가정의학과'],
        operatingHours: '월-금 09:00-19:00',
        latitude: latitude - 0.015,
        longitude: longitude - 0.01,
        mapsUrl: 'https://maps.google.com/?q=37.5636,126.9869',
      ),
    ];

    final filtered = hasER ? all.where((h) => h.hasEmergencyRoom).toList() : all;
    return HospitalSearchResponse(
      hospitals: filtered.take(limit).toList(),
      searchRadiusKm: radiusKm,
      userLocation: UserLocation(latitude: latitude, longitude: longitude),
    );
  }
}

class MockVoiceRepository extends VoiceRepository {
  MockVoiceRepository() : super(Dio());

  @override
  Future<Uint8List> synthesizeSpeech({
    required String text,
    String? voiceId,
    double? speed,
  }) async {
    // Return an empty audio payload — the consultation UI tolerates this and
    // simply skips playback when bytes are empty.
    return Uint8List(0);
  }
}
