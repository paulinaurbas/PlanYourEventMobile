
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/widgets/plan_your_event_card.dart';
import 'package:planyoureventmobile/widgets/standard_big_colorful_tiles.dart';

class GuestGroupContent extends StatefulWidget {

  const GuestGroupContent({Key key, }) : super(key: key);

  @override
  _GuestGroupContentState createState() => _GuestGroupContentState();
}

class _GuestGroupContentState extends State<GuestGroupContent> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      PlanYourEventCard(pictureName: 'assets/images/party_welocome.png',
        height: 180,
        width: 300,
        title: appStrings['guestGroupsLabel'],),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/FamilyGroupScreen');
              },
                child:
            StandardBigColorfulTiles(color: appColors['dirty_orage'], icon: Icons.bubble_chart, title: appStrings['family'])
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/FriendGroupScreen');
                },
                child: StandardBigColorfulTiles(color: appColors['sweet_honey'], icon: Icons.bubble_chart, title: appStrings['friends'])),
          ]),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/WorkGroupScreen');
                },
                child: StandardBigColorfulTiles(color: appColors['pink'], icon: Icons.bubble_chart, title: appStrings['work'])),
            GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/OthersGroupScreen');
                },
                child: StandardBigColorfulTiles(color: appColors['sweet_green'], icon: Icons.bubble_chart, title: appStrings['others'])),
          ]
      ),
    ]);

  }
  }