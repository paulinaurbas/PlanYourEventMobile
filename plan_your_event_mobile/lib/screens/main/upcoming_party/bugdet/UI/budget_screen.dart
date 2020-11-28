import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/styling/gradient_bar.dart';

import 'budget_content.dart';

class BudgetScreen extends StatelessWidget {
  final String partyType;

  const BudgetScreen({Key key, this.partyType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final partyId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: appColors['backgroud_color'],
      appBar: AppBar(
        centerTitle: true,
        title: Text(appStrings['budget']),
        flexibleSpace: getGradientBar,
      ),
      body: BudgetContent(partyID: partyId, ),
    );
  }
}