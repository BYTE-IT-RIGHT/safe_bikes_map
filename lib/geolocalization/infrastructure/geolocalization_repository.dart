import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:safe_bikes_map/common/domain/failure.dart';
import 'package:safe_bikes_map/geolocalization/domain/i_geolocalization_repository.dart';

class GeolocalizationRepository implements IGeolocalizationRepository {
  @override
  Future<Either<Failure, Stream<Position>>> determinePosition() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        log('serviceEnabled: $serviceEnabled');
        return left(const Failure.unexpected());
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          log('LocationPermission.denied');
          return left(const Failure.unexpected());
        }
      }

      if (permission == LocationPermission.deniedForever) {
        log('LocationPermission.deniedForever');
        return left(const Failure.unexpected());
      }

      final positionStream = Geolocator.getPositionStream();
      return right(positionStream);
    } catch (e) {
      log('unexpected error while determinePosition: $e');
      return left(const Failure.unexpected());
    }
  }
}
