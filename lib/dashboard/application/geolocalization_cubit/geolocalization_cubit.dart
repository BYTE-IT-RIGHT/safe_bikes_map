import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:safe_bikes_map/geolocalization/domain/i_geolocalization_repository.dart';

part 'geolocalization_state.dart';
part 'geolocalization_cubit.freezed.dart';

class GeolocalizationCubit extends Cubit<GeolocalizationState> {
  final IGeolocalizationRepository iGeolocalizationRepository;
  GeolocalizationCubit({
    required this.iGeolocalizationRepository,
  }) : super(const GeolocalizationState.initial());
  late final StreamSubscription<Position> _positionSubscribtion;

  void init() async {
    final result = await iGeolocalizationRepository.determinePosition();
    result.fold(
        (l) {},
        (r) => _positionSubscribtion = r.listen((event) {
              emit(GeolocalizationState.data(event));
            }));
  }

  @override
  Future<void> close() async {
    await _positionSubscribtion.cancel();
    return super.close();
  }
}
