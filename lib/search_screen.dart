import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_october/components.dart';
import 'package:flutter_course_october/cubit/app_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit().get(context);
        var model = AppCubit().get(context).searchModel;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      cubit.search(keyWord: value);
                    },
                    decoration: InputDecoration(
                        hintText: "Search..",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  BuildCondition(
                    condition: model != null,
                    builder: (context) => ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: model!.articles.length,
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return buildNewsItem(model.articles[index], context);
                      },
                    ),
                    fallback: (context) => state is SearchNewsLoadingState
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: LinearProgressIndicator(),
                          )
                        : const SizedBox(),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
