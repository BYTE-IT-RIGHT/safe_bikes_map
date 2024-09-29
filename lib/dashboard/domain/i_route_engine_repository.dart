import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safe_bikes_map/common/domain/failure.dart';

abstract class IRouteEngineRepository {
  Future<Either<Failure, Polyline>> getPolyline(
    LatLng startPoint,
    LatLng endPoint,
  );
}
