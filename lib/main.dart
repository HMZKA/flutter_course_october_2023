import 'package:flutter/material.dart';
import 'package:flutter_course_october/animate_container_screen.dart';
import 'package:flutter_course_october/animated_align_screen.dart';
import 'package:flutter_course_october/login_screen.dart';
import 'package:flutter_course_october/rating_screen.dart';
import 'package:flutter_course_october/telegram_screen.dart';
import 'package:flutter_course_october/training_screen.dart';
import 'package:flutter_course_october/tween_animate_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: AnimatedAlignScreen());
  }
}
