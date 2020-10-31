import 'package:flutter/cupertino.dart';
import 'package:planyoureventmobile/datasources/parties/parties_api_provider.dart';
import 'package:planyoureventmobile/enums/guest_confirmation_status.dart';
import 'package:planyoureventmobile/models/event_model.dart';

class PartiesRepository with ChangeNotifier {
  final _partiesApiProvider = PartiesApiProvider();

  Future <List<Event>> getEventList(String userId) => _partiesApiProvider.getEvents(userId);

  Future <int> getPartyGuestStatus (String partyID, GuestConfirmationStatus guestConfirmationStatus) => _partiesApiProvider.getPartyGuestStatus(partyID, guestConfirmationStatus);

}