import 'package:flutter/material.dart';
import 'package:shelter_finder/Pages/second_page.dart';

// functions and methods

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});



@override
 Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 50, 137, 207),
        appBar: AppBar(
          title: Text("1st Page"),
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
                    Navigator.pushNamed(context, '/mapPage');
                  },
                ),
              ],
            ),
          ),
       body: SafeArea(
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            //box 1
            Center(
              child: Container(
              height: 200,
              width: 500,  
              
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 102, 166, 219),
                borderRadius: BorderRadius.circular(20.0),
                
              ), 
              child: Center(
                child: Text(
                  "Welcome to Shelter Finder!",
                    style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times New Roman',
                  ),
                ),
              ),  
                        ),
            ), 
              SizedBox(height: 10), //spacing between boxes
          //box 2  
          Center(
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/home'); 
              },
            child: Container(
              height: 50,
              width: 500,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 102, 166, 219),
                borderRadius: BorderRadius.circular(20.0),
              ), 
            child: Center(
                child: Text(
                  "Get Started",
                    style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times New Roman',
                  ),
                ),  
            ),
            ),
            ),
          ),            


          ]
        ),    
       ),
    ),
    );
 }


}