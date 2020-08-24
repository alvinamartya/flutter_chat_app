part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInRequestEvent extends SignInEvent {
  final String email;
  final String password;

  SignInRequestEvent(this.email, this.password);
}

class SignInResponseEvent extends SignInEvent {
  final String message;
  SignInResponseEvent(this.message);
}
