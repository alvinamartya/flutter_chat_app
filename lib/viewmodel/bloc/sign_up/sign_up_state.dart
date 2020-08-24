part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpResponseState extends SignUpState {
  final String message;
  final bool success;

  SignUpResponseState(this.message, this.success);
}
