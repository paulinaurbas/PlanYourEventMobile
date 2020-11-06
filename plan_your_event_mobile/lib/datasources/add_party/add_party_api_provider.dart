import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planyoureventmobile/models/event_model.dart';


class AddPartyApiProvider{
  Firestore _firestore = Firestore.instance;

  Future <String> addParty (Event event) async {
    var newDocRef = _firestore.collection('events').document().documentID;
    event.addEventId(newDocRef);
    _firestore.collection('events').document(newDocRef).setData(event.eventToJson());
    return newDocRef;
  }
}