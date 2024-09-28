part of 'route_engine_cubit.dart';

@freezed
class RouteEngineState with _$RouteEngineState {
  const factory RouteEngineState({
    LatLng? startPoint,
    LatLng? endPoint,
  }) = _RouteEngineState;
}
