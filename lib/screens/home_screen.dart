import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_october/controllers/cubit/app_cubit.dart';
import 'package:flutter_course_october/screens/car_screen.dart';

import 'package:flutter_course_october/utils/dio_helper.dart';
import 'package:flutter_course_october/screens/home_work_screen.dart';
import 'package:flutter_course_october/models/news_model.dart';
import 'package:flutter_course_october/screens/search_screen.dart';
import 'package:flutter_course_october/screens/sport_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List screens = [
      const CarScreen(),
      const SportScreen(),
      const HomeWorkScreen()
    ];
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit().get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("NewsApp"),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ));
                  },
                  icon: const Icon(Icons.search)),
              IconButton(
                onPressed: () {
                  cubit.changeTheme();
                },
                icon: const Icon(CupertinoIcons.moon_stars_fill),
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.index,
              onTap: (value) {
                cubit.changeScreen(value);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.car), label: "Car"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports), label: "Sports"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_work), label: "Home Work"),
              ]),
          body: screens[cubit.index],
        );
      },
    );
  }
}
