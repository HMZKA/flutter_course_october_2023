import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_october/car_screen.dart';
import 'package:flutter_course_october/cubit/app_cubit.dart';
import 'package:flutter_course_october/dio_helper.dart';
import 'package:flutter_course_october/home_work_screen.dart';
import 'package:flutter_course_october/news_model.dart';
import 'package:flutter_course_october/sport_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List screens = [CarScreen(), SportScreen(), HomeWorkScreen()];
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit().get(context);
        return Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            title: Text("NewsApp"),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
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
