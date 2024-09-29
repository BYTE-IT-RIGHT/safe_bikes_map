part of 'geolocalization_cubit.dart';

@freezed
class GeolocalizationState with _$GeolocalizationState {
  const factory GeolocalizationState.initial() = _Initial;
  const factory GeolocalizationState.loading() = _Loading;
  const factory GeolocalizationState.data(Position position) = _Data;
}
