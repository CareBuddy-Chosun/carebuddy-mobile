import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/l10n/app_strings.dart';

class TriageResultBanner extends ConsumerWidget {
  const TriageResultBanner({super.key, required this.result});

  final String result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(stringsProvider);
    final (label, color) = switch (result) {
      AppConstants.triageEmergency => (t.triageEmergency, AppTheme.emergency),
      AppConstants.triageVisitHospital =>
        (t.triageVisitHospitalShort, AppTheme.warning),
      AppConstants.triageHomeCare => (t.triageHomeCareShort, AppTheme.success),
      _ => (t.triageUnknown, AppTheme.textSecondary),
    };

    return Container(
      width: double.infinity,
      color: color.withValues(alpha: 0.15),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        label,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
