import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safe_bikes_map/dashboard/domain/i_route_engine_repository.dart';

part 'route_engine_state.dart';
part 'route_engine_cubit.freezed.dart';

class RouteEngineCubit extends Cubit<RouteEngineState> {
  final IRouteEngineRepository routeEngineRepository;
  RouteEngineCubit({
    required this.routeEngineRepository,
  }) : super(const RouteEngineState());

  void addStartPoint(LatLng v) => state.copyWith(startPoint: v);

  void addEndPoint(LatLng v) => state.copyWith(endPoint: v);

  void getPolyline() async {
    if (state.startPoint != null && state.endPoint != null) {
      routeEngineRepository.getPolyline(state.startPoint!, state.endPoint!);
    }
  }
}
