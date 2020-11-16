import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/to_do/UI/to_do_content.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/to_do/Widgets/pie_chart_with_todos.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/styling/gradient_bar.dart';


class ToDoScreen extends StatelessWidget {
  final String partyType;

  const ToDoScreen({Key key, this.partyType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final partyId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: appColors['backgroud_color'],
      appBar: AppBar(
        centerTitle: true,
        title: Text(appStrings['toDo']),
        flexibleSpace: getGradientBar,
      ),
      body: ToDoContent(partyID: partyId,),
    );
  }
}