import 'package:shelter_finder/pages/first_page.dart';
import 'package:shelter_finder/pages/second_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){

     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 50, 137, 207),
        appBar: AppBar(
          title: Text("Information"),
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
    ),
    );
  }
}