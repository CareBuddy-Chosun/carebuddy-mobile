import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/consultation/presentation/screens/consultation_screen.dart';
import '../features/history/presentation/screens/history_screen.dart';
import '../features/hospital/presentation/screens/hospital_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/register', builder: (context, state) => const RegisterScreen()),
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/consultation',
        builder: (_, state) {
          final sessionId = state.extra as String?;
          return ConsultationScreen(sessionId: sessionId);
        },
      ),
      GoRoute(path: '/history', builder: (context, state) => const HistoryScreen()),
      GoRoute(path: '/hospitals', builder: (context, state) => const HospitalScreen()),
    ],
  );
});
