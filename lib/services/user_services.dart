import 'package:flutter/material.dart';
import 'package:popo_app/models/user_model.dart';

class UserServices with ChangeNotifier {
  UserModel? _user;

  bool get userExist => _user != null;

  UserModel? get user => _user;
  set user(UserModel? user) {
    _user = user;
    notifyListeners();
  }

  void setAge(int age) {
    if (_user != null) {
      _user?.edad = age;
      notifyListeners();
    }
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }

  void addProfession() {
    if(_user != null) {
      _user!.profesiones.add('profesion - ${_user!.profesiones.length + 1}');
    }
    notifyListeners();
  }
}
