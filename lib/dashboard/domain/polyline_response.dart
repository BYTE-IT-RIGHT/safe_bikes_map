import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolylineResponse {
  final int arivalTime;
  final Polyline polyline;

  const PolylineResponse({required this.arivalTime, required this.polyline});
}