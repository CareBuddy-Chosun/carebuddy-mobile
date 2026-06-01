import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/consultation/presentation/screens/consultation_screen.dart';
import '../features/history/presentation/screens/history_screen.dart';
import '../features/history/presentation/screens/session_detail_screen.dart';
import '../features/hospital/presentation/screens/hospital_screen.dart';
import '../features/profile/presentation/screens/guardian_list_screen.dart';
import '../features/profile/presentation/screens/guardian_form_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';
import 'shell_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen()),
      GoRoute(
          path: '/register',
          builder: (context, state) => const RegisterScreen()),
      GoRoute(
          path: '/home',
          builder: (context, state) => const ShellScreen()),
      GoRoute(
        path: '/consultation',
        builder: (_, state) {
          final sessionId = state.extra as String?;
          return ConsultationScreen(sessionId: sessionId);
        },
      ),
      GoRoute(
        path: '/session/:id',
        builder: (_, state) {
          final sessionId = state.pathParameters['id']!;
          return SessionDetailScreen(sessionId: sessionId);
        },
      ),
      GoRoute(
        path: '/hospitals',
        builder: (_, state) {
          final extra = state.extra;
          String? level;
          String? dept;
          if (extra is Map) {
            level = extra['level'] as String?;
            dept = extra['department'] as String?;
          } else if (extra is String) {
            level = extra;
          }
          return HospitalScreen(triageLevel: level, department: dept);
        },
      ),
      GoRoute(
          path: '/history',
          builder: (context, state) => const HistoryScreen()),
      GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen()),
      GoRoute(
          path: '/profile/guardians',
          builder: (context, state) => const GuardianListScreen()),
      GoRoute(
          path: '/profile/guardians/add',
          builder: (context, state) => const GuardianFormScreen()),
    ],
  );
});
