import 'package:flutter/material.dart';
import '../models/user.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  bool _isLoggedIn = false;

  User? get user => _user;
  bool get isLoggedIn => _isLoggedIn;

  Future<bool> signUp(String email, String password, String name) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      _user = User(email: email, password: password, name: name);
      _isLoggedIn = true;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signIn(String email, String password) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      if (email == _user?.email && password == _user?.password) {
        _isLoggedIn = true;
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  void signOut() {
    _user = null;
    _isLoggedIn = false;
    notifyListeners();
  }
}