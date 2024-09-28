import 'package:hive_flutter/adapters.dart';
import 'package:safe_bikes_map/local_storage/domain/i_local_storage_repository.dart';

class LocalStorageRepository implements ILocalStorageRepository {
  late final Box box;

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox('HackYeah2024');
  }
}
