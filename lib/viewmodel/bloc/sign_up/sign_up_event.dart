part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpRequestEvent extends SignUpEvent {
  final String email;
  final String name;
  final String password;

  SignUpRequestEvent(this.email, this.name, this.password);
}
