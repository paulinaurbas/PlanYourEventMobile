
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';


class AuthRepository with ChangeNotifier {
  FirebaseUser _user;

  FirebaseUser get getUser => _user;

  void setUser(FirebaseUser user){
    _user = user;
    notifyListeners();
  }

}