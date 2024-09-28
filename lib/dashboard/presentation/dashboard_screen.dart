import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_bikes_map/dashboard/application/cubit/route_engine_cubit.dart';
import 'package:safe_bikes_map/dashboard/domain/i_route_engine_repository.dart';
import 'package:safe_bikes_map/dashboard/presentation/widget/app_navigation_bar.dart';
import 'package:safe_bikes_map/di_module.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final Set<Marker> markers = {};
  final Set<Polyline> polylines = {};

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 5,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RouteEngineCubit(
          routeEngineRepository: getIt<IRouteEngineRepository>()),
      child: BlocBuilder<RouteEngineCubit, RouteEngineState>(
        builder: (context, state) => Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const Padding(
                    padding: EdgeInsets.all(8.0), child: AppNavigationBar()),
                Expanded(
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    polylines: polylines,
                    markers: markers,
                    onTap: (argument) {
                      if (state.fromDestinationSelected) {
                        context
                            .read<RouteEngineCubit>()
                            .addStartPoint(argument);
                      }
                      if (state.toDestinationSelected) {
                        context.read<RouteEngineCubit>().addEndPoint(argument);
                      }
                      // if (_firstPoint == null) {
                      //   setState(() {
                      //     markers.add(Marker(
                      //         markerId: const MarkerId('1'),
                      //         position: argument));

                      //   });
                      // } else if (_secondPoint == null) {
                      //   setState(() {
                      //     markers.add(Marker(
                      //         markerId: const MarkerId('2'),
                      //         position: argument));
                      //     polylines.add(Polyline(
                      //         polylineId: const PolylineId('12'),
                      //         points: [_firstPoint!, argument]));

                      //     _secondPoint = argument;
                      //   });
                      // }
                    },
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () => context.read<RouteEngineCubit>().getPolyline()),
        ),
      ),
    );
  }
}
