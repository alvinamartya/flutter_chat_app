part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInResponseState extends SignInState {
  final String message;
  final bool success;
  SignInResponseState(this.message, this.success);
}
