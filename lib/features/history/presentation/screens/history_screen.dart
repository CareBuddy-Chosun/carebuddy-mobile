import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/l10n/app_strings.dart';
import '../providers/history_provider.dart';
import '../widgets/session_list_tile.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(historyProvider.notifier).loadInitial();
    });
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(historyProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(historyProvider);
    final t = ref.watch(stringsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(t.historyTitle)),
      body: state.isLoading && state.sessions.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : state.error != null && state.sessions.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(state.error!),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () =>
                            ref.read(historyProvider.notifier).refresh(),
                        child: Text(t.retry),
                      ),
                    ],
                  ),
                )
              : state.sessions.isEmpty
                  ? Center(
                      child: Text(
                        t.noSessionsYet,
                        textAlign: TextAlign.center,
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () =>
                          ref.read(historyProvider.notifier).refresh(),
                      child: ListView.separated(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(16),
                        itemCount:
                            state.sessions.length + (state.hasMore ? 1 : 0),
                        separatorBuilder: (_, _) => const SizedBox(height: 8),
                        itemBuilder: (context, i) {
                          if (i >= state.sessions.length) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                          final session = state.sessions[i];
                          return SessionListTile(
                            session: session,
                            onTap: () => context.push('/consultation',
                                extra: session.id),
                            onDelete: () => ref
                                .read(historyProvider.notifier)
                                .deleteSession(session.id),
                          );
                        },
                      ),
                    ),
    );
  }
}
