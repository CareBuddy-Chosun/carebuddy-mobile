import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/l10n/app_strings.dart';
import '../providers/hospital_provider.dart';
import '../widgets/hospital_card.dart';

class HospitalScreen extends ConsumerStatefulWidget {
  const HospitalScreen({super.key, this.triageLevel, this.department});

  final String? triageLevel;
  final String? department;

  @override
  ConsumerState<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends ConsumerState<HospitalScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(hospitalProvider.notifier).loadNearby(
            triageLevel: widget.triageLevel,
            department: widget.department,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(hospitalProvider);
    final t = ref.watch(stringsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.hospitalsTitle),
        actions: [
          if (state.searchRadiusKm != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  t.radiusKm(state.searchRadiusKm!.toStringAsFixed(0)),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ),
        ],
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.error != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(state.error!, textAlign: TextAlign.center),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => ref
                              .read(hospitalProvider.notifier)
                              .loadNearby(
                                triageLevel: widget.triageLevel,
                                department: widget.department,
                              ),
                          child: Text(t.retry),
                        ),
                      ],
                    ),
                  ),
                )
              : state.hospitals.isEmpty
                  ? Center(child: Text(t.noHospitalsNearby))
                  : ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: state.hospitals.length,
                      separatorBuilder: (context, i) =>
                          const SizedBox(height: 8),
                      itemBuilder: (context, i) {
                        return HospitalCard(hospital: state.hospitals[i]);
                      },
                    ),
    );
  }
}
