import 'package:flutter/material.dart';
import 'package:shelter_finder/Pages/map_page.dart';
import 'package:shelter_finder/pages/first_page.dart';
import 'package:shelter_finder/pages/second_page.dart';
import 'package:shelter_finder/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shelter_finder/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
 const MyApp({super.key});

 @override
 Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        '/first': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
        '/home': (context) => HomePage(),
        '/mapPage': (context) => MapPage()
      },
    );
 }
}