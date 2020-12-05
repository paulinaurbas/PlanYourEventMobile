import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planyoureventmobile/enums/guest_confirmation_status.dart';
import 'package:planyoureventmobile/models/event_model.dart';
import 'package:planyoureventmobile/models/guest.dart';
import 'package:planyoureventmobile/models/guest_status.dart';

class PartiesApiProvider{

  Future <List<Event>> getEvents (String userId) async {
    try {
      CollectionReference ref = Firestore.instance.collection('events');
      QuerySnapshot eventsQuery = await ref
          .where("user_id", isEqualTo: userId )
          .getDocuments();
      HashMap<int, Event> eventsHashMap = new HashMap<int, Event>();
      int i = 0;
      eventsQuery.documents.forEach((document) {
        eventsHashMap.putIfAbsent(i, () => Event.fromJson(document.data));
        i++;
      });
      return eventsHashMap.values.toList();
    } catch (e) {
      print(e);
    }
  }

  Future <List<Guest>> getPartyGuest (String partyId) async {
      CollectionReference ref = Firestore.instance.collection('guest_status');
      QuerySnapshot eventsQuery = await ref
          .where("user_id", isEqualTo: partyId )
          .getDocuments();
      HashMap<int, Guest> eventsHashMap = new HashMap<int, Guest>();
      int i = 0;
      eventsQuery.documents.forEach((document) {
        eventsHashMap.putIfAbsent(i, () => Guest.fromJson(document.data));
        i++;
      });
      return eventsHashMap.values.toList();
  }

  Future <int> getPartyGuestStatus (String partyID, GuestConfirmationStatus guestConfirmationStatus) async {
    try {
      CollectionReference ref = Firestore.instance.collection('guest_status');
      QuerySnapshot eventsQuery = await ref
          .where("party_id", isEqualTo: partyID)
          .where("guest_status", isEqualTo: guestConfirmationStatus.toString())
          .getDocuments();
      HashMap<int, GuestStatus> eventsHashMap = new HashMap<int, GuestStatus>();
      int i = 0;
      eventsQuery.documents.forEach((document) {
        eventsHashMap.putIfAbsent(i, () => GuestStatus.fromJson(document.data));
        i++;
      });
      int idNumber = 0;
      return eventsHashMap.values.toList().length;
    } catch (e) {
      print(e);
      return 0;
    }
  }
}