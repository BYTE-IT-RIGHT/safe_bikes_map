import 'package:get_it/get_it.dart';
import 'package:safe_bikes_map/dashboard/domain/i_route_engine_repository.dart';
import 'package:safe_bikes_map/dashboard/infrastructure/route_enginge_repository.dart';
import 'package:safe_bikes_map/geolocalization/domain/i_geolocalization_repository.dart';
import 'package:safe_bikes_map/geolocalization/infrastructure/geolocalization_repository.dart';
import 'package:safe_bikes_map/local_storage/domain/i_local_storage_repository.dart';
import 'package:safe_bikes_map/local_storage/infrastructure/local_storage_repository.dart';
import 'package:safe_bikes_map/navigation/app_router.dart';

final getIt = GetIt.instance;

void diInit() {
  getIt.registerLazySingleton(() => AppRouter());
  getIt.registerLazySingleton<ILocalStorageRepository>(
      () => LocalStorageRepository());
  getIt.registerLazySingleton<IRouteEngineRepository>(
      () => RouteEngingeRepository());
  getIt.registerLazySingleton<IGeolocalizationRepository>(() => GeolocalizationRepository());
}
