import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/l10n/app_strings.dart';
import '../providers/profile_provider.dart';

class GuardianListScreen extends ConsumerWidget {
  const GuardianListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileProvider);
    final guardians = state.profile?.guardians ?? [];
    final t = ref.watch(stringsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(t.emergencyGuardians)),
      floatingActionButton: guardians.length < 2
          ? FloatingActionButton(
              onPressed: () => context.push('/profile/guardians/add'),
              child: const Icon(Icons.add),
            )
          : null,
      body: guardians.isEmpty
          ? Center(
              child: Text(
                t.noGuardiansConfigured,
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
                            title: Text(t.removeGuardian),
                            content: Text(t.removeGuardianConfirm(g.name)),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx, false),
                                child: Text(t.cancel),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(ctx, true),
                                child: Text(t.remove,
                                    style: const TextStyle(color: Colors.red)),
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
