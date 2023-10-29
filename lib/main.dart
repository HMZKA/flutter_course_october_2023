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
          appBar: AppBar(title: Text("My Application")),
          body: Container(
            width: double.infinity,
            color: Colors.black,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 1 + 1 + 1 + 1 / 4
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.red,
                    child: Text(
                      "First Text",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.amber,
                    child: Text(
                      "Second Text",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                    child: Text(
                      "Third Text",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.purple,
                    child: Text(
                      "Fourth Text",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
