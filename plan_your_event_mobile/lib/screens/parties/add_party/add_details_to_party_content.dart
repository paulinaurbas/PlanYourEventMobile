import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/widgets/standard_big_colorful_tiles.dart';

class AddDetailsToPartyContent extends StatefulWidget {
  final String partyType;

  const AddDetailsToPartyContent({Key key, this.partyType}) : super(key: key);

  @override
  _AddDetailsToPartyContentState createState() => _AddDetailsToPartyContentState();
}

class _AddDetailsToPartyContentState extends State<AddDetailsToPartyContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors['backgroud_color'],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StandardBigColorfulTiles(color: appColors['sweet_green'], icon: Icons.bubble_chart, title: appStrings['menu']),
                  StandardBigColorfulTiles(color: appColors['pink'], icon: Icons.bubble_chart, title: appStrings['budget']),
                  ]),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StandardBigColorfulTiles(color: appColors['sweet_blue'], icon: Icons.bubble_chart, title: appStrings['documents']),
                StandardBigColorfulTiles(color: appColors['button_grey'], icon: Icons.bubble_chart, title: appStrings['plan']),
                ]
              ),
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StandardBigColorfulTiles(color: appColors['dark_oragne'], icon: Icons.bubble_chart, title: appStrings['supliers']),
                    StandardBigColorfulTiles(color: appColors['sea_blue'], icon: Icons.bubble_chart, title: appStrings['next']),
                  ]
              ),
            ),
          ])
        ],
      ),
    );
  }
}