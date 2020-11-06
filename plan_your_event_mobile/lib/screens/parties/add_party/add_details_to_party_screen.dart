import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/styling/gradient_bar.dart';
import 'add_details_to_party_content.dart';

class AddPartyDetailsScreen extends StatelessWidget {
  final String partyType;

  const AddPartyDetailsScreen({Key key, this.partyType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors['backgroud_color'],
      appBar: AppBar(
        centerTitle: true,
        title: Text(appStrings['eventDetails']),
        flexibleSpace: getGradientBar,
      ),
      body: AddDetailsToPartyContent(partyType: partyType),
    );
  }
}