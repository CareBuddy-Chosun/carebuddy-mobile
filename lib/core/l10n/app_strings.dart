import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/language_provider.dart';

/// Provides the active [AppStrings] set based on [languageProvider].
///
/// Watch this in any Consumer widget to get the correct localized strings and
/// have the widget rebuild automatically when the user toggles the language.
final stringsProvider = Provider<AppStrings>((ref) {
  return ref.watch(languageProvider) == 'en' ? AppStrings.en : AppStrings.ko;
});

/// All user-facing UI strings for the CareBuddy app.
///
/// Two concrete instances are provided: [AppStrings.ko] (Korean, default) and
/// [AppStrings.en] (English). Backend-provided text (chat replies, server
/// triage explanations, etc.) is intentionally NOT included here.
abstract class AppStrings {
  const AppStrings();

  static const AppStrings ko = _KoStrings();
  static const AppStrings en = _EnStrings();

  // ---- Common ----
  String get appName;
  String get appTagline;
  String get cancel;
  String get confirm;
  String get retry;
  String get delete;
  String get remove;
  String get save;

  // ---- Shell / navigation ----
  String get shellTitleDashboard;
  String get shellTitleHistory;
  String get shellTitleProfile;
  String get shellSubtitle;
  String get shellLiveMonitoring;
  String get shellTrackingRealtime;
  String get navHome;
  String get navHistory;
  String get navProfile;

  // ---- Auth: login ----
  String get loginEmail;
  String get loginPassword;
  String get signIn;
  String get noAccountSignUp;

  // ---- Auth: register ----
  String get createAccount;
  String get fullName;
  String get nameLabel;
  String get passwordHelper;
  String dateOfBirthSelected(String date);
  String get dateOfBirthOptional;
  String get consentTitle;
  String get consentSubtitle;
  String get alreadyHaveAccountSignIn;

  // ---- Home ----
  String get profileTooltip;
  String get homeGreeting;
  String get homeDisclaimer;
  String get startConsultation;
  String get startConsultationSub;
  String get pastSessions;
  String get pastSessionsSub;
  String get nearbyHospitals;
  String get nearbyHospitalsSub;

  // ---- Consultation ----
  String get consultationTitle;
  String get handsFreeOn;
  String get handsFreeOff;
  String get ttsOn;
  String get ttsOff;
  String get stopSpeaking;
  String get listening;
  String get typeYourSymptoms;
  String get sttUnavailableType;
  String get sttNoMicType;
  String get sttCouldNotStartType;

  // ---- Greeting (client-generated) ----
  String get consultationGreeting;

  // ---- Emergency banner ----
  String get emergencyDetected;
  String get call911;
  String get notify;

  // ---- Triage ----
  String get triageEmergency;
  String get triageVisitHospital;
  String get triageHomeCare;
  String get triageVisitHospitalShort;
  String get triageHomeCareShort;
  String get triageAssessment;
  String get triageUnknown;
  String get nextSteps;
  String get notifyGuardians;
  String get findNearbyHospitals;

  // ---- History ----
  String get historyTitle;
  String get noSessionsYet;
  String get inProgress;
  String minutesShort(int minutes);

  // ---- Session detail ----
  String get sessionDetail;
  String get deleteSession;
  String get deleteSessionDetailContent;
  String get deleteSessionListContent;
  String get conversation;
  String get statusActive;

  // ---- Hospital ----
  String get hospitalsTitle;
  String radiusKm(String km);
  String get noHospitalsNearby;
  String get hospitalCall;
  String get hospitalDirections;
  String hospitalHours(String hours);
  String get hospitalEr;
  String distanceKm(String km);

  // ---- Profile ----
  String get profileTitle;
  String get failedToLoadProfile;
  String bornOn(String date);
  String consultationsCount(int count);
  String get dataConsentTitle;
  String get dataConsentSubtitle;
  String get languageSectionTitle;
  String get languageSectionSubtitle;
  String get emergencyGuardians;
  String guardiansConfigured(int count);
  String get logout;
  String get deleteAccount;

  // ---- Delete account dialog ----
  String get deleteAccountWarning;
  String get enterPasswordToConfirm;

