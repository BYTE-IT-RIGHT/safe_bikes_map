import 'package:dartz/dartz.dart';
import 'package:safe_bikes_map/common/domain/failure.dart';
import 'package:geolocator/geolocator.dart';

abstract class IGeolocalizationRepository {
  Future<Either<Failure, Stream<Position>>> determinePosition();
}