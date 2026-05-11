import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_theme.dart';

class TriageResultBanner extends StatelessWidget {
  const TriageResultBanner({super.key, required this.result});

  final String result;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (result) {
      AppConstants.triageEmergency => ('EMERGENCY', AppTheme.emergency),
      AppConstants.triageVisitHospital => ('VISIT HOSPITAL', AppTheme.warning),
      AppConstants.triageHomeCare => ('HOME CARE', AppTheme.success),
      _ => ('Unknown', AppTheme.textSecondary),
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
