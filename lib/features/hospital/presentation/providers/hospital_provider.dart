import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/network/dio_client.dart';

class HospitalState {
  const HospitalState({
    this.hospitals = const [],
    this.isLoading = false,
    this.error,
  });

  final List<Map<String, dynamic>> hospitals;
  final bool isLoading;
  final String? error;

  HospitalState copyWith({
    List<Map<String, dynamic>>? hospitals,
    bool? isLoading,
    String? error,
  }) =>
      HospitalState(
        hospitals: hospitals ?? this.hospitals,
        isLoading: isLoading ?? this.isLoading,
        error: error,
      );
}

final hospitalProvider =
    StateNotifierProvider<HospitalNotifier, HospitalState>((ref) {
  return HospitalNotifier(ref);
});

class HospitalNotifier extends StateNotifier<HospitalState> {
  HospitalNotifier(this._ref) : super(const HospitalState());

  final Ref _ref;

  Future<void> loadNearby() async {
    state = state.copyWith(isLoading: true);
    try {
      final permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.requestPermission();
      }

      final position = await Geolocator.getCurrentPosition();
      final dio = _ref.read(dioProvider);
      final response = await dio.get('/hospitals', queryParameters: {
        'lat': position.latitude,
        'lng': position.longitude,
      });

      final hospitals = (response.data as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();

      state = state.copyWith(hospitals: hospitals, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
