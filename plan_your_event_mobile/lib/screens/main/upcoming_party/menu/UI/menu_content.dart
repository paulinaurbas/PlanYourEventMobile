import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/bloc/menu_bloc.dart';
import 'package:planyoureventmobile/bloc/party_bloc.dart';
import 'package:planyoureventmobile/models/menu.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/menu/widgets/menu_card.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/widgets/plan_your_event_card.dart';
import 'package:planyoureventmobile/widgets/standard_add_card.dart';

class MenuContent extends StatefulWidget {
  final String partyID;
  const MenuContent({
    Key key, this.partyID
  }) : super(key: key);

  @override
  _MenuContentState createState() => _MenuContentState();
}

class _MenuContentState extends State<MenuContent> {
  MenuBloc menuBloc = MenuBloc();

  @override
  void initState() {
    super.initState();
    menuBloc.getPartyMenu(widget.partyID);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        PlanYourEventCard(
          pictureName: 'assets/images/lunch_with_friends.png',
          height: 180,
          width: 300,
          title: appStrings['menu'],
        ),
        Column(
          children: [getGuestStream
          ],
        )
      ]),
    );
  }

  Widget get getGuestStream {
    return StreamBuilder<List<Menu>>(
      stream: menuBloc.menuList.stream,
      builder: (context, AsyncSnapshot<List<Menu>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return Column(
              children: _buildGuestListWidget(snapshot.data),
            );
          } else if (snapshot.data.isEmpty) {
            return StandardAddCard(
                route: '/AddMenu', partyId: widget.partyID);
          } else {
            return StandardAddCard(
                route: '/AddMenu', partyId: widget.partyID);
          }
        } else if (snapshot.hasError) {
          return Container();
        } else if (snapshot.data == null || snapshot.data.isEmpty) {
          return StandardAddCard(
              route: '/AddMenu', partyId: widget.partyID);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
  List<Widget> _buildGuestListWidget(List<Menu> data) {
    List<Widget> allTiles = [];
    data.forEach((element) {
      allTiles.add(MenuCard(menu: element));
    });
    allTiles.add(StandardAddCard(
        route: '/AddMenu', partyId: widget.partyID));
    return allTiles;
  }
}