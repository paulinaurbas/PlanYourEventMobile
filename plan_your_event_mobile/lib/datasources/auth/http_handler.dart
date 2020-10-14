import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HttpHandler {
  final Dio _dio = Dio();

  Future<String> extractToken() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser user = await firebaseAuth.currentUser();
    IdTokenResult token = await user.getIdToken();
    return token.token;
  }

 Future<Response> getFromApi(String _endpoint) async {
    var token = await extractToken();
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization" :"Bearer " + token
    };
    Response response = await _dio.get(_endpoint, options: new Options(headers:headers),);
    return response;
  }

  Future<Response> postToApi(String _endpoint) async {
    var token = await extractToken();
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization" :"Bearer " + token
    };
    Response response = await _dio.post(_endpoint, options: new Options(headers:headers));
    return response;
  }
}
