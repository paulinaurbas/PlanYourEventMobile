import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planyoureventmobile/datasources/auth/auth_servce.dart';
import 'package:planyoureventmobile/models/login_model.dart';

class AuthBloc extends BlocProvider {
  final AuthService auth = AuthService();


}