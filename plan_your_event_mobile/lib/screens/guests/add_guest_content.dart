import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planyoureventmobile/bloc/add_guest_bloc.dart';
import 'package:planyoureventmobile/enums/guest_groups.dart';
import 'package:planyoureventmobile/my_flutter_app_icons.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/utils/standard_error_hanler.dart';
import 'package:planyoureventmobile/widgets/food_preferences_tiles.dart';
import 'package:planyoureventmobile/widgets/standard_big_colorful_tiles.dart';

class AddNewGuestContent extends StatefulWidget {
  final GuestType guestType; 
  AddNewGuestContent({Key key, this.guestType}) : super(key: key);

  @override
  _AddNewGuestContentState createState() => _AddNewGuestContentState();
}

class _AddNewGuestContentState extends State<AddNewGuestContent> {
  bool noMilk = false;
  bool glutenFree = false;
  bool noMeat = false;
  bool noSeaFood = false;
  bool vegan = false;
  bool noNuts = false;
  bool noEggs = false;
  bool noFish = false;
  bool friends = false;
  bool family = false;
  bool work = false;
  bool others = false;

  AddGuestBloc _addGuestBloc = AddGuestBloc();

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(children: [
          getNameAndSurnameBox,
          getContactBox,
         getGroupTiles,
          getPreferencesTiles,
          getButton
        ])
      ]),
    );
  }

  Widget get getNameAndSurnameBox => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(12.0),
                        ),
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(12.0),
                        ),
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      labelText: 'Name',
                      contentPadding: EdgeInsets.all(10)),
                  keyboardType: TextInputType.text,
                  onChanged: _addGuestBloc.changeGuestName,
                  inputFormatters: [
                    WhitelistingTextInputFormatter(RegExp("[a-z A-Z á-ú Á-Ú]"))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(12.0),
                        ),
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(12.0),
                        ),
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      labelText: 'Surname',
                      contentPadding: EdgeInsets.all(10)),
                  keyboardType: TextInputType.text,
                  onChanged: _addGuestBloc.changeGuestSurname,
                  inputFormatters: [
                    WhitelistingTextInputFormatter(RegExp("[a-z A-Z á-ú Á-Ú]"))
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget get getContactBox => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text(appStrings['contactInfo'],
                      style: TextStyle(fontSize: 18))
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                child: Row(children: [
                  Flexible(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(12.0),
                            ),
                            borderSide: BorderSide(color: Colors.black, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(12.0),
                            ),
                            borderSide: BorderSide(color: Colors.black, width: 1.0),
                          ),
                          labelText: 'Email',
                          contentPadding: EdgeInsets.all(10)),
                      keyboardType: TextInputType.text,
                      onChanged: _addGuestBloc.guestEmail,
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    child: Flexible(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(12.0),
                              ),
                              borderSide: BorderSide(color: Colors.black, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(12.0),
                              ),
                              borderSide: BorderSide(color: Colors.black, width: 1.0),
                            ),
                            labelText: 'Phone',
                            contentPadding: EdgeInsets.all(10)),
                        keyboardType: TextInputType.phone,
                        onChanged: _addGuestBloc.changePhone,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(9),
                          WhitelistingTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ]),
          ),
        ],
      ));

  Widget get getGroupTiles =>
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Text(appStrings['group'], style: TextStyle(fontSize: 18))
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      family = true;
                      friends = false;
                      work = false;
                      others = false;
                    });
                  },
                  child: StandardBigColorfulTiles(
                      color: appColors['dark_oragne'],
                      icon: MyFlutterApp.family,
                      iconSize: 18,
                      height: 57,
                      width: 72,
                      padding: 5,
                      title: appStrings['family']),
                ),
                family
                    ? Icon(
                        Icons.check_circle_outline,
                        color: Colors.black,
                      )
                    : Icon(
                        Icons.check_circle_outline,
                        color: Colors.transparent,
                      ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      family = false;
                      friends = true;
                      work = false;
                      others = false;
                    });
                  },
                  child: StandardBigColorfulTiles(
                      color: appColors['sweet_honey'],
                      iconSize: 18,
                      height: 57,
                      padding: 5,
                      width: 72,
                      icon: MyFlutterApp.high_five,
                      title: appStrings['friends']),
                ),
                friends
                    ? Icon(
                        Icons.check_circle_outline,
                        color: Colors.black,
                      )
                    : Icon(
                        Icons.check_circle_outline,
                        color: Colors.transparent,
                      ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      family = false;
                      friends = false;
                      work = true;
                      others = false;
                    });
                  },
                  child: StandardBigColorfulTiles(
                      color: appColors['pink'],
                      iconSize: 18,
                      height: 57,
                      width: 72,
                      padding: 5,
                      icon: MyFlutterApp.team,
                      title: appStrings['work']),
                ),
                work
                    ? Icon(
                        Icons.check_circle_outline,
                        color: Colors.black,
                      )
                    : Icon(
                        Icons.check_circle_outline,
                        color: Colors.transparent,
                      ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      family = false;
                      friends = false;
                      work = false;
                      others = true;
                    });
                  },
                  child: StandardBigColorfulTiles(
                      color: appColors['sweet_green'],
                      iconSize: 18,
                      height: 57,
                      width: 72,
                      padding: 5,
                      icon:  MyFlutterApp.group,
                      title: appStrings['others']),
                ),
                others
                    ? Icon(
                        Icons.check_circle_outline,
                        color: Colors.black,
                      )
                    : Icon(
                        Icons.check_circle_outline,
                        color: Colors.transparent,
                      ),
              ],
            ),
          ]),
        )
      ]);

  Widget get getPreferencesTiles =>
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Text(appStrings['group'], style: TextStyle(fontSize: 18))
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            noFish = !noFish;
                          });
                        },
                        child: FoodPreferencesTile(
                            icon: MyFlutterApp.no,
                            title: appStrings['noFish'])),
                    noFish
                        ? Icon(
                            Icons.check_circle_outline,
                            color: Colors.black,
                          )
                        : Icon(
                            Icons.check_circle_outline,
                            color: Colors.transparent,
                          ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            noMilk = !noMilk;
                          });
                        },
                        child: FoodPreferencesTile(
                            icon: MyFlutterApp.dairy,
                            title: appStrings['noMilk'])),
                    noMilk
                        ? Icon(
                            Icons.check_circle_outline,
                            color: Colors.black,
                          )
                        : Icon(
                            Icons.check_circle_outline,
                            color: Colors.transparent,
                          ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            glutenFree = !glutenFree;
                          });
                        },
                        child: FoodPreferencesTile(
                            icon: MyFlutterApp.wheat,
                            title: appStrings['glutenFree'])),
                    glutenFree
                        ? Icon(
                            Icons.check_circle_outline,
                            color: Colors.black,
                          )
                        : Icon(
                            Icons.check_circle_outline,
                            color: Colors.transparent,
                          ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            noMeat = !noMeat;
                          });
                        },
                        child: FoodPreferencesTile(
                            icon:MyFlutterApp.meat,
                            title: appStrings['noMeat'])),
                    noMeat
                        ? Icon(
                            Icons.check_circle_outline,
                            color: Colors.black,
                          )
                        : Icon(
                            Icons.check_circle_outline,
                            color: Colors.transparent,
                          ),
                  ],
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            noSeaFood = !noSeaFood;
                          });
                        },
                        child: FoodPreferencesTile(
                            icon: MyFlutterApp.crab,
                            title: appStrings['noSeaFood'])),
                    noSeaFood
                        ? Icon(
                            Icons.check_circle_outline,
                            color: Colors.black,
                          )
                        : Icon(
                            Icons.check_circle_outline,
                            color: Colors.transparent,
                          ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            vegan = !vegan;
                          });
                        },
                        child: FoodPreferencesTile(
                            icon: MyFlutterApp.eco_24px,
                            title: appStrings['vegan'])),
                    vegan
                        ? Icon(
                            Icons.check_circle_outline,
                            color: Colors.black,
                          )
                        : Icon(
                            Icons.check_circle_outline,
                            color: Colors.transparent,
                          ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            noNuts = !noNuts;
                          });
                        },
                        child: FoodPreferencesTile(
                            icon: MyFlutterApp.nut,
                            title: appStrings['noNuts'])),
                    noNuts
                        ? Icon(
                            Icons.check_circle_outline,
                            color: Colors.black,
                          )
                        : Icon(
                            Icons.check_circle_outline,
                            color: Colors.transparent,
                          ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            noEggs = !noEggs;
                          });
                        },
                        child: FoodPreferencesTile(
                            icon: MyFlutterApp.protein,
                            title: appStrings['noEggs'])),
                    noEggs
                        ? Icon(
                            Icons.check_circle_outline,
                            color: Colors.black,
                          )
                        : Icon(
                            Icons.check_circle_outline,
                            color: Colors.transparent,
                          ),
                  ],
                ),
              ]),
            ],
          ),
        )
      ]);

  Widget get getButton => Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          onPressed: () {
            if (_addGuestBloc.validateFields()) {
              createGuest();
            } else {
              String message = appStrings["smtWentWrong"];
              displaySnackbar(context, message);
            }
          },
          color: appColors['buttons_orange'],
          splashColor: appColors['gradinet_bright_color'],
          child: Text(appStrings['next']),
        ),
      );

  void createGuest() {
    GuestType guestType = getGuestType(family, friends, work, others);
    _addGuestBloc.addGuest(noMilk,
        glutenFree ,
        noMeat,
        noSeaFood,
        vegan,
        noNuts ,
        noEggs ,
        noFish , guestType).then((value) {
        Navigator.pop(context);
    });
  }


}
