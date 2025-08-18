import 'package:flutter/material.dart';
import 'package:shelter_finder/Pages/second_page.dart';
import 'package:shelter_finder/Read%20Data/get_shelter_name.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shelter_finder/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Epsg3857NoRepeat extends Epsg3857 {
  const Epsg3857NoRepeat();

  @override
  bool get replicatesWorldLongitude => false;
}
// functions and methods


class MapPage extends StatefulWidget {
  const MapPage({super.key});

@override
_MapPageState createState() => _MapPageState();
}


class _MapPageState extends State<MapPage> {
  List<Map<String, dynamic>> shelters = [];
  
  @override
  void initState() {
    super.initState();
    fetchShelterNames();
  }


// put the shlter info into a list
Future<void> fetchShelterNames() async {
  final snapshot = await FirebaseFirestore.instance.collection('shelters').get();
  setState(() {
      shelters = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    });
}



@override

 Widget build(BuildContext context){
if(shelters.isEmpty) {
  return const Scaffold (
    body: Center(child: CircularProgressIndicator())
    );
  }
List<Marker> markers = [
  for(int i = 0; i < shelters.length; i++)
    Marker(
          point: LatLng(shelters[i]['latitude'], shelters[i]['longitude']),
          width: 40,
          height: 40,
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text("Shelter Information"),
                  content: Text(shelters[i]['name']),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: Text("Close"),
                    ),
                  ],
                ),
              );
            },
            child: const Icon(
              Icons.location_on,
              color: Colors.red,
              size: 40,
            ),
          )
    )
  
];

return Scaffold(
   appBar: AppBar(
    title: Text("Map Page"),
    backgroundColor: const Color.fromARGB(255, 102, 166, 219),
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
      minZoom: 3,
      
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
MarkerLayer(
        markers: markers,
      ),
    ],
 ), 
);
 }

 }
