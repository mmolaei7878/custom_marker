import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'MyMarker.dart';

class WidgetToMarker extends StatefulWidget {
  const WidgetToMarker({Key? key}) : super(key: key);

  @override
  _WidgetToMarkerState createState() => _WidgetToMarkerState();
}

class _WidgetToMarkerState extends State<WidgetToMarker> {
  Set<Marker> _markers = <Marker>{};
  final GlobalKey globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Stack(
            children: [
              // you have to add your widget in the same widget tree
              // add your google map in stack
              // declare your marker before google map
              // pass your global key to your widget
              MyMarker(globalKey),
              Positioned.fill(
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(target: LatLng(32.4279, 53.6880), zoom: 15),
                  markers: _markers,
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            label: FittedBox(child: Text('Add Markers')),
            onPressed: () async {
              // call widgetToIcon Function and pass the same global key
              _markers.add(
                Marker(
                  markerId: MarkerId('circleCanvasWithText'),
                  icon: await MarkerIcon.widgetToIcon(globalKey),
                  position: LatLng(35.8400, 50.9391),
                ),
              );

              setState(() {});
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        ),
      ],
    );
  }
}
