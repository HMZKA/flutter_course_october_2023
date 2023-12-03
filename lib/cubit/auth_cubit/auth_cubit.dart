import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_october/cubit/auth_cubit/auth_state.dart';
import 'package:flutter_course_october/utils/dio_helper.dart';
import 'package:flutter_course_october/models/profile_model.dart';
import 'package:flutter_course_october/utils/storage.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  AuthCubit get(context) => BlocProvider.of(context);
  ProfileModel? profileModel;
  login({required String email, required String password}) {
    emit(LoginLoadingState());
    DioHelper.post(path: "login", data: {"email": email, "password": password})
        .then((value) {
      value?.data["status"]
          ? {
              profileModel = ProfileModel.fromJson(value?.data["data"]),
              CacheHelper.setString(
                  key: "token", value: "${profileModel?.token}")
            }
          : {};
      print(value?.data);
      emit(LoginSuccessState(status: value?.data["status"]));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }
}
