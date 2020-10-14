import 'package:firebase_auth/firebase_auth.dart';
import 'package:planyoureventmobile/models/user.dart';
import 'package:planyoureventmobile/repository/auth_repository.dart';
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String url = 'http://192.168.0.113:8080/api/register_user';
  AuthRepository authRepository = AuthRepository();

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }

  Future signInWithEmailAndPassword(String email, String password) async {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
  }

  Future registerWithEmailAndPassword(String email, String password) async {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
  }


  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  signIn(AuthCredential authCredential) {
    FirebaseAuth.instance.signInWithCredential(authCredential);
  }

}