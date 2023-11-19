part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

class ChangeScreenState extends AppState {}

class GetTeslaNewsLoadingState extends AppState {}

class GetTeslaNewsSuccessState extends AppState {}

class GetTeslaNewsErrorState extends AppState {}

class GetSportsNewsLoadingState extends AppState {}

class GetSportsNewsSuccessState extends AppState {}

class GetSportsNewsErrorState extends AppState {}
