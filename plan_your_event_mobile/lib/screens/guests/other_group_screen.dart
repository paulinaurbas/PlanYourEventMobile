import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/screens/guests/other_group_content.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/styling/gradient_bar.dart';


class OtherGroupScreen extends StatelessWidget {

  const OtherGroupScreen({Key key,}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors['backgroud_color'],
      appBar: AppBar(
        centerTitle: true,
        title: Text(appStrings['others']),
        flexibleSpace: getGradientBar,
      ),
      body: OthersGroupContent(),
    );
  }
}
