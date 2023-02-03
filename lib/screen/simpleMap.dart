import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleMap extends StatefulWidget {
  const SimpleMap({Key? key}) : super(key: key);

  @override
  State<SimpleMap> createState() => _SimpleMapState();
}

class _SimpleMapState extends State<SimpleMap> {
  static final LatLng _kMapCenter = LatLng(19.018255973653343, 72.84793849278007);

  static final CameraPosition _kInitialPosition = CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps Demo'),
      ),
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        mapType: MapType.terrain,
      ),
    );
  }
}

// String keytool="keytool -list -v -keystore "c:\users\123\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android";
// Sha1 key 68:14:68:49:E9:10:07:60:AC:66:AF:12:3C:7D:0B:0C:76:AF:4D:95
