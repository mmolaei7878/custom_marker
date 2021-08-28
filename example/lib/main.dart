import 'package:google_map_custom_marker_icon/google_map_custom_marker_icon.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Set<Marker> _markers = <Marker>{};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(32.4279, 53.6880), zoom: 15),
        markers: _markers,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: FittedBox(child: Text('Add Markers')),
        onPressed: () async {
          _markers.add(
            Marker(
              markerId: MarkerId('circleCanvasWithText'),
              icon: await GoogleMapCustomMarkerIcon.circleCanvasWithText(
                  size: Size(80, 80),
                  text: 'Hi',
                  circleColor: Colors.red,
                  fontColor: Colors.white,
                  fontSize: 22),
              position: LatLng(35.8400, 50.9391),
            ),
          );

          _markers.add(
            Marker(
              markerId: MarkerId('downloadResizePicture'),
              icon: await GoogleMapCustomMarkerIcon.downloadResizePicture(
                  url:
                      'https://thegpscoordinates.net/photos/la/tehran_iran_5u679ezi8f.jpg',
                  imageSize: 150),
              position: LatLng(35.6892, 51.3890),
            ),
          );
          _markers.add(
            Marker(
              markerId: MarkerId('downloadResizePictureCircle'),
              icon: await GoogleMapCustomMarkerIcon.downloadResizePictureCircle(
                  'https://thegpscoordinates.net/photos/la/tehran_iran_5u679ezi8f.jpg',
                  size: 150,
                  addBorder: true,
                  borderColor: Colors.white,
                  borderSize: 15),
              position: LatLng(34.6416, 50.8746),
            ),
          );

          setState(() {});
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
