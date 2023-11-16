part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

class IncrementState extends AppState {}

class GetTeslaNewsLoadingState extends AppState {}

class GetTeslaNewsSuccessState extends AppState {}

class GetTeslaNewsErrorState extends AppState {}
