import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safe_bikes_map/common/domain/failure.dart';
import 'package:safe_bikes_map/dashboard/domain/i_route_engine_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as math;

class RouteEngingeRepository implements IRouteEngineRepository {
  @override
  Future<Either<Failure, Polyline>> getPolyline(
    LatLng startPoint,
    LatLng endPoint,
  ) async {
    try {
      final body = {
        'locations': [
          {
            'lat': startPoint.latitude,
            'lon': startPoint.longitude,
            'type': 'break'
          },
          {
            'lat': endPoint.latitude,
            'lon': endPoint.longitude,
            'type': 'break',
          }
        ],
        'costing': 'bicycle',
        'directions_options': {'units': 'kilometers'}
      };
      final response = await http.post(
          Uri.parse('http://165.227.244.153/route'),
          body: jsonEncode(body));
      if (response.statusCode == 200) {
        log('polyLine get success');
        final pointLatLng = _decodePolyline(jsonDecode(response.body));
        final latLeng = pointLatLng.map((e) => LatLng(e[0], e[1])).toList();
        log('polyLine get success $latLeng');
        return right(
            Polyline(polylineId: const PolylineId('Route'), points: latLeng));
      } else {
        log('error while getting polyLine status code: ${response.statusCode}');
        return left(const Failure.unexpected());
      }
    } catch (e) {
      log('unexpected error while getting polyLine: $e');
      return left(const Failure.unexpected());
    }
  }

  List<List<double>> _decodePolyline(Map<String, dynamic> data,
      {int precision = 6}) {
    String encodedShape = data['trip']['legs'][0]['shape'];
    int index = 0;
    int lat = 0;
    int lng = 0;
    List<List<double>> coordinates = [];
    int shift = 0;
    int result = 0;
    int byte;
    int latitudeChange;
    int longitudeChange;
    double factor = math.pow(10, precision).toDouble();

    while (index < encodedShape.length) {
      // Reset shift, result, and byte
      byte = shift = result = 0;

      do {
        byte = encodedShape.codeUnitAt(index++) - 63;
        result |= (byte & 0x1f) << shift;
        shift += 5;
      } while (byte >= 0x20);

      latitudeChange = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);

      shift = result = 0;

      do {
        byte = encodedShape.codeUnitAt(index++) - 63;
        result |= (byte & 0x1f) << shift;
        shift += 5;
      } while (byte >= 0x20);

      longitudeChange = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);

      lat += latitudeChange;
      lng += longitudeChange;

      coordinates.add([lat / factor, lng / factor]);
    }

    return coordinates;
  }

  // List<PointLatLng> _decodePolyline(Map<String, dynamic> data) {
  //   final polylinePoints = PolylinePoints();
  //   String encodedShape = data['trip']['legs'][0]['shape'];
  //   log(encodedShape);
  //   List<PointLatLng> result = polylinePoints.decodePolyline(encodedShape);
  //   return result;
  //   // List<List<double>> polyline = [];
  //   // int index = 0, len = encodedShape.length;
  //   // int lat = 0, lng = 0;

  //   // while (index < len) {
  //   //   int b, shift = 0, result = 0;
  //   //   do {
  //   //     b = encodedShape.codeUnitAt(index++) - 63;
  //   //     result |= (b & 0x1F) << shift;
  //   //     shift += 5;
  //   //   } while (b >= 0x20);
  //   //   int deltaLat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
  //   //   lat += deltaLat;

  //   //   shift = 0;
  //   //   result = 0;
  //   //   do {
  //   //     b = encodedShape.codeUnitAt(index++) - 63;
  //   //     result |= (b & 0x1F) << shift;
  //   //     shift += 5;
  //   //   } while (b >= 0x20);
  //   //   int deltaLng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
  //   //   lng += deltaLng;

  //   //   double finalLat = lat / 1E5;
  //   //   double finalLng = lng / 1E5;
  //   //   polyline.add([finalLat, finalLng]);
  //   // }

  //   // return polyline;
  // }
}
