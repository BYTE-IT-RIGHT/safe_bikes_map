import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:safe_bikes_map/dashboard/domain/i_route_engine_repository.dart';

part 'route_engine_state.dart';
part 'route_engine_cubit.freezed.dart';

class RouteEngineCubit extends Cubit<RouteEngineState> {
  final IRouteEngineRepository routeEngineRepository;
  RouteEngineCubit({
    required this.routeEngineRepository,
  }) : super(RouteEngineState(
            fromDestinationController: TextEditingController(),
            toDestinationController: TextEditingController(),
            focusNodeFromDestination: FocusNode(),
            focusNodeToDestination: FocusNode()));

  void init() {
    state.focusNodeFromDestination.addListener(() {
      if (state.focusNodeFromDestination.hasFocus) {
        state.focusNodeToDestination.unfocus();
        emit(state.copyWith(
            fromDestinationSelected: true, toDestinationSelected: false));
      }
    });
    state.focusNodeToDestination.addListener(() {
      if (state.focusNodeToDestination.hasFocus) {
        state.focusNodeFromDestination.unfocus();
        emit(state.copyWith(
            toDestinationSelected: true, fromDestinationSelected: false));
      }
    });
  }

  void addStartPoint(LatLng v, {bool useUserLocalization = false}) async {
    final markers = Set<Marker>.from(state.markers);
    markers.removeWhere((element) => element.markerId.value == 'from');
    if (useUserLocalization) {
      final userMarker = state.markers
          .firstWhere((element) => element.markerId.value == 'user_position');
      emit(state.copyWith(startPoint: userMarker.position));
      return;
    }
    markers.add(Marker(markerId: const MarkerId('from'), position: v));
    emit(state.copyWith(
      startPoint: v,
      fromDestinationController: state.fromDestinationController
        ..text = v.toString(),
      markers: markers,
    ));
    if (state.endPoint != null) {
      await getPolyline();
    }
  }

  void addEndPoint(LatLng v) async {
    final markers = Set<Marker>.from(state.markers);
    markers.removeWhere((element) => element.markerId.value == 'to');
    markers.add(Marker(markerId: const MarkerId('to'), position: v));
    emit(state.copyWith(
        endPoint: v,
        toDestinationController: state.toDestinationController
          ..text = v.toString(),
        markers: markers));
    if (state.startPoint != null) {
      await getPolyline();
    }
  }

  Future<void> getPolyline({bool useUserPosition = false}) async {
    if ((state.startPoint != null || useUserPosition) &&
        state.endPoint != null) {
      final result = await routeEngineRepository.getPolyline(
          state.startPoint!, state.endPoint!);
      result.fold(
        (l) {},
        (r) => emit(state.copyWith(polylines: {r})),
      );
    }
  }

  void updateToDestinationText(Prediction prediction) => emit(state.copyWith(
      toDestinationController: state.toDestinationController
        ..text = prediction.description ?? ''));

  void updateFromDestinationText(Prediction prediction) {
    final latLang = LatLng(double.tryParse(prediction.lat ?? '') ?? 0.0,
        double.tryParse(prediction.lng ?? '') ?? 0.0);
    final markers = Set<Marker>.from(state.markers);
    markers.removeWhere((element) => element.markerId.value == 'from');
    markers.add(Marker(markerId: const MarkerId('from'), position: latLang));
    emit(state.copyWith(
        startPoint: latLang,
        fromDestinationController: state.fromDestinationController
          ..text = prediction.description ?? ''));
  }

  void updateUserPosition(Position newPosition) async {
    final markers = Set<Marker>.from(state.markers);
    markers.removeWhere((element) => element.markerId.value == 'user_position');
    final data = await rootBundle.load('assets/png/zielony-dot.png');
    final uint8list = data.buffer.asUint8List();
    markers.add(Marker(
        markerId: const MarkerId('user_position'),
        position: LatLng(newPosition.latitude, newPosition.longitude),
        icon: BitmapDescriptor.bytes(uint8list)));
    emit(state.copyWith(markers: markers));
  }

  void useUserLocalization() {
    if (state.startPoint != null) {
      final markers = Set<Marker>.from(state.markers);
      markers.removeWhere((element) => element.markerId.value == 'from');
      emit(state.copyWith(startPoint: null, markers: markers));
    }
    emit(state.copyWith(
        useUserLocalization: !state.useUserLocalization,
        fromDestinationController: state.fromDestinationController
          ..text = !state.useUserLocalization ? 'TWOJA LOKALIZACJA' : ''));
  }
}
