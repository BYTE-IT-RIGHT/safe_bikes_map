import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_bikes_map/dashboard/application/cubit/route_engine_cubit.dart';
import 'package:safe_bikes_map/dashboard/presentation/widget/select_location.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  Row _buildPrefixRow(
      {required IconData firstIcon,
      required IconData secondIcon,
      required Color color}) {
    return Row(children: [
      Icon(
        firstIcon,
        size: 16,
        color: color,
      ),
      Icon(
        secondIcon,
        size: 16,
        color: color,
      ),
      const SizedBox(width: 8),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteEngineCubit, RouteEngineState>(
      builder: (context, state) => Column(children: [
        SelectLocation(
            isSelected: state.fromDestinationSelected,
            text: state.startPoint?.toString(),
            defaultText: 'Skąd jedziemy...',
            color: Colors.blue,
            prefix: _buildPrefixRow(
                firstIcon: Icons.arrow_forward,
                secondIcon: Icons.circle,
                color: Colors.blue),
            onTap: () =>
                context.read<RouteEngineCubit>().selectFromDestination()),
        const SizedBox(height: 8),
        SelectLocation(
          isSelected: state.toDestinationSelected,
          text: state.endPoint?.toString(),
          defaultText: 'Dokąd jedziemy...',
          color: Colors.green,
          prefix: _buildPrefixRow(
              firstIcon: Icons.circle,
              secondIcon: Icons.arrow_back,
              color: Colors.green),
          onTap: () => context.read<RouteEngineCubit>().selectToDestination(),
        ),
      ]),
    );
  }
}
