import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class IRouteEngineRepository {
  Future<Polyline> getPolyline(
    LatLng startPoint,
    LatLng endPoint,
  );
}
