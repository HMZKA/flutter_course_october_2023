import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_october/cubit/app_cubit/app_cubit.dart';
import 'package:flutter_course_october/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter_course_october/screens/main_screen.dart';
import 'package:flutter_course_october/utils/dio_helper.dart';
import 'package:flutter_course_october/screens/login_screen.dart';
import 'package:flutter_course_october/utils/storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  String token = CacheHelper.getData(key: "token") ?? "";
  Widget widget = LoginScreen();
  if (token != "") {
    widget = MainScreen();
  }
  runApp(MyApp(
    widget: widget,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.widget});
  Widget widget;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => AppCubit()
            ..getHomeData()
            ..getProfile(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: widget,
      ),
    );
  }
}
