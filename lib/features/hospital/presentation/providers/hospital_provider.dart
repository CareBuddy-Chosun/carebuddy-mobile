import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/network/hospital_repository.dart';
import '../../../../shared/models/hospital_models.dart';

class HospitalState {
  const HospitalState({
    this.hospitals = const [],
    this.isLoading = false,
    this.error,
    this.searchRadiusKm,
  });

  final List<Hospital> hospitals;
  final bool isLoading;
  final String? error;
  final double? searchRadiusKm;

  HospitalState copyWith({
    List<Hospital>? hospitals,
    bool? isLoading,
    String? error,
    double? searchRadiusKm,
  }) =>
      HospitalState(
        hospitals: hospitals ?? this.hospitals,
        isLoading: isLoading ?? this.isLoading,
        error: error,
        searchRadiusKm: searchRadiusKm ?? this.searchRadiusKm,
      );
}

final hospitalProvider =
    StateNotifierProvider<HospitalNotifier, HospitalState>((ref) {
  return HospitalNotifier(ref);
});

class HospitalNotifier extends StateNotifier<HospitalState> {
  HospitalNotifier(this._ref) : super(const HospitalState());

  final Ref _ref;

  Future<void> loadNearby({String? triageLevel}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      double latitude;
      double longitude;

      if (AppConstants.useMockBackend) {
        // Skip real GPS in offline/mock mode and use Seoul as the demo origin.
        latitude = 37.5665;
        longitude = 126.9780;
      } else {
        final permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          final requested = await Geolocator.requestPermission();
          if (requested == LocationPermission.denied ||
              requested == LocationPermission.deniedForever) {
            state = state.copyWith(
              isLoading: false,
              error:
                  'Location permission denied. Please enable it in Settings.',
            );
            return;
          }
        }
        final position = await Geolocator.getCurrentPosition();
        latitude = position.latitude;
        longitude = position.longitude;
      }

      final repo = _ref.read(hospitalRepositoryProvider);
      final response = await repo.searchNearby(
        latitude: latitude,
        longitude: longitude,
        triageLevel: triageLevel,
      );

      state = state.copyWith(
        hospitals: response.hospitals,
        searchRadiusKm: response.searchRadiusKm,
        isLoading: false,
      );
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, error: e.userMessage);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
