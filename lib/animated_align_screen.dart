import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedAlignScreen extends StatefulWidget {
  AnimatedAlignScreen({super.key});

  @override
  State<AnimatedAlignScreen> createState() => _AnimatedAlignScreenState();
}

class _AnimatedAlignScreenState extends State<AnimatedAlignScreen> {
  List aligns = [
    Alignment.center,
    Alignment.centerRight,
    Alignment.bottomCenter,
    Alignment.bottomRight,
    Alignment.topLeft,
    Alignment.bottomLeft,
    Alignment.topCenter,
    Alignment.topRight,
  ];
  int index = 0;
  @override
  void initState() {
    Timer.periodic(Duration(milliseconds: 3000), (timer) {
      setState(() {
        index = Random().nextInt(7);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AnimatedAlignScreen")),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red,
        child: AnimatedAlign(
          alignment: aligns[index],
          duration: Duration(milliseconds: 2500),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 26, 59, 86),
                  shape: BoxShape.circle),
              width: 150,
              height: 150,
            ),
          ),
        ),
      ),
    );
  }
}
