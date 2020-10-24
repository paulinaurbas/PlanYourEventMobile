import 'package:flutter/cupertino.dart';
import 'package:planyoureventmobile/datasources/guests/guest_api_provider.dart';
import 'package:planyoureventmobile/models/guest.dart';

class AddGuestRepository with ChangeNotifier {
  final _addGuestApiProvider = AddGuestApiProvider();

  Future <String> addGuest(Guest guest) => _addGuestApiProvider.addGuest(guest);

  Future <List<Guest>> getGuestList(String guestType, String userId) => _addGuestApiProvider.getGuestFromGroup(guestType, userId);

}