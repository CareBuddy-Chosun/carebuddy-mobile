import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/hospital_provider.dart';
import '../../../../core/constants/app_theme.dart';

class HospitalScreen extends ConsumerStatefulWidget {
  const HospitalScreen({super.key});

  @override
  ConsumerState<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends ConsumerState<HospitalScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(hospitalProvider.notifier).loadNearby();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(hospitalProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Nearby Hospitals')),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.error != null
              ? Center(child: Text(state.error!))
              : state.hospitals.isEmpty
                  ? const Center(child: Text('No hospitals found nearby.'))
                  : ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: state.hospitals.length,
                      separatorBuilder: (context, i) => const SizedBox(height: 8),
                      itemBuilder: (context, i) {
                        final h = state.hospitals[i];
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
                                    const Icon(Icons.local_hospital,
                                        color: AppTheme.primary),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        h['name'] as String,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Text(
                                      '${h['distance_km']} km',
                                      style: const TextStyle(
                                          color: AppTheme.textSecondary,
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(h['address'] as String,
                                    style: const TextStyle(
                                        color: AppTheme.textSecondary,
                                        fontSize: 13)),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    if (h['phone'] != null)
                                      OutlinedButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(Icons.phone, size: 16),
                                        label: const Text('Call'),
                                      ),
                                    const SizedBox(width: 8),
                                    OutlinedButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(Icons.directions, size: 16),
                                      label: const Text('Directions'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
    );
  }
}
