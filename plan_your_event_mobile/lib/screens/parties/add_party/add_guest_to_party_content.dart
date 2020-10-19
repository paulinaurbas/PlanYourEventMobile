import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:planyoureventmobile/models/guest.dart';
import 'file:///C:/Users/User/Documents/GitHub/PlanYourEventMobile/plan_your_event_mobile/lib/screens/parties/add_party/details_tiles.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/widgets/guest_tiles.dart';
import 'package:planyoureventmobile/widgets/plan_your_event_card.dart';

class AddGuestToPartyContent extends StatefulWidget {
  final String partyType;

  const AddGuestToPartyContent({Key key, this.partyType}) : super(key: key);

  @override
  _AddGuestToPartyContentState createState() => _AddGuestToPartyContentState();
}

class _AddGuestToPartyContentState extends State<AddGuestToPartyContent> {
  String dropDownValue;
  List<Guest> guestList = List<Guest>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors['backgroud_color'],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(children: [
              getGuestList,
              getButton,
              getImage,
            ])
          ],
        ),
      ),
    );
  }
    Widget get getGuestList => Container(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 19.0, top: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              child: Text(
                                appStrings["guest"],
                                style: TextStyle(fontSize: 17),
                              )),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: InkWell(
                              child: Text(appStrings['allList'],
                                  style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.w600,
                                  )),
                              onTap: () {
                              },
                            ),
                          )
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0, top: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GuestScrollTiles(guestList: guestList),
                      ],
                    ),
                  ),
                ],
              ),
            )));

  Widget get getImage => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
          child: Container(
            child: PlanYourEventCard(pictureName: 'assets/images/party_welocome.png', height: 218, width: 300, title: ""),
            )),
    ],
  );

    Widget get getButton => Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        onPressed: () {
          Navigator.pushNamed(context, '/PartyDetails');
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        color: appColors['button_grey'],
        hoverColor:  appColors['button_grey'],
        child: Text(appStrings['next']),
      ),
    );
  }