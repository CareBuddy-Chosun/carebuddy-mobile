import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/network/dio_client.dart';

final sessionHistoryProvider = FutureProvider<List<dynamic>>((ref) async {
  final dio = ref.read(dioProvider);
  final response = await dio.get('/sessions');
  return response.data as List<dynamic>;
});

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(sessionHistoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Past Sessions')),
      body: history.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (sessions) {
          if (sessions.isEmpty) {
            return const Center(
              child: Text('No sessions yet.\nStart a consultation!',
                  textAlign: TextAlign.center),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: sessions.length,
            separatorBuilder: (context, i) => const SizedBox(height: 8),
            itemBuilder: (context, i) {
              final session = sessions[i] as Map<String, dynamic>;
              final triage = session['triage_result'] as String?;
              final createdAt = session['created_at'] as String;
              return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey.shade200),
                ),
                child: ListTile(
                  leading: Icon(
                    triage == 'emergency'
                        ? Icons.emergency
                        : triage == 'visit_hospital'
                            ? Icons.local_hospital
                            : Icons.home,
                    color: triage == 'emergency'
                        ? AppTheme.emergency
                        : triage == 'visit_hospital'
                            ? AppTheme.warning
                            : AppTheme.success,
                  ),
                  title: Text(
                    triage?.replaceAll('_', ' ').toUpperCase() ?? 'In Progress',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(createdAt.substring(0, 10)),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.go('/consultation',
                      extra: session['id'] as String),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