  // ---- Guardians ----
  String get addGuardian;
  String get saveGuardian;
  String get guardianPhone;
  String get guardianPhoneHint;
  String get guardianRelationshipOptional;
  String get guardianRelationshipHint;
  String get noGuardiansConfigured;
  String get removeGuardian;
  String removeGuardianConfirm(String name);

  // ---- Validators ----
  String get emailRequired;
  String get emailInvalid;
  String get passwordRequired;
  String get passwordTooShort;
  String get passwordNeedsUppercase;
  String get passwordNeedsDigit;
  String fieldRequired(String field);
  String get phoneRequired;
  String get phoneInvalid;

  // ---- Generic errors ----
  String get genericError;
}

class _KoStrings extends AppStrings {
  const _KoStrings();

  @override
  String get appName => 'CareBuddy';
  @override
  String get appTagline => 'AI 건강 도우미';
  @override
  String get cancel => '취소';
  @override
  String get confirm => '확인';
  @override
  String get retry => '다시 시도';
  @override
  String get delete => '삭제';
  @override
  String get remove => '제거';
  @override
  String get save => '저장';

  @override
  String get shellTitleDashboard => '건강 대시보드';
  @override
  String get shellTitleHistory => '진료 기록';
  @override
  String get shellTitleProfile => '내 프로필';
  @override
  String get shellSubtitle => 'AI 기반 건강 관리 경험';
  @override
  String get shellLiveMonitoring => '실시간 건강 모니터링';
  @override
  String get shellTrackingRealtime => '증상을 실시간으로 추적합니다';
  @override
  String get navHome => '홈';
  @override
  String get navHistory => '기록';
  @override
  String get navProfile => '프로필';

  @override
  String get loginEmail => '이메일';
  @override
  String get loginPassword => '비밀번호';
  @override
  String get signIn => '로그인';
  @override
  String get noAccountSignUp => '계정이 없으신가요? 회원가입';

  @override
  String get createAccount => '계정 만들기';
  @override
  String get fullName => '이름';
  @override
  String get nameLabel => '이름';
  @override
  String get passwordHelper => '최소 8자, 대문자 1개, 숫자 1개 포함';
  @override
  String dateOfBirthSelected(String date) => '생년월일: $date';
  @override
  String get dateOfBirthOptional => '생년월일 (선택)';
  @override
  String get consentTitle => '맞춤 케어를 위한 데이터 저장에 동의합니다';
  @override
  String get consentSubtitle => '향후 상담 개선을 위해 세션 데이터가 저장됩니다.';
  @override
  String get alreadyHaveAccountSignIn => '이미 계정이 있으신가요? 로그인';

  @override
  String get profileTooltip => '프로필';
  @override
  String get homeGreeting => '오늘 무엇을 도와드릴까요?';
  @override
  String get homeDisclaimer => '저는 의료 전문가가 아닙니다. 이 안내는 진단이 아닙니다.';
  @override
  String get startConsultation => '상담 시작';
  @override
  String get startConsultationSub => '음성이나 텍스트로 증상을 설명하세요';
  @override
  String get pastSessions => '지난 상담';
  @override
  String get pastSessionsSub => '상담 기록을 확인하세요';
  @override
  String get nearbyHospitals => '주변 병원';
  @override
  String get nearbyHospitalsSub => '가까운 병원과 의원을 찾아보세요';

  @override
  String get consultationTitle => '상담';
  @override
  String get handsFreeOn => '핸즈프리: 켜짐';
  @override
  String get handsFreeOff => '핸즈프리: 꺼짐';
  @override
  String get ttsOn => '음성 안내 켜짐';
  @override
  String get ttsOff => '음성 안내 꺼짐';
  @override
  String get stopSpeaking => '음성 중지';
  @override
  String get listening => '듣고 있어요…';
  @override
  String get typeYourSymptoms => '증상을 입력하세요...';
  @override
  String get sttUnavailableType => '음성 입력을 사용할 수 없습니다. 대신 입력해 주세요.';
  @override
  String get sttNoMicType => '마이크/음성 인식을 사용할 수 없습니다. 대신 입력해 주세요.';
  @override
  String get sttCouldNotStartType => '마이크를 시작할 수 없습니다. 대신 입력해 주세요.';

