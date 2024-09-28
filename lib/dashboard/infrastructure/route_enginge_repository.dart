import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safe_bikes_map/dashboard/domain/i_route_engine_repository.dart';
import 'package:http/http.dart' as http;

class RouteEngingeRepository implements IRouteEngineRepository {
  @override
  Future<Polyline> getPolyline(
    LatLng startPoint,
    LatLng endPoint,
  ) async {
    final result = await http.post(Uri.parse(''));
    if (result.statusCode == 200) {
      print(result.body);
    }
    return const Polyline(polylineId: PolylineId('das'));
    //LineString.decode(bytes, format: WKB.geometry);
  }
}
