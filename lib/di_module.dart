import 'package:get_it/get_it.dart';
import 'package:safe_bikes_map/navigation/app_router.dart';

final getIt = GetIt.instance;

void diInit(){
  getIt.registerLazySingleton(() => AppRouter());
}