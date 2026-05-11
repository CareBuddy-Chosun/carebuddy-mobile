import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/network/session_repository.dart';
import '../../../../shared/models/session_models.dart';

class HistoryState {
  const HistoryState({
    this.sessions = const [],
    this.isLoading = false,
    this.error,
    this.currentPage = 0,
    this.totalPages = 1,
    this.hasMore = true,
  });

  final List<SessionSummary> sessions;
  final bool isLoading;
  final String? error;
  final int currentPage;
  final int totalPages;
  final bool hasMore;

  HistoryState copyWith({
    List<SessionSummary>? sessions,
    bool? isLoading,
    String? error,
    int? currentPage,
    int? totalPages,
    bool? hasMore,
  }) =>
      HistoryState(
        sessions: sessions ?? this.sessions,
        isLoading: isLoading ?? this.isLoading,
        error: error,
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages ?? this.totalPages,
        hasMore: hasMore ?? this.hasMore,
      );
}

final historyProvider =
    StateNotifierProvider<HistoryNotifier, HistoryState>((ref) {
  return HistoryNotifier(ref);
});

class HistoryNotifier extends StateNotifier<HistoryState> {
  HistoryNotifier(this._ref) : super(const HistoryState());

  final Ref _ref;

  Future<void> loadInitial() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final repo = _ref.read(sessionRepositoryProvider);
      final response = await repo.listSessions(page: 1);
      state = state.copyWith(
        sessions: response.sessions,
        currentPage: 1,
        totalPages: response.pagination.totalPages,
        hasMore: response.pagination.page < response.pagination.totalPages,
        isLoading: false,
      );
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, error: e.userMessage);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> loadMore() async {
    if (!state.hasMore || state.isLoading) return;
    final nextPage = state.currentPage + 1;
    state = state.copyWith(isLoading: true);
    try {
      final repo = _ref.read(sessionRepositoryProvider);
      final response = await repo.listSessions(page: nextPage);
      state = state.copyWith(
        sessions: [...state.sessions, ...response.sessions],
        currentPage: nextPage,
        hasMore: nextPage < response.pagination.totalPages,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> deleteSession(String sessionId) async {
    try {
      final repo = _ref.read(sessionRepositoryProvider);
      await repo.deleteSession(sessionId);
      state = state.copyWith(
        sessions: state.sessions.where((s) => s.id != sessionId).toList(),
      );
    } on ApiException catch (e) {
      state = state.copyWith(error: e.userMessage);
    }
  }

  Future<void> refresh() async {
    state = const HistoryState();
    await loadInitial();
  }
}