  @override
  String get consultationGreeting =>
      '안녕하세요! 저는 케어버디예요. 증상 확인을 도와드릴게요. '
      '참고로 저는 의료 전문가가 아니며, 이 안내는 진단이 아닙니다. '
      '오늘 어디가 불편하신가요?';

  @override
  String get emergencyDetected => '응급 상황이 감지되었습니다';
  @override
  String get call911 => '응급 전화';
  @override
  String get notify => '알림 보내기';

  @override
  String get triageEmergency => '응급';
  @override
  String get triageVisitHospital => '병원 방문 권장';
  @override
  String get triageHomeCare => '자가 관리';
  @override
  String get triageVisitHospitalShort => '병원 방문';
  @override
  String get triageHomeCareShort => '자가 관리';
  @override
  String get triageAssessment => '평가 결과';
  @override
  String get triageUnknown => '알 수 없음';
  @override
  String get nextSteps => '다음 단계:';
  @override
  String get notifyGuardians => '보호자에게 알리기';
  @override
  String get findNearbyHospitals => '주변 병원 찾기';

  @override
  String get historyTitle => '지난 상담';
  @override
  String get noSessionsYet => '아직 상담 기록이 없습니다.\n상담을 시작해 보세요!';
  @override
  String get inProgress => '진행 중';
  @override
  String minutesShort(int minutes) => '$minutes분';

  @override
  String get sessionDetail => '상담 상세';
  @override
  String get deleteSession => '상담 삭제';
  @override
  String get deleteSessionDetailContent => '이 상담과 모든 데이터가 영구적으로 삭제됩니다.';
  @override
  String get deleteSessionListContent => '이 상담이 영구적으로 삭제됩니다.';
  @override
  String get conversation => '대화 내용';
  @override
  String get statusActive => '진행 중';

  @override
  String get hospitalsTitle => '주변 병원';
  @override
  String radiusKm(String km) => '반경 $km km';
  @override
  String get noHospitalsNearby => '주변에 병원을 찾을 수 없습니다.';
  @override
  String get hospitalCall => '전화';
  @override
  String get hospitalDirections => '길찾기';
  @override
  String hospitalHours(String hours) => '진료 시간: $hours';
  @override
  String get hospitalEr => '응급실';
  @override
  String distanceKm(String km) => '$km km';

  @override
  String get profileTitle => '프로필';
  @override
  String get failedToLoadProfile => '프로필을 불러오지 못했습니다';
  @override
  String bornOn(String date) => '생년월일: $date';
  @override
  String consultationsCount(int count) => '상담 $count회';
  @override
  String get dataConsentTitle => '데이터 저장 동의';
  @override
  String get dataConsentSubtitle => '맞춤형 상담을 위해 세션 데이터를 저장합니다';
  @override
  String get languageSectionTitle => '언어 / Language';
  @override
  String get languageSectionSubtitle => '케어버디가 사용하는 언어';
  @override
  String get emergencyGuardians => '비상 보호자';
  @override
  String guardiansConfigured(int count) => '$count/2명 등록됨';
  @override
  String get logout => '로그아웃';
  @override
  String get deleteAccount => '계정 삭제';

  @override
  String get deleteAccountWarning =>
      '이 작업은 영구적이며 되돌릴 수 없습니다. 모든 데이터가 삭제됩니다.';
  @override
  String get enterPasswordToConfirm => '확인을 위해 비밀번호를 입력하세요';

  @override
  String get addGuardian => '보호자 추가';
  @override
  String get saveGuardian => '보호자 저장';
  @override
  String get guardianPhone => '전화번호';
  @override
  String get guardianPhoneHint => '+821012345678';
  @override
  String get guardianRelationshipOptional => '관계 (선택)';
  @override
  String get guardianRelationshipHint => '예: 부모, 배우자, 친구';
  @override
  String get noGuardiansConfigured => '등록된 보호자가 없습니다.\n+ 를 눌러 추가하세요 (최대 2명).';
  @override
  String get removeGuardian => '보호자 제거';
  @override
  String removeGuardianConfirm(String name) => '$name 님을 제거할까요?';

