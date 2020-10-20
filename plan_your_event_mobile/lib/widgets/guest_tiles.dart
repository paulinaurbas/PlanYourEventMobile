import 'package:flutter/material.dart';
import 'package:planyoureventmobile/models/guest.dart';
import 'package:planyoureventmobile/styling/colors.dart';

class GuestScrollTiles extends StatelessWidget {
  final List<Guest> guestList;

  const GuestScrollTiles({Key key, this.guestList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: _buildRowWithSmallTiles,
          ),
        )
      ]),
    );
  }

  List<Widget> get _buildRowWithSmallTiles {
    List<Widget> allTiles = [];
    if(guestList == null || guestList.isEmpty){
      allTiles.add(getEmptyGuestTile);
    } else {
      guestList.forEach((element) {
        allTiles.add(GuestTile(guest: element));
      });
      allTiles.add(getEmptyGuestTile);
    }
    return allTiles;
  }

  Widget get getEmptyGuestTile => Padding(
        padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 7),
        child: Container(
          height: 71,
          width: 100,
          decoration: BoxDecoration(
              color: appColors['tiles_orange'],
              border: Border.all(
                color: appColors['tiles_orange'],
              ),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add),
            ],
          ),
        ),
      );
}

class GuestTile extends StatelessWidget {
  final Guest guest;

  const GuestTile({Key key, this.guest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 20),
      child: Container(
        height: 71,
        width: 100,
        decoration: BoxDecoration(
            color: appColors['tiles_orange'],
            border: Border.all(
              color: appColors['tiles_orange'],
            ),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
