part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

class ChangeScreenState extends AppState {}

class ChangeThemeModeState extends AppState {}

class GetTeslaNewsLoadingState extends AppState {}

class GetTeslaNewsSuccessState extends AppState {}

class GetTeslaNewsErrorState extends AppState {}

class GetSportsNewsLoadingState extends AppState {}

class GetSportsNewsSuccessState extends AppState {}

class GetSportsNewsErrorState extends AppState {}

class SearchNewsLoadingState extends AppState {}

class SearchNewsSuccessState extends AppState {}

class SearchNewsErrorState extends AppState {}
