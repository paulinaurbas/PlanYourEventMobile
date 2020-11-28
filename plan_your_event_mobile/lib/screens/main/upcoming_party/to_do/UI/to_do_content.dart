import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/bloc/menu_bloc.dart';
import 'package:planyoureventmobile/bloc/party_bloc.dart';
import 'package:planyoureventmobile/bloc/to_do_bloc.dart';
import 'package:planyoureventmobile/enums/to_do_categories.dart';
import 'package:planyoureventmobile/models/menu.dart';
import 'package:planyoureventmobile/models/to_do_item.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/menu/widgets/menu_card.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/to_do/Widgets/pie_chart_with_todos.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/to_do/Widgets/pop_up_with_add_new_item.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/to_do/Widgets/status_small_bar.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/to_do/Widgets/to_do_cards.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/widgets/plan_your_event_card.dart';
import 'package:planyoureventmobile/widgets/standard_add_card.dart';

class ToDoContent extends StatefulWidget {
  final String partyID;
  final double toDo;
  final double inProgress;
  final double done;
  const ToDoContent({
    Key key, this.partyID, this.toDo, this.inProgress, this.done
  }) : super(key: key);

  @override
  _ToDoContentState createState() => _ToDoContentState();
}

class _ToDoContentState extends State<ToDoContent> {
  ToDoBloc _bloc = ToDoBloc();
  double todoValue ;
  double inProgress;
  double done;

  @override
  void initState() {
    super.initState();
    todoValue = widget.toDo;
    inProgress = widget.inProgress;
    done = widget.done;
    _bloc.getPartyToDoListThings(widget.partyID);
    _bloc.getPartyInProgressListThings(widget.partyID);
    _bloc.getPartyDoneListThings(widget.partyID);
    _bloc.getPartyInProgressListThings(widget.partyID);
    _bloc.getPartyToDoListThings(widget.partyID);
    _bloc.getPartyDoneListThings(widget.partyID);
    _bloc.getPartyDoneLengthThings(widget.partyID);
    _bloc.getPartyInProgressLengthThings(widget.partyID);
    _bloc.toDoLenght.stream.listen((event) {
      setState(() {
        todoValue = event.toDouble();
      });
    });
    _bloc.inProgressLength.stream.listen((event) {
      setState(() {
        inProgress = event.toDouble();
      });
    });
    _bloc.doneLenght.stream.listen((event) {
      setState(() {
        done = event.toDouble();
      });
    });
    _bloc.getPartyInProgressListThings(widget.partyID);
    _bloc.getPartyDoneListThings(widget.partyID);
    _bloc.toDoListStream.listen((event) {
      if(mounted){
        setState(() {});
      }
    });
    _bloc.inProgressListStream.listen((event) {
      if(mounted){
        setState(() {});
      }
    });
    _bloc.doneListStream.listen((event) {
      if(mounted){
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ToDoChartPie(toDoValue: todoValue, inProgressValue: inProgress, doneValue: done,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Ink(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.add),
                color: Colors.black,
                onPressed: () {
                  _showCupertinoDialog();
                },
              ),
            ),
          ),
        ),
        getToDoStream,
        getInProgressStream,
        getDoneStream

      ]),
    );
  }

  _showCupertinoDialog() {
    showDialog(
        context: context,
        builder: (_) =>
            AlertDialog(
              title: Text(appStrings["addNewToDo"]),
              content: PopUpWithAddToDo(thingsToDoBloc: _bloc,),
              actions: <Widget>[
                FlatButton(
                  child: Text(appStrings["close"]),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text(
                    appStrings["addNewToDo"], textAlign: TextAlign.center,),
                  onPressed: () {
                      _bloc.addToDoToParty(widget.partyID);
                      Navigator.pop(context);
                  },
                ),
              ],
            ));
  }


  Widget get getToDoStream {
    return StreamBuilder<List<ToDoItem>>(
      stream: _bloc.toDoList.stream,
      builder: (context, AsyncSnapshot<List<ToDoItem>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return Column(
              children: [
                ToDoCard(toDoType: appStrings["toDo"], toDoList: snapshot.data,  toDoBloc: _bloc,)
              ],
            );
          } else if (snapshot.data.isEmpty) {
            return Container();
          } else {
            return Container();
          }
        } else if (snapshot.hasError) {
          return Container();
        } else if (snapshot.data == null || snapshot.data.isEmpty) {
          return Container();
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget get getInProgressStream {
    return StreamBuilder<List<ToDoItem>>(
      stream: _bloc.inProgressList.stream,
      builder: (context, AsyncSnapshot<List<ToDoItem>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return Column(
              children: [
                ToDoCard(toDoType: appStrings["inProgress"], toDoList: snapshot.data, toDoBloc: _bloc,)
              ],
            );
          } else if (snapshot.data.isEmpty) {
            return Container();
          } else {
            return StandardAddCard(
                route: '/AddMenu', partyId: widget.partyID);
          }
        } else if (snapshot.hasError) {
          return Container();
        } else if (snapshot.data == null || snapshot.data.isEmpty) {
          return Container();
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget get getDoneStream {
    return StreamBuilder<List<ToDoItem>>(
      stream: _bloc.doneList.stream,
      builder: (context, AsyncSnapshot<List<ToDoItem>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return Column(
              children: [
                ToDoCard(toDoType: appStrings["done"], toDoList: snapshot.data,  toDoBloc: _bloc,)
              ],
            );
          } else if (snapshot.data.isEmpty) {
            return Container();
          } else {
            return Container();
          }
        } else if (snapshot.hasError) {
          return Container();
        } else if (snapshot.data == null || snapshot.data.isEmpty) {
          return Container();
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}



