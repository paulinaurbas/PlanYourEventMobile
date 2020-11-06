import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/styling/gradient_bar.dart';

import 'add_guest_to_party_content.dart';
import 'create_party_content.dart';

class AddGuestToPartyScreen extends StatelessWidget {

  const AddGuestToPartyScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final partyID = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: appColors['backgroud_color'],
      appBar: AppBar(
        centerTitle: true,
        title: Text(appStrings['eventDetails']),
        flexibleSpace: getGradientBar,
      ),
      body: AddGuestToPartyContent(partyId: partyID),
    );
  }
}