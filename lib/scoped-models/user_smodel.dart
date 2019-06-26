import 'package:scoped_model/scoped_model.dart';

import '../models/usermodel.dart';

mixin UserSModel on Model {
  UserModel _authenticatedUser;

  void login(String email, String password) {
    _authenticatedUser =
        UserModel(id: 'sbsdbcd', email: email, password: password);
  }
}