  @override
  String get emailRequired => '이메일을 입력하세요';
  @override
  String get emailInvalid => '올바른 이메일을 입력하세요';
  @override
  String get passwordRequired => '비밀번호를 입력하세요';
  @override
  String get passwordTooShort => '비밀번호는 최소 8자 이상이어야 합니다';
  @override
  String get passwordNeedsUppercase => '비밀번호에 대문자를 1개 이상 포함해야 합니다';
  @override
  String get passwordNeedsDigit => '비밀번호에 숫자를 1개 이상 포함해야 합니다';
  @override
  String fieldRequired(String field) => '$field을(를) 입력하세요';
  @override
  String get phoneRequired => '전화번호를 입력하세요';
  @override
  String get phoneInvalid => '올바른 전화번호를 입력하세요 (예: +821012345678)';

  @override
  String get genericError => '문제가 발생했습니다. 다시 시도해 주세요.';
}

class _EnStrings extends AppStrings {
  const _EnStrings();

  @override
  String get appName => 'CareBuddy';
  @override
  String get appTagline => 'Your AI Health Assistant';
  @override
  String get cancel => 'Cancel';
  @override
  String get confirm => 'Confirm';
  @override
  String get retry => 'Retry';
  @override
  String get delete => 'Delete';
  @override
  String get remove => 'Remove';
  @override
  String get save => 'Save';

  @override
  String get shellTitleDashboard => 'Health Dashboard';
  @override
  String get shellTitleHistory => 'Medical History';
  @override
  String get shellTitleProfile => 'Patient Profile';
  @override
  String get shellSubtitle => 'AI-powered healthcare experience';
  @override
  String get shellLiveMonitoring => 'Live Health Monitoring';
  @override
  String get shellTrackingRealtime => 'Tracking symptoms in real-time';
  @override
  String get navHome => 'Home';
  @override
  String get navHistory => 'History';
  @override
  String get navProfile => 'Profile';

  @override
  String get loginEmail => 'Email';
  @override
  String get loginPassword => 'Password';
  @override
  String get signIn => 'Sign In';
  @override
  String get noAccountSignUp => "Don't have an account? Sign Up";

  @override
  String get createAccount => 'Create Account';
  @override
  String get fullName => 'Full Name';
  @override
  String get nameLabel => 'Name';
  @override
  String get passwordHelper => 'Min 8 characters, 1 uppercase, 1 digit';
  @override
  String dateOfBirthSelected(String date) => 'Date of Birth: $date';
  @override
  String get dateOfBirthOptional => 'Date of Birth (optional)';
  @override
  String get consentTitle => 'I consent to data storage for personalized care';
  @override
  String get consentSubtitle =>
      'Your session data will be stored to improve future consultations.';
  @override
  String get alreadyHaveAccountSignIn => 'Already have an account? Sign In';

  @override
  String get profileTooltip => 'Profile';
  @override
  String get homeGreeting => 'How can I help you today?';
  @override
  String get homeDisclaimer =>
      'I am not a medical professional. This is not a diagnosis.';
  @override
  String get startConsultation => 'Start Consultation';
  @override
  String get startConsultationSub => 'Describe your symptoms by voice or text';
  @override
  String get pastSessions => 'Past Sessions';
  @override
  String get pastSessionsSub => 'Review your consultation history';
  @override
  String get nearbyHospitals => 'Nearby Hospitals';
  @override
  String get nearbyHospitalsSub => 'Find hospitals and clinics near you';

  @override
  String get consultationTitle => 'Consultation';
  @override
  String get handsFreeOn => 'Hands-free: On';
  @override
  String get handsFreeOff => 'Hands-free: Off';
  @override
  String get ttsOn => 'TTS On';
  @override
  String get ttsOff => 'TTS Off';
  @override
  String get stopSpeaking => 'Stop speaking';
  @override
  String get listening => 'Listening…';
  @override
  String get typeYourSymptoms => 'Type your symptoms...';
  @override
  String get sttUnavailableType => 'Voice input unavailable. You can type instead.';
  @override
  String get sttNoMicType =>
      'Microphone/speech not available. You can type instead.';
  @override
  String get sttCouldNotStartType =>
      'Could not start microphone. You can type instead.';

  @override
  String get consultationGreeting =>
      "Hello! I'm CareBuddy. I'm here to help assess your symptoms. "
      "Please note: I am not a medical professional and this is not a diagnosis. "
      "How are you feeling today?";

