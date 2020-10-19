import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:planyoureventmobile/models/guest.dart';
import 'file:///C:/Users/User/Documents/GitHub/PlanYourEventMobile/plan_your_event_mobile/lib/screens/parties/add_party/details_tiles.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/widgets/guest_tiles.dart';

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
                  getSingleCard(color: appColors['sweet_green'], icon: Icons.bubble_chart, title: appStrings['menu']),
                  getSingleCard(color: appColors['pink'], icon: Icons.bubble_chart, title: appStrings['budget']),
                  ]),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  getSingleCard(color: appColors['sweet_blue'], icon: Icons.bubble_chart, title: appStrings['documents']),
                  getSingleCard(color: appColors['button_grey'], icon: Icons.bubble_chart, title: appStrings['plan']),
                ]
              ),
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getSingleCard(color: appColors['dark_oragne'], icon: Icons.bubble_chart, title: appStrings['supliers']),
                    getSingleCard(color: appColors['sea_blue'], icon: Icons.bubble_chart, title: appStrings['next']),
                  ]
              ),
            ),
          ])
        ],
      ),
    );
  }

  Widget getSingleCard ({Color color, IconData icon, String title}) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      width: 124,
      height: 111,
      decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color:color,
          ),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Icon(
                icon,
                size: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );


}