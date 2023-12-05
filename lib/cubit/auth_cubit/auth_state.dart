sealed class AuthState {}

final class AuthInitial extends AuthState {}

class ChangeLocaleState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  bool status;
  LoginSuccessState({required this.status});
}

class LoginErrorState extends AuthState {}
