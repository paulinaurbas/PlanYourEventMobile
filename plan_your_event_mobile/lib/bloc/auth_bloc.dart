import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planyoureventmobile/datasources/auth/auth_api_provider.dart';
import 'package:planyoureventmobile/models/user.dart';
import 'package:planyoureventmobile/repository/auth_repository.dart';
import 'package:rxdart/rxdart.dart';

// ignore: must_be_immutable
class AuthBloc extends BlocProvider {
  static final AuthBloc _authBloc = AuthBloc._internal();

  factory AuthBloc() {
    return _authBloc;
  }

  AuthBloc._internal();
  final AuthService auth = AuthService();
  AuthRepository _authRepository = AuthRepository();

}
