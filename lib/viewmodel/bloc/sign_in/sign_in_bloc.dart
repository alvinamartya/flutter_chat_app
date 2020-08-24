import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app/utils/shared_preferences.dart';
import 'package:chat_app/viewmodel/services/auth_services.dart';
import 'package:chat_app/viewmodel/services/user_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial());

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    if (event is SignInRequestEvent) {
      FirebaseUser user =
          await AuthServices.signIn(event.email, event.password);

      if (user != null) {
        DocumentSnapshot snapshot = await UserServices.getUsers(event.email);
        Preferences.signIn(event.email, snapshot.data["name"],
            snapshot.data["image"] == null ? "" : snapshot.data["image"]);

        yield SignInResponseState("Sign in is success", true);
      } else {
        yield SignInResponseState(
            "Login is failed, invalid email or password", false);
      }
    } else if (event is SignInResponseEvent) {
      yield SignInResponseState(event.message, false);
    }
  }
}
