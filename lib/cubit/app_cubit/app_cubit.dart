import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_october/utils/dio_helper.dart';
import 'package:flutter_course_october/models/home_model.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  AppCubit get(context) => BlocProvider.of(context);
  int index = 0;
  changeScreen(value) {
    index = value;
    emit(ChangeScreenState());
  }

  HomeModel? homeModel;
  getHomeData() {
    emit(GetHomeDataLoadingState());
    DioHelper.get(path: "home").then((value) {
      homeModel = HomeModel.fromJson(value?.data);
      print(homeModel?.data?.products[0].name);
      emit(GetHomeDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetHomeDataErrorState());
    });
  }

  getProfile() {
    emit(GetProfileDataLoadingState());
    DioHelper.get(path: "profile").then((value) {
      print(value?.data);
      emit(GetProfileDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetProfileDataErrorState());
    });
  }
}
