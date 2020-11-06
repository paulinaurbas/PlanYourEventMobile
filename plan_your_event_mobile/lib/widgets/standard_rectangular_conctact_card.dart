import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planyoureventmobile/bloc/add_guest_bloc.dart';
import 'package:planyoureventmobile/bloc/party_bloc.dart';
import 'package:planyoureventmobile/enums/guest_confirmation_status.dart';
import 'package:planyoureventmobile/models/guest.dart';
import 'package:planyoureventmobile/models/guest_status.dart';
import 'package:planyoureventmobile/my_flutter_app_icons.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/guest_confirmation/guest_confirmation_content.dart';
import 'package:provider/provider.dart';

class StandardContactCard extends StatefulWidget {
  final Guest guest;
  final GuestStatus guestStatus;
  final String partyId;
  final bool canChangedGuestStatus;
  final PartyBloc partyBloc;

  const StandardContactCard({
    Key key,
    this.guest,
    this.partyId,
    this.canChangedGuestStatus,
    this.guestStatus, this.partyBloc,
  }) : super(key: key);

  @override
  _StandardContactCardState createState() => _StandardContactCardState();
}

class _StandardContactCardState extends State<StandardContactCard> {
  bool isAdded = false;
  AddGuestBloc _addGuestBloc = AddGuestBloc();
  bool isEditable = false;
  GuestConfirmationStatus guestConfirmationStatus;

  @override
  void initState() {
    super.initState();

    if (widget.partyId != null) {
      setState(() {
        isEditable = false;
      });
    } else {
      setState(() {
        isEditable = true;
      });
    }
    if (widget.guestStatus != null) {
      guestConfirmationStatus = widget.guestStatus.guestStatus;
    }
  }

  Widget get getIconDependingOnStatus {
    if (guestConfirmationStatus == GuestConfirmationStatus.CONFIRMED) {
      return Icon(Icons.check_circle_outline, color: Colors.green);
    } else if (guestConfirmationStatus == GuestConfirmationStatus.WAITING) {
      return Icon(Icons.wifi_tethering, color: Colors.amber);
    } else {
      return Icon(Icons.work_outline_rounded, color: Colors.red);
    }
  }

  _showPopupMenu(Offset offset) async {
    double left = offset.dx;
    double top = offset.dy;
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: [
        PopupMenuItem<String>(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  guestConfirmationStatus = GuestConfirmationStatus.CONFIRMED;
                  _addGuestBloc.editGuestStatus(GuestStatus(
                      guestId: widget.guestStatus.guestId,
                      partyId: widget.guestStatus.partyId,
                      guestStatus: guestConfirmationStatus,
                      guestStatusID: widget.guestStatus.guestStatusID));
                });
              },
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                  ),
                  Text('Accepted'),
                ],
              ),
            ),
            value: 'Accept'),
        PopupMenuItem<String>(
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    guestConfirmationStatus = GuestConfirmationStatus.WAITING;
                    _addGuestBloc.editGuestStatus(GuestStatus(
                        guestId: widget.guestStatus.guestId,
                        partyId: widget.guestStatus.partyId,
                        guestStatus: guestConfirmationStatus,
                        guestStatusID: widget.guestStatus.guestStatusID));
                  });
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.wifi_tethering, color: Colors.amber),
                    Text('Waiting'),
                  ],
                )),
            value: 'Waiting'),
        PopupMenuItem<String>(
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    guestConfirmationStatus = GuestConfirmationStatus.DECLINE;
                    _addGuestBloc.editGuestStatus(GuestStatus(
                        guestId: widget.guestStatus.guestId,
                        partyId: widget.guestStatus.partyId,
                        guestStatus: guestConfirmationStatus,
                        guestStatusID: widget.guestStatus.guestStatusID));
                    if(widget.partyBloc != null){
                      widget.partyBloc.refreshGuestStatus(widget.partyId);
                    }
                  });
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.work_outline_rounded, color: Colors.red),
                    Text('Decline'),
                  ],
                )),
            value: 'Reject'),
      ],
      elevation: 8.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> preferencesList = List<Widget>();
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        if (widget.guestStatus != null) {
          _showPopupMenu(details.globalPosition);
        }
      },
      child: Padding(
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
                          Text(widget.guest.name + ' ' + widget.guest.surname,
                              style: TextStyle(
                                fontSize: 20,
                              )),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 5, 15, 10),
                      child: Row(
                        children: [
                          isEditable ? editGuest : addToPartyGuest,
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
      ),
    );
  }

  Widget get addToPartyGuest {
    return GestureDetector(
      onTap: () {
        if (widget.canChangedGuestStatus == null) {
          setState(() {
            isAdded = !isAdded;
          });
          _addGuestBloc.connectUserWithParty(GuestStatus(
              partyId: widget.partyId,
              guestId: widget.guest.guestId,
              guestStatus: GuestConfirmationStatus.WAITING));
        }
      },
      child: widget.canChangedGuestStatus != null
          ? getIconDependingOnStatus
          : Icon(
              isAdded ? Icons.check_circle : Icons.check_circle_outline,
              color: isAdded ? Colors.green : Colors.black,
              size: 20,
            ),
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
    if ((widget.guest.noEggs))
      list.add(getPreferencesIcons(MyFlutterApp.protein));
    if ((widget.guest.noFish)) list.add(getPreferencesIcons(MyFlutterApp.fish));
    if ((widget.guest.glutenFree))
      list.add(getPreferencesIcons(MyFlutterApp.wheat));
    if ((widget.guest.noMilk)) list.add(getPreferencesIcons(MyFlutterApp.milk));
    if ((widget.guest.noMeat))
      list.add(getPreferencesIcons(MyFlutterApp.meat__2_));
    if ((widget.guest.noNuts))
      list.add(getPreferencesIcons(MyFlutterApp.peanut));
    if ((widget.guest.noSeaFood))
      list.add(getPreferencesIcons(MyFlutterApp.crab));
    if (widget.guest.vegan)
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
