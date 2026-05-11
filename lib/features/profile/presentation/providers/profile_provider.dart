import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/network/user_repository.dart';
import '../../../../shared/models/user_models.dart';

class ProfileState {
  const ProfileState({
    this.profile,
    this.isLoading = false,
    this.error,
  });

  final UserProfile? profile;
  final bool isLoading;
  final String? error;

  ProfileState copyWith({
    UserProfile? profile,
    bool? isLoading,
    String? error,
  }) =>
      ProfileState(
        profile: profile ?? this.profile,
        isLoading: isLoading ?? this.isLoading,
        error: error,
      );
}

final profileProvider =
    StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  return ProfileNotifier(ref);
});

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier(this._ref) : super(const ProfileState());

  final Ref _ref;

  Future<void> loadProfile() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final repo = _ref.read(userRepositoryProvider);
      final profile = await repo.getProfile();
      state = state.copyWith(profile: profile, isLoading: false);
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, error: e.userMessage);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> updateProfile(UserProfileUpdate update) async {
    try {
      final repo = _ref.read(userRepositoryProvider);
      final profile = await repo.updateProfile(update);
      state = state.copyWith(profile: profile);
    } on ApiException catch (e) {
      state = state.copyWith(error: e.userMessage);
    }
  }

  Future<void> addGuardian(GuardianCreate guardian) async {
    try {
      final repo = _ref.read(userRepositoryProvider);
      await repo.addGuardian(guardian);
      await loadProfile(); // Reload to get updated guardian list
    } on ApiException catch (e) {
      state = state.copyWith(error: e.userMessage);
      rethrow;
    }
  }

  Future<void> deleteGuardian(String guardianId) async {
    try {
      final repo = _ref.read(userRepositoryProvider);
      await repo.deleteGuardian(guardianId);
      await loadProfile();
    } on ApiException catch (e) {
      state = state.copyWith(error: e.userMessage);
    }
  }

  Future<void> deleteAccount(String password) async {
    final repo = _ref.read(userRepositoryProvider);
    await repo.deleteAccount(password);
  }
}
