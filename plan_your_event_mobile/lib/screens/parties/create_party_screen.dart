import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/styling/gradient_bar.dart';

import 'create_party_content.dart';

class CreatePartyScreen extends StatelessWidget {
final String partyType;

  const CreatePartyScreen({Key key, this.partyType}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors['backgroud_color'],
      appBar: AppBar(
        centerTitle: true,
        title: Text(appStrings['eventDetails']),
        flexibleSpace: getGradientBar,
      ),
      body: CreatePartyContent(partyType: partyType),
    );
  }
}
