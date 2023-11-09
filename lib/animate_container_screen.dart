import 'dart:async';

import 'package:flutter/material.dart';

class AnimateContainerScreen extends StatefulWidget {
  AnimateContainerScreen({super.key});

  @override
  State<AnimateContainerScreen> createState() => _AnimateContainerScreenState();
}

class _AnimateContainerScreenState extends State<AnimateContainerScreen> {
  double width = 100;
  double fontSize = 12;
  double height = 100;
  double radius = 0.0;
  Color color = Colors.amber;
  @override
  void initState() {
    super.initState();
    animate();
  }

  animate() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (width == 100) {
        setState(() {
          width = 300;
          height = 300;
          color = Colors.red;
          fontSize = 22;
          radius = 50;
        });
      } else {
        setState(() {
          width = 100;
          height = 100;
          radius = 0;
          fontSize = 12;
          color = Colors.amber;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Container")),
      body: Center(
          child: AnimatedContainer(
        duration: const Duration(milliseconds: 2500),
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(radius)),
        child: Center(
            child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 2500),
          style: TextStyle(fontSize: fontSize),
          child: const Text("Waiting..."),
        )),
      )),
    );
  }
}
