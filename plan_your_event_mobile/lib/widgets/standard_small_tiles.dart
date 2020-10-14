import 'package:flutter/material.dart';
import 'file:///C:/Users/User/Documents/GitHub/PlanYourEventMobile/plan_your_event_mobile/lib/screens/parties/add_party/create_party_screen.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';

class SmallPartyScrollTiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
           child: Flexible(
             child: Row(
               children:
                _buildRowWithSmallTiles,
             ),
           ),
        )
      ]),
    );
  }


  List<Widget> get _buildRowWithSmallTiles {

    List<Widget> allTiles = [];
    allTiles.add(SmallPartyTile(color: appColors['dark_oragne'], icon: Icons.bubble_chart, title: appStrings['bithdayParty']));
    allTiles.add(SmallPartyTile(color: appColors['sweet_honey'], icon: Icons.bubble_chart, title: appStrings['buisnessMeeting']));
    allTiles.add(SmallPartyTile(color: appColors['dirty_orage'], icon: Icons.bubble_chart, title: appStrings['kinderBall']));
    allTiles.add(SmallPartyTile(color: appColors['sweet_blue'], icon: Icons.bubble_chart, title: appStrings['familyMeeting']));
    allTiles.add(SmallPartyTile(color: appColors['sea_blue'], icon: Icons.bubble_chart, title: appStrings['babyShower']));
    allTiles.add(SmallPartyTile(color: appColors['baptism_blue'], icon: Icons.bubble_chart, title: appStrings['baptism']));
    allTiles.add(SmallPartyTile(color: appColors['light_blue'], icon: Icons.bubble_chart, title: appStrings['holyCommunion']));

    return allTiles;
  }
}

class SmallPartyTile extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;

  const SmallPartyTile({Key key, this.color, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 20),
        child: GestureDetector(
          onTap: () => Navigator.push(context,
              new MaterialPageRoute(builder: (context) => CreatePartyScreen(partyType: title))),
          child: Container(
            height: 71,
            width: 100,
            decoration: BoxDecoration(
                color: color,
                border: Border.all(
                  color: color,
                ),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      icon,
                      size: 40,
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Flexible(
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 13),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}
