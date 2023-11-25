import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_october/components/components.dart';
import '/controllers/cubit/app_cubit.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit().get(context);
        var model = AppCubit().get(context).sportModel;
        return BuildCondition(
          condition: model != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: model!.articles.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return buildNewsItem(model.articles[index], context);
              },
            ),
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
