import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planyoureventmobile/bloc/menu_bloc.dart';
import 'package:planyoureventmobile/enums/drop_down_values.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/widgets/food_preferences_tiles.dart';
import 'package:planyoureventmobile/widgets/standard_big_colorful_tiles.dart';

class AddMenuContent extends StatefulWidget {
  final String partyID;
  const AddMenuContent({Key key, this.partyID}) : super(key: key);

  @override
  _AddMenuContentState createState() => _AddMenuContentState();
}

class _AddMenuContentState extends State<AddMenuContent> {
  String dropDownValue;
  bool kids = false;
  bool glutenFree = false;
  bool noSeaFood = false;
  bool vegan = false;
  bool noMeat = false;
  bool noEggs = false;
  bool noFish = false;
  bool water = false;
  bool hotDrinks = false;
  bool coldDrinks = false;
  bool alcohol = false;
  String type;
  String drinkType;
  MenuBloc _bloc = MenuBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Column(children: [getTypeAmountRow, getDescriptionRow, getPreferencesTiles, getDrinksTiles, getButton])),
        ),
      ),
    );
  }
  Widget get getTypeAmountRow=> Padding(
    padding: const EdgeInsets.all(2.0),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: getDropDown
        ),
        getPriceTextInput,
        getAmountTextInput,
      ],
    ),
  );

  Widget get getAmountTextInput => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 80,
      child: TextFormField(
        onChanged: _bloc.changeAmount,
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
            labelText: 'Amount',
            contentPadding: EdgeInsets.all(10)),
        keyboardType: TextInputType.number,
        inputFormatters: [
          WhitelistingTextInputFormatter.digitsOnly
        ],
      ),
    ),
  );

  Widget get getDrinkAmountTextInput => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 80,
      child: TextFormField(
        onChanged: _bloc.changeDrinkAmount,
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
            labelText: 'Amount',
            contentPadding: EdgeInsets.all(10)),
        keyboardType: TextInputType.number,
        inputFormatters: [
          WhitelistingTextInputFormatter.digitsOnly
        ],
      ),
    ),
  );

  Widget get getPriceTextInput => Container(
    width: 80,
    child: TextFormField(
      onChanged: _bloc.changePrice,
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
          labelText: 'Prize',
          contentPadding: EdgeInsets.all(10)),
      keyboardType: TextInputType.number,

    ),
  );

  Widget get getDropDown =>  Container(
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.all(Radius.circular(12))
    ),
    height: 48,
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: DropdownButton<String>(
        value: type,
        icon: Icon(Icons.keyboard_arrow_down),
        iconSize: 20,
        elevation: 12,
        underline: Container(
          height: 2,
          color: Colors.transparent,
        ),
        onChanged:
            (String newValue) {
          setState(() {
            type = newValue;
          });
        },
        items: <String>[
          'Appetizer',
          'Main course',
          'Dessert',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    ),
  );

  Widget get getDescriptionRow => Padding(
        padding: const EdgeInsets.only(left: 2.0, right: 15.0, bottom: 5, top: 5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                onChanged: _bloc.changeDescription,
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
                    labelText: 'Description',
                    contentPadding: EdgeInsets.all(10)),
                keyboardType: TextInputType.text,
                inputFormatters: [
                  WhitelistingTextInputFormatter(RegExp("[a-z A-Z á-ú Á-Ú]"))
                ],
              ),
            ),
          ],
        ),
      );
  Widget get getPreferencesTiles =>
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
       Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 12.0),
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              noFish = !noFish;
                            });
                          },
                          child: FoodPreferencesTile(
                              border: true,
                              icon: Icons.bubble_chart,
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              kids = !kids;
                            });
                          },
                          child: FoodPreferencesTile(
                              border: true,
                              icon: Icons.bubble_chart,
                              title: appStrings['kids'])),
                      kids
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              glutenFree = !glutenFree;
                            });
                          },
                          child: FoodPreferencesTile(
                              border: true,
                              icon: Icons.bubble_chart,
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
                ),
                Column(
                  children: [
                  ],
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 12.0),
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              noSeaFood = !noSeaFood;
                            });
                          },
                          child: FoodPreferencesTile(
                              border: true,
                              icon: Icons.bubble_chart,
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              vegan = !vegan;
                            });
                          },
                          child: FoodPreferencesTile(
                              border: true,
                              icon: Icons.bubble_chart,
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              noMeat = !noMeat;
                            });
                          },
                          child: FoodPreferencesTile(
                              border: true,
                              icon: Icons.bubble_chart,
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
                ),
                Column(
                ),
              ]),
            ],
          ),
        )
      ]);

  Widget get getDrinksTiles =>
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Text(appStrings['drinks'], style: TextStyle(fontSize: 18))
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      hotDrinks = false;
                      water = true;
                      coldDrinks = false;
                      alcohol = false;
                    });
                  },
                  child: StandardBigColorfulTiles(
                      color: appColors['dark_oragne'],
                      border: true,
                      icon: Icons.bubble_chart,
                      iconSize: 18,
                      height: 57,
                      width: 60,
                      padding: 5,
                      title: appStrings['water']),
                ),
                water
                    ? Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                )
                    : Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.transparent,
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      hotDrinks = true;
                      water = false;
                      coldDrinks = false;
                      alcohol = false;
                    });
                  },
                  child: StandardBigColorfulTiles(
                      color: appColors['sweet_honey'],
                      border: true,
                      iconSize: 18,
                      height: 57,
                      padding: 5,
                      width: 60,
                      icon: Icons.bubble_chart,
                      title: appStrings['hotDrinks']),
                ),
                hotDrinks
                    ? Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                )
                    : Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.transparent,
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      hotDrinks = false;
                      water = false;
                      coldDrinks = true;
                      alcohol = false;
                    });
                  },
                  child: StandardBigColorfulTiles(
                      color: appColors['pink'],
                      border: true,
                      iconSize: 18,
                      height: 57,
                      width: 60,
                      padding: 5,
                      icon: Icons.bubble_chart,
                      title: appStrings['coldDrinks']),
                ),
                coldDrinks
                    ? Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                )
                    : Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.transparent,
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      hotDrinks = false;
                      water = false;
                      coldDrinks = false;
                      alcohol = true;
                    });
                  },
                  child: StandardBigColorfulTiles(
                      color: appColors['sweet_green'],
                      iconSize: 18,
                      border: true,
                      height: 57,
                      width: 60,
                      padding: 5,
                      icon: Icons.bubble_chart,
                      title: appStrings['alcohol']),
                ),
                alcohol
                    ? Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                )
                    : Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.transparent,
                ),
              ],
            ),
          ]),
        ),
        getDrinkRow
      ]);

  Widget get getDrinkRow => Padding(
    padding: const EdgeInsets.only(left: 16.0, right: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getTypeDropDown,
        getAmountTextInput
      ],
    ),
  );

  Widget get getTypeDropDown {
    List <String> valueList = getDrinkList;
    return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.all(Radius.circular(12))
    ),
    height: 48,
    width: 180,
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: drinkType,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down),
          iconSize: 20,
          elevation: 12,
          underline: Container(
            height: 2,
            color: Colors.transparent,
          ),
          onChanged:
              (String newValue) {
            setState(() {
              drinkType = newValue;
            });
          },
          items: valueList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    ),
  );
  }

  Widget get getButton => Padding(
    padding: const EdgeInsets.all(8.0),
    child: FlatButton(
      onPressed: () {
        saveMenu();
        Navigator.pushNamed(context, '/');
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      color: appColors['button_grey'],
      hoverColor:  appColors['button_grey'],
      child: Text(appStrings['next']),
    ),
  );

  List<String> get getDrinkList{
    if(water){
      return waterList;
    } else if(hotDrinks){
      return hotDrinksList;
    } else if(coldDrinks){
      return coldDrinksList;
    } else if(alcohol)  {
      return alcoholList;
    } else {
      return List<String>();
    }
}

void saveMenu() {
  _bloc.addMenu(type, drinkType, widget.partyID, vegan, noMeat, kids, noSeaFood, noFish, glutenFree);
}
}
