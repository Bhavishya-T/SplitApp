import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/users.dart';

class LoginPageViewModel extends ChangeNotifier {
  Users? _loggedInUser;

  Users? get loggedInUser => _loggedInUser;

  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<void> login(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user != null) {
        _loggedInUser = Users(username: user.email!, password: password);
      } else {
        _loggedInUser = null;
      }
    } catch (e) {
      print('Login failed: $e');
      _loggedInUser = null;
    }

    notifyListeners();
  }

  Future<void> logout() async {
    await _auth.signOut();
    _loggedInUser = null;
    notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user != null) {
        _loggedInUser = Users(username: user.email!, password: password);
      } else {
        _loggedInUser = null;
      }
    } catch (e) {
      print('Sign-up failed: $e');
      _loggedInUser = null;
    }

    notifyListeners();
  }
}