import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/bloc/add_guest_bloc.dart';
import 'package:planyoureventmobile/bloc/party_bloc.dart';
import 'package:planyoureventmobile/enums/guest_groups.dart';
import 'package:planyoureventmobile/models/guest.dart';
import 'package:planyoureventmobile/models/guest_invite_to_party_status.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/widgets/plan_your_event_card.dart';
import 'package:planyoureventmobile/widgets/standard_add_card.dart';
import 'package:planyoureventmobile/widgets/standard_rectangular_conctact_card.dart';

class GuestConfirmationContent extends StatefulWidget {
  final String partyID;
  const GuestConfirmationContent({
    Key key, this.partyID
  }) : super(key: key);

  @override
  _GuestConfirmationContentState createState() => _GuestConfirmationContentState();
}

class _GuestConfirmationContentState extends State<GuestConfirmationContent> {
 PartyBloc partyBloc = PartyBloc();

  @override
  void initState() {
    super.initState();
    partyBloc.getPartyGuest(widget.partyID);
    partyBloc.getPartyGuestStatus(widget.partyID);
    partyBloc.guestToConfirmationStream();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        PlanYourEventCard(
          pictureName: 'assets/images/party_welocome.png',
          height: 180,
          width: 300,
          title: appStrings['partyGuest'],
        ),
        Column(
          children: [getGuestStream],
        )
      ]),
    );
  }

  Widget get getGuestStream {
    return StreamBuilder<List<GuestInviteToPartyStatus>>(
      stream: partyBloc.guestToConfirmationStream(),
      builder: (context, AsyncSnapshot<List<GuestInviteToPartyStatus>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return  Column(
              children: _buildGuestListWidget(snapshot.data),
            );
          } else if (snapshot.data.isEmpty) {
            return StandardAddCard(route: '/AddGuest', partyId: widget.partyID,);
          } else {
            return Container();
          }
        } else if (snapshot.hasError) {
          return Container();
        } else if(snapshot.data != null) {
          return StandardAddCard(route: '/AddGuest', partyId: widget.partyID,);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  List<Widget> _buildGuestListWidget(List<GuestInviteToPartyStatus> data) {
    List<Widget> allTiles = [];
    data.forEach((element) {
      allTiles.add(StandardContactCard(guest: element.guest, canChangedGuestStatus: true, partyId: widget.partyID, guestStatus: element.connectGuestWithParty, partyBloc: partyBloc, ));
    });
    allTiles.add(StandardAddCard(
      route: '/AddGuest',
      partyId: widget.partyID,
    ));
    return allTiles;
  }
}
