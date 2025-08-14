import 'package:flutter/material.dart';
import 'package:shelter_finder/Pages/second_page.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Epsg3857NoRepeat extends Epsg3857 {
  const Epsg3857NoRepeat();

  @override
  bool get replicatesWorldLongitude => false;
}
// functions and methods

class MapPage extends StatelessWidget {
  const MapPage({super.key});



@override

 Widget build(BuildContext context){
return Scaffold(
   appBar: AppBar(
    title: Text("Map Page"),
   ),
      drawer: Drawer(
            backgroundColor: const Color.fromARGB(255, 102, 166, 219),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  onTap: () {
                    Navigator.pushNamed(context, '/first');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text("Map"),
                  onTap: () {
                    Navigator.pushNamed(context, '/mapPage');
                  },
                ),
              ],
            ),
          ),

 body: FlutterMap(
    mapController: MapController(),
    options: MapOptions(
      cameraConstraint: const CameraConstraint.containLatitude(),
      crs: const Epsg3857NoRepeat(),
    ),
    
    children: [
      TileLayer(
  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
      ),

      PolygonLayer(
        drawInSingleWorld: true,
        polygons: [
          Polygon(
      points: [LatLng(30, 40), LatLng(20, 50), LatLng(25, 45)],
      color: Colors.blue,
    ),
        ],  
      ),
      PolylineLayer(
        drawInSingleWorld: true,
  polylines: [
    Polyline(
      points: [LatLng(30, 40), LatLng(20, 50), LatLng(25, 45)],
      color: Colors.blue,
    ),
  ],
),
    ],
 ), 
);

 }
}