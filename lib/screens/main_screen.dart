import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_october/cubit/app_cubit/app_cubit.dart';
import 'package:flutter_course_october/screens/category_screen.dart';
import 'package:flutter_course_october/screens/favorites_screen.dart';
import 'package:flutter_course_october/screens/home_screen.dart';
import 'package:flutter_course_october/screens/profile_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  List screens = const [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit().get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: const Text("ShopMall"),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.index,
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                cubit.changeScreen(value);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: "Category"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favorites"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile")
              ]),
          body: screens[cubit.index],
        );
      },
    );
  }
}
