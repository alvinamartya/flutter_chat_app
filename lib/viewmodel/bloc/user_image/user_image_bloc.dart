import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app/utils/shared_preferences.dart';
import 'package:meta/meta.dart';

part 'user_image_event.dart';
part 'user_image_state.dart';

class UserImageBloc extends Bloc<UserImageEvent, UserImageState> {
  UserImageBloc() : super(UserImageInitial());

  @override
  Stream<UserImageState> mapEventToState(
    UserImageEvent event,
  ) async* {
    if ((event is UserImageLoadedEvent) == true) {
      String imagePath = await Preferences.getImage();
      if (imagePath != "") {
        yield UserImageLoaded(imagePath);
      }
    } else if ((event is UserImageUploadEvent) == true) {
      UserImageUploadEvent imageEvent = event as UserImageUploadEvent;
      if (imageEvent.imagePath != "")
        yield UserImageLoaded(imageEvent.imagePath);
      else
        yield UserImageInitial();
    }
  }
}
