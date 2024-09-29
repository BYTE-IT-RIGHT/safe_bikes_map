import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:safe_bikes_map/constants/Secrets.dart';
import 'package:safe_bikes_map/dashboard/application/route_enginge_cubit/route_engine_cubit.dart';

class SelectLocation extends StatefulWidget {
  final bool isSelected;
  final String? text;
  final String defaultText;
  final Function(Prediction) onTap;
  final Widget prefix;
  final Color color;
  final FocusNode focusNode;
  final TextEditingController controller;
  final bool enableMyLocation;
  final Function? onMyLocationClick;
  const SelectLocation(
      {super.key,
      required this.isSelected,
      required this.text,
      required this.defaultText,
      required this.onTap,
      required this.prefix,
      required this.color,
      required this.focusNode,
      required this.controller,
      required this.enableMyLocation,
      this.onMyLocationClick});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteEngineCubit, RouteEngineState>(
        builder: (context, state) => Padding(
              padding:
                  widget.isSelected ? EdgeInsets.zero : const EdgeInsets.all(1),
              child: Row(
                children: [
                  widget.prefix,
                  Expanded(
                    child: GooglePlaceAutoCompleteTextField(
                        textEditingController: widget.controller,
                        googleAPIKey: Secrets.googleApiKey,
                        countries: const ['pl'],
                        language: 'pl',
                        focusNode: widget.focusNode,
                        boxDecoration: const BoxDecoration(
                          border: null,
                        ),
                        textStyle: TextStyle(
                            color: widget.controller.text == 'TWOJA LOKALIZACJA'
                                ? Colors.blue
                                : Colors.black),
                        itemClick: (postalCodeResponse) =>
                            widget.onTap(postalCodeResponse),
                        inputDecoration: InputDecoration(
                            hintText: widget.defaultText,
                            hintStyle: TextStyle(
                                color: Colors.black.withOpacity(
                                    widget.controller.text.isEmpty ? 0.5 : 1)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide()),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: widget.color, width: 2)),
                            suffixIcon: widget.enableMyLocation
                                ? RawMaterialButton(
                                    shape: const CircleBorder(),
                                    onPressed: () =>
                                        widget.onMyLocationClick!(),
                                    child: Icon(
                                      Icons.my_location_outlined,
                                      color: state.useUserLocalization
                                          ? Colors.blue
                                          : Colors.black.withOpacity(0.4),
                                    ),
                                  )
                                : null)),
                  ),
                ],
              ),
            ));
  }
}
