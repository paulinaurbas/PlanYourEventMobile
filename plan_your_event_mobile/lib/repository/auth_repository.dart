
import 'package:planyoureventmobile/datasources/auth/auth_api_provider.dart';
import 'package:planyoureventmobile/models/user.dart';

class AuthRepository {
  AuthApiProvider _authApiProvider = AuthApiProvider();

  Future<User> getUser(){
    return _authApiProvider.getUser();
  }


  Future<User> registerUser(){
    return _authApiProvider.registerUser();
  }
}