import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  bool _isLoggedIn = false;


  get isLoggedIn => _isLoggedIn;

  set setLoggedIn(bool value){
    _isLoggedIn = value;
    notifyListeners();
  }

}
