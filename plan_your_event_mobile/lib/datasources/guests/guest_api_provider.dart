import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planyoureventmobile/enums/guest_confirmation_status.dart';
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

  Future<List<String>> getGuestID(String partyID) async {
    List <GuestStatus> guest = await getPartyGuestStatus(partyID);
    List <String> guestID = List<String>();
    guest.forEach((element) {
      guestID.add(element.guestId);
    });
    return guestID;
  }

  Future <List<Guest>> getPartyGuest (String partyID) async {
    try {
      List <String> guestId = await getGuestID(partyID);
      CollectionReference ref = Firestore.instance.collection('guests');

      QuerySnapshot eventsQuery = await ref
            .where("guest_id", whereIn: guestId)
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

  Future <void> addGuestToParty (GuestStatus connectGuestWithParty) async {
    var newDocRef = _firestore.collection('guest_status').document().documentID;
    connectGuestWithParty.addStatusID(newDocRef);
    return _firestore.collection('guest_status').document(newDocRef).setData(connectGuestWithParty.guestToJson());
  }

  editGuestStatus(GuestStatus guestStatus) async {
    _firestore.collection('guest_status').document(guestStatus.guestStatusID).updateData(guestStatus.statusToJson());
  }

}