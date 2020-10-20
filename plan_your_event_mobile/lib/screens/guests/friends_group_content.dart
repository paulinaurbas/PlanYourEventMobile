import 'package:flutter/cupertino.dart';
import 'package:planyoureventmobile/models/guest.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/widgets/plan_your_event_card.dart';
import 'package:planyoureventmobile/widgets/standard_add_card.dart';
import 'package:planyoureventmobile/widgets/standard_rectangular_conctact_card.dart';

class FriendsGroupContent extends StatefulWidget {

  const FriendsGroupContent({Key key, }) : super(key: key);

  @override
  _FriendsGroupContentState createState() => _FriendsGroupContentState();
}

class _FriendsGroupContentState extends State<FriendsGroupContent> {
  List<Guest> list = new List();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        PlanYourEventCard(pictureName: 'assets/images/party_welocome.png',
          height: 180,
          width: 300,
          title: appStrings['friends'],),
        Column(
          children: _buildRowWithSmallTiles,
        )
      ]),
    );

  }
  List<Widget> get _buildRowWithSmallTiles {
    List<Widget> allTiles = [];
    if(list == null || list.isEmpty){
      allTiles.add(StandardAddCard());
    } else {
      list.forEach((element) {
        allTiles.add(StandardContactCard(guest: element));
      });
      allTiles.add(StandardAddCard());
    }
    return allTiles;
  }

}