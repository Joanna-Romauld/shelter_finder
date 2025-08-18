import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shelter_finder/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shelter_finder/pages/first_page.dart';
import 'package:shelter_finder/pages/second_page.dart';
import 'package:shelter_finder/pages/home_page.dart';

class GetShelterName extends StatelessWidget {
  final String shelterId;

  const GetShelterName({required this.shelterId});

  @override
  Widget build(BuildContext context) {

    CollectionReference shelters = FirebaseFirestore.instance.collection('shelters');
    return FutureBuilder<DocumentSnapshot>(
      future: shelters.doc(shelterId).get(),
      builder: ((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = 
        snapshot.data!.data() as Map<String, dynamic>;
        return Text('${data['latitude']}, ${data['longitude']}');
      
      }
      return Text("Loading...");
      }
    
    ));
  }
}