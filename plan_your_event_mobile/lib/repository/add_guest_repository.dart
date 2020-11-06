import 'package:flutter/cupertino.dart';
import 'package:planyoureventmobile/datasources/guests/guest_api_provider.dart';
import 'package:planyoureventmobile/enums/guest_confirmation_status.dart';
import 'package:planyoureventmobile/models/guest.dart';
import 'package:planyoureventmobile/models/guest_status.dart';

class AddGuestRepository with ChangeNotifier {
  final _addGuestApiProvider = AddGuestApiProvider();

  Future <String> addGuest(Guest guest) => _addGuestApiProvider.addGuest(guest);

  Future <List<Guest>> getGuestList(String guestType, String userId) => _addGuestApiProvider.getGuestFromGroup(guestType, userId);

  Future <List<Guest>> getPartyGuestList(String partyId) => _addGuestApiProvider.getPartyGuest(partyId);

  Future <List<GuestStatus>> getPartyGuestStatusList(String partyId) => _addGuestApiProvider.getPartyGuestStatus(partyId);

  Future addGuestToParty(GuestStatus connectGuestWithParty) => _addGuestApiProvider.addGuestToParty(connectGuestWithParty);

  Future editGuestStatus(GuestStatus guestStatus) => _addGuestApiProvider.editGuestStatus(guestStatus);
}