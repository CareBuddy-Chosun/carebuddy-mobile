import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/l10n/app_strings.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/providers/language_provider.dart';
import '../../../../shared/models/user_models.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../providers/profile_provider.dart';
import '../widgets/delete_account_dialog.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileProvider.notifier).loadProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileProvider);
    final t = ref.watch(stringsProvider);

    if (state.isLoading && state.profile == null) {
      return Scaffold(
        appBar: AppBar(title: Text(t.profileTitle)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final profile = state.profile;
    if (profile == null) {
      return Scaffold(
        appBar: AppBar(title: Text(t.profileTitle)),
        body: Center(child: Text(state.error ?? t.failedToLoadProfile)),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(t.profileTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // User info card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(profile.fullName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(profile.email,
                      style: const TextStyle(color: AppTheme.textSecondary)),
                  if (profile.dateOfBirth != null) ...[
                    const SizedBox(height: 4),
                    Text(t.bornOn(profile.dateOfBirth!),
                        style:
                            const TextStyle(color: AppTheme.textSecondary)),
                  ],
                  const SizedBox(height: 8),
                  Text(t.consultationsCount(profile.sessionCount),
                      style: const TextStyle(color: AppTheme.textSecondary)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Data consent toggle
          Card(
            child: SwitchListTile(
              title: Text(t.dataConsentTitle),
              subtitle: Text(
                t.dataConsentSubtitle,
                style: const TextStyle(fontSize: 12),
              ),
              value: profile.consentDataStorage,
              onChanged: (value) {
                ref.read(profileProvider.notifier).updateProfile(
                      UserProfileUpdate(consentDataStorage: value),
                    );
              },
            ),
          ),
          const SizedBox(height: 16),

          // Language section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.languageSectionTitle,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    t.languageSectionSubtitle,
                    style: const TextStyle(
                        fontSize: 12, color: AppTheme.textSecondary),
                  ),
                  const SizedBox(height: 12),
                  SegmentedButton<String>(
                    segments: const [
                      ButtonSegment(value: 'ko', label: Text('한국어')),
                      ButtonSegment(value: 'en', label: Text('English')),
                    ],
                    selected: {ref.watch(languageProvider)},
                    onSelectionChanged: (selection) {
                      ref
                          .read(languageProvider.notifier)
                          .setLanguage(selection.first);
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Guardians section
          Card(
            child: ListTile(
              leading: const Icon(Icons.people),
              title: Text(t.emergencyGuardians),
              subtitle: Text(t.guardiansConfigured(profile.guardians.length)),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push('/profile/guardians'),
            ),
          ),
          const SizedBox(height: 32),

          // Actions
          OutlinedButton.icon(
            onPressed: () async {
              await ref.read(authProvider.notifier).logout();
              if (context.mounted) context.go('/login');
            },
            icon: const Icon(Icons.logout),
            label: Text(t.logout),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () async {
              final password = await showDialog<String>(
                context: context,
                builder: (_) => const DeleteAccountDialog(),
              );
              if (password == null) return;
              try {
                await ref
                    .read(profileProvider.notifier)
                    .deleteAccount(password);
                await ref.read(authProvider.notifier).logout();
                if (context.mounted) context.go('/login');
              } on ApiException catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.userMessage)),
                  );
                }
              }
            },
            child: Text(t.deleteAccount,
                style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
