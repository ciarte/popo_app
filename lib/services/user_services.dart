import 'dart:async';
import 'package:popo_app/models/user_model.dart';

class _UserServices {
  UserModel? _user;
  UserModel? get user => _user;

  bool get userExist => _user != null;

  final StreamController<UserModel> _stremController =
      StreamController<UserModel>.broadcast();
  Stream<UserModel> get userStream => _stremController.stream;

  void newUser(UserModel user) {
    _user = user;
    _stremController.add(user);
  }

  void newAge(int edad) {
    if (_user == null) return;
    _user!.edad = edad;
    _stremController.add(_user!);
  }
}

final userServices = _UserServices();
