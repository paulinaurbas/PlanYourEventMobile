import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/models/guest.dart';
import 'package:planyoureventmobile/my_flutter_app_icons.dart';

class StandardContactCard extends StatefulWidget {
  final Guest guest;
  final bool isEditable;

  const StandardContactCard({
    Key key,
    this.guest, this.isEditable,
  }) : super(key: key);

  @override
  _StandardContactCardState createState() => _StandardContactCardState();
}

class _StandardContactCardState extends State<StandardContactCard> {
  bool isAdded = false;

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
                    child: Text(widget.guest.name + ' ' + widget.guest.surname,
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5, 15, 10),
                    child: widget.isEditable ? editGuest : addToPartyGuest,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Icon(
                      MyFlutterApp.phone_handset,
                      size: 14.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      widget.guest.phoneNumber,
                      style: TextStyle(
                        fontSize: 13,
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
                    child: Icon(
                      Icons.mail_outline,
                      size: 15.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 11),
                    child: Text(
                      widget.guest.email,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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

  Widget get addToPartyGuest {
    return GestureDetector(
    onTap: () {
      setState(() {
        isAdded = !isAdded;
      });
    },
    child: Icon(
      isAdded ? Icons.check_circle : Icons.check_circle_outline,
      color: isAdded ? Colors.green : Colors.black,
      size: 20,
    ),
  );
  }

      Widget get editGuest =>GestureDetector(
        onTap: () {

        },
        child: Icon(
          MyFlutterApp.edit,
          size: 20,
        ),
      );

      List<Widget> get getGuestFoodPreferences {
    List<Widget> list = List<Widget>();
    if (!(widget.guest.noEggs))
      list.add(getPreferencesIcons(MyFlutterApp.protein));
    if (!(widget.guest.noFish))
      list.add(getPreferencesIcons(MyFlutterApp.fish));
    if (!(widget.guest.glutenFree))
      list.add(getPreferencesIcons(MyFlutterApp.wheat));
    if (!(widget.guest.noMilk))
      list.add(getPreferencesIcons(MyFlutterApp.milk));
    if (!(widget.guest.noMeat))
      list.add(getPreferencesIcons(MyFlutterApp.meat__2_));
    if (!(widget.guest.noNuts))
      list.add(getPreferencesIcons(MyFlutterApp.peanut));
    if (!(widget.guest.noSeaFood))
      list.add(getPreferencesIcons(MyFlutterApp.crab));
    if (widget.guest.vegan)
      list.add(getPreferencesIcons(MyFlutterApp.eco_24px));
    return list;
  }

  Widget getPreferencesIcons (IconData icon){
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
       child: ClipOval(child: Icon(
               icon,
               size: 18,
               ),
     )
     ),
   );
  }
}
