import 'package:flutter/material.dart';
import 'package:shelter_finder/Pages/second_page.dart';

// functions and methods

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

 void buttonPressed(BuildContext context) {
   // This function can be used to handle button presses
   Navigator.push(context, 
   MaterialPageRoute(
    builder: (context) => SecondPage(),
    ),
    );
 }
@override
 Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 50, 137, 207),
        appBar: AppBar(
          title: Text("Home Page"),
          backgroundColor: const Color.fromARGB(255, 102, 166, 219),
          leading: Icon(Icons.menu),
          actions: [
            IconButton(
              onPressed: () {},
               icon: Icon(Icons.logout),
            ),
          ],
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
                buttonPressed(context); 
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