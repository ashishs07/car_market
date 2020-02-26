import 'package:flutter/material.dart';

import '../models/usermodel.dart';

class UsersProvider with ChangeNotifier {
  var _user = UserModel(
    email: null,
    password: null,
  );

  UserModel get user {
    return _user;
  }

  void login(String email, String password) {
    _user = UserModel(
      email: email,
      password: password,
    );
    notifyListeners();
  }
}
