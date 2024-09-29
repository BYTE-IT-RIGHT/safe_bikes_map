import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_bikes_map/dashboard/application/route_enginge_cubit/route_engine_cubit.dart';

class EstimationsBar extends StatelessWidget {
  const EstimationsBar({super.key});

  String convertSecondsToHoursAndMinutes(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;

    return "${hours == 0 ? '' : '${hours}g'} ${minutes}m";
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteEngineCubit, RouteEngineState>(
      builder: (context, state) => Container(
          color: Colors.blue,
          height: 138,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text.rich(
                TextSpan(children: [
                  const TextSpan(text: 'Czas do celu'),
                  TextSpan(
                      text: convertSecondsToHoursAndMinutes(
                          state.estimatedArivalTime ?? 0),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 26)),
                ]),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              )
            ]),
          )),
    );
  }
}
