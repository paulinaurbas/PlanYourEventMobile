import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planyoureventmobile/models/document_model.dart';

class DocumentApiProvider {
  Firestore _firestore = Firestore.instance;

  Future<String> addDocument(Document document) async {
    try {
      var newDocRef = _firestore.collection('documents').document().documentID;
      document.addId(newDocRef);
      _firestore
          .collection('documents')
          .document(newDocRef)
          .setData(document.documentToJson());
      return newDocRef;
    } catch (e) {
      print(e);
    }
  }

  Future<List<Document>> getPartyDocuments(String partyId) async {
    try {
      CollectionReference ref = Firestore.instance.collection('documents');
      QuerySnapshot eventsQuery =
      await ref.where("party_id", isEqualTo: partyId).getDocuments();
      HashMap<int, Document> eventsHashMap = new HashMap<int, Document>();
      int i = 0;
      eventsQuery.documents.forEach((document) {
        eventsHashMap.putIfAbsent(i, () => Document.fromJson(document.data));
        i++;
      });
      return eventsHashMap.values.toList();
    } catch (e) {
      print(e);
    }
  }
  editDocumentStatus(Document document) async {
    try {
      _firestore.collection('documents').document(document.id).updateData(
          document.documentToJson());
    } catch(e){
      print(e);
    }
  }

}
