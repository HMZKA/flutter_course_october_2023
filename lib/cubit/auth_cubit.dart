import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_october/dio_helper.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  AuthCubit get(context) => BlocProvider.of(context);
  login({required String email, required String password}) {
    emit(LoginLoadingState());
    DioHelper.post(path: "login", data: {"email": email, "password": password})
        .then((value) {
      print(value?.data);
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }
}
