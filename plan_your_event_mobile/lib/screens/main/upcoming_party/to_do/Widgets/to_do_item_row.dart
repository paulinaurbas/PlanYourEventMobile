import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/enums/to_do_categories.dart';
import 'package:planyoureventmobile/models/to_do_item.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/to_do/Widgets/status_small_bar.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';

class ToDoItemRow extends StatefulWidget{
  final ToDoItem todo;

  const ToDoItemRow({Key key, this.todo}) : super(key: key);
  @override
  _ToDoItemRowState createState() => _ToDoItemRowState();
}

class _ToDoItemRowState extends State<ToDoItemRow> {
  bool toDo = false;
  bool inProgress = false;
  bool done = false;

  @override
  Widget build(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child:  Text(
          widget.todo.description,
          style: TextStyle(
            fontSize: 13,
          ),
        ),
      ),
      Row(
        children:
          statusRow()
      )
    ],
  );
  }

  List <Widget> statusRow (){
    List<Widget> allTiles = [];

    if(widget.todo.toDoType == ToDoType.TODO){
      allTiles.add(statusSmallBar(Colors.orange, appStrings['inProgress'], toDo));
      allTiles.add(statusSmallBar(Colors.green, appStrings['done'], done));
    } else if(widget.todo.toDoType == ToDoType.INPROGRESS){
      allTiles.add(statusSmallBar(Colors.pink, appStrings['toDo'], toDo));
      allTiles.add(statusSmallBar(Colors.green, appStrings['done'], done));
    } else {
      allTiles.add(statusSmallBar(Colors.pink, appStrings['toDo'], toDo));
      allTiles.add(statusSmallBar(Colors.orange, appStrings['inProgress'], toDo));
    }
      return allTiles;

  }

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