

### A package to use local image, network image and svg file plus customization in google_maps_flutter marker icon.
 
<img src="https://user-images.githubusercontent.com/79679398/131233083-b58f740e-662a-485e-a860-16f50ec9cf5c.jpg" width="650">

# Get started
## Add dependency

```dart
dependencies:
  marker_icon: ^0.6.1
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


### svgAsset : a svg icon marker from your asset folder.
### pictureAsset : a picture(png,jpeg,etc...) icon marker from your asset folder.
### pictureAssetWithCenterText : a picture(png,jpeg,etc...) icon marker from your asset folder With Center text.
### circleCanvasWithText : a circle canvas with center text.
### downloadResizePicture : a picture(png,jpeg,etc...) icon marker from internet.
### downloadResizePictureCircle : a rounded picture(png,jpeg,etc...) icon marker with border from internet.



