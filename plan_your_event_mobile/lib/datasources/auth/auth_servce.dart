import 'package:firebase_auth/firebase_auth.dart';
import 'package:planyoureventmobile/datasources/auth/auth_api_provider.dart';
import 'package:planyoureventmobile/models/user.dart';
import 'package:http/http.dart';
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
  Future<String> extractTokenAndAccessSecureResource() async {
    var token = await extractToken();
    return await accessSecureResource(token);
  }

  Future<String> extractToken() async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser user = await firebaseAuth.currentUser();
    IdTokenResult token = await user.getIdToken();
    return token.token;
  }

  Future<String> accessSecureResource(token) async {

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization" :"Bearer " + token
    };
    print("Token "+ token);
    authRepository.registerUser();
    Response response = await get(url, headers: headers);
    int statusCode = response.statusCode;
    if(statusCode != 200){
      return "Could not get input from server";
    }
    return response.body.toString();
  }



  signIn(AuthCredential authCredential) {
    FirebaseAuth.instance.signInWithCredential(authCredential);
  }

}