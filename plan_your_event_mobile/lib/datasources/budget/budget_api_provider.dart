import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planyoureventmobile/models/budget_model.dart';
import 'package:planyoureventmobile/models/bugdet_item_model.dart';
import 'package:planyoureventmobile/models/document_model.dart';

class BudgetApiProvider {
  Firestore _firestore = Firestore.instance;

  Future<String> addBudget(Budget budget) async {
    try {
      var newDocRef = _firestore.collection('budget').document().documentID;
      budget.addId(newDocRef);
      _firestore
          .collection('budget')
          .document(newDocRef)
          .setData(budget.budgetToJson());
      return newDocRef;
    } catch (e) {
      print(e);
    }
  }
  Future<List<BudgetItem>> getPartyBudgetItems (String partyID, String budgetId) async {
    try {
      CollectionReference ref = Firestore.instance.collection('budget_items');
      QuerySnapshot eventsQuery =
          await ref.where("party_id", isEqualTo: partyID)
              .getDocuments();
      HashMap<int, BudgetItem> eventsHashMap = new HashMap<int, BudgetItem>();
      int i = 0;
      eventsQuery.documents.forEach((document) {
        eventsHashMap.putIfAbsent(i, () => BudgetItem.fromJson(document.data));
        i++;
      });
      return eventsHashMap.values.toList();
    } catch (e) {
      print(e);
      return null;
    }
  }
  Future<String> addBudgetItem(BudgetItem document) async {
    try {
      var newDocRef = _firestore.collection('budget_items').document().documentID;
      document.addId(newDocRef);
      _firestore
          .collection('budget_items')
          .document(newDocRef)
          .setData(document.budgetToJson());
      return newDocRef;
    } catch (e) {
      print(e);
    }
  }

  Future updateBudget(Budget budget) async{
    _firestore.collection('budget').document(budget.id).updateData(budget.budgetToJson());
  }

  Future<Budget> getPartyBudget(String partyId) async {
    try {
      CollectionReference ref = Firestore.instance.collection('budget');
      QuerySnapshot eventsQuery =
      await ref.where("party_id", isEqualTo: partyId).getDocuments();
      HashMap<int, Budget> eventsHashMap = new HashMap<int, Budget>();
      int i = 0;
      eventsQuery.documents.forEach((document) {
        eventsHashMap.putIfAbsent(i, () => Budget.fromJson(document.data));
        i++;
      });
      return eventsHashMap.values.toList().first;
    } catch (e) {
      print(e);
      return null;
    }
  }

}
