import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/models/menu.dart';
import 'package:planyoureventmobile/my_flutter_app_icons.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';

class MenuCard extends StatefulWidget {
  final Menu menu;
  const MenuCard({
    Key key, this.menu,
  }) : super(key: key);

  @override
  _MenuCardState createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    List<Widget> preferencesList = List<Widget>();
    return Padding(
      padding: const EdgeInsets.only(left: 19, right: 19, top: 10.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 15, 12, 12),
                    child:
                    Text(widget.menu.type,
                        style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold
                        )),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5, 15, 10),
                    child: Row(
                      children: [
                        editGuest,
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child:  Text(
                      widget.menu.description,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(appStrings['servings'].replaceAll('<amount>', widget.menu.amount.toString()),
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 18),
                    child: Text(
                      appStrings["drinks"],
                      style: TextStyle(
                        fontSize: 17,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 12),
                    child: Text(
                      widget.menu.drink.type,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,  top: 12),
                    child: Text(appStrings['servings'].replaceAll('<amount>', widget.menu.amount.toString()),
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: getGuestFoodPreferences,
                ),
              )
            ],
          )),
    );
  }



  Widget get editGuest => GestureDetector(
    onTap: () {},
    child: Icon(
      MyFlutterApp.edit,
      size: 20,
    ),
  );

  List<Widget> get getGuestFoodPreferences {
    List<Widget> list = List<Widget>();
    if ((widget.menu.kids))
      list.add(getPreferencesIcons(MyFlutterApp.protein));
    if ((widget.menu.noFish)) list.add(getPreferencesIcons(MyFlutterApp.fish));
    if ((widget.menu.glutenFree))
      list.add(getPreferencesIcons(MyFlutterApp.wheat));
    if ((widget.menu.vegetarian))
      list.add(getPreferencesIcons(MyFlutterApp.meat__2_));
    if ((widget.menu.seaFood))
      list.add(getPreferencesIcons(MyFlutterApp.crab));
    if (widget.menu.vegan)
      list.add(getPreferencesIcons(MyFlutterApp.eco_24px));
    return list;
  }

  Widget getPreferencesIcons(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 1.0, left: 3, right: 3),
      child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(12.0)),
            border: new Border.all(
              color: Colors.black,
              width: 0.25,
            ),
          ),
          child: ClipOval(
            child: Icon(
              icon,
              size: 18,
            ),
          )),
    );
  }
}
