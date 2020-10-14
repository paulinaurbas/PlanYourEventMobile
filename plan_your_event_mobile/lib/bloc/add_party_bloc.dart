
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPartyBloc extends BlocProvider {
  static final AddPartyBloc _addPartyBloc = AddPartyBloc._internal();

  factory AddPartyBloc() {
    return _addPartyBloc;
  }

  AddPartyBloc._internal();


}