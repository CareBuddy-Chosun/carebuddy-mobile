import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../shared/models/session_models.dart';

class TriageDetailCard extends StatelessWidget {
  const TriageDetailCard({
    super.key,
    required this.triageResult,
    this.onNotifyGuardians,
    this.onFindHospitals,
  });

  final TriageResult triageResult;
  final VoidCallback? onNotifyGuardians;
  final VoidCallback? onFindHospitals;

  @override
  Widget build(BuildContext context) {
    final (label, color, icon) = switch (triageResult.level) {
      AppConstants.triageEmergency => ('EMERGENCY', AppTheme.emergency, Icons.emergency),
      AppConstants.triageVisitHospital => ('VISIT HOSPITAL', AppTheme.warning, Icons.local_hospital),
      AppConstants.triageHomeCare => ('HOME CARE', AppTheme.success, Icons.home),
      _ => ('ASSESSMENT', Colors.grey, Icons.info),
    };

    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: color.withValues(alpha: 0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 28),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            if (triageResult.explanation != null) ...[
              const SizedBox(height: 12),
              Text(triageResult.explanation!, style: const TextStyle(fontSize: 14)),
            ],
            if (triageResult.nextSteps.isNotEmpty) ...[
              const SizedBox(height: 12),
              const Text('Next Steps:', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              ...triageResult.nextSteps.map((step) => Padding(
                    padding: const EdgeInsets.only(left: 8, top: 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('  \u2022  '),
                        Expanded(child: Text(step, style: const TextStyle(fontSize: 13))),
                      ],
                    ),
                  )),
            ],
            const SizedBox(height: 16),
            // Action buttons
            if (triageResult.level == AppConstants.triageEmergency &&
                onNotifyGuardians != null)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: onNotifyGuardians,
                  icon: const Icon(Icons.notifications_active),
                  label: const Text('Notify Guardians'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.emergency,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            if (triageResult.level != AppConstants.triageHomeCare &&
                onFindHospitals != null) ...[
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: onFindHospitals,
                  icon: const Icon(Icons.local_hospital),
                  label: const Text('Find Nearby Hospitals'),
                ),
              ),
            ],
            // Mandatory disclaimer (SRS FR-014)
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                triageResult.disclaimer,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade700,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
