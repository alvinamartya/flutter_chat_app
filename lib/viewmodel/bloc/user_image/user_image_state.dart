part of 'user_image_bloc.dart';

@immutable
abstract class UserImageState {}

class UserImageInitial extends UserImageState {}

class UserImageLoaded extends UserImageState {
  final String imagePath;
  UserImageLoaded(this.imagePath);
}

class UserImageUpload extends UserImageState {
  final String imagePath;
  UserImageUpload(this.imagePath);
}
