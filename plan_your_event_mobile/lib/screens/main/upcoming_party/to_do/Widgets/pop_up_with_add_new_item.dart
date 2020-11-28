import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/bloc/to_do_bloc.dart';
import 'package:planyoureventmobile/enums/to_do_categories.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';

class PopUpWithAddToDo extends StatefulWidget{
  final thingsToDoBloc;

  const PopUpWithAddToDo({Key key, this.thingsToDoBloc}) : super(key: key);
  @override
  _PopUpWithAddToDoState createState() => _PopUpWithAddToDoState();
}

class _PopUpWithAddToDoState extends State<PopUpWithAddToDo> {
  ToDoBloc _bloc;
  String toDoDescription;
  ToDoType toDoType;
  bool toDo = false;
  bool inProgress = false;
  bool done = false;

  @override
  void initState() {
    super.initState();
    _bloc = widget.thingsToDoBloc;
  }

  @override
  Widget build(BuildContext context) {
     return  Column(
         children: [
           TextField(
             autofocus: true,
             onChanged: _bloc.changeDescription,
             decoration: new InputDecoration(
               labelText: appStrings["addNewToDo"],
             ),
           ),
           Align(
             alignment: Alignment.topLeft,
             child: Padding(
               padding: const EdgeInsets.only(top: 8.0),
               child: Text(appStrings['thingStatus']),
             ),
           ),
           getRowWithToStatus,
         ]);
  }

  Widget get getRowWithToStatus =>
      Row(
          children: [
            getToDoColumn,
            getInProgressColumn,
            getDoneColumn
          ]);

  Widget get getToDoColumn =>
      GestureDetector(
        onTap: () {
          setState(() {
            toDo = true;
            inProgress = false;
            done = false;
          });
          _bloc.addToDoStatus(ToDoType.TODO);
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: statusSmallBar(Colors.green, appStrings['toDo'], toDo),
            ),
          ],
        ),
      );

  Widget get getInProgressColumn =>
      GestureDetector(
        onTap: () {
          setState(() {
            toDo = false;
            inProgress = true;
            done = false;
          });
          _bloc.addToDoStatus(ToDoType.INPROGRESS);
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: statusSmallBar(
                  Colors.orange, appStrings['inProgress'], inProgress),
            ),
          ],
        ),
      );

  Widget get getDoneColumn =>
      GestureDetector(
        onTap: () {
          setState(() {
            toDo = false;
            inProgress = false;
            done = true;
          });
          _bloc.addToDoStatus(ToDoType.DONE);
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: statusSmallBar(Colors.pink, appStrings['done'], done),
            ),
          ],
        ),
      );

  Widget statusSmallBar( Color color, String title, bool isChecked) {
    return Container(
      decoration: BoxDecoration(
          color: isChecked ? color : Colors.white,
          border: Border.all(
            color: color,
          ),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title, textAlign: TextAlign.center,),
      ),
    );
  }
}