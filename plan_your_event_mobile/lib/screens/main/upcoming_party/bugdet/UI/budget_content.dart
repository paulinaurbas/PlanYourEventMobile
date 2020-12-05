import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/bloc/budget_bloc.dart';
import 'package:planyoureventmobile/models/budget_model.dart';
import 'package:planyoureventmobile/models/bugdet_item_model.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/bugdet/Widget/add_budget_item.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/bugdet/Widget/budget_items_row.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/bugdet/Widget/card_with_progress.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';

import 'add_new_budget_content.dart';

class BudgetContent extends StatefulWidget {
  final String partyID;
  const BudgetContent({
    Key key, this.partyID
  }) : super(key: key);

  @override
  _BudgetContentState createState() => _BudgetContentState();
}

class _BudgetContentState extends State<BudgetContent> {
  BudgetBloc _bloc = BudgetBloc();
  @override
  void initState() {
    super.initState();
    _bloc.getPartyBudget(widget.partyID);
    _bloc.getPartyBudgetItems(widget.partyID);

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Column(
          children: [
            getBudgetStream
          ],
        )
      ]),
    );
  }



  Widget get getBudgetStream {
    return StreamBuilder<Budget>(
      stream: _bloc.budget?.stream,
      builder: (context, AsyncSnapshot<Budget> snapshot) {
        if(snapshot == null) {
        return AddNewBudgetContent(partyID: widget.partyID, bloc: _bloc,);
        }else if (snapshot.data != null || snapshot.hasData) {
          return Column(
            children: [
              getItemsBudgetStream(snapshot.data)
            ],
          );
        } else {
          return AddNewBudgetContent(partyID: widget.partyID, bloc: _bloc,);
        }
      }
    );
  }



  Widget getItemsBudgetStream (Budget budget){
    return StreamBuilder<List<BudgetItem>>(
      stream: _bloc.budgetItemsListStream,
      builder: (context, AsyncSnapshot<List<BudgetItem>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return Column(
              children: [
                BudgetProgressCard(
                  height: 180,
                  width: 300,
                  budget: budget,
                  bloc: _bloc,
                  title: appStrings['budget'],
                ),
                Column(
                  children: _buildDocumentsListWidget(snapshot.data, budget),
                ),
              ],
            );
          } else if (snapshot.data.isEmpty) {
            _bloc.refreshRepo(widget.partyID);
            return Container();
          } else {
            _bloc.refreshRepo(widget.partyID);
            return Container();
          }
        } else if (snapshot.hasError) {
          return Container();
        } else if (snapshot.data == null || snapshot.data.isEmpty) {
          _bloc.refreshRepo(widget.partyID);
          return Column(
            children: [
              BudgetProgressCard(
                height: 180,
                width: 300,
                title: appStrings['budget'],
                budget: budget,
                bloc: _bloc,
              ),
              Column(
                children: [AddBugdetRow(partyId: widget.partyID, bloc: _bloc, budget: budget,)]
              ),
            ],
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  List<Widget> _buildDocumentsListWidget(List<BudgetItem> data, Budget budget) {
    List<Widget> allTiles = [];
    data.forEach((element) {
      allTiles.add(BudgetRowItem(element, _bloc));
    });
    allTiles.add(AddBugdetRow(partyId: widget.partyID, bloc: _bloc, budget: budget,));
    return allTiles;
  }
}