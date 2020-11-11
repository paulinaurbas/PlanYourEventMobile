import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/bloc/menu_bloc.dart';
import 'package:planyoureventmobile/bloc/party_bloc.dart';
import 'package:planyoureventmobile/bloc/suppliers_bloc.dart';
import 'package:planyoureventmobile/models/menu.dart';
import 'package:planyoureventmobile/models/supplier_model.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/menu/widgets/menu_card.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/supliers/widgets/supliers_card.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/widgets/plan_your_event_card.dart';
import 'package:planyoureventmobile/widgets/standard_add_card.dart';

class SupliersContent extends StatefulWidget {
  final String partyID;
  const SupliersContent({
    Key key, this.partyID
  }) : super(key: key);

  @override
  _SupliersContentState createState() => _SupliersContentState();
}

class _SupliersContentState extends State<SupliersContent> {
  SuppliersBloc _bloc = SuppliersBloc();
  @override
  void initState() {
    super.initState();
    _bloc.getPartySuppliers(widget.partyID);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        PlanYourEventCard(
          pictureName: 'assets/images/party_welocome.png',
          height: 180,
          width: 300,
          title: appStrings['supliers'],
        ),
        Column(
          children: [
            getGuestStream
          ],
        )
      ]),
    );
  }

  Widget get getGuestStream {
    return StreamBuilder<List<Supplier>>(
      stream: _bloc.suppliersList.stream,
      builder: (context, AsyncSnapshot<List<Supplier>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return Column(
              children: _buildGuestListWidget(snapshot.data),
            );
          } else if (snapshot.data.isEmpty) {
            return StandardAddCard(
                route: '/AddSupplier', partyId: widget.partyID);
          } else {
            return StandardAddCard(
                route: '/AddSupplier', partyId: widget.partyID);
          }
        } else if (snapshot.hasError) {
          return Container();
        } else if (snapshot.data == null || snapshot.data.isEmpty) {
          return StandardAddCard(
              route: '/AddSupplier', partyId: widget.partyID);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  List<Widget> _buildGuestListWidget(List<Supplier> data) {
    List<Widget> allTiles = [];
    data.forEach((element) {
      allTiles.add(SupliersCard(supplier: element));
    });
    allTiles.add(StandardAddCard(
        route: '/AddSupplier', partyId: widget.partyID));
    return allTiles;
  }

}