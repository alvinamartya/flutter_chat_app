import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app/utils/shared_preferences.dart';
import 'package:chat_app/viewmodel/services/auth_services.dart';
import 'package:chat_app/viewmodel/services/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial());

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if (event is SignUpRequestEvent) {
      FirebaseUser user =
          await AuthServices.signUp(event.email, event.password);

      if (user != null) {
        await UserServices.createOrUpdateUser(event.email, name: event.name);
        Preferences.signIn(event.email, event.password, "");
        yield SignUpResponseState("Sign up is success", true);
      } else {
        yield SignUpResponseState("Sign up is failed", false);
      }
    }
  }
}
