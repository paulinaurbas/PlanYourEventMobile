import 'package:planyoureventmobile/enums/to_do_categories.dart';

class ToDoStatus {
  String toDoStatusId;
  String toDoID;
  String partyId;
  ToDoType toDoStatus;
  ToDoStatus({this.partyId, this.toDoStatus, this.toDoID, this.toDoStatusId});

  ToDoStatus.fromJson(Map<String, dynamic> json)
      : partyId = json["party_id"],
        toDoID =  json["to_do_id"],
        toDoStatusId = json["to_do_status_id"],
        toDoStatus = getToDoType(json["to_do_status"]);

  void addStatusID(String id){
    this.toDoStatusId = id;
  }

  Map<String, dynamic> toDoStatusToJson() => {
    'to_do_id': toDoID,
    'party_id': partyId,
    'to_do_status' : toDoStatus,
    'to_do_status_id': toDoStatusId
  };

  Map<String, dynamic> statusToJson() => {
    'to_do_status': toDoStatus.toString(),
  };
}
