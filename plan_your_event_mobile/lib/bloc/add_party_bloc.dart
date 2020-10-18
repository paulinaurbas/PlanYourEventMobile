
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planyoureventmobile/enums/PartyType.dart';
import 'package:planyoureventmobile/enums/PlaceType.dart';
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

  Future<void> addParty() {
    Event event = Event(
      placeType: _placeType.value,
      eventName: _partyName.value,
      placeName: _placeName.value,
      address: Address(
        _streetName.value, _cityName.value
      )
    );
    return _addPartyRepository.addEvent(event);
  }

  void dispose() async {
    _streetName.close();
    _cityName.close();
    _placeType.close();
    _partyName.close();
    _placeName.close();
  }

  bool validateFields() {
    if (_streetName.value != null &&
        _streetName.value.isNotEmpty &&
        _cityName.value != null &&
        _cityName.value.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}