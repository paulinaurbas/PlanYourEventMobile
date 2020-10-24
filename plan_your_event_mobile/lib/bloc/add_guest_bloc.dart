import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planyoureventmobile/enums/guest_groups.dart';
import 'package:planyoureventmobile/models/guest.dart';
import 'package:planyoureventmobile/repository/add_guest_repository.dart';
import 'package:rxdart/rxdart.dart';

class AddGuestBloc extends BlocProvider {
  final _addGuestRepository = AddGuestRepository();
  final _guestName = BehaviorSubject<String>();
  final _guestSurname = BehaviorSubject<String>();
  final _emailGuest = BehaviorSubject<String>();
  final _guestPhone = BehaviorSubject<String>();
  final _error = BehaviorSubject<dynamic>();

  final PublishSubject<List<Guest>> guestList = PublishSubject<List<Guest>>();

  Stream<dynamic> get errorStream => _error.stream;

  Stream<String> get guestPhone => _guestPhone.stream;

  Stream<String> get emailGuests => _emailGuest.stream;

  Stream<String> get guestsName => _guestName.stream;

  Stream<String> get guestsSurname => _guestSurname.stream;

  Function(String) get changePhone => _guestPhone.sink.add;

  Function(String) get changeGuestName => _guestName.sink.add;

  Function(String) get changeGuestSurname => _guestSurname.sink.add;

  Function(String) get guestEmail => _emailGuest.sink.add;

  bool updateShouldNotify(_) => true;

  getGuests(String guestType) async {
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) async {
      List<Guest> response = await _addGuestRepository.getGuestList(guestType, user.uid);
      guestList.sink.add(response);
    });
  }


  Future<String> addGuest(bool noMilk, bool glutenFree, bool noMeat, bool noSeaFood, bool vegan, bool noNuts, bool noEggs, bool noFish, GuestType guestType) async {
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
      String userId;
      if (user != null) {
        userId = user.uid;
      }
      Guest guest = Guest(
          name: _guestName.value,
          surname: _guestSurname.value,
          phoneNumber: _guestPhone.value,
          email: _emailGuest.value,
          userId: userId,
          noMilk: noMilk,
          glutenFree: glutenFree,
          noMeat: noMilk,
          noSeaFood: noSeaFood,
          vegan: vegan,
          noNuts: noNuts,
          noEggs: noEggs,
          noFish: noFish,
          guestType: guestType);
      return _addGuestRepository.addGuest(guest);
    }).catchError((e) {
      print(e);
      _error.sink.addError(e);
      return null;
    });
    return null;
  }

  void dispose() async {
    _guestName.close();
    _guestSurname.close();
    _emailGuest.close();
    _guestPhone.close();
    _error.close();
    guestList.close();
  }

  DateTime validateDateAndTime(String _date, String _time) {
    _date = _date.replaceAll(' ', '');
    _time = _time.replaceAll(' ', '');
    return DateTime.parse(_date + ' ' + _time);
  }

  bool validateFields() {
    if (_guestName.value != null &&
        _guestName.value.isNotEmpty &&
        _guestSurname.value != null &&
        _guestSurname.value.isNotEmpty) {
      _error.sink.addError('ValueNotNull');
      return true;
    } else {
      return false;
    }
  }
}
