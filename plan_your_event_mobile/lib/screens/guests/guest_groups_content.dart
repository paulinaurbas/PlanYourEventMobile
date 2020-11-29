import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/widgets/plan_your_event_card.dart';
import 'package:planyoureventmobile/widgets/standard_big_colorful_tiles.dart';

import '../../my_flutter_app_icons.dart';

class GuestGroupContent extends StatefulWidget {
  final String partyId;

  const GuestGroupContent({
    Key key,
    this.partyId,
  }) : super(key: key);

  @override
  _GuestGroupContentState createState() => _GuestGroupContentState();
}

class _GuestGroupContentState extends State<GuestGroupContent> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        flex:  4,
        child: PlanYourEventCard(
          pictureName: 'assets/images/family_group.png',
          height: widget.partyId == null ? 145 : 130,
          width: 300,
          title: appStrings['guestGroupsLabel'],
        ),
      ),
      Expanded(
        flex: 0,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/FamilyGroupScreen',
                    arguments: widget.partyId);
              },
              child: StandardBigColorfulTiles(
                  color: appColors['dirty_orage'],
                  icon:  MyFlutterApp.family,
                  title: appStrings['family'])),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/FriendGroupScreen',
                    arguments: widget.partyId);
              },
              child: StandardBigColorfulTiles(
                  color: appColors['sweet_honey'],
                  icon:  MyFlutterApp.high_five,
                  title: appStrings['friends'])),
        ]),
      ),
      Expanded(
        flex: 0,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/WorkGroupScreen',
                    arguments: widget.partyId);
              },
              child: StandardBigColorfulTiles(
                  color: appColors['pink'],
                  icon:  MyFlutterApp.team,
                  title: appStrings['work'])),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/OthersGroupScreen',
                    arguments: widget.partyId);
              },
              child: StandardBigColorfulTiles(
                  color: appColors['sweet_green'],
                  icon:  MyFlutterApp.group,
                  title: appStrings['others'])),
        ]),
      ),
      widget.partyId != null ? Expanded(
        flex:1 ,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/WorkGroupScreen',
                    arguments: widget.partyId);
              },
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/Home',
                      arguments: widget.partyId);

                },
                color: appColors['buttons_orange'],
                splashColor: appColors['gradinet_bright_color'],
                child: Text(appStrings['next']),
              ))
        ]),
      ) : Spacer(flex: 1),
    ]);
  }
}
