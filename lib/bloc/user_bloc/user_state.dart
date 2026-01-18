part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final UserModel? user;
  final bool existUser;

  const UserState({this.user, this.existUser = false});
}

class UserInitialState extends UserState {
  const UserInitialState() : super(existUser: false, user: null);
}

class UserSetState extends UserState {
  final UserModel newUser;
  const UserSetState(this.newUser) : super(existUser: true, user: newUser);
}

