
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/supliers/UI/supliers_content.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/styling/gradient_bar.dart';

import 'add_supliers_content.dart';

class AddSupliersScreen extends StatelessWidget {

  const AddSupliersScreen({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final partyId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        backgroundColor: appColors['backgroud_color'],
        appBar: AppBar(
          centerTitle: true,
          title: Text(appStrings['addSupplier']),
          flexibleSpace: getGradientBar,
        ),
        body: AddSuplierContent(partyId: partyId,)
    );
  }
}