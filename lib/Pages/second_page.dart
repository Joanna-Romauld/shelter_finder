
import 'package:flutter/material.dart';
import 'package:shelter_finder/Read%20Data/get_shelter_name.dart';
import 'package:shelter_finder/pages/first_page.dart';
import 'package:shelter_finder/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shelter_finder/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(home: SecondPage()));
}


class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
 List<String> shelterNames = [];

  Future<void> fetchShelterNames() async {
    await FirebaseFirestore.instance
        .collection('shelters')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element){
          // print(element.reference);
          shelterNames.add(element.reference.id);
        }),
        
        );

}

  @override
  Widget build(BuildContext context){

     return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: FutureBuilder(
              future: fetchShelterNames(),
              builder: (context, snapshot){
              return ListView.builder(
                  itemCount: shelterNames.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: GetShelterName(shelterId: shelterNames[index]),
                      );
                }
                );

            },
            
            ),
                ), 
          ]
        ),
        
      ),
        backgroundColor: const Color.fromARGB(255, 50, 137, 207),
  
        appBar: AppBar(
          title: Text("Map"),
          backgroundColor: const Color.fromARGB(255, 102, 166, 219),
          actions: [
            IconButton(
              onPressed: () {},
               icon: Icon(Icons.logout),
            ),
          ],
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
                    Navigator.pushNamed(context, '/second');
                  },
                ),
                
              ],
              
              
            ),
            
          ),
     );
  }
}