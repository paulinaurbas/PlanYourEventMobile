
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planyoureventmobile/enums/party_type.dart';
import 'package:planyoureventmobile/enums/place_type.dart';
import 'package:planyoureventmobile/models/address_model.dart';
import 'package:planyoureventmobile/models/event_model.dart';
import 'package:planyoureventmobile/repository/add_party_repository.dart';
import 'package:rxdart/rxdart.dart';

class AddPartyBloc extends BlocProvider {

  final _addPartyRepository = AddPartyRepository();
  final _streetName = BehaviorSubject<String>();
  final _cityName = BehaviorSubject<String>();
  final _placeType = BehaviorSubject<PlaceType>();
  final _partyName = BehaviorSubject<String>();
  final _placeName = BehaviorSubject<String>();
  final _error = BehaviorSubject<dynamic>();

  Stream <dynamic> get errorStream => _error.stream;

  Stream <String> get partyName => _partyName.stream;

  Stream<String> get placeName => _placeName.stream;

  Stream<PlaceType> get placeType => _placeType.stream;

  Stream<String> get streetName => _streetName.stream;

  Stream<String> get cityName => _cityName.stream;

  Function(String) get changePartyName => _partyName.sink.add;

  Function(String) get changePlaceName => _placeName.sink.add;

  Function(String) get changeStreetName => _streetName.sink.add;

  Function(PlaceType) get changePlaceTypeName => _placeType.sink.add;

  Function(String) get changeCityName => _cityName.sink.add;


  bool updateShouldNotify(_) => true;

  Future<String> addParty(String date, String time, PlaceType placeType, PartyType partyType) async {
    DateTime dateOfEvent = validateDateAndTime(date, time);
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
      String userId;
      if (user != null) {
        userId = user.uid;
      }
      Event event = Event(
          partyType: partyType,
          placeType: placeType,
          id: userId,
          eventName: _partyName.value,
          placeName: _placeName.value,
          dateTime: dateOfEvent,
          address: Address(
              _streetName.value, _cityName.value
          )
      );
      return _addPartyRepository.addEvent(event);
    }).catchError((e){
      print (e);
      _error.sink.addError(e);
      return null;
    });
    return null;
  }

  void dispose() async {
    _streetName.close();
    _cityName.close();
    _placeType.close();
    _partyName.close();
    _placeName.close();
    _error.close();
  }

  DateTime validateDateAndTime(String _date, String _time) {
    _date = _date.replaceAll(' ', '');
    _time =  _time.replaceAll(' ', '');
    return DateTime.parse(_date + ' ' + _time );
  }

  bool validateFields() {
    if (_streetName.value != null &&
        _streetName.value.isNotEmpty &&
        _cityName.value != null &&
        _cityName.value.isNotEmpty) {
      _error.sink.addError('ValueNotNull');
      return true;
    } else {
      return false;
    }
  }
}