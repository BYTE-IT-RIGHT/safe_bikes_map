part of 'route_engine_cubit.dart';

@freezed
class RouteEngineState with _$RouteEngineState {
  const factory RouteEngineState({
    @Default(false) bool toDestinationSelected,
    @Default(true) bool fromDestinationSelected,
    LatLng? startPoint,
    LatLng? endPoint,
    @Default({}) Set<Marker> markers,
  }) = _RouteEngineState;
}
