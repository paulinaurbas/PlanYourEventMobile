import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/screens/guests/guest_groups_content.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/styling/gradient_bar.dart';


class GuestGroupScreen extends StatelessWidget {

  const GuestGroupScreen({Key key,}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors['backgroud_color'],
      appBar: AppBar(
        centerTitle: true,
        title: Text(appStrings['guestGroup']),
        flexibleSpace: getGradientBar,
      ),
      body: GuestGroupContent(),
    );
  }
}
