import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/bloc/auth_bloc.dart';
import 'package:planyoureventmobile/bloc/party_bloc.dart';
import 'package:planyoureventmobile/models/event_model.dart';
import 'package:planyoureventmobile/repository/auth_repository.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/utils/clipper.dart';
import 'package:planyoureventmobile/utils/standard_time_counter.dart';
import 'package:planyoureventmobile/widgets/standard_big_colorful_tiles.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class DisplayUpcomingPartyContent extends StatefulWidget {
  final Event event;
  const DisplayUpcomingPartyContent({Key key, this.event}) : super(key: key);

  @override
  _DisplayUpcomingPartyContentState createState() =>
      _DisplayUpcomingPartyContentState();
}

class _DisplayUpcomingPartyContentState
    extends State<DisplayUpcomingPartyContent> {
  PartyBloc _partyBloc = PartyBloc();
  AuthRepository _authRepository;
  FirebaseUser user;
  Timer timer;

  @override
  void initState() {
    super.initState();
    _authRepository = Provider.of<AuthRepository>(context, listen: false);
    _partyBloc.getParties();
    user = _authRepository.getUser;
    _partyBloc.getPartyGuestStatusConfirmed(widget.event.eventId);
    _partyBloc.getPartyGuestStatusWaiting(widget.event.eventId);
     timer = Timer.periodic(Duration(seconds: 30), (time) {
       _partyBloc.getPartyGuestStatusConfirmed(widget.event.eventId);
       _partyBloc.getPartyGuestStatusWaiting(widget.event.eventId);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      getCircle,
      getInformationBox,
      Row(
        children: [
          getScrollHorizontalWithTiles,
        ],
      ),
      getGuestBox
    ]);
  }

  Widget get getCircle => ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 10, right: 20),
        height: 210,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: <Color>[
              appColors['gradinet_dark_color'],
              appColors['gradinet_bright_color'],
            ])),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          appStrings["timeLeft"],
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 50),
                        child: Container(
                          width: 115.0,
                          height: 115.0,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              getDiffrenceToPartyStart(widget.event.dateTime),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
            ]),
      ));

  Widget get getInformationBox => Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 5),
      child: Container(
        decoration: BoxDecoration(
            color: appColors['backgound_tile'],
            border: Border.all(
              color: appColors['backgound_tile'],
            ),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getDateTimeColumn,
            getPlaceColumn,
          ],
        ),
      ));

  Widget get getDateTimeColumn => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.calendar_today),
                ),
                Text(widget.event.getFormattedData)
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.access_time),
                ),
                Text(widget.event.getTimeFormatted)
              ]),
            ),
          ],
        ),
      );
  Widget get getPlaceColumn => Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.location_on_outlined),
                ),
                Text(widget.event.address.getStringWithAddress)
              ]),
            ),
          ],
        ),
      );

  Widget get getScrollHorizontalWithTiles =>
      Expanded(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                GestureDetector(
                  onTap: () {
                    Share.share(appStrings['shareMessage']
                        .replaceAll('<date>', widget.event.getFormattedData)
                        .replaceAll('<hour>', widget.event.getTimeFormatted)
                        .replaceAll('<address>',
                            widget.event.address.getStringWithAddress));
                  },
                  child: StandardBigColorfulTiles(
                      color: appColors['amarant'],
                      iconSize: 40,
                      height: 78,
                      width: 82,
                      padding: 5,
                      icon: Icons.bubble_chart,
                      title: appStrings['share']),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/PartyInspirationWebView');
                  },
                  child: StandardBigColorfulTiles(
                      color: appColors['dark_orange'],
                      iconSize: 40,
                      height: 78,
                      width: 82,
                      padding: 5,
                      icon: Icons.bubble_chart,
                      title: appStrings['inspiration']),
                ),
              ]),
            ),
          )
        ]),
      );

  Widget get getGuestBox => GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/PartyGuestsConfirmation', arguments: widget.event.eventId);
      },
      child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 26, 18, 5),
          child: Container(
            decoration: BoxDecoration(
                color: appColors['backgound_tile'],
                border: Border.all(
                  color: appColors['backgound_tile'],
                ),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.people_outline,
                    size: 42,
                  ),
                ),
                Column(children: [getConfirmationRow, getWaitingRow]),
              ],
            ),
          )));
  Widget get getConfirmationRow => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text(
          appStrings["guest"],
          style: TextStyle(fontSize: 18),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<int>(
              stream: _partyBloc.confirmedGuest,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(appStrings["confirmed"]),
                      Text(snapshot.data.toString(),
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ],
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(appStrings["confirmed"]),
                      Text("0",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ],
                  );
                }
              }),
        )
      ]));
  Widget get getWaitingRow => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: StreamBuilder<int>(
            stream: _partyBloc.waitingGuest,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(appStrings["waiting"]),
                    Text(snapshot.data.toString(),
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ],
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(appStrings["waiting"]),
                    Text("0",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ],
                );
              }
            }),
      );
}
