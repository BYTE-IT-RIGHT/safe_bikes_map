part of 'route_engine_cubit.dart';

@freezed
class RouteEngineState with _$RouteEngineState {
  const factory RouteEngineState({
   @Default(false) bool toDestinationSelected,
   @Default(false) bool fromDestinationSelected,
    LatLng? startPoint,
    LatLng? endPoint,
  }) = _RouteEngineState;
}
