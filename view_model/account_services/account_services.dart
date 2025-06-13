import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountServices with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _obscureText = true;

  bool get obscureText => _obscureText;
  User? user;
  void setObscureText() {
    _obscureText = !obscureText;
    notifyListeners();
  }

  AccountServices() {
    _auth.authStateChanges().listen((User? newUser) {
      user = newUser;
      notifyListeners();
    });
  }
}
