import 'package:flutter/material.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';

class DetailsScrollTiles extends StatelessWidget {

  const DetailsScrollTiles({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _buildRowWithSmallTiles,
          ),
        )
      ]),
    );
  }

  List<Widget> get _buildRowWithSmallTiles {
    List<Widget> allTiles = [];
    allTiles.add(DetailsTile(icon: Icons.bubble_chart, title: appStrings['budget']));
    allTiles.add(DetailsTile(icon: Icons.fastfood, title: appStrings['menu']));
    allTiles.add(DetailsTile(icon: Icons.person, title: appStrings['supliers']));
    allTiles.add(DetailsTile(icon: Icons.account_circle, title: appStrings['documents']));
    allTiles.add(DetailsTile(icon: Icons.bubble_chart, title: appStrings['inspiration']));

    return allTiles;
  }
}

class DetailsTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const DetailsTile({Key key, this.icon, this.title,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 20),
      child: Container(
        height: 71,
        width: 100,
        decoration: BoxDecoration(
            color: appColors['tilesOrange'],
            border: Border.all(
              color: appColors['tilesOrange'],
            ),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  icon,
                  size: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Flexible(
                  child: Text(
                    title,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
