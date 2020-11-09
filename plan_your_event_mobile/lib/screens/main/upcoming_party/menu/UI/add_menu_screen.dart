import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/styling/gradient_bar.dart';

import 'add_menu_content.dart';
import 'menu_content.dart';

class AddMenuScreen extends StatelessWidget {
  final String partyType;

  const AddMenuScreen({Key key, this.partyType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final partyId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: appColors['backgroud_color'],
      appBar: AppBar(
        centerTitle: true,
        title: Text(appStrings['addMenu']),
        flexibleSpace: getGradientBar,
      ),
      body: AddMenuContent(partyID: partyId, ),
    );
  }
}