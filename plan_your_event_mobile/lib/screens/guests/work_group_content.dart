import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/bloc/add_guest_bloc.dart';
import 'package:planyoureventmobile/enums/guest_groups.dart';
import 'package:planyoureventmobile/models/guest.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/widgets/plan_your_event_card.dart';
import 'package:planyoureventmobile/widgets/standard_add_card.dart';
import 'package:planyoureventmobile/widgets/standard_rectangular_conctact_card.dart';

class WorkGroupContent extends StatefulWidget {
  final String partyId;
  const WorkGroupContent({
    Key key, this.partyId,
  }) : super(key: key);

  @override
  _WorkGroupContentState createState() => _WorkGroupContentState();
}

class _WorkGroupContentState extends State<WorkGroupContent> {
  AddGuestBloc _addGuestBloc = AddGuestBloc();

  @override
  void initState() {
    super.initState();
    _addGuestBloc.getGuests(GuestType.BUISSNESS.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        PlanYourEventCard(
          pictureName: 'assets/images/work_collegues.png',
          height: 180,
          width: 300,
          title: appStrings['work'],
        ),
        Column(
          children: [getGuestStream],
        )
      ]),
    );
  }

  Widget get getGuestStream {
    return StreamBuilder<List<Guest>>(
      stream: _addGuestBloc.guestList.stream,
      builder: (context, AsyncSnapshot<List<Guest>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return Column(
              children: _buildGuestListWidget(snapshot.data),
            );
          } else if (snapshot.data.isEmpty) {
            return StandardAddCard(
                route: '/AddGuest', guestType: GuestType.BUISSNESS);
          } else {
            return Container();
          }
        } else if (snapshot.hasError) {
          return Container();
        } else if (snapshot.data != null) {
          return StandardAddCard(
              route: '/AddGuest', guestType: GuestType.BUISSNESS);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  List<Widget> _buildGuestListWidget(List<Guest> data) {
    List<Widget> allTiles = [];
    data.forEach((element) {
      allTiles.add(StandardContactCard(guest: element, partyId: widget.partyId));
    });
    if(widget.partyId == null) {
      allTiles.add(StandardAddCard(
        route: '/AddGuest',
        guestType: GuestType.FAMILY,
      ));
    }
    return allTiles;
  }
}
