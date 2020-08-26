part of 'user_image_bloc.dart';

@immutable
abstract class UserImageEvent {}

class UserImageUploadEvent extends UserImageEvent {
  final String imagePath;
  UserImageUploadEvent(this.imagePath);
}

class UserImageLoadedEvent extends UserImageEvent {}
