import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:planyoureventmobile/models/guest.dart';

class AddGuestApiProvider{
  Firestore _firestore = Firestore.instance;

  Future <String> addGuest (Guest guest) async {
    return _firestore.collection('guests').add(guest.guestToJson()).then((docRef) {
      return docRef.documentID;
    });
  }
  Future <List<Guest>> getGuestFromGroup (String groupType, String userId) async {
    try {
      CollectionReference ref = Firestore.instance.collection('guests');
      QuerySnapshot eventsQuery = await ref
          .where("guest_type", isEqualTo: groupType)
          .where("id", isEqualTo: userId )
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
}