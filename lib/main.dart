import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 107, 222, 31),
          foregroundColor: Colors.red,
          leading: Icon(
            Icons.menu,
            color: Colors.deepPurple,
          ),
          title: Text("First Application"),
          actions: [Icon(Icons.call), Icon(Icons.video_call_outlined)],
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 101, 166, 219),
                borderRadius: BorderRadius.circular(0)),
            width: 200,
            height: 200,
            //  padding: EdgeInsets.all(12.0),
            // margin: EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                "Welcome to our first application",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  //color: Colors.green
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
