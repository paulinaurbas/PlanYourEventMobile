import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/screens/guests/family_group_content.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/styling/gradient_bar.dart';


class FamilyGroupScreen extends StatelessWidget {
  const FamilyGroupScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final partyId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: appColors['backgroud_color'],
      appBar: AppBar(
        centerTitle: true,
        title: Text(appStrings['family']),
        flexibleSpace: getGradientBar,
      ),
      body: FamilyGroupContent(partyID: partyId),
    );
  }
}
