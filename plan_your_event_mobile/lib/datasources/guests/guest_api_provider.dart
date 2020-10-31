import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:planyoureventmobile/models/connect_guest_with_party.dart';
import 'package:planyoureventmobile/models/guest.dart';
import 'package:planyoureventmobile/models/guest_status.dart';

class AddGuestApiProvider{
  Firestore _firestore = Firestore.instance;

  Future addGuest (Guest guest) async {
    var newDocRef = _firestore.collection('guests').document().documentID;
    guest.addGuestId(newDocRef);
    return _firestore.collection('guests').document(newDocRef).setData(guest.guestToJson());
  }

  Future <List<Guest>> getGuestFromGroup (String groupType, String userId) async {
    try {
      CollectionReference ref = Firestore.instance.collection('guests');
      QuerySnapshot eventsQuery = await ref
          .where("guest_type", isEqualTo: groupType)
          .where("user_id", isEqualTo: userId )
          .getDocuments();
      HashMap<int, Guest> eventsHashMap = new HashMap<int, Guest>();
      int i = 0;
      eventsQuery.documents.forEach((document) {
        eventsHashMap.putIfAbsent(i, () => Guest.fromJson(document.data));
        i++;
      });
      return eventsHashMap.values.toList();
    } catch (e) {
      print(e);
    }
  }

  Future <List<GuestStatus>> getPartyGuestStatus (String partyID) async {
    try {
      CollectionReference ref = Firestore.instance.collection('guest_status');
      QuerySnapshot eventsQuery = await ref
          .where("party_id", isEqualTo: partyID)
          .getDocuments();
      HashMap<int, GuestStatus> eventsHashMap = new HashMap<int, GuestStatus>();
      int i = 0;
      eventsQuery.documents.forEach((document) {
        eventsHashMap.putIfAbsent(i, () => GuestStatus.fromJson(document.data));
        i++;
      });
      return eventsHashMap.values.toList();
    } catch (e) {
      print(e);
    }
  }

  Future <List<Guest>> getPartyGuest (String partyID) async {
    try {
      List <GuestStatus> guest = await getPartyGuestStatus(partyID);
      CollectionReference ref = Firestore.instance.collection('guests');
      String guestID =  guest.last.guestId;
      QuerySnapshot eventsQuery = await ref
            .where("guest_id", isEqualTo: guestID)
            .getDocuments();

      HashMap<int, Guest> eventsHashMap = new HashMap<int, Guest>();
      int i = 0;
      eventsQuery.documents.forEach((document) {
        eventsHashMap.putIfAbsent(i, () => Guest.fromJson(document.data));
        i++;
      });
      return eventsHashMap.values.toList();
    } catch (e) {
      print(e);
    }
  }



  Future <String> addGuestToParty (ConnectGuestWithParty connectGuestWithParty) async {
    return _firestore.collection('guest_status').add(connectGuestWithParty.userToJson()).then((docRef) {
      return docRef.documentID;
    });
  }
}