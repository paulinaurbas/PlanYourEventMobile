import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planyoureventmobile/datasources/auth/auth_servce.dart';
import 'package:planyoureventmobile/models/user.dart';
import 'package:planyoureventmobile/repository/auth_repository.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc extends BlocProvider {
  final AuthService auth = AuthService();
  AuthRepository _authRepository = AuthRepository();
  final PublishSubject <User> _subject = PublishSubject();
  Stream <User> get valideAuthorization => _subject.stream;

  getUser() async {
    User currentUser = await _authRepository.getUser();
    _subject.sink.add(currentUser);
  }

  registerUser() async {
    User response = await _authRepository.registerUser();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

}