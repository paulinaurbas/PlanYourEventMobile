import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planyoureventmobile/models/event_model.dart';


class AddPartyApiProvider{
  Firestore _firestore = Firestore.instance;
  Future <void> addParty (Event event) async {
    return _firestore.collection('events').add(event.eventToJson()).then((docRef) {
      return docRef.documentID;
    });
  }
}