import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_october/cubit/app_cubit.dart';
import 'package:flutter_course_october/dio_helper.dart';
import 'package:flutter_course_october/home_screen.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getTeslaNews()
        ..getSportNews(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
            darkTheme: ThemeData(
                scaffoldBackgroundColor: Colors.black,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.black,
                  unselectedItemColor: Colors.white,
                ),
                cardColor: const Color.fromARGB(255, 175, 105, 0),
                textTheme: const TextTheme(
                    bodyMedium: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
                primarySwatch: Colors.orange,
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white)),
            themeMode: AppCubit().get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: ThemeData(
                primarySwatch: Colors.orange,
                textTheme: const TextTheme(
                    bodyMedium:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black)),
          );
        },
      ),
    );
  }
}
