import 'package:flutter/material.dart';
import 'package:safe_bikes_map/dashboard/presentation/widget/bike_selection.dart';
import 'package:safe_bikes_map/dashboard/presentation/widget/settings_row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_bikes_map/settings/application/cubit/settings_cubit.dart';

class SettingsBottomSheet extends StatelessWidget {
  const SettingsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BikeSelection(
                      alreadySelected: state.settings.bikeType,
                      onSelect: (v) => context
                          .read<SettingsCubit>()
                          .updateSettings(state.settings.copyWith(bikeType: v)),
                      text: 'Rodzaj roweru'),
                  SettingsRow(
                      alreadySelected: state.settings.avoidBadSurface,
                      onSelect: (v) => context
                          .read<SettingsCubit>()
                          .updateSettings(
                              state.settings.copyWith(avoidBadSurface: v)),
                      text: 'Unikaj złych nawierzchni'),
                  SettingsRow(
                      alreadySelected: state.settings.avoidHighTraficRoads,
                      onSelect: (v) => context
                          .read<SettingsCubit>()
                          .updateSettings(
                              state.settings.copyWith(avoidHighTraficRoads: v)),
                      text: 'unikaj ruchliwych dróg '),
                  SettingsRow(
                      alreadySelected: state.settings.avoidHills,
                      onSelect: (v) => context
                          .read<SettingsCubit>()
                          .updateSettings(
                              state.settings.copyWith(avoidHills: v)),
                      text: 'Unikaj wzniesień'),
                ]),
          ),
        ),
      ),
    );
  }
}
