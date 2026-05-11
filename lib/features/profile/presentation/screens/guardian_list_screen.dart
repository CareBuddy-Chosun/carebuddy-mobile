import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_theme.dart';
import '../providers/profile_provider.dart';

class GuardianListScreen extends ConsumerWidget {
  const GuardianListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileProvider);
    final guardians = state.profile?.guardians ?? [];

    return Scaffold(
      appBar: AppBar(title: const Text('Emergency Guardians')),
      floatingActionButton: guardians.length < 2
          ? FloatingActionButton(
              onPressed: () => context.go('/profile/guardians/add'),
              child: const Icon(Icons.add),
            )
          : null,
      body: guardians.isEmpty
          ? const Center(
              child: Text(
                'No guardians configured.\nTap + to add one (max 2).',
                textAlign: TextAlign.center,
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: guardians.length,
              separatorBuilder: (_, _) => const SizedBox(height: 8),
              itemBuilder: (context, i) {
                final g = guardians[i];
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.person, color: AppTheme.primary),
                    title: Text(g.name),
                    subtitle: Text(
                      '${g.phone}${g.relationship != null ? ' \u00b7 ${g.relationship}' : ''}',
                    ),
                    trailing: IconButton(
                      icon:
                          const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () async {
                        final confirmed = await showDialog<bool>(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Remove Guardian'),
                            content: Text('Remove ${g.name}?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx, false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(ctx, true),
                                child: const Text('Remove',
                                    style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        );
                        if (confirmed == true) {
                          ref
                              .read(profileProvider.notifier)
                              .deleteGuardian(g.id);
                        }
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
