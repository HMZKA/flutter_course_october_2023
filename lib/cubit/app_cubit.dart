import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_october/dio_helper.dart';
import 'package:flutter_course_october/news_model.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  AppCubit get(context) => BlocProvider.of(context);
  int index = 0;
  increment() {
    index++;
    emit(IncrementState());
  }

  NewsModel? newsModel;
  getTeslaNews() {
    emit(GetTeslaNewsLoadingState());
    DioHelper.get(path: "everything", queryParameters: {
      "q": "tesla",
      "apiKey": "a269e4f1de864efc85f38b36f1bae318"
    }).then((value) {
      newsModel = NewsModel.fromJson(value?.data);
      newsModel?.articles.forEach((element) {
        print(element.title);
      });
      emit(GetTeslaNewsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetTeslaNewsErrorState());
    });
  }

  getSportNews() {
    DioHelper.get(path: "top-headlines", queryParameters: {
      "category": "sport",
      "country": "us",
      "apiKey": "a269e4f1de864efc85f38b36f1bae318"
    });
  }
}
