import 'package:buildcondition/buildcondition.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_october/cubit/app_cubit/app_cubit.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit().get(context);
        var model = AppCubit().get(context).homeModel;
        return BuildCondition(
          condition: model != null,
          builder: (context) {
            return Container(
              color: Colors.grey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: CarouselSlider(
                          items: model?.data?.banners
                              .map((e) => Image.network(
                                    "${e.image}",
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) =>
                                            loadingProgress != null
                                                ? Lottie.asset(
                                                    "images/loading.json",
                                                  )
                                                : child,
                                  ))
                              .toList(),
                          options: CarouselOptions(
                              viewportFraction: 1.0, autoPlay: true)),
                    ),
                    GridView.count(
                      childAspectRatio: 0.7,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: model!.data!.products
                          .map((e) => Card(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.1,
                                        child: Image.network(
                                          "${e.image}",
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          // fit: BoxFit.cover,
                                        ),
                                      ),
                                      e.discount != 0
                                          ? const Text(
                                              "DISCOUNT",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  backgroundColor: Colors.red),
                                            )
                                          : const SizedBox()
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Text(
                                      "${e.name}",
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              )))
                          .toList(),
                    )
                  ],
                ),
              ),
            );
          },
          fallback: (context) => Center(
            child: Lottie.asset("images/loading.json"),
          ),
        );
      },
    );
  }
}
