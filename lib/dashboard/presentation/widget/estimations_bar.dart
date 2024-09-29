import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_bikes_map/dashboard/application/route_enginge_cubit/route_engine_cubit.dart';

class EstimationsBar extends StatelessWidget {
  const EstimationsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteEngineCubit, RouteEngineState>(
      builder: (context, state) => Container(
          color: Colors.blue,
          height: 138,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (state.nextManuver != null)
                      Flexible(
                        child: Text(
                          state.nextManuver.toString(),
                          textAlign: TextAlign.center,
                          style:
                              const TextStyle(color: Colors.white, fontSize: 34),
                        ),
                      ),
                  ]),
            ),
          )),
    );
  }
}
