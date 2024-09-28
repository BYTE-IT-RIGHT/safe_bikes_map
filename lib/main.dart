import 'package:flutter/material.dart';
import 'package:safe_bikes_map/di_module.dart';
import 'package:safe_bikes_map/local_storage/domain/i_local_storage_repository.dart';
import 'package:safe_bikes_map/navigation/app_router.dart';

void main() async {
  diInit();
  await getIt<ILocalStorageRepository>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: getIt<AppRouter>().config(),
      title: 'Safe bikes map',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