  @override
  String get emergencyDetected => 'EMERGENCY DETECTED';
  @override
  String get call911 => 'Call 911';
  @override
  String get notify => 'Notify';

  @override
  String get triageEmergency => 'EMERGENCY';
  @override
  String get triageVisitHospital => 'VISIT HOSPITAL';
  @override
  String get triageHomeCare => 'HOME CARE';
  @override
  String get triageVisitHospitalShort => 'VISIT HOSPITAL';
  @override
  String get triageHomeCareShort => 'HOME CARE';
  @override
  String get triageAssessment => 'ASSESSMENT';
  @override
  String get triageUnknown => 'Unknown';
  @override
  String get nextSteps => 'Next Steps:';
  @override
  String get notifyGuardians => 'Notify Guardians';
  @override
  String get findNearbyHospitals => 'Find Nearby Hospitals';

  @override
  String get historyTitle => 'Past Sessions';
  @override
  String get noSessionsYet => 'No sessions yet.\nStart a consultation!';
  @override
  String get inProgress => 'In Progress';
  @override
  String minutesShort(int minutes) => '$minutes min';

  @override
  String get sessionDetail => 'Session Detail';
  @override
  String get deleteSession => 'Delete Session';
  @override
  String get deleteSessionDetailContent =>
      'This will permanently delete this session and all its data.';
  @override
  String get deleteSessionListContent =>
      'This will permanently delete this session.';
  @override
  String get conversation => 'Conversation';
  @override
  String get statusActive => 'ACTIVE';

  @override
  String get hospitalsTitle => 'Nearby Hospitals';
  @override
  String radiusKm(String km) => '$km km radius';
  @override
  String get noHospitalsNearby => 'No hospitals found nearby.';
  @override
  String get hospitalCall => 'Call';
  @override
  String get hospitalDirections => 'Directions';
  @override
  String hospitalHours(String hours) => 'Hours: $hours';
  @override
  String get hospitalEr => 'ER';
  @override
  String distanceKm(String km) => '$km km';

  @override
  String get profileTitle => 'Profile';
  @override
  String get failedToLoadProfile => 'Failed to load profile';
  @override
  String bornOn(String date) => 'Born: $date';
  @override
  String consultationsCount(int count) => '$count consultations';
  @override
  String get dataConsentTitle => 'Data Storage Consent';
  @override
  String get dataConsentSubtitle =>
      'Store session data for personalized future consultations';
  @override
  String get languageSectionTitle => 'Language / 언어';
  @override
  String get languageSectionSubtitle => 'Language CareBuddy responds in';
  @override
  String get emergencyGuardians => 'Emergency Guardians';
  @override
  String guardiansConfigured(int count) => '$count/2 configured';
  @override
  String get logout => 'Logout';
  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get deleteAccountWarning =>
      'This action is permanent and cannot be undone. '
      'All your data will be deleted.';
  @override
  String get enterPasswordToConfirm => 'Enter your password to confirm';

  @override
  String get addGuardian => 'Add Guardian';
  @override
  String get saveGuardian => 'Save Guardian';
  @override
  String get guardianPhone => 'Phone';
  @override
  String get guardianPhoneHint => '+821012345678';
  @override
  String get guardianRelationshipOptional => 'Relationship (optional)';
  @override
  String get guardianRelationshipHint => 'e.g., Parent, Spouse, Friend';
  @override
  String get noGuardiansConfigured =>
      'No guardians configured.\nTap + to add one (max 2).';
  @override
  String get removeGuardian => 'Remove Guardian';
  @override
  String removeGuardianConfirm(String name) => 'Remove $name?';

  @override
  String get emailRequired => 'Email is required';
  @override
  String get emailInvalid => 'Enter a valid email';
  @override
  String get passwordRequired => 'Password is required';
  @override
  String get passwordTooShort => 'Password must be at least 8 characters';
  @override
  String get passwordNeedsUppercase =>
      'Password must contain at least one uppercase letter';
  @override
  String get passwordNeedsDigit => 'Password must contain at least one digit';
  @override
  String fieldRequired(String field) => '$field is required';
  @override
  String get phoneRequired => 'Phone number is required';
  @override
  String get phoneInvalid => 'Enter a valid phone number (e.g. +821012345678)';

  @override
  String get genericError => 'Something went wrong. Please try again.';
}
