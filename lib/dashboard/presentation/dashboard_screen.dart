import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_bikes_map/dashboard/application/geolocalization_cubit/geolocalization_cubit.dart';
import 'package:safe_bikes_map/dashboard/application/route_enginge_cubit/route_engine_cubit.dart';
import 'package:safe_bikes_map/dashboard/domain/i_route_engine_repository.dart';
import 'package:safe_bikes_map/dashboard/presentation/widget/app_navigation_bar.dart';
import 'package:safe_bikes_map/dashboard/presentation/widget/estimations_bar.dart';
import 'package:safe_bikes_map/dashboard/presentation/widget/settings_bottom_sheet.dart';
import 'package:safe_bikes_map/di_module.dart';
import 'package:safe_bikes_map/geolocalization/domain/i_geolocalization_repository.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(50.07099433580664, 19.935496555962),
    zoom: 10,
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => RouteEngineCubit(
                  routeEngineRepository: getIt<IRouteEngineRepository>())
                ..init()),
          BlocProvider(
              create: (context) => GeolocalizationCubit(
                  iGeolocalizationRepository:
                      getIt<IGeolocalizationRepository>())
                ..init())
        ],
        child: BlocBuilder<RouteEngineCubit, RouteEngineState>(
          builder: (context, routeEngingeState) =>
              BlocListener<GeolocalizationCubit, GeolocalizationState>(
            listener: (context, geolocaliaztionState) {
              geolocaliaztionState.whenOrNull(
                data: (data) {
                  context.read<RouteEngineCubit>().updateUserPosition(data);
                  if (routeEngingeState.useUserLocalization) {
                    context.read<RouteEngineCubit>().getPolyline();
                  }
                },
              );
            },
            child: Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: routeEngingeState.navigationEnabled
                          ? const EstimationsBar()
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AppNavigationBar(
                                onMyLocationClick: () => context
                                    .read<RouteEngineCubit>()
                                    .useUserLocalization(),
                              )),
                    ),
                    Expanded(
                      child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: _kGooglePlex,
                        polylines: routeEngingeState.polylines,
                        markers: routeEngingeState.markers,
                        myLocationButtonEnabled: false,
                        onTap: (argument) {
                          if (routeEngingeState.fromDestinationSelected ||
                              (!routeEngingeState.fromDestinationSelected &&
                                  !routeEngingeState.toDestinationSelected)) {
                            if (routeEngingeState.useUserLocalization) {
                              return;
                            }
                            routeEngingeState.focusNodeFromDestination
                                .requestFocus();
                            context
                                .read<RouteEngineCubit>()
                                .addStartPoint(argument);
                          }
                          if (routeEngingeState.toDestinationSelected) {
                            context
                                .read<RouteEngineCubit>()
                                .addEndPoint(argument);
                          }
                        },
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 50),
                    (routeEngingeState.startPoint != null &&
                            routeEngingeState.endPoint != null)
                        ? FloatingActionButton(
                            backgroundColor: routeEngingeState.navigationEnabled
                                ? Colors.red
                                : Colors.blue,
                            foregroundColor: Colors.white,
                            onPressed: () => context
                                .read<RouteEngineCubit>()
                                .enableNavigation(),
                            child: Icon(routeEngingeState.navigationEnabled
                                ? Icons.close
                                : Icons.navigation_outlined),
                          )
                        : const SizedBox(width: 50),
                    FloatingActionButton(
                      onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (ctx) => SettingsBottomSheet(
                          cubit: context.read<RouteEngineCubit>(),
                        ),
                      ),
                      child: const Icon(Icons.settings),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
