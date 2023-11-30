import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_october/cubit/app_cubit/app_cubit.dart';
import 'package:flutter_course_october/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter_course_october/screens/main_screen.dart';
import 'package:flutter_course_october/utils/dio_helper.dart';
import 'package:flutter_course_october/screens/login_screen.dart';

void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => AppCubit()..getHomeData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
