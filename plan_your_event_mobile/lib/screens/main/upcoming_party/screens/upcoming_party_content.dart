import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/bloc/party_bloc.dart';
import 'package:planyoureventmobile/bloc/to_do_bloc.dart';
import 'package:planyoureventmobile/models/event_model.dart';
import 'package:planyoureventmobile/my_flutter_app_icons.dart';
import 'package:planyoureventmobile/repository/auth_repository.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/to_do/UI/to_do_screen.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/widgets/information_box.dart';
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
  ToDoBloc _toDoBloc = ToDoBloc();
  AuthRepository _authRepository;
  FirebaseUser user;
  Timer timer;
  int toDoCounter;
  int inProgressCounter;
  double toDoLenght;
  double inProgressLenght;
  double doneLength;


  @override
  void initState() {
    super.initState();
    _authRepository = Provider.of<AuthRepository>(context, listen: false);
    _partyBloc.getParties();
    _toDoBloc.getPartyToDoLengthThings(widget.event.eventId);
    _toDoBloc.getPartyInProgressLengthThings(widget.event.eventId);
    _toDoBloc.getPartyDoneLengthThings(widget.event.eventId);
    user = _authRepository.getUser;
    _partyBloc.getPartyGuestStatusConfirmed(widget.event.eventId);
    _partyBloc.getPartyGuestStatusWaiting(widget.event.eventId);
    timer = Timer.periodic(Duration(seconds: 4), (time) {
       _partyBloc.getPartyGuestStatusConfirmed(widget.event.eventId);
       _partyBloc.getPartyGuestStatusWaiting(widget.event.eventId);
       _toDoBloc.getPartyToDoLengthThings(widget.event.eventId);
       _toDoBloc.getPartyInProgressLengthThings(widget.event.eventId);
       _toDoBloc.getPartyDoneLengthThings(widget.event.eventId);
       if(mounted) {
         setState(() {});
       }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      getCircle,
      InformationBox(event: widget.event,),
      Row(
        children: [
          getScrollHorizontalWithTiles,
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getToDoBox,
          getGuestBox,

        ],
      ),
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
                    Navigator.pushNamed(context, '/Supliers', arguments: widget.event.eventId);
                  },
                  child: StandardBigColorfulTiles(
                      color: appColors['sweet_honey'],
                      iconSize: 40,
                      height: 78,
                      width: 82,
                      padding: 5,
                      icon:  MyFlutterApp.high_five,
                      title: appStrings['supliers']),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/Budget');
                  },
                  child: StandardBigColorfulTiles(
                      color: appColors['sweet_green'],
                      iconSize: 40,
                      height: 78,
                      width: 82,
                      padding: 5,
                      icon: Icons.bubble_chart,
                      title: appStrings['budget']),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/MenuDetails',
                        arguments: widget.event.eventId);
                  },
                  child: StandardBigColorfulTiles(
                      color: appColors['pink'],
                      iconSize: 40,
                      height: 78,
                      width: 82,
                      padding: 5,
                      icon: MyFlutterApp.menu,
                      title: appStrings['menu']),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/Documents',
                        arguments: widget.event.eventId);
                  },
                  child: StandardBigColorfulTiles(
                      color: appColors['sweet_blue'],
                      iconSize: 40,
                      height: 78,
                      width: 82,
                      padding: 5,
                      icon: MyFlutterApp.paper,
                      title: appStrings['documents']),
                ),
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
                      iconSize: 35,
                      height: 78,
                      width: 82,
                      padding: 5,
                      icon: MyFlutterApp.share,
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
                      icon:  MyFlutterApp.inspiration,
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
          padding: const EdgeInsets.fromLTRB(10, 26, 0, 5),
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
                SizedBox(height: 120,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    MyFlutterApp.group,
                    size: 60,
                  ),
                ),
                Column(children: [getConfirmationRow, getWaitingRow]),
              ],
            ),
          )));

  Widget get getToDoBox => GestureDetector(
      onTap: () {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => ToDoScreen(partyType: widget.event.eventId,
              toDoBloc: _toDoBloc, toDo: toDoLenght, inProgress: inProgressLenght, done: doneLength,)));
      },
      child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 26, 2, 5),
          child: Container(
            decoration: BoxDecoration(
                color: appColors['backgound_tile'],
                border: Border.all(
                  color: appColors['backgound_tile'],
                ),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 3.0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 130,),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(appStrings["partyStatus"],style: TextStyle(fontSize: 18), textAlign: TextAlign.start,),
                      ],
                    ),
                  ),
                  getToDoLabel,
                  getInProgressLabel,
                  getDoneLabel
                ],
              ),
            ),
          )));

  Widget get getToDoLabel => Padding(
    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
    child: StreamBuilder<int>(
      stream:  _toDoBloc.toDoLenght.stream,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
            toDoLenght = snapshot.data.toDouble();
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(snapshot.data.toString(), style: TextStyle(
                    color: Colors.pink, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,),
              ),
              Text(appStrings["toDo"],),
            ],
          );
        } else {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('0', style: TextStyle(
                    color: Colors.pink, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,),
              ),
              Text(appStrings["toDo"],),
            ],
          );
        }
      }
    ),
  );

  Widget get getInProgressLabel => Padding(
    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
    child: StreamBuilder<int>(
      stream: _toDoBloc.inProgressLength.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
            inProgressLenght = snapshot.data.toDouble();
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(snapshot.data.toString(), style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.bold),),
              ),
              Text(appStrings["inProgress"],),
            ],
          );
        } else {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('0', style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.bold),),
              ),
              Text(appStrings["inProgress"],),
            ],
          );
        }
      }
    ),
  );

  Widget get getDoneLabel => Padding(
    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
    child: StreamBuilder<int>(
      stream: _toDoBloc.doneLenght.stream,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          doneLength = snapshot.data.toDouble();
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(snapshot.data.toString(), style: TextStyle(
                    color: Colors.green, fontWeight: FontWeight.bold),),
              ),
              Text(appStrings["done"],),
            ],
          );
        } else {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('0', style: TextStyle(
                    color: Colors.green, fontWeight: FontWeight.bold),),
              ),
              Text(appStrings["done"],),
            ],
          );
        }
      }
    ),
  );

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
