import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/bloc/add_guest_bloc.dart';
import 'package:planyoureventmobile/enums/guest_groups.dart';
import 'package:planyoureventmobile/models/guest.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/widgets/plan_your_event_card.dart';
import 'package:planyoureventmobile/widgets/standard_add_card.dart';
import 'package:planyoureventmobile/widgets/standard_rectangular_conctact_card.dart';

class FamilyGroupContent extends StatefulWidget {
  final bool isEditable;
  const FamilyGroupContent({
    Key key, this.isEditable,
  }) : super(key: key);

  @override
  _FamilyGroupContentState createState() => _FamilyGroupContentState();
}

class _FamilyGroupContentState extends State<FamilyGroupContent> {
  AddGuestBloc _addGuestBloc = AddGuestBloc();

  @override
  void initState() {
    super.initState();
    _addGuestBloc.getGuests(GuestType.FAMILY.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        PlanYourEventCard(
          pictureName: 'assets/images/party_welocome.png',
          height: 180,
          width: 300,
          title: appStrings['family'],
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
              return  Column(
                children: _buildGuestListWidget(snapshot.data),
              );
            } else if (snapshot.data.isEmpty) {
              return StandardAddCard(route: '/AddGuest', guestType: GuestType.FAMILY);
            } else {
              return Container();
            }
          } else if (snapshot.hasError) {
            return Container();
          } else if(snapshot.data != null) {
            return StandardAddCard(route: '/AddGuest', guestType: GuestType.FAMILY);
          } else {
            return CircularProgressIndicator();
          }
        },
      );
  }

  List<Widget> _buildGuestListWidget(List<Guest> data) {
    List<Widget> allTiles = [];
    data.forEach((element) {
      allTiles.add(StandardContactCard(guest: element, isEditable: widget.isEditable));
    });
    allTiles.add(StandardAddCard(
      route: '/AddGuest',
      guestType: GuestType.FAMILY,
    ));
    return allTiles;
  }
}
