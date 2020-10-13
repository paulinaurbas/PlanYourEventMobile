import 'package:planyoureventmobile/models/user.dart';

import 'http_handler.dart';

class AuthApiProvider {

  Future<User> registerUser() async {
    final String _endpoint = "http://192.168.0.113:8080/api/register_user";
    return await HttpHandler().getFromApi(_endpoint).then((response) =>  User.fromJson(response.data));
  }

  Future<User> getUser() async {
    final String _endpoint = "http://192.168.0.113:8080/api/current_user";
    return await HttpHandler().getFromApi(_endpoint).then((response) =>  User.fromJson(response.data));
  }
}
