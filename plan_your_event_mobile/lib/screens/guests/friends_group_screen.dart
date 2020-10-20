import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/screens/guests/friends_group_content.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/styling/gradient_bar.dart';


class FriendsGroupScreen extends StatelessWidget {

  const FriendsGroupScreen({Key key,}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors['backgroud_color'],
      appBar: AppBar(
        centerTitle: true,
        title: Text(appStrings['friends']),
        flexibleSpace: getGradientBar,
      ),
      body: FriendsGroupContent(),
    );
  }
}
