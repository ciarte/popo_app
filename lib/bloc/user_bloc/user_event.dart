part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUserEvent extends UserEvent {
  final UserModel user;
  ActivateUserEvent(this.user);
}

class ChangeUserAgeEvent extends UserEvent {
  final int newAge;
  ChangeUserAgeEvent(this.newAge);
}

class AddUserProfessionEvent extends UserEvent {
  final String newProf;
  AddUserProfessionEvent(this.newProf);
}

class ResetUserEvent extends UserEvent {
  ResetUserEvent();
}