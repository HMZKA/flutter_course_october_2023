import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_october/cubit/app_cubit.dart';
import 'package:flutter_course_october/dio_helper.dart';
import 'package:flutter_course_october/news_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit().get(context);
        return Scaffold(
          appBar: AppBar(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
          ),
          body: Center(
              child: Text(
            "${cubit.index}",
            style: const TextStyle(fontSize: 22),
          )),
        );
      },
    );
  }
}
