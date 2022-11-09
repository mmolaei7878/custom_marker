

# overview
A package to convert Widget, Local image, Netwok image, Svg file to BitmapDescriptor which can use in google_maps_flutter icon marker.
 
<img src="https://user-images.githubusercontent.com/79679398/131233083-b58f740e-662a-485e-a860-16f50ec9cf5c.jpg" width="650">

# Get started
## Add dependency

```dart
dependencies:
  marker_icon: ^1.0.0
```
## Add rounded marker icon with border from network image:

```dart
 onPressed: () async {
  markers.add(
  Marker( 
  icon: await MarkerIcon.downloadResizePictureCircle(
  'https://thegpscoordinates.net/photos/la/tehran_iran_5u679ezi8f.jpg',
   size: 150,
   addBorder: true,
   borderColor: Colors.white,
   borderSize: 15),
      ),
     );
   }
```


## 1. All other functions work the same above except widget to marker.


# Widget To Marker




### MyMap class hold your googleMap widget:

```dart

class MyMap extends StatefulWidget {
  const WidgetToMarker({Key? key}) : super(key: key);
  @override
  _WidgetToMarkerState createState() => _WidgetToMarkerState();
}
class _WidgetToMarkerState extends State<WidgetToMarker> {

  Set<Marker> _markers = <Marker>{};
  
  // declare a global key   
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
                  initialCameraPosition: CameraPosition(
                      target: LatLng(32.4279, 53.6880), zoom: 15),
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ],
    );
  }
}

```

### MyMarker class hold your widget that you want convert it to marker icon:

```dart

class MyMarker extends StatelessWidget {
  // declare a global key and get it trough Constructor

  MyMarker(this.globalKeyMyWidget);
  final GlobalKey globalKeyMyWidget;

  @override
  Widget build(BuildContext context) {
    // wrap your widget with RepaintBoundary and
    // pass your global key to RepaintBoundary
    return RepaintBoundary(
      key: globalKeyMyWidget,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 250,
            height: 180,
            decoration:
                BoxDecoration(color: Colors.black, shape: BoxShape.circle),
          ),
          Container(
              width: 220,
              height: 150,
              decoration:
                  BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.accessibility,
                    color: Colors.white,
                    size: 35,
                  ),
                  Text(
                    'Widget',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

```
### Now we have a marker from our custom widget
<img src="https://user-images.githubusercontent.com/79679398/131248711-1fb815cf-d266-490b-a1d1-c7cb5bfa932c.jpg" width="650">



# Functions:

* widgetToMarker : an icon marker from your custom widget.
* svgAsset : a svg icon marker from your asset folder.
* pictureAsset : a picture(png,jpeg,etc...) icon marker from your asset folder.
* pictureAssetWithCenterText : a picture(png,jpeg,etc...) icon marker from your asset folder With text.
* circleCanvasWithText : a circle canvas with center text.
* downloadResizePicture : a picture(png,jpeg,etc...) icon marker from internet.
* downloadResizePictureCircle : a rounded picture(png,jpeg,etc...) icon marker with border from internet.


