import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planyoureventmobile/enums/to_do_categories.dart';
import 'package:planyoureventmobile/models/to_do_item.dart';
import 'package:planyoureventmobile/models/to_do_status.dart';

class ToDoApiProvider {
  Firestore _firestore = Firestore.instance;

  Future <int> getToDoStatus (String partyID, ToDoType toDoStatus) async {
    try {
      CollectionReference ref = Firestore.instance.collection('to_do_items');
      QuerySnapshot eventsQuery = await ref
          .where("party_id", isEqualTo: partyID)
          .where("to_do_type", isEqualTo: toDoStatus.toString())
          .getDocuments();
      HashMap<int, ToDoStatus> eventsHashMap = new HashMap<int, ToDoStatus>();
      int i = 0;
      eventsQuery.documents.forEach((document) {
        eventsHashMap.putIfAbsent(i, () => ToDoStatus.fromJson(document.data));
        i++;
      });
      int idNumber = 0;
      return eventsHashMap.values.toList().length;
    } catch (e) {
      print(e);
      return 0;
    }
  }

  Future <void> addToDoToParty (ToDoStatus toDoStatus) async {
    var newDocRef = _firestore.collection('to_do_status').document().documentID;
    toDoStatus.addStatusID(newDocRef);
    return _firestore.collection('to_do_status').document(newDocRef).setData(toDoStatus.toDoStatusToJson());
  }

  Future<void> addToDo(ToDoItem toDoItem) {
    var newDocRef = _firestore.collection('to_do_items').document().documentID;
    toDoItem.addStatusID(newDocRef);
    return _firestore.collection('to_do_items').document(newDocRef).setData(toDoItem.toDoItemToJson());
  }

  Future <List<ToDoItem>> getToDo(String partyID, String toDoStatus) async {
    try {
      CollectionReference ref = Firestore.instance.collection('to_do_items');
      QuerySnapshot eventsQuery = await ref
          .where("party_id", isEqualTo: partyID)
          .where("to_do_type", isEqualTo: toDoStatus)
          .getDocuments();
      HashMap<int, ToDoItem> eventsHashMap = new HashMap<int, ToDoItem>();
      int i = 0;
      eventsQuery.documents.forEach((document) {
        eventsHashMap.putIfAbsent(i, () => ToDoItem.fromJson(document.data));
        i++;
      });
      return eventsHashMap.values.toList();
    } catch (e) {
      print(e);
      return null;
    }
  }

  editToDoStatus(ToDoItem toDoStatus) async {
      _firestore.collection('to_do_items').document(toDoStatus.toDoItemId).updateData(toDoStatus.statusToJson());
  }
}
