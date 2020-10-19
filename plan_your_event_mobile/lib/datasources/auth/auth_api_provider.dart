import 'package:firebase_auth/firebase_auth.dart';
import 'package:planyoureventmobile/models/user.dart';
import 'package:planyoureventmobile/repository/auth_repository.dart';
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }


  initializeCurrentUser(AuthRepository authRepository) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    if(user != null){
      authRepository.setUser(user);
    }
  }

  Future signInWithEmailAndPassword(String email, String password, AuthRepository authRepository) async {
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    if(result != null){
      user = result.user;
      if(user != null){
        authRepository.setUser(user);
        return user;
      }
    }
    return result;
  }

  Future registerWithEmailAndPassword(String email, String password, AuthRepository authRepository) async {
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    if(result != null){
      user = result.user;
      if(user != null){
        authRepository.setUser(user);
        return user;
      }
    }
    return result;
  }


  void signOut(AuthRepository authRepository) async {
    try {
      await _auth.signOut();
      authRepository.setUser(null);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}