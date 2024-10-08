import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safe_bikes_map/common/domain/failure.dart';
import 'package:safe_bikes_map/dashboard/domain/i_route_engine_repository.dart';
import 'package:http/http.dart' as http;
import 'package:safe_bikes_map/dashboard/domain/polyline_response.dart';
import 'dart:math' as math;

import 'package:safe_bikes_map/settings/domain/Settings.dart';

class RouteEngingeRepository implements IRouteEngineRepository {
  @override
  Future<Either<Failure, PolylineResponse>> getPolyline(
      LatLng startPoint, LatLng endPoint,
      {required Settings settings}) async {
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
        'directions_options': {
          'units': 'kilometers',
        },
        'costing_options': {
          'bicycle': {
            'shortest': settings.fastestRoute,
            'use_roads': settings.avoidHighTraficRoads.getApiValue(false),
            'use_hills': settings.avoidHills.getApiValue(false),
            'avoid_bad_surfaces': settings.avoidBadSurface.getApiValue(true),
            'bicycle_type': settings.bikeType.getBikeByType(),
          },
        },
        'language': 'pl-PL'
      };

      final response = await http.post(
          Uri.parse('http://165.227.244.153/route'),
          body: jsonEncode(body));
      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);
        final pointLatLng = _decodePolyline(decodedJson);
        final latLeng = pointLatLng.map((e) => LatLng(e[0], e[1])).toList();
        final time = decodedJson['trip']['summary']['time'];
        final nextManuver =
            decodedJson['trip']['legs'][0]['maneuvers'][0]['instruction'];
        final normalizedTimeInSeconds = (time as double).toInt();
        return right(PolylineResponse(
            nextManuver: nextManuver,
            arivalTime: normalizedTimeInSeconds,
            polyline: Polyline(
              polylineId: const PolylineId('Route'),
              points: latLeng,
              width: 5,
              color: Colors.blue,
            )));
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
}
