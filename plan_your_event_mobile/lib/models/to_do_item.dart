import 'package:planyoureventmobile/enums/to_do_categories.dart';

class ToDoItem {
  String toDoItemId;
  String description;
  ToDoType toDoType;
  String partyId;


  ToDoItem({this.toDoItemId, this.description, this.toDoType, this.partyId});

  ToDoItem.fromJson(Map<String, dynamic> json)
      : partyId = json["party_id"],
        toDoItemId =  json["to_do_item_id"],
        description = json["description"],
        toDoType = getToDoType(json["to_do_type"]);

  void addStatusID(String id){
    this.toDoItemId = id;
  }

  Map<String, dynamic> toDoItemToJson() => {
    'to_do_item_id': toDoItemId,
    'party_id': partyId,
    'description' : description,
    'to_do_type': toDoType.toString(),
  };
  Map<String, dynamic> statusToJson() => {
    'to_do_type': toDoType.toString(),
  };
}