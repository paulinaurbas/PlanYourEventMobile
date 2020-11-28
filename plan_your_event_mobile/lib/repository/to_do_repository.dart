import 'package:flutter/cupertino.dart';
import 'package:planyoureventmobile/datasources/to_do/to_do_api_provider.dart';
import 'package:planyoureventmobile/enums/to_do_categories.dart';
import 'package:planyoureventmobile/models/to_do_item.dart';
import 'package:planyoureventmobile/models/to_do_status.dart';

class ToDoRepository with ChangeNotifier {
  final _toDoApiProvider = ToDoApiProvider();

  Future <int> getToDoStatus (String partyID, ToDoType toDoStatus) => _toDoApiProvider.getToDoStatus(partyID, toDoStatus);

  Future <List<ToDoItem>> getToDo (String partyID, String toDoType) => _toDoApiProvider.getToDo(partyID,toDoType);

  Future <void> addToDo(ToDoItem toDoItem) => _toDoApiProvider.addToDo(toDoItem);

  Future editToDoStatus(ToDoItem toDoStatus) => _toDoApiProvider.editToDoStatus(toDoStatus);

}