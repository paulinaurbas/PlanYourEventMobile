import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planyoureventmobile/models/supplier_model.dart';

class SupplierApiProvider {
  Firestore _firestore = Firestore.instance;

  Future<String> addSupplier(Supplier supplier) async {
    try {
      var newDocRef = _firestore.collection('supplier').document().documentID;
      supplier.addId(newDocRef);
      _firestore
          .collection('supplier')
          .document(newDocRef)
          .setData(supplier.supplierToJson());
      return newDocRef;
    } catch (e) {
      print(e);
    }
  }

  Future<List<Supplier>> getPartySupliers(String partyId) async {
    try {
      CollectionReference ref = Firestore.instance.collection('supplier');
      QuerySnapshot eventsQuery =
          await ref.where("party_id", isEqualTo: partyId).getDocuments();
      HashMap<int, Supplier> eventsHashMap = new HashMap<int, Supplier>();
      int i = 0;
      eventsQuery.documents.forEach((document) {
        eventsHashMap.putIfAbsent(i, () => Supplier.fromJson(document.data));
        i++;
      });
      return eventsHashMap.values.toList();
    } catch (e) {
      print(e);
    }
  }
}
