
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/enums/guest_groups.dart';
import 'package:planyoureventmobile/screens/guests/add_guest_content.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/styling/gradient_bar.dart';

class AddNewGuestScreen extends StatelessWidget {
  final GuestType guestType;
  const AddNewGuestScreen({Key key, this.guestType}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors['backgroud_color'],
      appBar: AppBar(
        centerTitle: true,
        title: Text(appStrings['addNewGuest']),
        flexibleSpace: getGradientBar,
      ),
      body: AddNewGuestContent(guestType: guestType),
    );
  }
}
