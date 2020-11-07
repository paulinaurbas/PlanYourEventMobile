import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planyoureventmobile/models/guest.dart';
import 'package:planyoureventmobile/models/menu.dart';

class MenuApiProvider {
  Firestore _firestore = Firestore.instance;

  Future <String> addMenu(Menu menu) async {
    try {
      var newDocRef = _firestore
          .collection('menu')
          .document()
          .documentID;
      menu.addId(newDocRef);
      _firestore.collection('events').document(newDocRef).setData(menu.menuToJson());
      return newDocRef;
    } catch (e) {
      print(e);
    }
  }

  Future <List<Menu>> getPartyMenu(String partyId) async {
    try {
      CollectionReference ref = Firestore.instance.collection('guests');
      QuerySnapshot eventsQuery = await ref
          .where("party_id", isEqualTo: partyId)
          .getDocuments();
      HashMap<int, Menu> eventsHashMap = new HashMap<int, Menu>();
      int i = 0;
      eventsQuery.documents.forEach((document) {
        eventsHashMap.putIfAbsent(i, () => Menu.fromJson(document.data));
        i++;
      });
      return eventsHashMap.values.toList();
    } catch (e) {
      print(e);
    }
  }
}