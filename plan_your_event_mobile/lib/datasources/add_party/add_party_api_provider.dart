import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planyoureventmobile/models/event_model.dart';


class AddPartyApiProvider{
  Firestore _firestore = Firestore.instance;
  Future <String> addParty (Event event) async {
    return _firestore.collection('events').add(event.eventToJson()).then((docRef) {
      return docRef.documentID;
    });
  }
}