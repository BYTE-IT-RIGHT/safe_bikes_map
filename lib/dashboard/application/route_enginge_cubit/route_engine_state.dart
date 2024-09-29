part of 'route_engine_cubit.dart';

@freezed
class RouteEngineState with _$RouteEngineState {
  const factory RouteEngineState({
    required TextEditingController toDestinationController,
    required TextEditingController fromDestinationController,
    required FocusNode focusNodeToDestination,
    required FocusNode focusNodeFromDestination,
    required Settings settings,
    int? estimatedArivalTime,
    @Default(false) bool navigationEnabled,
    @Default(false) bool useUserLocalization,
    @Default(false) bool fromDestinationSelected,
    @Default(false) bool toDestinationSelected,
    LatLng? startPoint,
    LatLng? endPoint,
    @Default({}) Set<Marker> markers,
    @Default({}) Set<Polyline> polylines,
  }) = _RouteEngineState;
}
