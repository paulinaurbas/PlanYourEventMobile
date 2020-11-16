import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/enums/to_do_categories.dart';
import 'package:planyoureventmobile/models/menu.dart';
import 'package:planyoureventmobile/models/to_do_item.dart';
import 'package:planyoureventmobile/my_flutter_app_icons.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/to_do/Widgets/to_do_item_row.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';

class ToDoCard extends StatefulWidget {
  final String toDoType;
  final List<ToDoItem> toDoList;
  const ToDoCard({
    Key key, this.toDoType, this.toDoList,
  }) : super(key: key);

  @override
  _ToDoCardState createState() => _ToDoCardState();
}

class _ToDoCardState extends State<ToDoCard> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    List<Widget> preferencesList = List<Widget>();
    return Padding(
      padding: const EdgeInsets.only(left: 19, right: 19, top: 10.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 15, 12, 12),
                    child:
                    Text(widget.toDoType,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold
                        )),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5, 15, 10),
                    child: Row(
                      children:
                        _buildGuestListWidget(widget.toDoList),
                    ),
                  ),
                ],
              ),
              Column(
                children: [

                ],
              )
    ])));
  }

  List<Widget> _buildGuestListWidget(List<ToDoItem> data) {
    List<Widget> allTiles = [];
    data.forEach((element) {
      allTiles.add(ToDoItemRow(todo: element));
    });
    return allTiles;
  }

}
