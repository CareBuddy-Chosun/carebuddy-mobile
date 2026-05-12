import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_theme.dart';

class EmergencyBanner extends StatelessWidget {
  const EmergencyBanner({
    super.key,
    this.onNotifyGuardians,
    this.onFindHospitals,
  });

  final VoidCallback? onNotifyGuardians;
  final VoidCallback? onFindHospitals;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppTheme.emergency,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          const Text(
            'EMERGENCY DETECTED',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () => launchUrl(Uri.parse('tel:911')),
                icon: const Icon(Icons.phone, size: 18),
                label: const Text('Call 911'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppTheme.emergency,
                ),
              ),
              if (onNotifyGuardians != null) ...[
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: onNotifyGuardians,
                  icon: const Icon(Icons.notifications_active, size: 18),
                  label: const Text('Notify'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withValues(alpha: 0.2),
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
