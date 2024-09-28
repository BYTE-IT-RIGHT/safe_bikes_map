import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safe_bikes_map/dashboard/domain/i_route_engine_repository.dart';
import 'package:http/http.dart' as http;

class RouteEngingeRepository implements IRouteEngineRepository {
  @override
  Future<Polyline> getPolyline(
    LatLng startPoint,
    LatLng endPoint,
  ) async {
    print('start');
    final body = {
      'locations': [
        {
          'lat': startPoint.latitude,
          'lon': startPoint.longitude,
          'type': 'break'
        },
        {'lat': endPoint.latitude, 'lon': endPoint.longitude, 'type': 'break'}
      ],
      'costing': 'bicycle',
      'directions_options': {'units': 'kilometers'}
    };

    final result = await http.post(Uri.parse('http://192.168.184.165:8002/route'), body: jsonEncode(body)).timeout(Duration(seconds: 3));
    if (result.statusCode == 200) {
      print(result.body);
    }
    return const Polyline(polylineId: PolylineId('das'));
    //LineString.decode(bytes, format: WKB.geometry);
  }
}
