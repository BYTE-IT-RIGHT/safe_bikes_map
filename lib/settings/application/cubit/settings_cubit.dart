import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:safe_bikes_map/settings/domain/Settings.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(const SettingsState(Settings(
          bikeType: 1,
          avoidBadSurface: SettingOption.medium,
          avoidHighTraficRoads: SettingOption.medium,
          avoidHills: SettingOption.medium,
        )));

  void updateSettings(Settings newSettings) =>
      emit(state.copyWith(settings: newSettings));
}
