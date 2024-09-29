import 'package:flutter/material.dart';
import 'package:safe_bikes_map/dashboard/application/route_enginge_cubit/route_engine_cubit.dart';
import 'package:safe_bikes_map/settings/presentation/bike_selection.dart';
import 'package:safe_bikes_map/settings/presentation/settings_row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBottomSheet extends StatelessWidget {
  final RouteEngineCubit cubit;
  const SettingsBottomSheet({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<RouteEngineCubit, RouteEngineState>(
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                
                children: [
                const Text(
                  'Najszybsza trasa',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Switch(
                  value: state.settings.fastestRoute,
                  onChanged: (v) => context
                      .read<RouteEngineCubit>()
                      .updateSettings(state.settings.copyWith(
                          fastestRoute: !state.settings.fastestRoute)),
                  activeColor: Colors.green,
                ),
                AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: !state.settings.fastestRoute
                        ? Column(children: [
                            BikeSelection(
                                alreadySelected: state.settings.bikeType,
                                onSelect: (v) => context
                                    .read<RouteEngineCubit>()
                                    .updateSettings(
                                        state.settings.copyWith(bikeType: v)),
                                text: 'Rodzaj roweru'),
                            SettingsRow(
                                alreadySelected: state.settings.avoidBadSurface,
                                onSelect: (v) => context
                                    .read<RouteEngineCubit>()
                                    .updateSettings(state.settings
                                        .copyWith(avoidBadSurface: v)),
                                text: 'Unikaj złych nawierzchni'),
                            SettingsRow(
                                alreadySelected:
                                    state.settings.avoidHighTraficRoads,
                                onSelect: (v) => context
                                    .read<RouteEngineCubit>()
                                    .updateSettings(state.settings
                                        .copyWith(avoidHighTraficRoads: v)),
                                text: 'unikaj ruchliwych dróg '),
                            SettingsRow(
                                alreadySelected: state.settings.avoidHills,
                                onSelect: (v) => context
                                    .read<RouteEngineCubit>()
                                    .updateSettings(
                                        state.settings.copyWith(avoidHills: v)),
                                text: 'Unikaj wzniesień'),
                          ])
                        : const SizedBox())
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
