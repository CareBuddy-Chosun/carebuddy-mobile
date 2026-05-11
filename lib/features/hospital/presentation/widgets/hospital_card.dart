import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../shared/models/hospital_models.dart';

class HospitalCard extends StatelessWidget {
  const HospitalCard({super.key, required this.hospital});

  final Hospital hospital;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.local_hospital, color: AppTheme.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    hospital.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Text(
                  '${hospital.distanceKm.toStringAsFixed(1)} km',
                  style: const TextStyle(
                      color: AppTheme.textSecondary, fontSize: 13),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(hospital.address,
                style: const TextStyle(
                    color: AppTheme.textSecondary, fontSize: 13)),
            if (hospital.operatingHours != null) ...[
              const SizedBox(height: 4),
              Text('Hours: ${hospital.operatingHours}',
                  style: const TextStyle(
                      color: AppTheme.textSecondary, fontSize: 12)),
            ],
            if (hospital.specialties.isNotEmpty) ...[
              const SizedBox(height: 8),
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: [
                  if (hospital.hasEmergencyRoom)
                    Chip(
                      label: const Text('ER'),
                      backgroundColor: AppTheme.emergency.withValues(alpha: 0.1),
                      labelStyle: const TextStyle(
                          color: AppTheme.emergency, fontSize: 11),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    ),
                  ...hospital.specialties.map((s) => Chip(
                        label: Text(s),
                        backgroundColor: Colors.grey.shade100,
                        labelStyle: const TextStyle(fontSize: 11),
                        materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                      )),
                ],
              ),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                if (hospital.phone != null)
                  OutlinedButton.icon(
                    onPressed: () =>
                        launchUrl(Uri.parse('tel:${hospital.phone}')),
                    icon: const Icon(Icons.phone, size: 16),
                    label: const Text('Call'),
                  ),
                if (hospital.phone != null) const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: () {
                    if (hospital.mapsUrl.isNotEmpty) {
                      launchUrl(Uri.parse(hospital.mapsUrl),
                          mode: LaunchMode.externalApplication);
                    }
                  },
                  icon: const Icon(Icons.directions, size: 16),
                  label: const Text('Directions'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
