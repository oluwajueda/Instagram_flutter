import 'package:flutter/foundation.dart';
import 'package:instagram_flutter/models/user.dart';
import 'package:instagram_flutter/services/auth_service.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthServices _authServices = AuthServices();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authServices.getUserDetails();
    _user = user;

    notifyListeners();
  }
}
